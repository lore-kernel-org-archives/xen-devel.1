From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1] stubdom/vtpm: include stdio.h for
 declaration of printf
Date: Tue, 29 May 2018 14:06:48 +0200
Message-ID: <20180529120648.30429-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Olaf Hering <olaf@aepfle.de>, Quan Xu <quan.xu0@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

VGhlIGZ1bmN0aW9uIHJlYWRfdnRwbWJsayB1c2VzIHByaW50ZigzKSwgYnV0IHN0ZGlvLmggaXMg
bm90IGluY2x1ZGVkCmluIHRoaXMgZmlsZS4gVGhpcyByZXN1bHRzIGluIGEgd2FybmluZyBmcm9t
IGdjYy03OgoKdnRwbWJsay5jOiBJbiBmdW5jdGlvbiAncmVhZF92dHBtYmxrJzoKdnRwbWJsay5j
OjMyMjo3OiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAncHJpbnRm
JyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgICAgIHByaW50ZigiRXhwZWN0
ZWQ6ICIpOwp2dHBtYmxrLmM6MzIyOjc6IHdhcm5pbmc6IGluY29tcGF0aWJsZSBpbXBsaWNpdCBk
ZWNsYXJhdGlvbiBvZiBidWlsdC1pbiBmdW5jdGlvbiAncHJpbnRmJwp2dHBtYmxrLmM6MzIyOjc6
IG5vdGU6IGluY2x1ZGUgJzxzdGRpby5oPicgb3IgcHJvdmlkZSBhIGRlY2xhcmF0aW9uIG9mICdw
cmludGYnCgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Ci0tLQog
c3R1YmRvbS92dHBtL3Z0cG1ibGsuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvc3R1YmRvbS92dHBtL3Z0cG1ibGsuYyBiL3N0dWJkb20vdnRwbS92
dHBtYmxrLmMKaW5kZXggZmU1MjlhYjVhYy4uNjgxZjBjMDFiNiAxMDA2NDQKLS0tIGEvc3R1YmRv
bS92dHBtL3Z0cG1ibGsuYworKysgYi9zdHViZG9tL3Z0cG0vdnRwbWJsay5jCkBAIC0yMCw2ICsy
MCw3IEBACiAjaW5jbHVkZSA8dW5pc3RkLmg+CiAjaW5jbHVkZSA8ZXJybm8uaD4KICNpbmNsdWRl
IDxmY250bC5oPgorI2luY2x1ZGUgPHN0ZGlvLmg+CiAKIC8qRW5jcnlwdGlvbiBrZXkgYW5kIGJs
b2NrIHNpemVzICovCiAjZGVmaW5lIEJMS1NaIDE2CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
