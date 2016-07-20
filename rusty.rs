#![crate_type="staticlib"]

use std::ffi::CString;
use std::os::raw::c_char;

#[no_mangle]
pub extern "system" fn myfun() -> *mut c_char {
    CString::new("hello world").unwrap().into_raw()
}
