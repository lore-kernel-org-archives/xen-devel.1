From: Adrian Pop <apop@bitdefender.com>
Subject: [PATCH v2 0/2] Add an altp2m subop for obtaining the
 page mem access
Date: Thu,  5 Jul 2018 13:44:43 +0300
Message-ID: <20180705104445.8048-1-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ccth=jv=bitdefender.com=apop@srs-us1.protection.inumbo.net>)
 id 1fb1kv-0005LW-01
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 10:44:57 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 8D5CF3086EE6
 for <xen-devel@lists.xenproject.org>; Thu,  5 Jul 2018 15:01:07 +0300 (EEST)
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id AB3EB7FC2A
 for <xen-devel@lists.xenproject.org>; Thu,  5 Jul 2018 13:44:55 +0300 (EEST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Adrian Pop <apop@bitdefender.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudGx5IHRoZXJlIGlzIGEgc3Vib3AgZm9yIHNldHRpbmcgdGhlIG1lbWFjY2VzcyBvZiBh
IHBhZ2UsIGJ1dCBub3QKZm9yIGNvbnN1bHRpbmcgaXQuICBUaGUgbmV3IEhWTU9QX2FsdHAybV9n
ZXRfbWVtX2FjY2VzcyBhZGRzIHRoaXMKZnVuY3Rpb25hbGl0eS4KCkNoYW5nZXMgaW4gdjI6Ci0g
dXNlIHRoZSBfcDJtX2dldF9tZW1fYWNjZXNzIGhlbHBlciBmcm9tIHAybV9nZXRfbWVtX2FjY2Vz
cwotIG1pbm9yIEFybSBhZGp1c3RtZW50cwotIG1vdmUgb3V0IHRoZSBhZGRpdGlvbiBvZiBhIG1l
bWFjY2VzcyBoZWxwZXIgZnVuY3Rpb24gdG8gYSBzZXBhcmF0ZQogIHBhdGNoIGluIHRoZSBhdHRl
bXB0cyBvZiBtYWtpbmcgdGhlIGRpZmYgY2xlYXJlcgoKQWRyaWFuIFBvcCAoMik6CiAgeDg2L21l
bV9hY2Nlc3M6IEFkZCBhIGhlbHBlciBmdW5jdGlvbiBmb3IgbWVtYWNjZXNzIGNvbnZlcnNpb24K
ICB4ODYvYWx0cDJtOiBBZGQgYSBzdWJvcCBmb3Igb2J0YWluaW5nIHRoZSBtZW0gYWNjZXNzIG9m
IGEgcGFnZQoKIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oICAgfCAgMyArKwogdG9vbHMv
bGlieGMveGNfYWx0cDJtLmMgICAgICAgICB8IDMzICsrKysrKysrKysrKystLQogeGVuL2FyY2gv
YXJtL21lbV9hY2Nlc3MuYyAgICAgICB8ICA4ICsrKy0KIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMg
ICAgICAgICAgfCAyNiArKysrKysrKysrLS0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMg
ICAgfCA3MyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIHhlbi9jb21tb24vbWVt
X2FjY2Vzcy5jICAgICAgICAgfCAgMiArLQogeGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3Au
aCB8IDEwICsrKy0tCiB4ZW4vaW5jbHVkZS94ZW4vbWVtX2FjY2Vzcy5oICAgIHwgIDMgKy0KIDgg
ZmlsZXMgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQoKLS0gCjIu
MTcuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
