From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 04/18] xen: create xenstore areas for
 XenDevice-s
Date: Fri, 7 Dec 2018 15:07:06 +0000
Message-ID: <20181207150706.GG18875__45147.3567438827$1544195162$gmane$org@perard.uk.xensource.com>
References: <1544108924-10841-1-git-send-email-paul.durrant@citrix.com>
 <1544108924-10841-5-git-send-email-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zRRO=OQ=citrix.com=prvs=87219212e=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gVHil-0004t4-9R
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 15:07:15 +0000
Content-Disposition: inline
In-Reply-To: <1544108924-10841-5-git-send-email-paul.durrant@citrix.com>
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

T24gVGh1LCBEZWMgMDYsIDIwMTggYXQgMDM6MDg6MzBQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
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
LmR1cnJhbnRAY2l0cml4LmNvbT4KCkxvb2tzIGdvb2QsCgpSZXZpZXdlZC1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3MsCgotLSAKQW50aG9ueSBQ
RVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
