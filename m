From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 22/34] x86/mm: put HVM only code under
 CONFIG_HVM
Date: Sun, 19 Aug 2018 19:27:22 +0300
Message-ID: <b43f3c0b-ee70-e1cd-6725-b31fc0bd0c8d@bitdefender.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <fda67a2a1da3fc7fdca0231352ef4989ebb0d81b.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lysl=lc=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1frQY5-0003KQ-1a
 for xen-devel@lists.xenproject.org; Sun, 19 Aug 2018 16:27:29 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 8FFE03086285
 for <xen-devel@lists.xenproject.org>; Sun, 19 Aug 2018 19:27:25 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 626AE7FC42
 for <xen-devel@lists.xenproject.org>; Sun, 19 Aug 2018 19:27:25 +0300 (EEST)
In-Reply-To: <fda67a2a1da3fc7fdca0231352ef4989ebb0d81b.1534518694.git-series.wei.liu2@citrix.com>
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

T24gOC8xNy8xOCA2OjEyIFBNLCBXZWkgTGl1IHdyb3RlOgo+IEdvaW5nIHRocm91Z2ggdGhlIGNv
ZGUsIG5lc3RlZCBFUFQsIEVQVCwgYW5kIEFMVFAyTSBkZXBlbmQgb24gSFZNIGNvZGUuIFB1dAo+
IHRoZXNlIGNvbXBvbmVudHMgdW5kZXIgQ09ORklHX0hWTS4gVGhpcyBmdXJ0aGVyIHJlcXVpcmVz
IHB1dHRpbmcgb25lCj4gb2YgdGhlIHZtIGV2ZW50IHVuZGVyIENPTkZJR19IVk0uCj4gCj4gQWxz
byBtYWtlIGhhcF9lbmFibGVkIGV2YWx1YXRlIHRvIGZhbHNlIHdoZW4gIUNPTkZJR19IVk0uIFRo
aXMgaW4gdHVybgo+IHJlcXVpcmVzIG1hcmtpbmcgYSB2YXJpYWJsZSBpbiBwMm1fc2V0X2VudHJ5
IGFzIF9fbWF5YmVfdW51c2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9tbS9NYWtlZmlsZSAgICAgICAgIHwg
IDUgKysrLS0KPiAgeGVuL2FyY2gveDg2L21tL2hhcC9NYWtlZmlsZSAgICAgfCAgMiArLQo+ICB4
ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAgICAgICB8IDE3ICsrKysrKysrKystLS0tLS0tCj4g
IHhlbi9jb21tb24vdm1fZXZlbnQuYyAgICAgICAgICAgIHwgIDIgKysKPiAgeGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vZG9tYWluLmggfCAgNCArKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9tbS9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9tbS9NYWtlZmlsZQo+IGluZGV4IDMwMTcxMTku
LjE1NmEzMjEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL01ha2VmaWxlCj4gKysrIGIv
eGVuL2FyY2gveDg2L21tL01ha2VmaWxlCj4gQEAgLTIsOCArMiw5IEBAIHN1YmRpci15ICs9IHNo
YWRvdwo+ICBzdWJkaXIteSArPSBoYXAKPiAgCj4gIG9iai15ICs9IHBhZ2luZy5vCj4gLW9iai15
ICs9IHAybS5vIHAybS1wdC5vIHAybS1lcHQubyBwMm0tcG9kLm8KPiAtb2JqLXkgKz0gYWx0cDJt
Lm8KPiArb2JqLXkgKz0gcDJtLm8gcDJtLXB0Lm8gcDJtLXBvZC5vCj4gK29iai0kKENPTkZJR19I
Vk0pICs9IHAybS1lcHQubwo+ICtvYmotJChDT05GSUdfSFZNKSArPSBhbHRwMm0ubwoKSSBhbSBh
YmxlIHRvIGNvbXBpbGUgeGVuLmd6IGJ5IHJ1bm5pbmcgbWFrZSBpbiB4ZW4vIHdpdGggbm8gaXNz
dWVzIHdpdGgKdGhlIGZvbGxvd2luZyBwYXRjaCBhcHBsaWVkOgoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9tbS9hbHRwMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9hbHRwMm0uYwppbmRleCA5MzBi
ZGMyNjY5Li5iMjg2N2ZkYWY3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vYWx0cDJtLmMK
KysrIGIveGVuL2FyY2gveDg2L21tL2FsdHAybS5jCkBAIC0xNSw4ICsxNSw2IEBACiAgKiB0aGlz
IHByb2dyYW07IElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KICAq
LwoKLSNpbmNsdWRlIDxhc20vaHZtL3N1cHBvcnQuaD4KLSNpbmNsdWRlIDxhc20vaHZtL2h2bS5o
PgogI2luY2x1ZGUgPGFzbS9wMm0uaD4KICNpbmNsdWRlIDxhc20vYWx0cDJtLmg+CgpTbyBJIHdv
bmRlciBpZiB0aG9zZSBpbmNsdWRlcyBhcmUgc2ltcGx5IGxlZnRvdmVycyB0aGF0LCBvbmNlIHJl
bW92ZWQsCndvdWxkIHNpbXBsaWZ5IHlvdXIgcGF0Y2guCgoKVGhhbmtzLApSYXp2YW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
