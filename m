From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [SVM] Getting the length of the current instruction in
 svm_vmexit_handler()
Date: Wed, 14 Mar 2018 16:56:06 +0200
Message-ID: <144d97a9-7616-bd21-17f6-6621fa5ad69e@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=c2fp=ge=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1ew7pD-0000h8-Fl
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 14:56:19 +0000
Received: from smtp03.buh.bitdefender.org (smtp.bitdefender.biz [10.17.80.77])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id 8AB057FBF6
 for <xen-devel@lists.xenproject.org>; Wed, 14 Mar 2018 16:56:10 +0200 (EET)
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Alexandru Isaila <aisaila@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpXZSdkIGxpa2UgdG8gcmV0cmlldmUgdGhlIGxlbmd0aCBvZiB0aGUgY3VycmVudCBp
bnN0cnVjdGlvbiBpbgpzdm1fdm1leGl0X2hhbmRsZXIoKSwgc3BlY2lmaWNhbGx5IGZvciB0aGUg
Vk1FWElUX0VYQ0VQVElPTl9EQiBhbmQKVk1FWElUX0VYQ0VQVElPTl9CUCBjYXNlcy4KCldlJ3Zl
IGNvbWJlZCB0aGUgdm1jYiB0byBubyBhdmFpbC4gRXZlcnl0aGluZyB3ZSd2ZSB0aG91Z2h0IHRv
IGNoZWNrCihleGl0aW5mbzEsIGV4aXRpbmZvMiwgZXhpdGludGluZm8pIHR1cm5zIG91dCB0byBi
ZSB6ZXJvIHRoZXJlIHdoaWxlCnRlc3RpbmcuCgpUaGVyZSdzIF9fZ2V0X2luc3RydWN0aW9uX2xl
bmd0aCh2Y3B1LCBpbnN0ciksIGJ1dCBpdCBleHBlY3RzIHRvIGJlIGZlZAp0aGUgZXhhY3QgaW5z
dHJ1Y3Rpb24gd2Ugd2FudCB0aGUgbGVuZ3RoIGZvciwgd2hpY2ggb2J2aW91c2x5IGRlZmVhdHMK
dGhlIHB1cnBvc2UgaGVyZS4KCklzIHRoZXJlIGEgY2xlYW4gd2F5IHRvIGdldCB0aGUgY3VycmVu
dCBpbnN0cnVjdGlvbiBsZW5ndGggbGlrZSB3ZSBkbyBpbgp0aGUgVk1YIGNhc2UgKF9fdm1yZWFk
KFZNX0VYSVRfSU5TVFJVQ1RJT05fTEVOLCAmaW5zbl9sZW4pKSB0aGF0IHdlJ3JlCm92ZXJsb29r
aW5nPwoKClRoYW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
