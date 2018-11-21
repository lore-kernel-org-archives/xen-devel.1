From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V8 0/7] Fix VGA logdirty related display freezes
 with altp2m
Date: Wed, 21 Nov 2018 12:19:47 +0200
Message-ID: <1542795594-4252-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rqmg=oa=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gPPc1-0001Ri-78
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 10:20:01 +0000
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 619D3301AB37
 for <xen-devel@lists.xenproject.org>; Wed, 21 Nov 2018 12:19:58 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 5E8313084EEC
 for <xen-devel@lists.xenproject.org>; Wed, 21 Nov 2018 12:19:58 +0200 (EET)
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

VGhpcyBzZXJpZXMgYWltcyB0byBwcmV2ZW50IHRoZSBkaXNwbGF5IGZyb20gZnJlZXppbmcgd2hl
bgplbmFibGluZyBhbHRwMm0gYW5kIHN3aXRjaGluZyB0byBhIG5ldyB2aWV3IChhbmQgYXNzb3J0
ZWQgcHJvYmxlbXMKd2hlbiByZXNpemluZyB0aGUgZGlzcGxheSkuCgpUaGUgc2VyaWVzIGludHJv
ZHVjZXMgcDJtX3tpbml0LGZyZWV9X2xvZ2RpcnR5KCksIGFsbG9jYXRlcyBhIG5ldwpsb2dkaXJ0
eSByYW5nZXNldCBmb3IgZWFjaCBuZXcgYWx0cDJtLCBhbmQgIHByb3BhZ2F0ZXMgKHVuZGVyIGxv
Y2spCmNoYW5nZXMgdG8gYWxsIHAybXMuCgpTaW5jZSB0aGUgbGFzdCB2ZXJzaW9uIG9mIHRoZSBz
ZXJpZXMsIHRoZSBzZWNvbmQgcGF0Y2ggaGFzIGJlZW4Kc3BsaXQgaW50byB0aHJlZSBzbWFsbGVy
IHBhdGNoZXMgZm9yIGVhc2llciByZXZpZXcuCgpbUEFUQ0ggVjggMS83XSB4ODYvbW06IGludHJv
ZHVjZSBwMm1fe2luaXQsZnJlZX1fbG9nZGlydHkoKQpbUEFUQ0ggVjggMi83XSB4ODYvcDJtOiBz
d2l0Y2ggZ2xvYmFsX2xvZ2RpcnR5IGZyb20gYm9vbF90IHRvIGJvb2wKW1BBVENIIFY4IDMvN10g
eDg2L3AybTogYWxsb2NhdGUgbG9nZGlydHlfcmFuZ2VzIGZvciBhbHRwMm1zCltQQVRDSCBWOCA0
LzddIHg4Ni9wMm06IHJlZmFjdG9yIHAybV9yZXNldF9hbHRwMm0oKQpbUEFUQ0ggVjggNS83XSB4
ODYvYWx0cDJtOiBmaXggZGlzcGxheSBmcm96ZW4gd2hlbiBzd2l0Y2hpbmcgdG8gYSBuZXcgdmll
dyBlYXJseQpbUEFUQ0ggVjggNi83XSBwMm06IEFsd2F5cyB1c2UgaG9zdHAybSB3aGVuIGNsaXBw
aW5nIHJhbmdlc2V0cwpbUEFUQ0ggVjggNy83XSBwMm06IGNoYW5nZV9yYW5nZV90eXBlOiBPbmx5
IGludmFsaWRhdGUgbWFwcGVkIGdmbnMKCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
