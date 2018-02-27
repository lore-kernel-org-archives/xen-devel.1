From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] x86/xen: add tty0 and hvc0 as preferred
	consoles for dom0
Date: Tue, 27 Feb 2018 11:19:22 +0100
Message-ID: <20180227101922.15701-1-jgross__32168.2437243455$1519726695$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=gjir=fv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eqcM5-0003Rb-PI
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 10:19:29 +0000
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

VG9kYXkgdGhlIHR0eTAgYW5kIGh2YzAgY29uc29sZXMgYXJlIGFkZGVkIGFzIGEgcHJlZmVycmVk
IGNvbnNvbGVzIGZvcgpwdiBkb21VcyBvbmx5LiBBcyB0aGlzIHJlcXVpcmVzIGEgYm9vdCBwYXJh
bWV0ZXIgZm9yIGdldHRpbmcgZG9tMAptZXNzYWdlcyBwZXIgZGVmYXVsdCwgYWRkIHRoZW0gZm9y
IGRvbTAsIHRvby4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KLS0tCiBhcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgfCA2ICsrKystLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKaW5k
ZXggYzA0N2Y0MjU1MmUxLi4zYzJjMjUzMDczN2UgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5fcHYuYworKysgYi9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMKQEAgLTEzNzYs
OCArMTM3Niw2IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIHZvaWQgX19pbml0IHhlbl9zdGFydF9r
ZXJuZWwodm9pZCkKIAogCWlmICgheGVuX2luaXRpYWxfZG9tYWluKCkpIHsKIAkJYWRkX3ByZWZl
cnJlZF9jb25zb2xlKCJ4ZW5ib290IiwgMCwgTlVMTCk7Ci0JCWFkZF9wcmVmZXJyZWRfY29uc29s
ZSgidHR5IiwgMCwgTlVMTCk7Ci0JCWFkZF9wcmVmZXJyZWRfY29uc29sZSgiaHZjIiwgMCwgTlVM
TCk7CiAJCWlmIChwY2lfeGVuKQogCQkJeDg2X2luaXQucGNpLmFyY2hfaW5pdCA9IHBjaV94ZW5f
aW5pdDsKIAl9IGVsc2UgewpAQCAtMTQxMCw2ICsxNDA4LDEwIEBAIGFzbWxpbmthZ2UgX192aXNp
YmxlIHZvaWQgX19pbml0IHhlbl9zdGFydF9rZXJuZWwodm9pZCkKIAogCQl4ZW5fYm9vdF9wYXJh
bXNfaW5pdF9lZGQoKTsKIAl9CisKKwlhZGRfcHJlZmVycmVkX2NvbnNvbGUoInR0eSIsIDAsIE5V
TEwpOworCWFkZF9wcmVmZXJyZWRfY29uc29sZSgiaHZjIiwgMCwgTlVMTCk7CisKICNpZmRlZiBD
T05GSUdfUENJCiAJLyogUENJIEJJT1Mgc2VydmljZSB3b24ndCB3b3JrIGZyb20gYSBQViBndWVz
dC4gKi8KIAlwY2lfcHJvYmUgJj0gflBDSV9QUk9CRV9CSU9TOwotLSAKMi4xMy42CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
