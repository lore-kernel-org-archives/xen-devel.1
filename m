From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH 1/2] gic-vgic: Drop an excessive clear_lrs
Date: Wed, 12 Dec 2018 18:55:24 +0200
Message-ID: <1544633725-7243-2-git-send-email-andrii.anisov@gmail.com>
References: <1544633725-7243-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX7nI-0005T6-6m
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 16:55:32 +0000
Received: by mail-lj1-x244.google.com with SMTP id v15-v6so16850946ljh.13
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 08:55:31 -0800 (PST)
In-Reply-To: <1544633725-7243-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoaXMgYWN0aW9u
IGlzIGV4Y2Vzc2l2ZSBiZWNhdXNlIGZvciBhbiBpbnZhbGlkIExSIHRoZXJlIGlzIG5vIG5lZWQK
dG8gd3JpdGUgYW5vdGhlciBpbnZhbGlkIHZhbHVlIHRvIGEgcmVnaXN0ZXIuIFNvIHdlIGNhbiBz
a2lwIGl0IGhlcmUsCnNhdmluZyBhIHBlcmlwaGVyYWwgcmVnaXN0ZXIgd3JpdGUuCktlZXAgY2xl
YXJpbmcgdGhlIExSIGZvciB0aGUgREVCVUcgYnVpbGQuIFRoaXMgd291bGQgbWFrZSBkdW1wZWQK
aW52YWxpZCBMUnMgYmUgemVyby4gVGhhdCBpcyBtb3JlIG9idmlvdXMgdGhhbiBwaWNraW5nIHN0
YXRlIGJpdHMKZnJvbSBhIG5vbi16ZXJvIHZhbHVlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFu
aXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2dpYy12Z2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwppbmRleCA5OTAzOTljLi40
ODkyMmY1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYworKysgYi94ZW4vYXJj
aC9hcm0vZ2ljLXZnaWMuYwpAQCAtMjE2LDcgKzIxNiw5IEBAIHN0YXRpYyB2b2lkIGdpY191cGRh
dGVfb25lX2xyKHN0cnVjdCB2Y3B1ICp2LCBpbnQgaSkKICAgICB9CiAgICAgZWxzZQogICAgIHsK
KyNpZm5kZWYgTkRFQlVHCiAgICAgICAgIGdpY19od19vcHMtPmNsZWFyX2xyKGkpOworI2VuZGlm
CiAgICAgICAgIGNsZWFyX2JpdChpLCAmdGhpc19jcHUobHJfbWFzaykpOwogCiAgICAgICAgIGlm
ICggcC0+ZGVzYyAhPSBOVUxMICkKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
