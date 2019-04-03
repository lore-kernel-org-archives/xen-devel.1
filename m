From: Andrea Righi <andrea.righi@canonical.com>
Subject: [PATCH] xen: use struct_size() helper in kzalloc()
Date: Wed, 3 Apr 2019 07:26:36 +0200
Message-ID: <20190403052636.GC21532__7764.65827818669$1554269908$gmane$org@xps-13>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fhi1=SF=canonical.com=andrea.righi@srs-us1.protection.inumbo.net>)
 id 1hBYQ5-0000lZ-8H
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 05:26:41 +0000
Received: from mail-wm1-f70.google.com ([209.85.128.70])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <andrea.righi@canonical.com>)
 id 1hBYQ2-0003xU-Gx
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 05:26:38 +0000
Received: by mail-wm1-f70.google.com with SMTP id t20so3693074wmi.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2019 22:26:38 -0700 (PDT)
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

c3RydWN0IHByaXZjbWRfYnVmX3ZtYV9wcml2YXRlIGhhcyBhIHplcm8tc2l6ZWQgYXJyYXkgYXQg
dGhlIGVuZAoocGFnZXMpLCB1c2UgdGhlIG5ldyBzdHJ1Y3Rfc2l6ZSgpIGhlbHBlciB0byBkZXRl
cm1pbmUgdGhlIHByb3BlcgphbGxvY2F0aW9uIHNpemUgYW5kIGF2b2lkIHBvdGVudGlhbCB0eXBl
IG1pc3Rha2VzLgoKU2lnbmVkLW9mZi1ieTogQW5kcmVhIFJpZ2hpIDxhbmRyZWEucmlnaGlAY2Fu
b25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jIHwgMyArLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jIGIvZHJpdmVycy94ZW4vcHJpdmNtZC1idWYuYwppbmRl
eCBkZTAxYTZkMDA1OWQuLmExYzYxZTM1MWQzZiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vcHJp
dmNtZC1idWYuYworKysgYi9kcml2ZXJzL3hlbi9wcml2Y21kLWJ1Zi5jCkBAIC0xNDAsOCArMTQw
LDcgQEAgc3RhdGljIGludCBwcml2Y21kX2J1Zl9tbWFwKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAlpZiAoISh2bWEtPnZtX2ZsYWdzICYgVk1fU0hBUkVE
KSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQl2bWFfcHJpdiA9IGt6YWxsb2Moc2l6ZW9mKCp2bWFf
cHJpdikgKyBjb3VudCAqIHNpemVvZih2b2lkICopLAotCQkJICAgR0ZQX0tFUk5FTCk7CisJdm1h
X3ByaXYgPSBremFsbG9jKHN0cnVjdF9zaXplKHZtYV9wcml2LCBwYWdlcywgY291bnQpLCBHRlBf
S0VSTkVMKTsKIAlpZiAoIXZtYV9wcml2KQogCQlyZXR1cm4gLUVOT01FTTsKIAotLSAKMi4xOS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
