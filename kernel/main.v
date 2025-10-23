@[has_globals]
module main

import limine

@[linker_section: '.limine_requests']
@[cinit]
__global (
	volatile limine_base_revision = limine.LimineBaseRevision{
		revision: 2
	}

	volatile limine_framebuffer_request = limine.LimineFramebufferRequest{
		response: unsafe {nil}
		revision: 2
	}
)

pub fn main() {
	kmain()
}

@[export: 'kmain']
pub fn kmain() {
	if limine_base_revision.revision != 0 {
		for {}
	}

	fb_tag := unsafe {limine_framebuffer_request.response.framebuffers[0]}

	for i in 0..100 {
		mut fb_ptr := &u32(fb_tag.address)
		unsafe {
			fb_ptr[i * (fb_tag.pitch / 4) + i] = 0xffffff;
		}
	}

	for {}
}