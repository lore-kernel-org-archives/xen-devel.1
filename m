From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH 9/9] xen/privcmd-buf.c: Convert to use
 vm_insert_range_buggy
Date: Fri, 11 Jan 2019 20:43:26 +0530
Message-ID: <20190111151326.GA2853__48846.9097800136$1547219287$gmane$org@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v1ph=PT=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1ghyR5-0008Gr-O9
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 15:09:27 +0000
Received: by mail-pg1-x542.google.com with SMTP id g189so6432696pgc.5
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jan 2019 07:09:26 -0800 (PST)
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

Q29udmVydCB0byB1c2Ugdm1faW5zZXJ0X3JhbmdlX2J1Z2d5KCkgdG8gbWFwIHJhbmdlIG9mIGtl
cm5lbAptZW1vcnkgdG8gdXNlciB2bWEuCgpUaGlzIGRyaXZlciBoYXMgaWdub3JlZCB2bV9wZ29m
Zi4gV2UgY291bGQgbGF0ZXIgImZpeCIgdGhlc2UgZHJpdmVycwp0byBiZWhhdmUgYWNjb3JkaW5n
IHRvIHRoZSBub3JtYWwgdm1fcGdvZmYgb2Zmc2V0dGluZyBzaW1wbHkgYnkKcmVtb3ZpbmcgdGhl
IF9idWdneSBzdWZmaXggb24gdGhlIGZ1bmN0aW9uIG5hbWUgYW5kIGlmIHRoYXQgY2F1c2VzCnJl
Z3Jlc3Npb25zLCBpdCBnaXZlcyB1cyBhbiBlYXN5IHdheSB0byByZXZlcnQuCgpTaWduZWQtb2Zm
LWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJz
L3hlbi9wcml2Y21kLWJ1Zi5jIHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9wcml2Y21k
LWJ1Zi5jIGIvZHJpdmVycy94ZW4vcHJpdmNtZC1idWYuYwppbmRleCBkZTAxYTZkLi5hOWQ3ZTk3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jCisrKyBiL2RyaXZlcnMveGVu
L3ByaXZjbWQtYnVmLmMKQEAgLTE2NiwxMiArMTY2LDggQEAgc3RhdGljIGludCBwcml2Y21kX2J1
Zl9tbWFwKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAlp
ZiAodm1hX3ByaXYtPm5fcGFnZXMgIT0gY291bnQpCiAJCXJldCA9IC1FTk9NRU07CiAJZWxzZQot
CQlmb3IgKGkgPSAwOyBpIDwgdm1hX3ByaXYtPm5fcGFnZXM7IGkrKykgewotCQkJcmV0ID0gdm1f
aW5zZXJ0X3BhZ2Uodm1hLCB2bWEtPnZtX3N0YXJ0ICsgaSAqIFBBR0VfU0laRSwKLQkJCQkJICAg
ICB2bWFfcHJpdi0+cGFnZXNbaV0pOwotCQkJaWYgKHJldCkKLQkJCQlicmVhazsKLQkJfQorCQly
ZXQgPSB2bV9pbnNlcnRfcmFuZ2VfYnVnZ3kodm1hLCB2bWFfcHJpdi0+cGFnZXMsCisJCQkJCQl2
bWFfcHJpdi0+bl9wYWdlcyk7CiAKIAlpZiAocmV0KQogCQlwcml2Y21kX2J1Zl92bWFwcml2X2Zy
ZWUodm1hX3ByaXYpOwotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
