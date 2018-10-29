From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V3 0/3] Fix VGA logdirty related display freezes
 with altp2m
Date: Mon, 29 Oct 2018 14:40:34 +0200
Message-ID: <1540816837-8936-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=auah=nj=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gH6qk-00057A-KS
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 12:40:54 +0000
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 D8875305FFA7
 for <xen-devel@lists.xenproject.org>; Mon, 29 Oct 2018 14:40:51 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D629F303A565
 for <xen-devel@lists.xenproject.org>; Mon, 29 Oct 2018 14:40:51 +0200 (EET)
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
bmdlcyB0byBhbGwKcDJtcy4KCltQQVRDSCBWMyAxLzNdIHg4Ni9hbHRwMm06IHByb3BhZ2F0ZSBl
cHQuYWQgY2hhbmdlcyB0byBhbGwgYWN0aXZlIGFsdHAybXMKW1BBVENIIFYzIDIvM10geDg2L21t
OiBhbGxvY2F0ZSBsb2dkaXJ0eV9yYW5nZXMgZm9yIGFsdHAybXMKW1BBVENIIFYzIDMvM10geDg2
L2FsdHAybTogZml4IGRpc3BsYXkgZnJvemVuIHdoZW4gc3dpdGNoaW5nIHRvIGEgbmV3IHZpZXcg
ZWFybHkKCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
