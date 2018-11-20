From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 00/24] ACPI reorganization
 for hardware-reduced API addition
Date: Tue, 20 Nov 2018 22:35:27 +0100
Message-ID: <bca20871-c6e1-b233-4cad-236c3ab36060@redhat.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181116172919.43f3e27d@redhat.com>
 <d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
 <20181119163110.2f357f40@redhat.com>
 <c09214f5-85fa-bb64-7c7e-2e9435ea4279@redhat.com>
 <20181119131314-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qxuu=n7=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gPDgJ-0001nP-Ul
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 21:35:39 +0000
In-Reply-To: <20181119131314-mutt-send-email-mst@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTEvMTggMTk6MTQsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBNb24sIE5v
diAxOSwgMjAxOCBhdCAwNjoxNDoyNlBNICswMTAwLCBQYW9sbyBCb256aW5pIHdyb3RlOgo+PiBP
biAxOS8xMS8xOCAxNjozMSwgSWdvciBNYW1tZWRvdiB3cm90ZToKPj4+IEkndmUgdHJpZWQgdG8g
Z2l2ZSBzdWdnZXN0aW9ucyBob3cgdG8gcmVzdHJ1Y3R1cmUgc2VyaWVzCj4+PiBvbiBwZXIgcGF0
Y2ggYmFzaXMuIEluIG15IG9waW5pb24gaXQgcXVpdGUgcG9zc2libGUgdG8gc3BsaXQKPj4+IHNl
cmllcyBpbiBzZXZlcmFsIHNtYWxsZXIgb25lcyBhbmQgaXQgc2hvdWxkIHJlYWxseSBoZWxwIHdp
dGgKPj4+IG1ha2luZyBzZXJpZXMgY2xlYW5lciBhbmQgZWFzaWVyL2Zhc3RlciB0byByZXZpZXcv
YW1lbmQvbWVyZ2UKPj4+IHZzIHdoYXQgd2UgaGF2ZSBpbiB2NS4KPj4KPj4gVGhpcyBpcyB0cnVl
LCBvbiB0aGUgb3RoZXIgaGFuZCB0aGUgc2VyaWVzIG1ha2VzIHNlbnNlIHRvZ2V0aGVyIGFuZCwK
Pj4gZXZlbiBpZiB0aGUgcGF0Y2hlcyBhcmUgbW9yZSBvciBsZXNzIGluZGVwZW5kZW50LCB0aGV5
IGFsc28gYWxsIGZvbGxvdwo+PiB0aGUgc2FtZSAicGxhbiIuICBGb3IgcmV2aWV3aW5nIHY2LCBh
cmUgeW91IGF3YXJlIG9mIFBhdGNoZXcncyBzZXJpZXMKPj4gZGlmZiBmdW5jdGlvbmFsaXR5PyAg
SXQgY2FuIHRlbGwgeW91IHdoaWNoIHBhdGNoZXMgaGFkIGNvbW1lbnRzIGluIHY1LAo+PiByZW9y
ZGVyIHBhdGNoZXMgaWYgYXBwbGljYWJsZSwgYW5kIGRpc3BsYXkgZGVsZXRlZCBhbmQgbmV3IHBh
dGNoZXMgYXQKPj4gdGhlIHJpZ2h0IHBvaW50IGluIHRoZSBzZXJpZXMuCj4+Cj4+IHY0LT52NSBp
cyBhIGJpdCBtZXNzZWQgdXAgYmVjYXVzZSBTYW11ZWwgcHJvYmFibHkgYWRkZWQgYSBkaWZmIG9y
ZGVyCj4+IHNldHVwCj4+IChodHRwczovL3BhdGNoZXcub3JnL1FFTVUvMjAxODExMDExMDIzMDMu
MTY0MzktMS1zYW1lb0BsaW51eC5pbnRlbC5jb20vZGlmZi8yMDE4MTEwNTAxNDA0Ny4yNjQ0Ny0x
LXNhbWVvQGxpbnV4LmludGVsLmNvbS8pCj4+IGJ1dCBpdCdzIHZlcnkgdXNlZnVsIGluIGdlbmVy
YWwuCj4+Cj4+IFBhb2xvCj4gCj4gT2ggSSBkaWRuJ3QgcmVhbGl6ZSBkaWZmb3JkZXIgYnJlYWtz
IHBhdGNoZXcuIE9yIGlzIHRoZSBwcm9ibGVtCj4gb25seSBpZiBvbmUgc3dpdGNoZXMgZnJvbSBu
byBvcmRlciB0byBkaWZmb3JkZXI/CgpObywgaXQncyBqdXN0IHRoYXQgc3dpdGNoaW5nIGl0IG9u
IG1ha2VzIHRoZSBpbnRlci12ZXJzaW9uIGRpZmYgbXVjaApsYXJnZXIsIGJlY2F1c2UgYWxsIGh1
bmtzIGFyZSByZW9yZGVyZWQuICBkaWZmb3JkZXIgaXMgbm90IGEgcHJvYmxlbS4KClBhb2xvCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
