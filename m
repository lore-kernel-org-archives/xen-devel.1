From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH] iommu: Eliminate an odd local variable
Date: Mon, 21 Jan 2019 18:04:08 +0200
Message-ID: <1548086648-8102-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8+6Q=P5=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1glc3f-000322-H5
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 16:04:19 +0000
Received: by mail-lj1-x242.google.com with SMTP id u89-v6so18003218lje.1
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jan 2019 08:04:18 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrii Anisov <andrii_anisov@epam.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCldpcGUgb3V0IGV4
Y2Vzc2l2ZSBsaW5lcyBmcm9tIGFuIGlvbW11X3VubWFwKCksIGFuZCBhbGlnbiBpdCB3aXRoIGFu
CmlvbW11X21hcCgpIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlf
YW5pc292QGVwYW0uY29tPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgfCA5
ICsrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwppbmRleCBiZDFhZjM1Li5iMzFhMWE5IDEwMDY0NAot
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2lvbW11LmMKQEAgLTM4NSwxOSArMzg1LDE2IEBAIGludCBpb21tdV91bm1hcChz
dHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4sIHVuc2lnbmVkIGludCBwYWdlX29yZGVyLAogCiAg
ICAgZm9yICggaSA9IDA7IGkgPCAoMXVsIDw8IHBhZ2Vfb3JkZXIpOyBpKysgKQogICAgIHsKLSAg
ICAgICAgaW50IGVyciA9IGhkLT5wbGF0Zm9ybV9vcHMtPnVubWFwX3BhZ2UoZCwgZGZuX2FkZChk
Zm4sIGkpLAorICAgICAgICByYyA9IGhkLT5wbGF0Zm9ybV9vcHMtPnVubWFwX3BhZ2UoZCwgZGZu
X2FkZChkZm4sIGkpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmbHVzaF9mbGFncyk7CiAKLSAgICAgICAgaWYgKCBsaWtlbHkoIWVycikgKQorICAgICAg
ICBpZiAoIGxpa2VseSghcmMpICkKICAgICAgICAgICAgIGNvbnRpbnVlOwogCiAgICAgICAgIGlm
ICggIWQtPmlzX3NodXR0aW5nX2Rvd24gJiYgcHJpbnRrX3JhdGVsaW1pdCgpICkKICAgICAgICAg
ICAgIHByaW50ayhYRU5MT0dfRVJSCiAgICAgICAgICAgICAgICAgICAgImQlZDogSU9NTVUgdW5t
YXBwaW5nIGRmbiAlIlBSSV9kZm4iIGZhaWxlZDogJWRcbiIsCi0gICAgICAgICAgICAgICAgICAg
ZC0+ZG9tYWluX2lkLCBkZm5feChkZm5fYWRkKGRmbiwgaSkpLCBlcnIpOwotCi0gICAgICAgIGlm
ICggIXJjICkKLSAgICAgICAgICAgIHJjID0gZXJyOworICAgICAgICAgICAgICAgICAgIGQtPmRv
bWFpbl9pZCwgZGZuX3goZGZuX2FkZChkZm4sIGkpKSwgcmMpOwogCiAgICAgICAgIGlmICggIWlz
X2hhcmR3YXJlX2RvbWFpbihkKSApCiAgICAgICAgIHsKLS0gCjIuNy40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
