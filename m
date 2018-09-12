From: Adrian Pop <apop@bitdefender.com>
Subject: [PATCH v6 0/3] Add hvmops for setting and getting the
 suppress #VE bit
Date: Wed, 12 Sep 2018 10:50:03 +0300
Message-ID: <20180912075006.31791-1-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mfac=l2=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fzzuy-0006RU-56
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 07:50:32 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 622F0301AB35
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 10:50:29 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 55FAB7FBFF
 for <xen-devel@lists.xenproject.org>; Wed, 12 Sep 2018 10:50:29 +0300 (EEST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>
List-Id: xen-devel@lists.xenproject.org

QXMgdGhlIGNvZGUgc3RhbmRzIHJpZ2h0IG5vdywgYWZ0ZXIgRG9tVSBoYXMgZW5hYmxlZCAjVkUg
dXNpbmcKSFZNT1BfYWx0cDJtX3ZjcHVfZW5hYmxlX25vdGlmeSwgYWxsIGl0cyBwYWdlcyBoYXZl
IHRoZSAjVkUgc3VwcHJlc3MgYml0CmNsZWFyZWQsIGdlbmVyYXRpbmcgI1ZFcyBmb3IgYW55IEVQ
VCB2aW9sYXRpb24uICBUaGVyZSBpcyBjdXJyZW50bHkgbm8Kd2F5IHRvIGNoYW5nZSB0aGUgdmFs
dWUgb2YgdGhlICNWRSBzdXBwcmVzcyBiaXQgZm9yIGEgcGFnZSBmcm9tIGEKZG9tYWluOyBpdCBj
YW4gb25seSBiZSBkb25lIGluIFhlbiBpbnRlcm5hbGx5IHVzaW5nIGVwdF9zZXRfZW50cnkoKS4K
CkZvbGxvd2luZyB0aGUgZGlzY3Vzc2lvbiBmcm9tCmh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTAzL21zZzAxMzEyLmh0bWwgdGhlc2UKcGF0Y2hlcyBp
bnRyb2R1Y2UgbmV3IGh2bW9wcyBmb3Igc2V0dGluZyBhbmQgZ2V0dGluZyB0aGlzIGJpdCBhbmQg
dGh1cwoKQWRyaWFuIFBvcCAoMik6CiAgeDg2L2FsdHAybTogQWRkIGEgaHZtb3AgZm9yIHNldHRp
bmcgdGhlIHN1cHByZXNzICNWRSBiaXQKICB4ODYvYWx0cDJtOiBBZGQgYSBodm1vcCBmb3IgcXVl
cnlpbmcgdGhlIHN1cHByZXNzICNWRSBiaXQKClZsYWQgSW9hbiBUb3BhbiAoMSk6CiAgeDg2L21t
OiBDaGFuZ2UgZGVmYXVsdCB2YWx1ZSBmb3Igc3VwcHJlc3MgI1ZFIGluIHNldF9tZW1fYWNjZXNz
KCkKCiB0b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCAgIHwgICA0ICsrCiB0b29scy9saWJ4
Yy94Y19hbHRwMm0uYyAgICAgICAgIHwgIDUwICsrKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2
L2h2bS9odm0uYyAgICAgICAgICB8ICAzMyArKysrKysrKysrCiB4ZW4vYXJjaC94ODYvbW0vbWVt
X2FjY2Vzcy5jICAgIHwgMTA3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiB4ZW4v
aW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oIHwgIDEzICsrKysKIHhlbi9pbmNsdWRlL3hlbi9t
ZW1fYWNjZXNzLmggICAgfCAgIDYgKysKIDYgZmlsZXMgY2hhbmdlZCwgMjExIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgotLSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
