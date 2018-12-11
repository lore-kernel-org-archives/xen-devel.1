From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 04/18] xen: create xenstore areas for
 XenDevice-s
Date: Tue, 11 Dec 2018 15:19:47 +0000
Message-ID: <20181211151947.GR18875@perard.uk.xensource.com>
References: <1544525238-3527-1-git-send-email-paul.durrant@citrix.com>
 <1544525238-3527-5-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P5G6=OU=citrix.com=prvs=8761f1f8f=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gWjpA-0000X7-EB
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:19:52 +0000
Content-Disposition: inline
In-Reply-To: <1544525238-3527-5-git-send-email-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMTA6NDc6MDRBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBzb3VyY2UgbW9kdWxlLCB4ZW4tYnVzLWhlbHBl
ci5jLCB3aGljaCBidWlsZHMgb24KPiBiYXNpYyBsaWJ4ZW5zdG9yZSBwcmltaXRpdmVzIHRvIHBy
b3ZpZGUgZnVuY3Rpb25zIHRvIGNyZWF0ZSAoc2V0dGluZwo+IHBlcm1pc3Npb25zIGFwcHJvcHJp
YXRlbHkpIGFuZCBkZXN0cm95IHhlbnN0b3JlIGFyZWFzLCBhbmQgZnVuY3Rpb25zIHRvCj4gJ3By
aW50ZicgYW5kICdzY2FuZicgbm9kZXMgdGhlcmVpbi4gVGhlIG1haW4geGVuLWJ1cyBjb2RlIHRo
ZW4gdXNlcwo+IHRoZXNlIHByaW1pdGl2ZXMgWzFdIHRvIGluaXRpYWxpemUgYW5kIGRlc3Ryb3kg
dGhlIGZyb250ZW5kIGFuZCBiYWNrZW5kCj4gYXJlYXMgZm9yIGEgWGVuRGV2aWNlIGR1cmluZyBy
ZWFsaXplIGFuZCB1bnJlYWxpemUgcmVzcGVjdGl2ZWx5Lgo+IAo+IFRoZSAneGVuLWJsb2NrJyBp
bXBsZW1lbnRhdGlvbiBpcyBleHRlbmRlZCB3aXRoIGEgJ2dldF9uYW1lJyBtZXRob2QgdGhhdAo+
IHJldHVybnMgdGhlIFZCRCBudW1iZXIuIFRoaXMgbnVtYmVyIGlzIHJlcXVpcmVkIHRvICduYW1l
JyB0aGUgeGVuc3RvcmUKPiBhcmVhcy4KPiAKPiBOT1RFOiBBbiBleGl0IGhhbmRsZXIgaXMgYWxz
byBhZGRlZCB0byBtYWtlIHN1cmUgdGhlIHhlbnN0b3JlIGFyZWFzIGFyZQo+ICAgICAgIGNsZWFu
ZWQgdXAgaWYgUUVNVSB0ZXJtaW5hdGVzIHdpdGhvdXQgZGV2aWNlcyBiZWluZyB1bnJlYWxpemVk
Lgo+IAo+IFsxXSBUaGUgJ3NjYW5mJyBmdW5jdGlvbnMgYXJlIGFjdHVhbGx5IG5vdCB5ZXQgbmVl
ZGVkLCBidXQgdGhleSB3aWxsIGJlCj4gICAgIG5lZWRlZCBieSBjb2RlIGRlbGl2ZXJlZCBpbiBz
dWJzZXF1ZW50IHBhdGNoZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVs
LmR1cnJhbnRAY2l0cml4LmNvbT4KPiAtLS0KPiAKPiB2MzoKPiAgLSBBZGQgdHJhbnNhY3Rpb24g
aWQgcGFyYW1ldGVycyB0byB4ZW4tYnVzLWhlbHBlciBmdW5jdGlvbnMKPiAgLSBOb3QgYWRkZWQg
QW50aG9ueSdzIFItYiBiZWNhdXNlIG9mIGNoYW5nZQo+IAoKUmV2aWV3ZWQtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhvbnkgUEVSQVJECgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
