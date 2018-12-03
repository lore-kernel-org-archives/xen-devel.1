From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 06/18] xen: add grant table interface for
 XenDevice-s
Date: Mon, 3 Dec 2018 15:45:56 +0000
Message-ID: <20181203154556.GL14786@perard.uk.xensource.com>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hLDM=OM=citrix.com=prvs=86815d540=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gTqQC-0000p2-Rz
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 15:46:08 +0000
Content-Disposition: inline
In-Reply-To: <20181121151211.15997-7-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, qemu-block@nongnu.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDM6MTE6NTlQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoZSBsZWdhY3kgUFYgYmFja2VuZCBpbmZyYXN0cnVjdHVyZSBwcm92aWRlcyBmdW5j
dGlvbnMgdG8gbWFwLCB1bm1hcCBhbmQKPiBjb3B5IHBhZ2VzIGdyYW50ZWQgYnkgZnJvbnRlbmRz
LiBTaW1pbGFyIGZ1bmN0aW9uYWxpdHkgd2lsbCBiZSByZXF1aXJlZAo+IGJ5IFhlbkRldmljZSBp
bXBsZW1lbnRhdGlvbnMgc28gdGhpcyBwYXRjaCBhZGRzIHRoZSBuZWNlc3Nhcnkgc3VwcG9ydC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29t
Pgo+IC0tLQo+ICt0eXBlZGVmIHN0cnVjdCBYZW5EZXZpY2VHcmFudENvcHlTZWdtZW50IHsKPiAr
ICAgIHVuaW9uIHsKPiArICAgICAgICB2b2lkICp2aXJ0Owo+ICsgICAgICAgIHN0cnVjdCB7Cj4g
KyAgICAgICAgICAgIHVpbnQzMl90IHJlZjsKPiArICAgICAgICAgICAgb2ZmX3Qgb2Zmc2V0Owo+
ICsgICAgICAgIH0gZm9yZWlnbjsKPiArICAgIH0gc291cmNlLCBkZXN0OwoKV2h5IGlzIHRoZXJl
IGEgdW5pb24gYmV0d2VlbiBgc291cmNlYCBhbmQgYGRlc3RgLCBJIGRvbid0IHNlZSBhbnkgd2F5
Cihhbm90aGVyIGZpZWxkKSB0byBkaXN0aW5ndWlzaCB3aGljaCBpcyB3aGljaC4gQ2FuJ3Qgd2Ug
aGF2ZSBhCnNlZ21lbnQgd2l0aG91dCBgc291cmNlYC9gZGVzdGA/IEl0IG1pbWljIHRoZQp4ZW5n
bnR0YWJfZ3JhbnRfY29weV9zZWdtZW50X3QgYnV0IHRoYXQgZG9lc24ndCBzZWVtcyB2ZXJ5IHVz
ZWZ1bCBhcyBpdApkb2Vzbid0IHJlYWxseSBwcmV2ZW50IG1pc3Rha2UuCgo+ICsgICAgc2l6ZV90
IGxlbjsKPiArfSBYZW5EZXZpY2VHcmFudENvcHlTZWdtZW50OwoKQW55d2F5LCBpdCdzIG5vdCB2
ZXJ5IGltcG9ydGFudDoKClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
