From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [RFC v2 11/16] gic-v2: Write HCR only on change
Date: Wed, 26 Dec 2018 13:20:22 +0200
Message-ID: <1545823227-6207-12-git-send-email-andrii.anisov@gmail.com>
References: <1545823227-6207-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tRx+=PD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gc7F3-00089k-LL
 for xen-devel@lists.xenproject.org; Wed, 26 Dec 2018 11:20:49 +0000
Received: by mail-lf1-x129.google.com with SMTP id f23so10663087lfc.13
 for <xen-devel@lists.xenproject.org>; Wed, 26 Dec 2018 03:20:48 -0800 (PST)
In-Reply-To: <1545823227-6207-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andre Przywara <andre.przywara@arm.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoaXMgc2F2ZXMg
b25lIHdyaXRlIHRvIHBlcmlwaGVyYWwgSENSIHJlZ2lzdGVyIHBlciBoeXBlcnZpc29yIGVudHJ5
IGZvcgptb3N0IGNhc2VzLgoKU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2Fu
aXNvdkBlcGFtLmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vZ2ljLXYyLmMgfCA3ICsrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2dpYy12Mi5jIGIveGVuL2FyY2gvYXJtL2dpYy12Mi5jCmluZGV4IDFh
NzQ0YzUuLjI1MTQ3YmQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9naWMtdjIuYworKysgYi94
ZW4vYXJjaC9hcm0vZ2ljLXYyLmMKQEAgLTU3OSwxNCArNTc5LDE3IEBAIHN0YXRpYyB2b2lkIGdp
Y3YyX3dyaXRlX2xyKGludCBsciwgY29uc3Qgc3RydWN0IGdpY19sciAqbHJfcmVnKQogCiBzdGF0
aWMgdm9pZCBnaWN2Ml9oY3Jfc3RhdHVzKHVpbnQzMl90IGZsYWcsIGJvb2wgc3RhdHVzKQogewot
ICAgIHVpbnQzMl90IGhjciA9IHJlYWRsX2dpY2goR0lDSF9IQ1IpOworICAgIHVpbnQzMl90IGhj
ciwgb2hjcjsKKworICAgIG9oY3IgPSBoY3IgPSByZWFkbF9naWNoKEdJQ0hfSENSKTsKIAogICAg
IGlmICggc3RhdHVzICkKICAgICAgICAgaGNyIHw9IGZsYWc7CiAgICAgZWxzZQogICAgICAgICBo
Y3IgJj0gKH5mbGFnKTsKIAotICAgIHdyaXRlbF9naWNoKGhjciwgR0lDSF9IQ1IpOworICAgIGlm
ICggaGNyICE9IG9oY3IgKQorICAgICAgICB3cml0ZWxfZ2ljaChoY3IsIEdJQ0hfSENSKTsKIH0K
IAogc3RhdGljIHVuc2lnbmVkIGludCBnaWN2Ml9yZWFkX3ZtY3JfcHJpb3JpdHkodm9pZCkKLS0g
CjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
