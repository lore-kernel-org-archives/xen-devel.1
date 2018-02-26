From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen: use hvc console for dom0
Date: Mon, 26 Feb 2018 12:08:22 +0100
Message-ID: <20180226110822.13787-1-jgross__16616.2975634963$1519643245$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=djnd=fu=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eqGdv-00006t-6T
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 11:08:27 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

VG9kYXkgdGhlIGh2YyBjb25zb2xlIGlzIGFkZGVkIGFzIGEgcHJlZmVycmVkIGNvbnNvbGUgZm9y
IHB2IGRvbVVzCm9ubHkuIEFzIHRoaXMgcmVxdWlyZXMgYSBib290IHBhcmFtZXRlciBmb3IgZ2V0
dGluZyBkb20wIG1lc3NhZ2VzIHBlcgpkZWZhdWx0IGFkZCBpdCBmb3IgZG9tMCwgdG9vLgoKU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGFyY2gveDg2
L3hlbi9lbmxpZ2h0ZW5fcHYuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5f
cHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwppbmRleCBjMDQ3ZjQyNTUyZTEuLmQy
Nzc0MGE4MGM1ZSAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9wdi5jCisrKyBi
L2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwpAQCAtMTM3Nyw3ICsxMzc3LDYgQEAgYXNtbGlu
a2FnZSBfX3Zpc2libGUgdm9pZCBfX2luaXQgeGVuX3N0YXJ0X2tlcm5lbCh2b2lkKQogCWlmICgh
eGVuX2luaXRpYWxfZG9tYWluKCkpIHsKIAkJYWRkX3ByZWZlcnJlZF9jb25zb2xlKCJ4ZW5ib290
IiwgMCwgTlVMTCk7CiAJCWFkZF9wcmVmZXJyZWRfY29uc29sZSgidHR5IiwgMCwgTlVMTCk7Ci0J
CWFkZF9wcmVmZXJyZWRfY29uc29sZSgiaHZjIiwgMCwgTlVMTCk7CiAJCWlmIChwY2lfeGVuKQog
CQkJeDg2X2luaXQucGNpLmFyY2hfaW5pdCA9IHBjaV94ZW5faW5pdDsKIAl9IGVsc2UgewpAQCAt
MTQxMCw2ICsxNDA5LDkgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBfX2luaXQgeGVuX3N0
YXJ0X2tlcm5lbCh2b2lkKQogCiAJCXhlbl9ib290X3BhcmFtc19pbml0X2VkZCgpOwogCX0KKwor
CWFkZF9wcmVmZXJyZWRfY29uc29sZSgiaHZjIiwgMCwgTlVMTCk7CisKICNpZmRlZiBDT05GSUdf
UENJCiAJLyogUENJIEJJT1Mgc2VydmljZSB3b24ndCB3b3JrIGZyb20gYSBQViBndWVzdC4gKi8K
IAlwY2lfcHJvYmUgJj0gflBDSV9QUk9CRV9CSU9TOwotLSAKMi4xMy42CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
