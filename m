From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V11 0/5] Fix VGA logdirty related display
 freezes with altp2m
Date: Wed,  5 Dec 2018 11:18:03 +0200
Message-ID: <1544001488-23763-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ngje=oo=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gUTJv-0000pb-9E
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 09:18:15 +0000
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 7A5C03016E6E
 for <xen-devel@lists.xenproject.org>; Wed,  5 Dec 2018 11:18:12 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 76F8C306E459
 for <xen-devel@lists.xenproject.org>; Wed,  5 Dec 2018 11:18:12 +0200 (EET)
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
Y2spCmNoYW5nZXMgdG8gYWxsIHAybXMuCgpbUEFUQ0ggVjExIDEvNV0geDg2L3AybTogYWxsb2Nh
dGUgbG9nZGlydHlfcmFuZ2VzIGZvciBhbHRwMm1zCltQQVRDSCBWMTEgMi81XSB4ODYvcDJtOiBy
ZWZhY3RvciBwMm1fcmVzZXRfYWx0cDJtKCkKW1BBVENIIFYxMSAzLzVdIHg4Ni9hbHRwMm06IGZp
eCBkaXNwbGF5IGZyb3plbiB3aGVuIHN3aXRjaGluZyB0byBhIG5ldyB2aWV3IGVhcmx5CltQQVRD
SCBWMTEgNC81XSBwMm06IEFsd2F5cyB1c2UgaG9zdHAybSB3aGVuIGNsaXBwaW5nIHJhbmdlc2V0
cwpbUEFUQ0ggVjExIDUvNV0gcDJtOiBjaGFuZ2VfdHlwZV9yYW5nZTogT25seSBpbnZhbGlkYXRl
IG1hcHBlZCBnZm5zCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
