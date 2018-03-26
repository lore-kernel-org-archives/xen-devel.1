From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: [SVM]NPF page mapping
Date: Mon, 26 Mar 2018 13:57:06 +0000
Message-ID: <1522072626.9360.13.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wpsw=gq=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1f0Tew-0000PS-8L
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 15:03:42 +0000
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id DC74C7FEA1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Mar 2018 17:06:21 +0300 (EEST)
Content-Language: en-US
Content-ID: <8E6BC5C01497B94C8BFD43A6BF62A54C@bitdefender.com>
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

SGVsbG8sDQoNCldlIGFyZSB0cnlpbmcgdG8gaW50cm9kdWNlIHRoZSBQYWNlIEFjY2VzcyBmdW5j
dGlvbmFsaXR5IG9uIFNWTS4gUmlnaHQNCm5vdywgb24gdGhlIHAybV9wdF9zZXRfZW50cnkoKSB0
aGUgcDJtX2FjY2Vzc190IGlzIG5vdCBzZXQgYW5kIGluIHRoZQ0KcDJtX3B0X2dldF9lbnRyeSgp
IGl0IGlzIHJldHVybmVkIGFzIHAybV9hY2Nlc3Nfcnd4IGJ5IGRlZmF1bHQuDQoNCkNvdWxkIHlv
dSBwbGVhc2Ugc3VnZ2VzdCBzb21lIHVwLXRvLWRhdGUgZG9jdW1lbnRhdGlvbiBvbiBOUFQsDQpl
c3BlY2lhbGx5IGlsbHVzdHJhdGluZyB0aGUgbWFwcGluZyBvZiB0aGUgdTY0IGludHB0ZV90IHR5
cGU/IEFsc28sIGFueQ0Kc3VnZ2VzdGlvbnMgb24gaG93IHRvIGFwcHJvYWNoIHRoaXMgYXJlIGFw
cHJlY2lhdGVkLg0KDQoNClRoYW5rcywNCkFsZXgNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
DQpUaGlzIGVtYWlsIHdhcyBzY2FubmVkIGJ5IEJpdGRlZmVuZGVyDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
