From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 4/4] ts-xen-install: Use
 pkg_manager_install_cmd_line
Date: Thu, 21 Jun 2018 15:09:20 +0100
Message-ID: <1529590160-25104-5-git-send-email-ian.jackson@eu.citrix.com>
References: <1529590160-25104-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g66k=jh=citrix.com=prvs=70384805a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fW0HM-0001dt-8C
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 14:09:40 +0000
In-Reply-To: <1529590160-25104-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UmF0aGVyIHRoYW4gdGFyZ2V0X3J1bl9hcHQsIHdoaWNoIHdlIGFyZSBhYm9saXNoaW5nIHNvb24u
CgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4K
LS0tCiB0cy14ZW4taW5zdGFsbCB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3RzLXhlbi1pbnN0YWxsIGIvdHMteGVu
LWluc3RhbGwKaW5kZXggOTkxM2U4NS4uZDU0YjJlNCAxMDA3NTUKLS0tIGEvdHMteGVuLWluc3Rh
bGwKKysrIGIvdHMteGVuLWluc3RhbGwKQEAgLTk5LDcgKzk5LDkgQEAgc3ViIHNvbWVfZXh0cmFk
ZWJzICgkKSB7CiAJdGFyZ2V0X2NtZF9yb290KCRobywKIAkJCSJkcGtnIC0tZm9yY2UtY29uZm9s
ZCAkZHBrZ29wdHMgJG9udGFyZ2V0IDwvZGV2L251bGwiLAogCQkJMzAwKTsKLQl0YXJnZXRfcnVu
X2FwdCgkaG8sIHF3KC1mIGluc3RhbGwpKTsKKwl0YXJnZXRfY21kX3Jvb3QoJGhvLAorCQkJcGtn
X21hbmFnZXJfaW5zdGFsbF9jbWRfbGluZSgkaG8sMCwxKSwKKwkJCTMwMDApOwogICAgIH0KIH0K
IAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
