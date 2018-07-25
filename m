From: Adrian Pop <apop@bitdefender.com>
Subject: [PATCH v4 0/3] Add hvmops for setting and getting the
 suppress #VE bit
Date: Wed, 25 Jul 2018 14:18:54 +0300
Message-ID: <20180725111857.22995-1-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8ljw=kj=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fiHp4-0004SE-D4
 for xen-devel@lists.xenproject.org; Wed, 25 Jul 2018 11:19:14 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 60587307FB0B
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jul 2018 15:35:29 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 41C7A7FBC9
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jul 2018 14:19:13 +0300 (EEST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>
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
dGh1cwpoYXZpbmcgY29udHJvbCBvdmVyIHdoaWNoIHBhZ2VzIGdlbmVyYXRlICNWRSBhbmQgd2hp
Y2ggVk0tRXhpdC4KCkFkcmlhbiBQb3AgKDIpOgogIHg4Ni9hbHRwMm06IEFkZCBhIGh2bW9wIGZv
ciBzZXR0aW5nIHRoZSBzdXBwcmVzcyAjVkUgYml0CiAgeDg2L2FsdHAybTogQWRkIGEgaHZtb3Ag
Zm9yIHF1ZXJ5aW5nIHRoZSBzdXBwcmVzcyAjVkUgYml0CgpWbGFkIElvYW4gVG9wYW4gKDEpOgog
IHg4Ni9tbTogQ2hhbmdlIGRlZmF1bHQgdmFsdWUgZm9yIHN1cHByZXNzICNWRSBpbiBzZXRfbWVt
X2FjY2VzcygpCgogdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggICB8ICAgNCArKwogdG9v
bHMvbGlieGMveGNfYWx0cDJtLmMgICAgICAgICB8ICA1MCArKysrKysrKysrKysrKysrCiB4ZW4v
YXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgIHwgIDMzICsrKysrKysrKysKIHhlbi9hcmNoL3g4
Ni9tbS9tZW1fYWNjZXNzLmMgICAgfCAxMDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0KIHhlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmggfCAgMTMgKysrKwogeGVuL2luY2x1
ZGUveGVuL21lbV9hY2Nlc3MuaCAgICB8ICAgNiArKwogNiBmaWxlcyBjaGFuZ2VkLCAyMDcgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
