#![feature(lang_items)]
#![feature(start)]
#![no_std]
#![no_main]

#[no_mangle]
pub extern "C" fn myfun() -> *const u8 {
    "hello world\0".as_ptr()
}

#[lang = "eh_personality"] extern fn eh_personality() {}
#[lang = "panic_fmt"] extern fn panic_fmt() -> ! { loop {} }
