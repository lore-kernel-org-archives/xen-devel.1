From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen_pt: Present the size of 64 bit BARs
 correctly
Date: Thu, 17 May 2018 18:57:34 +0100
Message-ID: <20180517175734.GO2057@perard.uk.xensource.com>
References: <20180514095746.5058-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kmnw=ie=citrix.com=prvs=6682a862c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fJN9n-0007OP-0A
 for xen-devel@lists.xenproject.org; Thu, 17 May 2018 17:57:39 +0000
Content-Disposition: inline
In-Reply-To: <20180514095746.5058-1-ross.lagerwall@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTQsIDIwMTggYXQgMTA6NTc6NDZBTSArMDEwMCwgUm9zcyBMYWdlcndhbGwg
d3JvdGU6Cj4gVGhlIGZ1bGwgc2l6ZSBvZiB0aGUgQkFSIGlzIHN0b3JlZCBpbiB0aGUgbG93ZXIg
UENJSU9SZWdpb24uc2l6ZS4gVGhlCj4gdXBwZXIgUENJSU9SZWdpb24uc2l6ZSBpcyAwLiAgQ2Fs
Y3VsYXRlIHRoZSBzaXplIG9mIHRoZSB1cHBlciBoYWxmCj4gY29ycmVjdGx5IGZyb20gdGhlIGxv
d2VyIGhhbGYgb3RoZXJ3aXNlIHRoZSBzaXplIHJlYWQgYnkgdGhlIGd1ZXN0IHdpbGwKPiBiZSBp
bmNvcnJlY3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3
YWxsQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Cgo+IC0tLQo+ICBody94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMgfCAyICsr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaHcv
eGVuL3hlbl9wdF9jb25maWdfaW5pdC5jIGIvaHcveGVuL3hlbl9wdF9jb25maWdfaW5pdC5jCj4g
aW5kZXggYTNjZTMzZS4uYWVlMzFjNiAxMDA2NDQKPiAtLS0gYS9ody94ZW4veGVuX3B0X2NvbmZp
Z19pbml0LmMKPiArKysgYi9ody94ZW4veGVuX3B0X2NvbmZpZ19pbml0LmMKPiBAQCAtNTA0LDYg
KzUwNCw4IEBAIHN0YXRpYyBpbnQgeGVuX3B0X2Jhcl9yZWdfd3JpdGUoWGVuUENJUGFzc3Rocm91
Z2hTdGF0ZSAqcywgWGVuUFRSZWcgKmNmZ19lbnRyeSwKPiAgICAgICAgICBiYXJfcm9fbWFzayA9
IFhFTl9QVF9CQVJfSU9fUk9fTUFTSyB8IChyX3NpemUgLSAxKTsKPiAgICAgICAgICBicmVhazsK
PiAgICAgIGNhc2UgWEVOX1BUX0JBUl9GTEFHX1VQUEVSOgo+ICsgICAgICAgIGFzc2VydChpbmRl
eCA+IDApOwo+ICsgICAgICAgIHJfc2l6ZSA9IGQtPmlvX3JlZ2lvbnNbaW5kZXggLSAxXS5zaXpl
ID4+IDMyOwo+ICAgICAgICAgIGJhcl9lbXVfbWFzayA9IFhFTl9QVF9CQVJfQUxMRjsKPiAgICAg
ICAgICBiYXJfcm9fbWFzayA9IHJfc2l6ZSA/IHJfc2l6ZSAtIDEgOiAwOwo+ICAgICAgICAgIGJy
ZWFrOwoKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
