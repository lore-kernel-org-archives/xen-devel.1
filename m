From: mjaggi@caviumnetworks.com
Subject: [PATCH resend 11/13] asm: arm: add pci_domain_nr
Date: Tue, 13 Mar 2018 20:50:17 +0530
Message-ID: <0d75a2560f329fda15e3457e6a0f73e415c64f60.1520834718.git.mjaggi@caviumnetworks.com>
References: <cover.1520834718.git.mjaggi@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=f3c3=gd=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1evlk8-0006mx-Et
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 15:21:36 +0000
In-Reply-To: <cover.1520834718.git.mjaggi@caviumnetworks.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: manish.jaggi@linaro.org, julien.grall@arm.com, xen-devel@lists.xenproject.org, sameer.goel@linaro.org, jgross@suse.com, sstabellini@kernel.org
Cc: Manish Jaggi <mjaggi@caviumnetworks.com>, manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTWFuaXNoIEphZ2dpIDxtamFnZ2lAY2F2aXVtbmV0d29ya3MuY29tPgoKUHJvdmlkZSBk
ZWZpbml0aW9uIGZvciB0aGlzIG1hY3JvLgoKU2lnbmVkLW9mZi1ieTogTWFuaXNoIEphZ2dpIDxt
YW5pc2guamFnZ2lAbGluYXJvLm9yZz4KLS0tCiB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUveGVuL3BjaS5oIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCmluZGV4IGRkNWVjNDNhNzAuLmVl
MWQ0ZGJmOTMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAorKysgYi94ZW4vaW5j
bHVkZS94ZW4vcGNpLmgKQEAgLTExNCw2ICsxMTQsOCBAQCBzdHJ1Y3QgcGNpX2RldiB7CiAgICAg
dTY0IHZmX3JsZW5bNl07CiB9OwogCisjZGVmaW5lIHBjaV9kb21haW5fbnIocGRldikgcGRldi0+
c2VnCisKICNkZWZpbmUgZm9yX2VhY2hfcGRldihkb21haW4sIHBkZXYpIFwKICAgICBsaXN0X2Zv
cl9lYWNoX2VudHJ5KHBkZXYsICYoZG9tYWluLT5hcmNoLnBkZXZfbGlzdCksIGRvbWFpbl9saXN0
KQogCi0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
