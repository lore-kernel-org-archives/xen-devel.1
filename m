From: Adrian Pop <apop@bitdefender.com>
Subject: [PATCH v6 1/3] x86/mm: Change default value for
 suppress #VE in set_mem_access()
Date: Wed, 12 Sep 2018 10:50:04 +0300
Message-ID: <20180912075006.31791-2-apop@bitdefender.com>
References: <20180912075006.31791-1-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mfac=l2=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fzzux-0006RK-5P
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 07:50:31 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id CD109305FFBA
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 10:50:29 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id C6C197FBFF
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 10:50:29 +0300 (EEST)
In-Reply-To: <20180912075006.31791-1-apop@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Vlad Ioan Topan <itopan@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogVmxhZCBJb2FuIFRvcGFuIDxpdG9wYW5AYml0ZGVmZW5kZXIuY29tPgoKVGhlIGRlZmF1
bHQgdmFsdWUgZm9yIHRoZSAic3VwcHJlc3MgI1ZFIiBiaXQgc2V0IGJ5IHNldF9tZW1fYWNjZXNz
KCkKY3VycmVudGx5IGRlcGVuZHMgb24gd2hldGhlciB0aGUgY2FsbCBpcyBtYWRlIGZyb20gdGhl
IHNhbWUgZG9tYWluICh0aGUKYml0IGlzIHNldCB3aGVuIGNhbGxlZCBmcm9tIGFub3RoZXIgZG9t
YWluIGFuZCBjbGVhcmVkIGlmIGNhbGxlZCBmcm9tCnRoZSBzYW1lIGRvbWFpbikuIFRoaXMgcGF0
Y2ggY2hhbmdlcyB0aGF0IGJlaGF2aW9yIHRvIGluaGVyaXQgdGhlIG9sZApzdXBwcmVzcyAjVkUg
Yml0IHZhbHVlIGlmIGl0IGlzIGFscmVhZHkgc2V0IGFuZCB0byBzZXQgaXQgdG8gMQpvdGhlcndp
c2UsIHdoaWNoIGlzIHNhZmVyIGFuZCBtb3JlIHJlbGlhYmxlLgoKU2lnbmVkLW9mZi1ieTogVmxh
ZCBJb2FuIFRvcGFuIDxpdG9wYW5AYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZHJp
YW4gUG9wIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjY6Ci0gYWRkIGEg
Y29tbWVudCBpbiB0aGUgY29kZSB0byBleHBsYWluIHRoZSBtZWFuaW5nIG9mIHRoZSAtMSBtYWdp
YyB2YWx1ZQotLS0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgfCA3ICsrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNj
ZXNzLmMKaW5kZXggYThiM2U5OWVjNC4uYzk4MGYxNzQ0ZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L21tL21lbV9hY2Nlc3MuYworKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCkBA
IC0yODUsOCArMjg1LDExIEBAIGludCBwMm1fc2V0X2FsdHAybV9tZW1fYWNjZXNzKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCBwMm1fZG9tYWluICpocDJtLAogICAgICAgICB9CiAgICAgfQogCi0g
ICAgcmV0dXJuIGFwMm0tPnNldF9lbnRyeShhcDJtLCBnZm4sIG1mbiwgUEFHRV9PUkRFUl80Sywg
dCwgYSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGN1cnJlbnQtPmRvbWFpbiAhPSBkKTsK
KyAgICAvKgorICAgICAqIEluaGVyaXQgdGhlIG9sZCBzdXBwcmVzcyAjVkUgYml0IHZhbHVlIGlm
IGl0IGlzIGFscmVhZHkgc2V0LCBvciBzZXQgaXQKKyAgICAgKiB0byAxIG90aGVyd2lzZQorICAg
ICAqLworICAgIHJldHVybiBhcDJtLT5zZXRfZW50cnkoYXAybSwgZ2ZuLCBtZm4sIFBBR0VfT1JE
RVJfNEssIHQsIGEsIC0xKTsKIH0KIAogc3RhdGljIGludCBzZXRfbWVtX2FjY2VzcyhzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAotLSAKMi4xOC4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
