@[has_globals]
module main

// Import the `limine` module defined in `kernel/modules/limine`
import limine

// Tells v that the code below must be generated in the .limine_requests section
@[linker_section: '.limine_requests']
@[cinit]
__global (
	volatile limine_base_revision = limine.LimineBaseRevision{
		revision: 2
	}

	// A request for the Limine framebuffer, which will allow us to draw pixels on the screen
	volatile limine_framebuffer_request = limine.LimineFramebufferRequest{
		response: unsafe {nil}
		revision: 2
	}
)

// The main function
pub fn main() {
	kmain()
}

// The main function of our kernel
pub fn kmain() {
	// Check if Limine works
	if limine_base_revision.revision != 0 {
		for {}
	}

	// The limine framebuffer tag
	fb_tag := unsafe {limine_framebuffer_request.response.framebuffers[0]}

	// Draw a line to the framebuffer
	for i in 0..100 {
		// Pointer to the framebuffer
		mut fb_ptr := &u32(fb_tag.address)
		unsafe {
			// Draw a pixel
			fb_ptr[i * (fb_tag.pitch / 4) + i] = 0xffffff;
		}
	}

	// Hang the CPU
	for {}
}