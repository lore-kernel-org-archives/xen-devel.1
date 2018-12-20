From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH V12 0/5] Fix VGA logdirty related display
 freezes with altp2m
Date: Thu, 20 Dec 2018 19:38:33 +0200
Message-ID: <1545327518-5731-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iE3c=O5=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1ga2HW-0007r9-7i
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 17:38:46 +0000
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 C8EBF3011FC1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Dec 2018 19:38:43 +0200 (EET)
Received: from rcojocaru.npunix.bitdefender.biz (unknown [10.17.12.174])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B8C34306E477
 for <xen-devel@lists.xenproject.org>; Thu, 20 Dec 2018 19:38:43 +0200 (EET)
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
Y2spCmNoYW5nZXMgdG8gYWxsIHAybXMuCgpbUEFUQ0ggVjEyIDEvNV0geDg2L3AybTogYWxsb2Nh
dGUgbG9nZGlydHlfcmFuZ2VzIGZvciBhbHRwMm1zCltQQVRDSCBWMTIgMi81XSB4ODYvcDJtOiBy
ZWZhY3RvciBwMm1fcmVzZXRfYWx0cDJtKCkKW1BBVENIIFYxMiAzLzVdIHg4Ni9hbHRwMm06IGZp
eCBkaXNwbGF5IGZyb3plbiB3aGVuIHN3aXRjaGluZyB0byBhIG5ldyB2aWV3IGVhcmx5CltQQVRD
SCBWMTIgNC81XSBwMm06IEFsd2F5cyB1c2UgaG9zdHAybSB3aGVuIGNsaXBwaW5nIHJhbmdlc2V0
cwpbUEFUQ0ggVjEyIDUvNV0gcDJtOiBjaGFuZ2VfdHlwZV9yYW5nZTogT25seSBpbnZhbGlkYXRl
IG1hcHBlZCBnZm5zCgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
