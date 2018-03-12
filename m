From: mjaggi@caviumnetworks.com
Subject: [PATCH 10/13] asm: arm: add dev_is_pci
Date: Mon, 12 Mar 2018 13:19:17 +0530
Message-ID: <e405a92c2d7d3e5983385599038dc8c70d983c7a.1520834716.git.mjaggi@caviumnetworks.com>
References: <cover.1520834716.git.mjaggi@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=eudt=gc=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1evIEL-0003ql-RC
 for xen-devel@lists.xenproject.org; Mon, 12 Mar 2018 07:50:49 +0000
In-Reply-To: <cover.1520834716.git.mjaggi@caviumnetworks.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@linaro.org, sameer.goel@linaro.org, sstabellini@kernel.org, jgross@suse.com, xen-devel@lists.xenproject.org
Cc: Manish Jaggi <manish.jaggi@linaro.org>, Manish Jaggi <mjaggi@caviumnetworks.com>, manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTWFuaXNoIEphZ2dpIDxtamFnZ2lAY2F2aXVtbmV0d29ya3MuY29tPgoKZGV2X2lzX3Bj
aSBmb3IgQVJNIHdhcyB0b2RvIHRpbGwgbm93LgpQcm92aWRlIGRlZmluaXRpb24gZm9yIHRoaXMg
bWFjcm8uCgpTaWduZWQtb2ZmLWJ5OiBNYW5pc2ggSmFnZ2kgPG1hbmlzaC5qYWdnaUBsaW5hcm8u
b3JnPgotLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vZGV2aWNlLmggfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvYXNtLWFybS9kZXZpY2UuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZGV2aWNlLmgK
aW5kZXggN2YyZDhkMzY3ZS4uYjc1ZDc5Yjc5MyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNt
LWFybS9kZXZpY2UuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2RldmljZS5oCkBAIC02LDYg
KzYsNyBAQAogZW51bSBkZXZpY2VfdHlwZQogewogICAgIERFVl9EVCwKKyAgICBERVZfUENJLAog
fTsKIAogc3RydWN0IGRldl9hcmNoZGF0YSB7CkBAIC0yNyw4ICsyOCw3IEBAIHR5cGVkZWYgc3Ry
dWN0IGRldmljZSBkZXZpY2VfdDsKIAogI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPgogCi0v
KiBUT0RPOiBDb3JyZWN0bHkgaW1wbGVtZW50IGRldl9pc19wY2kgd2hlbiBQQ0kgaXMgc3VwcG9y
dGVkIG9uIEFSTSAqLwotI2RlZmluZSBkZXZfaXNfcGNpKGRldikgKCh2b2lkKShkZXYpLCAwKQor
I2RlZmluZSBkZXZfaXNfcGNpKGRldikgKChkZXYtPnR5cGUgPT0gREVWX1BDSSkpCiAjZGVmaW5l
IGRldl9pc19kdChkZXYpICAoKGRldi0+dHlwZSA9PSBERVZfRFQpCiAKIGVudW0gZGV2aWNlX2Ns
YXNzCi0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
