//! Copyright © 2016 Bart Massey
//! 
//! [This program is licensed under the "MIT License"]
//! Please see the file COPYING in the source distribution
//! of this software for license terms.
//!
//! Demonstrate making statically-linked rust
//! functions available to C.

#![crate_type="staticlib"]

use std::ffi::CString;
use std::os::raw::c_char;

/// Returns a heap-allocated C string containing "hello
/// world".  Because this is compiled as a staticlib crate,
/// Rust will use the system malloc() to allocate the
/// storage.
#[no_mangle]
pub extern "system" fn gethello() -> *mut c_char {
    CString::new("hello world").unwrap().into_raw()
}

/// Free the heap-allocated memory underlying a string
/// obtained from `gethello()`. Because this storage is
/// allocated using the system malloc(), an ordinary free()
/// will also work fine.
#[no_mangle]
pub extern "system" fn freehello(hello: *mut c_char) {
    let _ = unsafe { CString::from_raw(hello) };
}
