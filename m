From: Adrian Pop <apop@bitdefender.com>
Subject: [PATCH v5 1/3] x86/mm: Change default value for
 suppress #VE in set_mem_access()
Date: Mon,  3 Sep 2018 18:48:34 +0300
Message-ID: <20180903154836.25708-2-apop@bitdefender.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ffst=lr=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fwr5r-0006ut-GO
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 15:48:47 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 6D5B0305CD3B
 for <xen-devel@lists.xenproject.org>; Mon,  3 Sep 2018 18:48:46 +0300 (EEST)
Received: from smtp01.buh.bitdefender.com (smtp.bitdefender.biz [10.17.80.75])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 694FB7FC77
 for <xen-devel@lists.xenproject.org>; Mon,  3 Sep 2018 18:48:46 +0300 (EEST)
In-Reply-To: <20180903154836.25708-1-apop@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, Vlad Ioan Topan <itopan@bitdefender.com>
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
YW4gUG9wIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vbWVtX2Fj
Y2Vzcy5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2Fy
Y2gveDg2L21tL21lbV9hY2Nlc3MuYwppbmRleCA4NGQyNjBlYmQ4Li5lMTUyMmEwYjc1IDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9t
bS9tZW1fYWNjZXNzLmMKQEAgLTI4NCw4ICsyODQsNyBAQCBpbnQgcDJtX3NldF9hbHRwMm1fbWVt
X2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcDJtX2RvbWFpbiAqaHAybSwKICAgICAg
ICAgfQogICAgIH0KIAotICAgIHJldHVybiBhcDJtLT5zZXRfZW50cnkoYXAybSwgZ2ZuLCBtZm4s
IFBBR0VfT1JERVJfNEssIHQsIGEsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICBjdXJyZW50
LT5kb21haW4gIT0gZCk7CisgICAgcmV0dXJuIGFwMm0tPnNldF9lbnRyeShhcDJtLCBnZm4sIG1m
biwgUEFHRV9PUkRFUl80SywgdCwgYSwgLTEpOwogfQogCiBzdGF0aWMgaW50IHNldF9tZW1fYWNj
ZXNzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwMm1fZG9tYWluICpwMm0sCi0tIAoyLjE4LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
