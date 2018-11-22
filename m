From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V9 0/7] Fix VGA logdirty related display freezes
 with altp2m
Date: Thu, 22 Nov 2018 13:40:21 +0200
Message-ID: <1542886828-11241-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QveS=OB=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gPnLX-0005RB-La
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 11:40:35 +0000
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 272D4301AB3F
 for <xen-devel@lists.xenproject.org>; Thu, 22 Nov 2018 13:40:33 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 1E9BA306E4AC
 for <xen-devel@lists.xenproject.org>; Thu, 22 Nov 2018 13:40:33 +0200 (EET)
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
Y2spCmNoYW5nZXMgdG8gYWxsIHAybXMuCgpbUEFUQ0ggVjkgMS83XSB4ODYvbW06IGludHJvZHVj
ZSBwMm1fe2luaXQsZnJlZX1fbG9nZGlydHkoKQpbUEFUQ0ggVjkgMi83XSB4ODYvcDJtOiBzd2l0
Y2ggZ2xvYmFsX2xvZ2RpcnR5IGZyb20gYm9vbF90IHRvIGJvb2wKW1BBVENIIFY5IDMvN10geDg2
L3AybTogYWxsb2NhdGUgbG9nZGlydHlfcmFuZ2VzIGZvciBhbHRwMm1zCltQQVRDSCBWOSA0Lzdd
IHg4Ni9wMm06IHJlZmFjdG9yIHAybV9yZXNldF9hbHRwMm0oKQpbUEFUQ0ggVjkgNS83XSB4ODYv
YWx0cDJtOiBmaXggZGlzcGxheSBmcm96ZW4gd2hlbiBzd2l0Y2hpbmcgdG8gYSBuZXcgdmlldyBl
YXJseQpbUEFUQ0ggVjkgNi83XSBwMm06IEFsd2F5cyB1c2UgaG9zdHAybSB3aGVuIGNsaXBwaW5n
IHJhbmdlc2V0cwpbUEFUQ0ggVjkgNy83XSBwMm06IGNoYW5nZV9yYW5nZV90eXBlOiBPbmx5IGlu
dmFsaWRhdGUgbWFwcGVkIGdmbnMKCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
