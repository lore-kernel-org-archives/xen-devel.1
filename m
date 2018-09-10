From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] x86/hvm: Switch hvm_allow_get_param()
 to use a whitelist
Date: Mon, 10 Sep 2018 03:41:42 -0600
Message-ID: <5B963C5602000078001E6AA3@prv1-mh.provo.novell.com>
References: <1536171124-27053-1-git-send-email-andrew.cooper3@citrix.com>
 <1536171124-27053-2-git-send-email-andrew.cooper3@citrix.com>
 <c2554d76f69749078dfe1ca60340042e@AMSPEX02CL03.citrite.net>
 <2145af5a-d61e-9b0c-2d47-b3f4e155306b@citrix.com>
 <5B923D0202000078001E63A4@prv1-mh.provo.novell.com>
 <f2a24a71-2a8e-78ba-53ac-2a86dc049a1f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f2a24a71-2a8e-78ba-53ac-2a86dc049a1f@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA5LjE4IGF0IDIwOjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMDkvMTggMDk6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNi4w
OS4xOCBhdCAxNzoyMSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MDYvMDkvMTggMDk6NTYsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+Pj4gQEAgLTQzOTAsOSArNDQx
MSw2IEBAIHN0YXRpYyBpbnQgaHZtb3BfZ2V0X3BhcmFtKAo+Pj4+PiAgICAgIGlmICggY29weV9m
cm9tX2d1ZXN0KCZhLCBhcmcsIDEpICkKPj4+Pj4gICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4+
Pj4+Cj4+Pj4+IC0gICAgaWYgKCBhLmluZGV4ID49IEhWTV9OUl9QQVJBTVMgKQo+Pj4+PiAtICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Pj4gLQo+Pj4+IEFTU0VSVCwganVzdCBpbiBjYXNlIHNv
bWVvbmUgc2NyZXdzIHVwIHRoZSBhbGxvdyBmdW5jdGlvbiBpbiBmdXR1cmU/Cj4+PiBUaGF0J3Mg
bm90IGdvaW5nIHRvIGhlbHAgaW4gYW55IHByYWN0aWNhbCB3YXkuICBUaGlzIGNoZWNrIGRvZXMg
cmVhbGx5Cj4+PiBleGlzdCwgYW5kIGlzIHBhcnQgb2YgdGhlIHN3aXRjaCBzdGF0ZW1lbnQuCj4+
IFdoaWNoIHN3aXRjaCgpIHN0YXRlbWVudD8gVGhlIG9uZSBpbiB0aGUgYWxsb3cgZnVuY3Rpb24g
aW5jbHVkZXMgdGhpcywKPj4gYnV0IHRoZSBvbmUgaGVyZSBzaW1wbHkgaGFzCj4+Cj4+ICAgICBk
ZWZhdWx0Ogo+PiAgICAgICAgIGEudmFsdWUgPSBkLT5hcmNoLmh2bS5wYXJhbXNbYS5pbmRleF07
Cj4+ICAgICAgICAgYnJlYWs7Cj4gCj4gQSBib3VuZGFyeSBjaGVjayBvbiBhLmluZGV4IGxvZ2lj
YWxseSBmYWxscyB3aXRoaW4gdGhlIHJlbWl0IG9mCj4gaHZtX2FsbG93X2dldF9wYXJhbSgpCgpD
b3JyZWN0LiBIZW5jZSAtIGR1ZSB0byB0aGUgc3BsaXQgYmV0d2VlbiB0aGUgdHdvIGZ1bmN0aW9u
cyAtIHRoZQpkZXNpcmUgdG8gaGF2ZSBhIHZhbGlkYXRpbmcgQVNTRVJUKCkgaW4gdGhlIG90aGVy
IGZ1bmN0aW9uLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
