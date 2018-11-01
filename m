From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V4 0/3] Fix VGA logdirty related display freezes
 with altp2m
Date: Thu,  1 Nov 2018 16:45:39 +0200
Message-ID: <1541083542-22464-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kl4z=nm=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gIEEH-0003Wf-DP
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 14:45:49 +0000
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 17402305FFA2
 for <xen-devel@lists.xenproject.org>; Thu,  1 Nov 2018 16:45:47 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 122403084EEC
 for <xen-devel@lists.xenproject.org>; Thu,  1 Nov 2018 16:45:47 +0200 (EET)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGlzIHNlcmllcyBhaW1zIHRvIHByZXZlbnQgdGhlIGRpc3BsYXkgZnJvbSBmcmVl
emluZyB3aGVuCmVuYWJsaW5nIGFsdHAybSBhbmQgc3dpdGNoaW5nIHRvIGEgbmV3IHZpZXcgKGFu
ZCBhc3NvcnRlZCBwcm9ibGVtcwp3aGVuIHJlc2l6aW5nIHRoZSBkaXNwbGF5KS4gU2luY2UgdGhl
IGxhc3QgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLAp3aGF0IHdhcyBwcmV2aW91c2x5IHRoZSBzZWNv
bmQgKGFuZCBsYXN0KSBwYXRjaCBoYXMgYmVlbiBzcGxpdCBpbgp0d28gcGF0Y2hlcywgdGhlIGZp
cnN0IG9mIHdoaWNoIG9ubHkgY29uY2VybnMgaXRzZWxmIHdpdGggcmFuZ2VzZXQKYWxsb2NhdGlv
biAvIGRlYWxsb2NhdGlvbiAvIGluaXRpYWxpemF0aW9uLgoKVGhlIGZpcnN0IHBhdGNoIHByb3Bh
Z2F0ZXMgZXB0LmFkIGNoYW5nZXMgdG8gYWxsIGFjdGl2ZSBhbHRwMm1zLAp0aGUgc2Vjb25kIG9u
ZSBhbGxvY2F0ZXMgYW5kIGluaXRpYWxpemVzIGEgbmV3IGxvZ2RpcnR5IHJhbmdlc2V0IGZvcgpl
YWNoIG5ldyBhbHRwMm0sIGFuZCB0aGUgdGhpcmQgcHJvcGFnYXRlcyAodW5kZXIgbG9jaykgY2hh
bmdlcyB0byBhbGwKcDJtcy4KCltQQVRDSCBWNCAxLzNdIHg4Ni9hbHRwMm06IHByb3BhZ2F0ZSBl
cHQuYWQgY2hhbmdlcyB0byBhbGwgYWN0aXZlCltQQVRDSCBWNCAyLzNdIHg4Ni9tbTogYWxsb2Nh
dGUgbG9nZGlydHlfcmFuZ2VzIGZvciBhbHRwMm1zCltQQVRDSCBWNCAzLzNdIHg4Ni9hbHRwMm06
IGZpeCBkaXNwbGF5IGZyb3plbiB3aGVuIHN3aXRjaGluZyB0byBhIG5ldwoKClRoYW5rcywKUmF6
dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
