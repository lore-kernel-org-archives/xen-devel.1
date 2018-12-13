From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12] dt: fix integer check in
 dt_device_is_compatible
Date: Thu, 13 Dec 2018 14:08:35 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812131407420.12259@sstabellini-ThinkPad-X260>
References: <1544553966-30776-1-git-send-email-sstabellini@kernel.org>
 <dac85357-c66f-29eb-6d01-b655250e1111@arm.com>
 <alpine.DEB.2.10.1812121541050.12259@sstabellini-ThinkPad-X260>
 <33444cf6-39a0-94eb-5a38-0882f62f2d2d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z3Fi=OW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gXZ9p-0004z4-Rm
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 22:08:37 +0000
In-Reply-To: <33444cf6-39a0-94eb-5a38-0882f62f2d2d@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini <stefanos@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxMyBEZWMgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMTIvMTIvMTggMTE6NTMgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9u
IFdlZCwgMTIgRGVjIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSGkgU3RlZmFubywK
PiA+ID4gCj4gPiA+IE9uIDExLzEyLzIwMTggMTg6NDYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiA+ID4gPiBjcGxlbiBpcyB1bnNpZ25lZCwgdGh1cywgaXQgY2FuIG5ldmVyIGJlIDwgMC4g
VXNlIGEgc2lnbmVkIGludGVnZXIgbG9jYWwKPiA+ID4gPiB2YXJpYWJsZSBpbnN0ZWFkLgo+ID4g
PiAKPiA+ID4gVGhlIGN1cnJlbnQgY29kZSBjaGVja3MgPiAwLiBMb29raW5nIGF0IHRoZSBjb2Rl
IEkgZG9uJ3QgdGhpbmsgaXQgY2FuIGV2ZXIKPiA+ID4gYmUKPiA+ID4gbmVnYXRpdmUuIFNvIGNh
biB5b3UgZGV0YWlscyB3aGF0IGlzIHRoZSBwcm9ibGVtIHlvdSBhcmUgdHJ5aW5nIHRvCj4gPiA+
IHJlc29sdmU/Cj4gPiAKPiA+IFllcywgaXQgY2FuIGJlICJuZWdhdGl2ZSIgKG5vdCBhY3R1YWxs
eSBuZWdhdGl2ZSBiZWNhdXNlIGl0IGlzIGRlZmluZWQKPiA+IGFzIHVuc2lnbmVkKSwgaW4gZmFj
dCBpdCBoYXBwZW5zIHdpdGggdGhlIG5vZGVzIGFkZGVkIGR5bmFtaWNhbGx5IGJ5IGdydWIKPiA+
IGF0IGJvb3QuIFRoaXMgcGF0Y2hlcyBmaXhlcyBib290aW5nIGZyb20gZ3J1Yi4KPiA+IAo+ID4g
U3BlY2lmaWNhbGx5IGlsZW4gaXMgaW5pdGlhbGVkIHRvIDE2LCBidXQgc3RybGVuKzEgaXMgMTcs
IHNvIGxlbmd0aAo+ID4gYmVjb21lcyAtMS4gVGhlIGxlbmd0aCBvZiB0aGUgcHJvcGVydHkgZ2Vu
ZXJhdGVkIGJ5IGdydWIgc2VlbXMgdG8gYmUKPiA+IHNob3J0IGJ5IDEuCj4gU3VjaCBleHBsYW5h
dGlvbiBzaG91bGQgaGF2ZSBiZWVuIGluIHRoZSBjb21taXQgbWVzc2FnZSwgaXQgaGVscHMgdG8K
PiBkaWFnbm9zdGljcyB3aGVyZSB0aGUgcHJvYmxlbSBpcyBjb21pbmcgZnJvbS4KPiAKPiBMb29r
aW5nIGF0IHRoZSBzcGVjaWZpY2F0aW9uIFsxXSBzZWN0aW9uIDIuMy4xLCBhIGNvbXBhdGlibGUg
cHJvcGVydHkgaXMgYQo+IGNvbmNhdGVuYXRlZCBsaXN0IG9mIG51bGwgdGVybWluYXRlZCBzdHJp
bmdzLiBTbyB0aGUgY3VycmVudCBjb2RlIGlzIGFjdHVhbGx5Cj4gY29ycmVjdCBhbmQgdGhlcmUg
aXMgYSBidWcgaW4gR1JVQi4KPiAKPiBUaGlzIGJ1ZyB3YXMgYWN0dWFsbHkgZml4ZWQgYnkgY29t
bWl0IGFlNTgxN2YxZCAiYXJtNjQveGVuX2Jvb3Q6IEZpeCBYZW4gYm9vdAo+IHVzaW5nIEdSVUIy
IG9uIEFBUkNINjQiLgo+IAo+IEkgYXNzdW1lIHlvdSBhcmUgdXNpbmcgR3J1YiAyLjAyIHdoaWNo
IGRvZXMgbm90IGNvbnRhaW4gdGhlIGZ1bGwgc3VwcG9ydCBmb3IKPiBYZW4uIFNvIEkgd291bGQg
bm90IGV2ZW4gY29uc2lkZXIgdG8gd29yay1hcm91bmQgaXQgaW4gWGVuLgo+IAo+IEluc3RlYWQs
IEkgd291bGQgcmVjb21tZW5kIHlvdSB0byB1cGdyYWRlIHRvIGEgbW9yZSByZWNlbnQgR1JVQi4g
SXQgd291bGQgYmUKPiBtb3JlIGxpa2VseSBzdGFnaW5nIGFzIHRoZXJlIGFyZSBubyBuZXcgR1JV
QiB2ZXJzaW9uLgo+IAo+IEFub3RoZXIgc29sdXRpb24gaXMgdG8gdXNlIGNoYWlubG9hZGluZy4K
Cml0IGlzIHRydWUgdGhhdCBpdCB3YXMgYSAidGVtcG9yYXJ5IiBidWcgaW4gZ3J1YgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
