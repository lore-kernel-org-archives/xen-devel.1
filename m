From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH for-4.12 V13 0/5] Fix VGA logdirty related
 display freezes with altp2m
Date: Fri, 21 Dec 2018 21:09:33 +0200
Message-ID: <1545419378-3293-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eOA2=O6=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gaQB7-0002BN-Es
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 19:09:45 +0000
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 EF3C2301AB32
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 21:09:42 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id E012C306E477
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 21:09:42 +0200 (EET)
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
Y2spCmNoYW5nZXMgdG8gYWxsIHAybXMuCgpbUEFUQ0ggZm9yLTQuMTIgVjEzIDEvNV0geDg2L3Ay
bTogYWxsb2NhdGUgbG9nZGlydHlfcmFuZ2VzIGZvciBhbHRwMm1zCltQQVRDSCBmb3ItNC4xMiBW
MTMgMi81XSB4ODYvcDJtOiByZWZhY3RvciBwMm1fcmVzZXRfYWx0cDJtKCkKW1BBVENIIGZvci00
LjEyIFYxMyAzLzVdIHg4Ni9hbHRwMm06IGZpeCBkaXNwbGF5IGZyb3plbiB3aGVuIHN3aXRjaGlu
ZyB0byBhIG5ldyB2aWV3IGVhcmx5CltQQVRDSCBmb3ItNC4xMiBWMTMgNC81XSBwMm06IEFsd2F5
cyB1c2UgaG9zdHAybSB3aGVuIGNsaXBwaW5nIHJhbmdlc2V0cwpbUEFUQ0ggZm9yLTQuMTIgVjEz
IDUvNV0gcDJtOiBjaGFuZ2VfdHlwZV9yYW5nZTogT25seSBpbnZhbGlkYXRlIG1hcHBlZCBnZm5z
CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
