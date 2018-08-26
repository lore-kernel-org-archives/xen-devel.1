From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2 12/23] x86: monitor.o is currently HVM
 only
Date: Sun, 26 Aug 2018 19:33:50 +0300
Message-ID: <08966fb3-f761-a1e3-4214-d091eb21cf84@bitdefender.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <9a48f409a1c77ec9e0a5742fc36de3e0b825b1fe.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3m2n=lj=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1ftxzF-00063t-OT
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 16:34:01 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 93733305FFA4
 for <xen-devel@lists.xenproject.org>; Sun, 26 Aug 2018 19:33:59 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 6AC5B7FE66
 for <xen-devel@lists.xenproject.org>; Sun, 26 Aug 2018 19:33:59 +0300 (EEST)
In-Reply-To: <9a48f409a1c77ec9e0a5742fc36de3e0b825b1fe.1535285866.git-series.wei.liu2@citrix.com>
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

T24gOC8yNi8xOCAzOjE5IFBNLCBXZWkgTGl1IHdyb3RlOgo+IFRoZXJlIGhhcyBiZWVuIHBsYW4g
dG8gbWFrZSBQViB3b3JrLCBidXQgaXQgaXMgbm90IHlldCB0aGVyZS4gIFByb3ZpZGUKPiBzdHVi
cyB0byBtYWtlIGl0IGJ1aWxkIHdpdGggIUNPTkZJR19IVk0uCj4gCj4gU2lnbmVkLW9mZi1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L01ha2Vm
aWxlICAgICAgICAgfCAgMiArLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L21vbml0b3IuaCB8IDE0
ICsrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUgYi94ZW4v
YXJjaC94ODYvTWFrZWZpbGUKPiBpbmRleCA5YjliNjNhLi40M2Y5MTg5IDEwMDY0NAo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+IEBA
IC00NSw3ICs0NSw3IEBAIG9iai15ICs9IG1pY3JvY29kZV9hbWQubwo+ICBvYmoteSArPSBtaWNy
b2NvZGVfaW50ZWwubwo+ICBvYmoteSArPSBtaWNyb2NvZGUubwo+ICBvYmoteSArPSBtbS5vIHg4
Nl82NC9tbS5vCj4gLW9iai15ICs9IG1vbml0b3Iubwo+ICtvYmotJChDT05GSUdfSFZNKSArPSBt
b25pdG9yLm8KPiAgb2JqLXkgKz0gbXBwYXJzZS5vCj4gIG9iai15ICs9IG5taS5vCj4gIG9iai15
ICs9IG51bWEubwo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L21vbml0b3IuaCBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvbW9uaXRvci5oCj4gaW5kZXggNDk4ODkwMy4uMDlmN2Y4YSAx
MDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21vbml0b3IuaAo+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvbW9uaXRvci5oCj4gQEAgLTk5LDEwICs5OSwyNCBAQCBzdGF0aWMgaW5s
aW5lIHVpbnQzMl90IGFyY2hfbW9uaXRvcl9nZXRfY2FwYWJpbGl0aWVzKHN0cnVjdCBkb21haW4g
KmQpCj4gIGludCBhcmNoX21vbml0b3JfZG9tY3RsX2V2ZW50KHN0cnVjdCBkb21haW4gKmQsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX21vbml0b3Jf
b3AgKm1vcCk7Cj4gIAo+ICsjaWZkZWYgQ09ORklHX0hWTQo+ICsKPiAgaW50IGFyY2hfbW9uaXRv
cl9pbml0X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkKTsKPiAgCj4gIHZvaWQgYXJjaF9tb25pdG9y
X2NsZWFudXBfZG9tYWluKHN0cnVjdCBkb21haW4gKmQpOwo+ICAKPiArI2Vsc2UKPiArCj4gK3N0
YXRpYyBpbmxpbmUgaW50IGFyY2hfbW9uaXRvcl9pbml0X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpk
KQo+ICt7Cj4gKyAgICByZXR1cm4gMDsKClJpZ2h0LCBpZiB2bV9ldmVudCBpcyBub3Qgc3VwcG9y
dGVkIGZvciBhbnl0aGluZyBvdGhlciB0aGFuIEhWTSB0aGVuIHdlCnNob3VsZCByZXR1cm4gLUVO
T0VOVCBvciBhIHNpbWlsYXIgZXJyb3IgaGVyZS4gVGhhdCB3YXksIGF0IGxlYXN0IHRoZQp1c2Vy
IGtub3dzIHRoaW5ncyB3aWxsIG5vdCB3b3JrIHVwZnJvbnQgKHdoZW4gdHJ5aW5nIHRvIGVuYWJs
ZSB2bV9ldmVudCkuCgo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9tb25pdG9y
X2NsZWFudXBfZG9tYWluKHN0cnVjdCBkb21haW4gKmQpCj4gK3t9CgpJJ20gbm90IHN1cmUgaWYg
dGhpcyBpcyB2YWxpZCBjb2Rpbmcgc3R5bGUgKGFzIG9wcG9zZWQgdG8gaGF2aW5nIGEKbmV3bGlu
ZSBiZWZvcmUgJ30nLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
