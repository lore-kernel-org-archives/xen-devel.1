From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 1/5] iommu: trivial re-organisation to avoid
 unnecessary test
Date: Wed, 8 May 2019 14:23:59 +0100
Message-ID: <20190508132403.1454-2-paul.durrant@citrix.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Ps6=TI=citrix.com=prvs=0248bffa7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hOMYO-0000d9-8W
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:24:12 +0000
In-Reply-To: <20190508132403.1454-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QW4gJ2lmICggIWlvbW11X2VuYWJsZWQgKScgZm9sbG93ZWQgYnkgYW4gJ2lmICggaW9tbXVfZW5h
YmxlZCApJyB3aXRoCm9ubHkgYSBwcmludGsoKSBpbiBiZXR3ZWVuIHNlZW1zIGEgbGl0dGxlIHNp
bGx5LiBNb3ZlIHRoZSBwcmludGsoKSBhbmQKdXNlICdlbHNlJyBpbnN0ZWFkLgoKU2lnbmVkLW9m
Zi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
aW9tbXUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwppbmRleCBhNjY5N2Q1OGZiLi5iNDUzYjMy
MTkxIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCisrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKQEAgLTUxMiwxNCArNTEyLDE0IEBAIGludCBf
X2luaXQgaW9tbXVfc2V0dXAodm9pZCkKICAgICBpZiAoICFpb21tdV9pbnRyZW1hcCApCiAgICAg
ICAgIGlvbW11X2ludHBvc3QgPSAwOwogCisgICAgcHJpbnRrKCJJL08gdmlydHVhbGlzYXRpb24g
JXNhYmxlZFxuIiwgaW9tbXVfZW5hYmxlZCA/ICJlbiIgOiAiZGlzIik7CiAgICAgaWYgKCAhaW9t
bXVfZW5hYmxlZCApCiAgICAgewogICAgICAgICBpb21tdV9zbm9vcCA9IDA7CiAgICAgICAgIGlv
bW11X2h3ZG9tX3Bhc3N0aHJvdWdoID0gZmFsc2U7CiAgICAgICAgIGlvbW11X2h3ZG9tX3N0cmlj
dCA9IGZhbHNlOwogICAgIH0KLSAgICBwcmludGsoIkkvTyB2aXJ0dWFsaXNhdGlvbiAlc2FibGVk
XG4iLCBpb21tdV9lbmFibGVkID8gImVuIiA6ICJkaXMiKTsKLSAgICBpZiAoIGlvbW11X2VuYWJs
ZWQgKQorICAgIGVsc2UKICAgICB7CiAgICAgICAgIHByaW50aygiIC0gRG9tMCBtb2RlOiAlc1xu
IiwKICAgICAgICAgICAgICAgIGlvbW11X2h3ZG9tX3Bhc3N0aHJvdWdoID8gIlBhc3N0aHJvdWdo
IiA6Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
