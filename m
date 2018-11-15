From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH 9/9] xen/privcmd-buf.c: Convert to use
 vm_insert_range
Date: Thu, 15 Nov 2018 21:22:17 +0530
Message-ID: <20181115155217.GA28043__4028.98611869222$1542296843$gmane$org@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dbea=n2=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1gNJsp-0001fe-RZ
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 15:48:43 +0000
Received: by mail-pf1-x441.google.com with SMTP id q1so1889559pfi.5
 for <xen-devel@lists.xenproject.org>; Thu, 15 Nov 2018 07:48:42 -0800 (PST)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, willy@infradead.org, mhocko@suse.com, boris.ostrovsky@oracle.com, jgross@suse.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
List-Id: xen-devel@lists.xenproject.org

Q29udmVydCB0byB1c2Ugdm1faW5zZXJ0X3JhbmdlKCkgdG8gbWFwIHJhbmdlIG9mIGtlcm5lbApt
ZW1vcnkgdG8gdXNlciB2bWEuCgpTaWduZWQtb2ZmLWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRy
LmxpbnV4QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZy
YWRlYWQub3JnPgotLS0KIGRyaXZlcnMveGVuL3ByaXZjbWQtYnVmLmMgfCA4ICsrLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMveGVuL3ByaXZjbWQtYnVmLmMgYi9kcml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5j
CmluZGV4IGRmMWVkMzcuLjhkODI1NWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3ByaXZjbWQt
YnVmLmMKKysrIGIvZHJpdmVycy94ZW4vcHJpdmNtZC1idWYuYwpAQCAtMTgwLDEyICsxODAsOCBA
QCBzdGF0aWMgaW50IHByaXZjbWRfYnVmX21tYXAoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hKQogCWlmICh2bWFfcHJpdi0+bl9wYWdlcyAhPSBjb3VudCkKIAkJ
cmV0ID0gLUVOT01FTTsKIAllbHNlCi0JCWZvciAoaSA9IDA7IGkgPCB2bWFfcHJpdi0+bl9wYWdl
czsgaSsrKSB7Ci0JCQlyZXQgPSB2bV9pbnNlcnRfcGFnZSh2bWEsIHZtYS0+dm1fc3RhcnQgKyBp
ICogUEFHRV9TSVpFLAotCQkJCQkgICAgIHZtYV9wcml2LT5wYWdlc1tpXSk7Ci0JCQlpZiAocmV0
KQotCQkJCWJyZWFrOwotCQl9CisJCXJldCA9IHZtX2luc2VydF9yYW5nZSh2bWEsIHZtYS0+dm1f
c3RhcnQsIHZtYV9wcml2LT5wYWdlcywKKwkJCQl2bWFfcHJpdi0+bl9wYWdlcyk7CiAKIAlpZiAo
cmV0KQogCQlwcml2Y21kX2J1Zl92bWFwcml2X2ZyZWUodm1hX3ByaXYpOwotLSAKMS45LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
