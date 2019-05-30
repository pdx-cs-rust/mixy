//! Copyright © 2016 Bart Massey
//! 
//! [This program is licensed under the "MIT License"]
//! Please see the file COPYING in the source distribution
//! of this software for license terms.
//!
//! Demonstrate making statically-linked rust
//! functions available to C and vice-versa.

#![crate_type="staticlib"]
#![no_std]
#![no_builtins]

extern {
    fn c_mul(x: i32, y: i32) -> i32;
}

#[no_mangle]
pub extern "system" fn rust_add(a: i32, b: i32) -> i32 {
    let z = a + b;
    unsafe { c_mul(z, z) }
}

#[panic_handler]
#[no_mangle]
pub fn panic_handler(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}
