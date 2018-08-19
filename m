From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 28/34] x86/vm_event: put vm_event_fill_regs
 under CONFIG_HVM
Date: Sun, 19 Aug 2018 19:41:11 +0300
Message-ID: <71b93a62-5bcd-918a-7b9a-0da6e16270c6@bitdefender.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <d8838b921f3d33265ca7ed08ff256a7423a58404.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lysl=lc=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1frQlP-0004nb-7n
 for xen-devel@lists.xenproject.org; Sun, 19 Aug 2018 16:41:15 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id B23273086283
 for <xen-devel@lists.xenproject.org>; Sun, 19 Aug 2018 19:41:13 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id A1C757FC41
 for <xen-devel@lists.xenproject.org>; Sun, 19 Aug 2018 19:41:13 +0300 (EEST)
In-Reply-To: <d8838b921f3d33265ca7ed08ff256a7423a58404.1534518694.git-series.wei.liu2@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gOC8xNy8xOCA2OjEyIFBNLCBXZWkgTGl1IHdyb3RlOgo+IElkZWFsbHkgdGhlIEhWTSBzcGVj
aWZpYyBwYXJ0IG9mIFZNIGV2ZW50IHNob3VsZCBiZSBtb3ZlZCBpbnRvIGh2bS8gYXQKPiBzb21l
IHBvaW50LCBidXQgdGhpcyB3aWxsIGRvIGZvciBub3cuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L3ZtX2V2ZW50
LmMgfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMgYi94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwo+
IGluZGV4IGY5MWFhZGUuLmI0ZjZhZmIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L3ZtX2V2
ZW50LmMKPiArKysgYi94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwo+IEBAIC0xMjQsNiArMTI0LDcg
QEAgdm9pZCB2bV9ldmVudF9tb25pdG9yX25leHRfaW50ZXJydXB0KHN0cnVjdCB2Y3B1ICp2KQo+
ICAKPiAgdm9pZCB2bV9ldmVudF9maWxsX3JlZ3Modm1fZXZlbnRfcmVxdWVzdF90ICpyZXEpCj4g
IHsKPiArI2lmIENPTkZJR19IVk0KPiAgICAgIGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpy
ZWdzID0gZ3Vlc3RfY3B1X3VzZXJfcmVncygpOwo+ICAgICAgc3RydWN0IHNlZ21lbnRfcmVnaXN0
ZXIgc2VnOwo+ICAgICAgc3RydWN0IGh2bV9od19jcHUgY3R4dDsKPiBAQCAtMTc3LDYgKzE3OCw3
IEBAIHZvaWQgdm1fZXZlbnRfZmlsbF9yZWdzKHZtX2V2ZW50X3JlcXVlc3RfdCAqcmVxKQo+ICAK
PiAgICAgIGh2bV9nZXRfc2VnbWVudF9yZWdpc3RlcihjdXJyLCB4ODZfc2VnX2NzLCAmc2VnKTsK
PiAgICAgIHJlcS0+ZGF0YS5yZWdzLng4Ni5jc19hcmJ5dGVzID0gc2VnLmF0dHI7Cj4gKyNlbmRp
Zgo+ICB9CgpTb21lIHJlZ2lzdGVycyBjYW4gYmUgb2J0YWluZWQgaGVyZSB3aXRob3V0IHVzaW5n
IEhWTS1zcGVjaWZpYyBjb2RlLAp1bmxlc3MgSSdtIG1pc3VuZGVyc3RhbmRpbmcgaG93IGl0IHdv
cmtzLiBTbyBJIHdvbmRlciBpZiBpdCB3b3VsZG4ndCBiZQpiZXR0ZXIgdG8gcHV0IG9ubHkgdGhl
ICJzdHJ1Y3QgaHZtX2h3X2NwdSBjdHh0OyItcmVsYXRlZCBjb2RlIHVuZGVyCkNPTkZJR19IVk0g
LSB0aGF0IHdheSB3aGF0IGNhbiBiZSBxdWVyaWVkIHZpYSBndWVzdF9jcHVfdXNlcl9yZWdzKCkK
YWxvbmUgd29uJ3QgYmUgbG9zdC4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
