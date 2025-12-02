//! Copyright © 2016 Bart Massey
//! 
//! [This program is licensed under the "MIT License"]
//! Please see the file COPYING in the source distribution
//! of this software for license terms.
//!
//! Demonstrate making statically-linked rust
//! functions available to C and vice-versa.

#![no_std]
#![no_builtins]

unsafe extern "C" {
    fn c_mul(x: i32, y: i32) -> i32;
    fn abort() -> !;
}

#[unsafe(no_mangle)]
pub extern "C" fn rust_add_squared(a: i32, b: i32) -> i32 {
    let z = match i32::checked_add(a, b) {
        Some(v) => v,
        None => unsafe { abort() },
    };
    unsafe { c_mul(z, z) }
}

#[panic_handler]
pub fn panic_handler(_info: &core::panic::PanicInfo) -> ! {
    unsafe { abort(); }
}
