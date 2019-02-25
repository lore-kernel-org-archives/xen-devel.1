From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen-block: stop leaking memory in
 xen_block_drive_create()
Date: Mon, 25 Feb 2019 16:46:31 +0000
Message-ID: <20190225164631.GE1349@perard.uk.xensource.com>
References: <20190219163440.15702-1-paul.durrant@citrix.com>
 <9510cf48c9064c0fb1e6eb64b414a7ea@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Eb4A=RA=citrix.com=prvs=952ce4ebe=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gyJOp-0007ye-Ra
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 16:46:39 +0000
Content-Disposition: inline
In-Reply-To: <9510cf48c9064c0fb1e6eb64b414a7ea@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMTksIDIwMTkgYXQgMDQ6MzY6MjhQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gVGhlIGxvY2FsbHkgYWxsb2NhdGVkIFFEaWN0LXMgbmVlZCB0byBiZSBmcmVlZC4g
KCdmaWxlX2xheWVyJyB3aWxsIGJlCj4gPiBmcmVlZCBpbXBsaWNpdGx5IHNpbmNlIGl0IGlzIGFk
ZGVkIGFzIGFuIG9iamVjdCB0byAnZHJpdmVyX2xheWVyJykuCj4gPiAKPiA+IFNwb3R0ZWQgYnkg
Q292ZXJpdHk6IENJRCAxMzk4NjQ5Cj4gPiAKPiA+IFdoaWxlIGluIHRoZSBuZWlnaGJvdXJob29k
IGZyZWUgJ2RyaXZlcicgYW5kICdmaWxlbmFtZScgYXMgc29vbiBhcyB0aGV5Cj4gPiBhcmUKPiA+
IGFkZGVkIHRvIHRoZSBRRGljdHMuIEZyZWVpbmcgYWZ0ZXIgdGhlICdkb25lJyBsYWJlbCBkb2Vz
bid0IG1ha2UgdGhhdCBtdWNoCj4gPiBzZW5zZSBhcywgaWYgdGhlIGVycm9yIHBhdGgganVtcHMg
dG8gdGhhdCBsYWJlbCwgdGhlIHZhbHVlcyB3b3VsZCBiZSBOVUxMCj4gPiBhbnl3YXkuCj4gPiAK
PiA+IFRoaXMgcGF0Y2ggYWxzbyBtYWtlcyB0aGF0IG1vcmUgb2J2aW91cyBieSB0YWtpbmcgdGhl
IGVycm9yIHBhdGggaWYKPiA+ICdwYXJhbXMnIGlzIE5VTEwgYW5kIHRoZW4gYXNzZXJ0aW5nIHRo
YXQgYm90aCBkcml2ZXIgYW5kIGZpbGVuYW1lIGFyZQo+ID4gbm9uLU5VTEwgaW4gdGhlIG5vcm1h
bCBwYXRoLgo+ID4gCj4gPiBSZXBvcnRlZC1ieTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVs
bEBsaW5hcm8ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJh
bnRAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
