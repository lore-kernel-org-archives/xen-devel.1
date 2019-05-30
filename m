From: Baodong Chen <chenbaodong@mxnavi.com>
Subject: [PATCH] xen/sched_null: Superficial clean-ups
Date: Thu, 30 May 2019 17:33:14 +0800
Message-ID: <1559208794-4549-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=k8x6=T6=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hWHRc-0006SG-Iz
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 09:33:56 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Baodong Chen <chenbaodong@mxnavi.com>, George Dunlap <george.dunlap@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

KiBSZW1vdmUgdW51c2VkIGRlcGVuZGVuY3kgJ2tleWhhbmRsZXIuaCcKKiBNYWtlIHNjaGVkX251
bGxfZGVmIHN0YXRpYwoKU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVuYmFvZG9uZ0Bt
eG5hdmkuY29tPgpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWRfbnVsbC5jIHwgMyArLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3NjaGVkX251bGwuYyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCmluZGV4IGE1OWRiYjIu
LmM5NzAwZjEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCisrKyBiL3hlbi9j
b21tb24vc2NoZWRfbnVsbC5jCkBAIC0zMSw3ICszMSw2IEBACiAjaW5jbHVkZSA8eGVuL3NjaGVk
Lmg+CiAjaW5jbHVkZSA8eGVuL3NjaGVkLWlmLmg+CiAjaW5jbHVkZSA8eGVuL3NvZnRpcnEuaD4K
LSNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPgogI2luY2x1ZGUgPHhlbi90cmFjZS5oPgogCiAv
KgpAQCAtODcxLDcgKzg3MCw3IEBAIHN0YXRpYyB2b2lkIG51bGxfZHVtcChjb25zdCBzdHJ1Y3Qg
c2NoZWR1bGVyICpvcHMpCiAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcHJ2LT5sb2NrLCBm
bGFncyk7CiB9CiAKLWNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgc2NoZWRfbnVsbF9kZWYgPSB7Citz
dGF0aWMgY29uc3Qgc3RydWN0IHNjaGVkdWxlciBzY2hlZF9udWxsX2RlZiA9IHsKICAgICAubmFt
ZSAgICAgICAgICAgPSAibnVsbCBTY2hlZHVsZXIiLAogICAgIC5vcHRfbmFtZSAgICAgICA9ICJu
dWxsIiwKICAgICAuc2NoZWRfaWQgICAgICAgPSBYRU5fU0NIRURVTEVSX05VTEwsCi0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
