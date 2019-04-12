From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] x86/msr: Fix fallout from mostly c/s 832c180
Date: Fri, 12 Apr 2019 11:00:45 +0000
Message-ID: <9e2177f417214532a02cc8ca4fe2e580@AMSPEX02CL01.citrite.net>
References: <1554832427-30567-1-git-send-email-andrew.cooper3@citrix.com>
 <5CADC46B02000078002261CC@prv1-mh.provo.novell.com>
 <1027d5f4-e133-0717-4fdf-76cafbf07a03@citrix.com>
 <5CB06C810200007800226D79@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5CB06C810200007800226D79@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IAo+ID4gQW4gb3B0aW1pc2luZyBjb21waWxl
ciB3aGljaCB1c2VzIGFuIG9iamVjdCwgYW5kIHBhc3NlcyBhIGNvbnN0IHBvaW50ZXIKPiA+IHRv
IHRoYXQgb2JqZWN0IHRvIGEgZnVuY3Rpb24sIGlzIHBlcm1pdHRlZCB0byByZXRhaW4gYXNzdW1w
dGlvbnMgZGVyaXZlZAo+ID4gZnJvbSB0aGF0IHN0YXRlIGFjcm9zcyB0aGUgZnVuY3Rpb24gY2Fs
bCBzZXF1ZW5jZSBwb2ludCwgYmVjYXVzZSB0aGUgQUJJCj4gPiBvZiB0aGUgZnVuY3Rpb24gc3Rh
dGVzIHRoYXQgdGhlIGNvbnRlbnQgb2YgdGhlIG9iamVjdCBkb2Vzbid0IGNoYW5nZS4KPiAKPiBW
ZXJ5IG11Y2ggbm90IHNvLCBuby4gVGFrZSB0aGlzIHNpbXBsZSAoYW5kIGdyYW50ZWQgY29udHJp
dmVkKQo+IGV4YW1wbGU6Cj4gCj4gaW50IGludGVnZXI7Cj4gCj4gaW50IHRlc3Qodm9pZCkgewo+
IAlmdW5jKCZpbnRlZ2VyKTsKPiAJcmV0dXJuIGludGVnZXI7Cj4gfQo+IAo+IGFuZCBpbiBhIGRp
ZmZlcmVudCBDVSAoanVzdCB0byBhdm9pZCB0aGUgZWZmZWN0IG9mIHRoZSBjb21waWxlcgo+IGlu
bGluaW5nIHRoZSB3aG9sZSB0aGluZykKPiAKPiB2b2lkIGZ1bmMoY29uc3QgaW50KnBpKSB7Cj4g
CWludGVnZXIgPSB+KnBpOwo+IH0KPiAKPiBWYXJpb3VzIG90aGVyIGV4YW1wbGVzIGFyZSBwb3Nz
aWJsZSwgaW5jbHVkaW5nIG9uZXMgd2hlcmUKPiB0aGVyZSdzIG5vdGhpbmcgY29udHJpdmVkIGF0
IGFsbC4KPiAKCkknbSBub3Qgc3VyZSB3aGV0aGVyIHRoZSBmYWN0IHRoYXQgJ2ludGVnZXInIGlz
IGFjY2Vzc2VkIGFzIGEgbm9uLWNvbnN0IGdsb2JhbCBpbiB0aGUgYWJvdmUgbWFrZXMgYW55IGRp
ZmZlcmVuY2UgaW4gdGhpcyBleGFtcGxlIGJ1dCB3aGF0IHlvdSBzZWVtIHRvIGJlIGhpZ2hsaWdo
dGluZyBpcyB0aGF0IHRoZXJlJ3Mgc2ltcGx5IG5vIHBvaW50IGluIGV2ZXIgdXNpbmcgY29uc3Qg
c3RydWN0IHZjcHUgcG9pbnRlcnMgYmVjYXVzZSB0aGUgY29tcGlsZXIgY2FuIG5ldmVyIGFjdHVh
bGx5IGRvIGFueSB1c2VmdWwgb3B0aW1pemF0aW9uIGJhc2VkIG9uIHRoZSBjb25zdCBxdWFsaWZp
ZXIuIElzIHRoYXQgdGhlIGNhc2U/CgogIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
