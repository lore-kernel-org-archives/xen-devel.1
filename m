From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] remove dead code in allocate_memory
Date: Fri, 12 Jan 2018 16:29:16 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801121619160.5767@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0q6w=ei=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ea9hM-0003oM-Sp
 for xen-devel@lists.xenproject.org; Sat, 13 Jan 2018 00:29:24 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@linaro.org
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

bG93bWVtIGlzIHVuY2hhbmdlZCB1bnRpbCBhZnRlciB0aGlzIGxvb3AsIHRoZXJlIGlzIG5vIHBv
aW50IGluIHRlc3RpbmcKZm9yIGl0cyB2YWx1ZS4gTW9yZW92ZXIsIENvdmVyaXR5IGNvbXBsYWlu
cyBhYm91dCBkZWFkIGNvZGUuCgpSZW1vdmUgdGhlIGxvd21lbSB0ZXN0IGluIHRoZSBmaXJzdCBs
b29wLgoKQ0lEOiAxMzgxODMyClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKaW5kZXggMTU1Yzk1Mi4uZmE1ODkw
NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYwpAQCAtMjc3LDcgKzI3Nyw3IEBAIHN0YXRpYyB2b2lkIGFsbG9j
YXRlX21lbW9yeShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQog
ICAgICAqLwogICAgIHdoaWxlICggb3JkZXIgPj0gbWluX2xvd19vcmRlciApCiAgICAgewotICAg
ICAgICBmb3IgKCBiaXRzID0gb3JkZXIgOyBiaXRzIDw9IChsb3dtZW0gPyAzMiA6IFBBRERSX0JJ
VFMpOyBiaXRzKysgKQorICAgICAgICBmb3IgKCBiaXRzID0gb3JkZXIgOyBiaXRzIDw9IDMyOyBi
aXRzKysgKQogICAgICAgICB7CiAgICAgICAgICAgICBwZyA9IGFsbG9jX2RvbWhlYXBfcGFnZXMo
ZCwgb3JkZXIsIE1FTUZfYml0cyhiaXRzKSk7CiAgICAgICAgICAgICBpZiAoIHBnICE9IE5VTEwg
KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
