From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 36/39] ARM: new VGIC: vgic-init:
 implement vgic_init
Date: Tue, 27 Mar 2018 17:06:17 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803271705470.12360@sstabellini-ThinkPad-X260>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-37-andre.przywara@linaro.org>
 <alpine.DEB.2.10.1803271609420.12360@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yb8v=gs=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f0ybc-0006Wy-99
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 00:06:20 +0000
In-Reply-To: <alpine.DEB.2.10.1803271609420.12360@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyNyBNYXIgMjAxOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gK3N0YXRp
YyB2b2lkIHZnaWNfdmNwdV9lYXJseV9pbml0KHN0cnVjdCB2Y3B1ICp2Y3B1KQo+ID4gK3sKPiA+
ICsgICAgc3RydWN0IHZnaWNfY3B1ICp2Z2ljX2NwdSA9ICZ2Y3B1LT5hcmNoLnZnaWM7Cj4gPiAr
ICAgIHVuc2lnbmVkIGludCBpOwo+ID4gKwo+ID4gKyAgICBJTklUX0xJU1RfSEVBRCgmdmdpY19j
cHUtPmFwX2xpc3RfaGVhZCk7Cj4gPiArICAgIHNwaW5fbG9ja19pbml0KCZ2Z2ljX2NwdS0+YXBf
bGlzdF9sb2NrKTsKPiA+ICsKPiA+ICsgICAgLyoKPiA+ICsgICAgICogRW5hYmxlIGFuZCBjb25m
aWd1cmUgYWxsIFNHSXMgdG8gYmUgZWRnZS10cmlnZ2VyZWQgYW5kCj4gPiArICAgICAqIGNvbmZp
Z3VyZSBhbGwgUFBJcyBhcyBsZXZlbC10cmlnZ2VyZWQuCj4gPiArICAgICAqLwo+ID4gKyAgICBm
b3IgKCBpID0gMDsgaSA8IFZHSUNfTlJfUFJJVkFURV9JUlFTOyBpKysgKQo+ID4gKyAgICB7Cj4g
PiArICAgICAgICBzdHJ1Y3QgdmdpY19pcnEgKmlycSA9ICZ2Z2ljX2NwdS0+cHJpdmF0ZV9pcnFz
W2ldOwo+ID4gKwo+ID4gKyAgICAgICAgSU5JVF9MSVNUX0hFQUQoJmlycS0+YXBfbGlzdCk7Cj4g
PiArICAgICAgICBzcGluX2xvY2tfaW5pdCgmaXJxLT5pcnFfbG9jayk7Cj4gPiArICAgICAgICBp
cnEtPmludGlkID0gaTsKPiA+ICsgICAgICAgIGlycS0+dmNwdSA9IE5VTEw7Cj4gPiArICAgICAg
ICBpcnEtPnRhcmdldF92Y3B1ID0gdmNwdTsKPiA+ICsgICAgICAgIGlycS0+dGFyZ2V0cyA9IDFV
IDw8IHZjcHUtPnZjcHVfaWQ7Cj4gPiArICAgICAgICBhdG9taWNfc2V0KCZpcnEtPnJlZmNvdW50
LCAwKTsKPiA+ICsgICAgICAgIGlmICggdmdpY19pcnFfaXNfc2dpKGkpICkKPiA+ICsgICAgICAg
IHsKPiA+ICsgICAgICAgICAgICAvKiBTR0lzICovCj4gPiArICAgICAgICAgICAgaXJxLT5lbmFi
bGVkID0gMTsKPiA+ICsgICAgICAgICAgICBpcnEtPmNvbmZpZyA9IFZHSUNfQ09ORklHX0VER0U7
Cj4gPiArICAgICAgICB9Cj4gPiArICAgICAgICBlbHNlCj4gPiArICAgICAgICB7Cj4gPiArICAg
ICAgICAgICAgLyogUFBJcyAqLwo+ID4gKyAgICAgICAgICAgIGlycS0+Y29uZmlnID0gVkdJQ19D
T05GSUdfTEVWRUw7CgpQbGVhc2Ugc2VlIG15IGNvbW1lbnQgYWJvdXQgZXZ0Y2huX2lycSBiZWlu
ZyBlZGdlOgoKYWxwaW5lLkRFQi4yLjEwLjE4MDMyNzE2NTExNTAuMTIzNjBAc3N0YWJlbGxpbmkt
VGhpbmtQYWQtWDI2MAoKCj4gPiArICAgICAgICB9Cj4gPiArICAgIH0KPiA+ICt9CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
