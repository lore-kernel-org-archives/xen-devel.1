From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH v3 9/9] xen/privcmd-buf.c: Convert to use
 vm_insert_range
Date: Fri, 7 Dec 2018 00:15:45 +0530
Message-ID: <20181206184545.GA847__13245.8117361695$1544121641$gmane$org@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fJFh=OP=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1gUyb2-0003TP-Uc
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 18:42:00 +0000
Received: by mail-pl1-x642.google.com with SMTP id k8so556010pls.11
 for <xen-devel@lists.xenproject.org>; Thu, 06 Dec 2018 10:41:59 -0800 (PST)
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
YWRlYWQub3JnPgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jIHwgOCArKy0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jIGIvZHJpdmVycy94ZW4vcHJpdmNtZC1idWYu
YwppbmRleCBkZjFlZDM3Li44ZDgyNTViIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9wcml2Y21k
LWJ1Zi5jCisrKyBiL2RyaXZlcnMveGVuL3ByaXZjbWQtYnVmLmMKQEAgLTE4MCwxMiArMTgwLDgg
QEAgc3RhdGljIGludCBwcml2Y21kX2J1Zl9tbWFwKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAlpZiAodm1hX3ByaXYtPm5fcGFnZXMgIT0gY291bnQpCiAJ
CXJldCA9IC1FTk9NRU07CiAJZWxzZQotCQlmb3IgKGkgPSAwOyBpIDwgdm1hX3ByaXYtPm5fcGFn
ZXM7IGkrKykgewotCQkJcmV0ID0gdm1faW5zZXJ0X3BhZ2Uodm1hLCB2bWEtPnZtX3N0YXJ0ICsg
aSAqIFBBR0VfU0laRSwKLQkJCQkJICAgICB2bWFfcHJpdi0+cGFnZXNbaV0pOwotCQkJaWYgKHJl
dCkKLQkJCQlicmVhazsKLQkJfQorCQlyZXQgPSB2bV9pbnNlcnRfcmFuZ2Uodm1hLCB2bWEtPnZt
X3N0YXJ0LCB2bWFfcHJpdi0+cGFnZXMsCisJCQkJdm1hX3ByaXYtPm5fcGFnZXMpOwogCiAJaWYg
KHJldCkKIAkJcHJpdmNtZF9idWZfdm1hcHJpdl9mcmVlKHZtYV9wcml2KTsKLS0gCjEuOS4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
