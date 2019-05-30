//! Copyright © 2016 Bart Massey
//! 
//! [This program is licensed under the "MIT License"]
//! Please see the file COPYING in the source distribution
//! of this software for license terms.
//!
//! Demonstrate making statically-linked rust
//! functions available to C.

#![crate_type="staticlib"]
#![no_std]
#![no_builtins]

#[no_mangle]
pub extern "system" fn rust_add(a: i32, b: i32) -> i32 {
    a + b
}

#[panic_handler]
#[no_mangle]
pub fn panic_handler(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}
