From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: [SVM] Adding page access bits
Date: Thu, 10 May 2018 12:59:51 +0000
Message-ID: <1525957212.27235.13.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=glpx=h5=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1fGlBB-0001NN-52
 for xen-devel@lists.xenproject.org; Thu, 10 May 2018 13:00:17 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 835D03041479
 for <xen-devel@lists.xenproject.org>; Thu, 10 May 2018 17:16:14 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id A925E7FC29
 for <xen-devel@lists.xenproject.org>; Thu, 10 May 2018 16:00:14 +0300 (EEST)
Content-Language: en-US
Content-ID: <2182A1BBA727E6469F8FE4AB222804CC@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sDQoNCldlIHdhbnQgdG8gYWRkIHRoZSBwYWdlIGFjY2VzcyBmdW5jdGlvbmFsaXR5IHRv
IHRoZSBTVk0gY29kZS4gV2UgaGF2ZQ0KYmVlbiB0cnlpbmcgdG8gYWRkIDQgYml0cyBpbiB0aGUg
cHRlIGJ1dCBhbGwgc2VlbSB0byBiZSB0YWtlbi4NCg0KSXMgdGhlcmUgYSB3YXkgdG8gYWNjb21t
b2RhdGUgdGhlbSBpbiB0aGUgMjQgYml0IGZsYWcgbWFzaz8NCg0KSSB0aGluayBpdCBjYW4gYmUg
ZG9uZSBieSBtb3ZpbmcgdGhlIDQgcHJvdGVjdGlvbiBrZXkgZmllbGQgYml0cyBmcm9tDQoyMjox
OSB0byAyMzozMCBzbyB3ZSBjYW4gaGF2ZSB0aGUgMTk6MTYgZm9yIGFjY2Vzcy4gTm90IHN1cmUg
aWYgYml0IDIzDQppcyBjbGVhcg0KDQpBbnkgdGhvdWdodHMgb24gdGhpcyBtYXR0ZXIgYXJlIGFw
cHJlY2lhdGVkLg0KDQpUaGFua3MsDQpBbGV4DQoNCl9fX19fX19fX19fX19fX19fX19fX19fXw0K
VGhpcyBlbWFpbCB3YXMgc2Nhbm5lZCBieSBCaXRkZWZlbmRlcg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
