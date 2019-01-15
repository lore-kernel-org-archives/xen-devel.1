From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools: only call git when necessary in OVMF
 Makefile
Date: Tue, 15 Jan 2019 11:29:38 +0000
Message-ID: <20190115112938.wcvh67sokhtlpw6u@zion.uk.xensource.com>
References: <20190115110940.29403-1-wei.liu2@citrix.com>
 <04282240-35d1-ddaa-f202-fea9e60539d6@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNAP=PX=citrix.com=prvs=9111e199a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gjMuc-00086d-AP
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:29:42 +0000
Content-Disposition: inline
In-Reply-To: <04282240-35d1-ddaa-f202-fea9e60539d6@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMTE6Mjc6MTJBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNS8wMS8yMDE5IDExOjA5LCBXZWkgTGl1IHdyb3RlOgo+ID4gVXNlcnMgbWF5
IGNob29zZSB0byBleHBvcnQgYSBzbmFwc2hvdCBvZiBPVk1GIGFuZCBidWlsZCBpdAo+ID4gd2l0
aCB4ZW4uZ2l0IHN1cHBsaWVkIG92bWYtbWFrZWZpbGUuIEluIHRoYXQgY2FzZSB3ZSBkb24ndAo+
ID4gbmVlZCB0byBjYWxsIGBnaXQgc3VibW9kdWxlYC4KPiA+Cj4gPiBGaXhlcyBiMTYyODE4NzBl
Lgo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiAg
dG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZSB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
ZmlybXdhcmUvb3ZtZi1tYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZpbGUKPiA+
IGluZGV4IDNkZTJmYzAzMDAuLjU1Zjk5OTIxNDUgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9maXJt
d2FyZS9vdm1mLW1ha2VmaWxlCj4gPiArKysgYi90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxl
Cj4gPiBAQCAtMTYsNyArMTYsNyBAQCBhbGw6IGJ1aWxkCj4gPiAgCj4gPiAgLlBIT05ZOiBidWls
ZAo+ID4gIGJ1aWxkOgo+ID4gLQkkKEdJVCkgc3VibW9kdWxlIHVwZGF0ZSAtLWluaXQgLS1yZWN1
cnNpdmUKPiA+ICsJaWYgdGVzdCAtZSAuZ2l0IDsgdGhlbiAkKEdJVCkgc3VibW9kdWxlIHVwZGF0
ZSAtLWluaXQgLS1yZWN1cnNpdmUgOyBmaQo+IAo+IFlvdSB3YW50IC1kIHJhdGhlciB0aGFuIC1l
LgoKQW50aG9ueSBzYWlkIC5naXQgY291bGQgYmUgYSBsaW5rLgoKV2VpLgoKPiAKPiB+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
