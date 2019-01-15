From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools: only call git when necessary in OVMF
 Makefile
Date: Tue, 15 Jan 2019 11:27:12 +0000
Message-ID: <04282240-35d1-ddaa-f202-fea9e60539d6@citrix.com>
References: <20190115110940.29403-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3OYV=PX=citrix.com=prvs=91139fb13=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gjMsG-0007yu-2T
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:27:16 +0000
In-Reply-To: <20190115110940.29403-1-wei.liu2@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDEvMjAxOSAxMTowOSwgV2VpIExpdSB3cm90ZToKPiBVc2VycyBtYXkgY2hvb3NlIHRv
IGV4cG9ydCBhIHNuYXBzaG90IG9mIE9WTUYgYW5kIGJ1aWxkIGl0Cj4gd2l0aCB4ZW4uZ2l0IHN1
cHBsaWVkIG92bWYtbWFrZWZpbGUuIEluIHRoYXQgY2FzZSB3ZSBkb24ndAo+IG5lZWQgdG8gY2Fs
bCBgZ2l0IHN1Ym1vZHVsZWAuCj4KPiBGaXhlcyBiMTYyODE4NzBlLgo+Cj4gUmVwb3J0ZWQtYnk6
IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+ICB0b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxl
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlIGIvdG9vbHMvZmly
bXdhcmUvb3ZtZi1tYWtlZmlsZQo+IGluZGV4IDNkZTJmYzAzMDAuLjU1Zjk5OTIxNDUgMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZQo+ICsrKyBiL3Rvb2xzL2Zpcm13
YXJlL292bWYtbWFrZWZpbGUKPiBAQCAtMTYsNyArMTYsNyBAQCBhbGw6IGJ1aWxkCj4gIAo+ICAu
UEhPTlk6IGJ1aWxkCj4gIGJ1aWxkOgo+IC0JJChHSVQpIHN1Ym1vZHVsZSB1cGRhdGUgLS1pbml0
IC0tcmVjdXJzaXZlCj4gKwlpZiB0ZXN0IC1lIC5naXQgOyB0aGVuICQoR0lUKSBzdWJtb2R1bGUg
dXBkYXRlIC0taW5pdCAtLXJlY3Vyc2l2ZSA7IGZpCgpZb3Ugd2FudCAtZCByYXRoZXIgdGhhbiAt
ZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
