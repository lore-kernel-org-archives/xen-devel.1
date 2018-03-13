From: mjaggi@caviumnetworks.com
Subject: [PATCH resend 08/13] asm: arm: pci: Fix the #include
	label in asm-arm/pci.h
Date: Tue, 13 Mar 2018 20:50:14 +0530
Message-ID: <52e661b8f61c00e9d05c7e6f6856b2843244c049.1520834718.git.mjaggi@caviumnetworks.com>
References: <cover.1520834718.git.mjaggi@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=f3c3=gd=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1evlk0-0006fL-F5
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 15:21:28 +0000
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

RnJvbTogTWFuaXNoIEphZ2dpIDxtamFnZ2lAY2F2aXVtbmV0d29ya3MuY29tPgoKYXNtLWFybS9w
Y2kuaCBoYXMgYW4gaW5jb3JyZWN0ICNpZm5kZWYgbGFiZWwuCkZpeGluZyBpdCB0byBBUk0KClNp
Z25lZC1vZmYtYnk6IE1hbmlzaCBKYWdnaSA8bWFuaXNoLmphZ2dpQGxpbmFyby5vcmc+Ci0tLQog
eGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaCB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2Fz
bS1hcm0vcGNpLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3BjaS5oCmluZGV4IGRlMTMzNTlmNjUu
LjMxNDVlZDUwNWMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGNpLmgKKysrIGIv
eGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaApAQCAtMSw3ICsxLDcgQEAKLSNpZm5kZWYgX19YODZf
UENJX0hfXwotI2RlZmluZSBfX1g4Nl9QQ0lfSF9fCisjaWZuZGVmIF9fQVNNX0FSTV9QQ0lfSF9f
CisjZGVmaW5lIF9fQVNNX0FSTV9QQ0lfSF9fCiAKIHN0cnVjdCBhcmNoX3BjaV9kZXYgewogfTsK
IAotI2VuZGlmIC8qIF9fWDg2X1BDSV9IX18gKi8KKyNlbmRpZiAvKiBfX0FTTV9BUk1fUENJX0hf
XyAqLwotLSAKMi4xNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
