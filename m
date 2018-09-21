From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v5 1/5] x86/mem_access: put
 p2m_{get/set}_suppress_ve under CONFIG_HVM
Date: Fri, 21 Sep 2018 18:57:39 +0300
Message-ID: <e89abfdc-c6ee-9075-6470-4a0e6484d876@bitdefender.com>
References: <cover.147d0f0e643da1e63074fd4940f98b9ad458396a.1537545258.git-series.wei.liu2@citrix.com>
 <645582bae3826048a61ba2162c1539f580847f13.1537545258.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qbiu=md=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1g3Nod-000618-30
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 15:57:59 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id CE397305FFA8
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 18:57:57 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id B85377FC29
 for <xen-devel@lists.xenproject.org>; Fri, 21 Sep 2018 18:57:57 +0300 (EEST)
In-Reply-To: <645582bae3826048a61ba2162c1539f580847f13.1537545258.git-series.wei.liu2@citrix.com>
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

T24gOS8yMS8xOCA2OjU0IFBNLCBXZWkgTGl1IHdyb3RlOgo+IFRoZXkgYXJlIHVzZWQgYnkgSFZN
IGNvZGUgb25seS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgo+IC0tLQo+IHY1OiBuZXcKPiAtLS0KPiAgeGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3Mu
YyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9h
Y2Nlc3MuYwo+IGluZGV4IDIyMTdiZGEuLjgyNmMzNWYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L21tL21lbV9hY2Nlc3MuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMK
PiBAQCAtNTAxLDYgKzUwMSw3IEBAIHZvaWQgYXJjaF9wMm1fc2V0X2FjY2Vzc19yZXF1aXJlZChz
dHJ1Y3QgZG9tYWluICpkLCBib29sIGFjY2Vzc19yZXF1aXJlZCkKPiAgICAgIH0KPiAgfQo+ICAK
PiArI2lmZGVmIENPTkZJR19IVk0KPiAgLyoKPiAgICogU2V0L2NsZWFyIHRoZSAjVkUgc3VwcHJl
c3MgYml0IGZvciBhIHBhZ2UuICBPbmx5IGF2YWlsYWJsZSBvbiBWTVguCj4gICAqLwo+IEBAIC02
MDAsNiArNjAxLDcgQEAgaW50IHAybV9nZXRfc3VwcHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwg
Z2ZuX3QgZ2ZuLCBib29sICpzdXBwcmVzc192ZSwKPiAgCj4gICAgICByZXR1cm4gMDsKPiAgfQo+
ICsjZW5kaWYKPiAgCj4gIC8qCj4gICAqIExvY2FsIHZhcmlhYmxlczoKCkhlbGxvIFdlaSwKCkkg
YW0gd29ya2luZyBvbiBtb3ZpbmcgdGhlc2UgZnVuY3Rpb25zIHRvIHAybS5jIChidXQgd2FpdGlu
ZyBmb3IKR2VvcmdlJ3MgcmVwbHkgb24gdGhlIFZNWCAjVkUgY2hlY2tzKSwgc28gaWYgeW91J2Qg
bGlrZSAtIGFuZCBmZWVsCnRoYXQncyBhcHByb3ByaWF0ZSAtIEkgY2FuIGFsc28gcHV0IHRoYXQg
Y29kZSB1bmRlciBDT05GSUdfSFZNIGluIHRoZQpjbGVhbnVwIHBhdGNoLiBJcyB0aGF0IHNvbWV0
aGluZyB5b3UnZCBiZSBpbnRlcmVzdGVkIGluPwoKT3RoZXJ3aXNlLCBBY2tlZC1ieTogUmF6dmFu
IENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiwgYW5kCkknbGwgbW92ZSB0aGUg
bmV3IGNvZGUgYXMgd2VsbC4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
