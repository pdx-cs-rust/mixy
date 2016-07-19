#![crate_type="staticlib"]

use std::result::Result;
use std::ffi::{CString, NulError};

extern "system" {
    fn abort() -> !;
}

fn cunwrap(cstring: Result<CString, NulError>) -> CString {
    match cstring {
        Ok(s) => s,
        _ => unsafe { abort() }
    }
}

#[no_mangle]
pub extern "system" fn myfun() -> *const i8 {
    cunwrap(CString::new("hello world")).as_ptr()
}
