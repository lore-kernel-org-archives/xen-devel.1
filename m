From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCHv2 9/9] xen/privcmd-buf.c: Convert to use
 vm_insert_range_buggy
Date: Thu, 31 Jan 2019 08:44:52 +0530
Message-ID: <20190131031452.GA2442__42715.3516838857$1548904290$gmane$org@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aWcy=QH=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1gp2kT-0007fM-N5
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 03:10:41 +0000
Received: by mail-pl1-x643.google.com with SMTP id p8so814785plo.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jan 2019 19:10:40 -0800 (PST)
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
LWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6
IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Ci0tLQogZHJpdmVy
cy94ZW4vcHJpdmNtZC1idWYuYyB8IDggKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vcHJpdmNt
ZC1idWYuYyBiL2RyaXZlcnMveGVuL3ByaXZjbWQtYnVmLmMKaW5kZXggZGUwMWE2ZC4uYTlkN2U5
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vcHJpdmNtZC1idWYuYworKysgYi9kcml2ZXJzL3hl
bi9wcml2Y21kLWJ1Zi5jCkBAIC0xNjYsMTIgKzE2Niw4IEBAIHN0YXRpYyBpbnQgcHJpdmNtZF9i
dWZfbW1hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJ
aWYgKHZtYV9wcml2LT5uX3BhZ2VzICE9IGNvdW50KQogCQlyZXQgPSAtRU5PTUVNOwogCWVsc2UK
LQkJZm9yIChpID0gMDsgaSA8IHZtYV9wcml2LT5uX3BhZ2VzOyBpKyspIHsKLQkJCXJldCA9IHZt
X2luc2VydF9wYWdlKHZtYSwgdm1hLT52bV9zdGFydCArIGkgKiBQQUdFX1NJWkUsCi0JCQkJCSAg
ICAgdm1hX3ByaXYtPnBhZ2VzW2ldKTsKLQkJCWlmIChyZXQpCi0JCQkJYnJlYWs7Ci0JCX0KKwkJ
cmV0ID0gdm1faW5zZXJ0X3JhbmdlX2J1Z2d5KHZtYSwgdm1hX3ByaXYtPnBhZ2VzLAorCQkJCQkJ
dm1hX3ByaXYtPm5fcGFnZXMpOwogCiAJaWYgKHJldCkKIAkJcHJpdmNtZF9idWZfdm1hcHJpdl9m
cmVlKHZtYV9wcml2KTsKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
