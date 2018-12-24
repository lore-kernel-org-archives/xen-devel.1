From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH v5 9/9] xen/privcmd-buf.c: Convert to use
 vm_insert_range
Date: Mon, 24 Dec 2018 18:58:34 +0530
Message-ID: <20181224132834.GA22203__25362.8704617315$1545657798$gmane$org@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=so4L=PB=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1gbQDn-0004J4-Tb
 for xen-devel@lists.xenproject.org; Mon, 24 Dec 2018 13:24:39 +0000
Received: by mail-pg1-x544.google.com with SMTP id w7so5579358pgp.13
 for <xen-devel@lists.xenproject.org>; Mon, 24 Dec 2018 05:24:38 -0800 (PST)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, willy@infradead.org, mhocko@suse.com, boris.ostrovsky@oracle.com, jgross@suse.com, linux@armlinux.org.uk, robin.murphy@arm.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
List-Id: xen-devel@lists.xenproject.org

Q29udmVydCB0byB1c2Ugdm1faW5zZXJ0X3JhbmdlKCkgdG8gbWFwIHJhbmdlIG9mIGtlcm5lbApt
ZW1vcnkgdG8gdXNlciB2bWEuCgpTaWduZWQtb2ZmLWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRy
LmxpbnV4QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IE1hdHRoZXcgV2lsY294IDx3aWxseUBpbmZy
YWRlYWQub3JnPgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jIHwgOCArKy0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jIGIvZHJpdmVycy94ZW4vcHJpdmNtZC1idWYu
YwppbmRleCBkZjFlZDM3Li5kMzFiODM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9wcml2Y21k
LWJ1Zi5jCisrKyBiL2RyaXZlcnMveGVuL3ByaXZjbWQtYnVmLmMKQEAgLTE4MCwxMiArMTgwLDgg
QEAgc3RhdGljIGludCBwcml2Y21kX2J1Zl9tbWFwKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAlpZiAodm1hX3ByaXYtPm5fcGFnZXMgIT0gY291bnQpCiAJ
CXJldCA9IC1FTk9NRU07CiAJZWxzZQotCQlmb3IgKGkgPSAwOyBpIDwgdm1hX3ByaXYtPm5fcGFn
ZXM7IGkrKykgewotCQkJcmV0ID0gdm1faW5zZXJ0X3BhZ2Uodm1hLCB2bWEtPnZtX3N0YXJ0ICsg
aSAqIFBBR0VfU0laRSwKLQkJCQkJICAgICB2bWFfcHJpdi0+cGFnZXNbaV0pOwotCQkJaWYgKHJl
dCkKLQkJCQlicmVhazsKLQkJfQorCQlyZXQgPSB2bV9pbnNlcnRfcmFuZ2Uodm1hLCB2bWEtPnZt
X3N0YXJ0LCB2bWFfcHJpdi0+cGFnZXMsCisJCQkJCXZtYV9wcml2LT5uX3BhZ2VzKTsKIAogCWlm
IChyZXQpCiAJCXByaXZjbWRfYnVmX3ZtYXByaXZfZnJlZSh2bWFfcHJpdik7Ci0tIAoxLjkuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
