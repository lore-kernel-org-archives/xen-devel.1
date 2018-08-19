From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 24/34] x86/mem_access: put HVM only function
 under CONFIG_HVM
Date: Sun, 19 Aug 2018 19:36:07 +0300
Message-ID: <a08564ad-fc85-423b-aa9f-8089867b32a7@bitdefender.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <32a9abc8421e09b6807aa93024f40f0535202bbc.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lysl=lc=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1frQgV-00046x-UE
 for xen-devel@lists.xenproject.org; Sun, 19 Aug 2018 16:36:11 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id D1EDA3086285
 for <xen-devel@lists.xenproject.org>; Sun, 19 Aug 2018 19:36:09 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id C59407FE69
 for <xen-devel@lists.xenproject.org>; Sun, 19 Aug 2018 19:36:09 +0300 (EEST)
In-Reply-To: <32a9abc8421e09b6807aa93024f40f0535202bbc.1534518694.git-series.wei.liu2@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gOC8xNy8xOCA2OjEyIFBNLCBXZWkgTGl1IHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNj
ZXNzLmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyBiL3hlbi9hcmNoL3g4Ni9tbS9t
ZW1fYWNjZXNzLmMKPiBpbmRleCAwM2E4NjQxLi5lMTUyNWZkIDEwMDY0NAo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vz
cy5jCj4gQEAgLTEzOCw2ICsxMzgsNyBAQCBib29sIHAybV9tZW1fYWNjZXNzX2VtdWxhdGVfY2hl
Y2soc3RydWN0IHZjcHUgKnYsCj4gICAgICByZXR1cm4gdmlvbGF0aW9uOwo+ICB9Cj4gIAo+ICsj
aWYgQ09ORklHX0hWTQo+ICBib29sIHAybV9tZW1fYWNjZXNzX2NoZWNrKHBhZGRyX3QgZ3BhLCB1
bnNpZ25lZCBsb25nIGdsYSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbnBm
ZWMgbnBmZWMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgdm1fZXZlbnRfcmVxdWVzdF90
ICoqcmVxX3B0cikKPiBAQCAtMjQ0LDYgKzI0NSw3IEBAIGJvb2wgcDJtX21lbV9hY2Nlc3NfY2hl
Y2socGFkZHJfdCBncGEsIHVuc2lnbmVkIGxvbmcgZ2xhLAo+ICAgICAgLyogUmV0dXJuIHdoZXRo
ZXIgdkNQVSBwYXVzZSBpcyByZXF1aXJlZCAoYWthLiBzeW5jIGV2ZW50KSAqLwo+ICAgICAgcmV0
dXJuIChwMm1hICE9IHAybV9hY2Nlc3NfbjJyd3gpOwo+ICB9Cj4gKyNlbmRpZgo+ICAKPiAgaW50
IHAybV9zZXRfYWx0cDJtX21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHAybV9k
b21haW4gKmhwMm0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwMm1f
ZG9tYWluICphcDJtLCBwMm1fYWNjZXNzX3QgYSwKPiAKCkFja2VkLWJ5OiBSYXp2YW4gQ29qb2Nh
cnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
