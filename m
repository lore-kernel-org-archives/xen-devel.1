From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v4 02/16] xen/arm: setup: use maddr_to_mfn
	rather than _mfn(paddr_to_pfn(...))
Date: Wed, 21 Feb 2018 14:02:45 +0000
Message-ID: <20180221140259.29360-3-julien.grall@arm.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221140259.29360-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvbnN0cnVjdGlvbiBfbWZuKHBhZGRyX3RvX3BmbiguLi4pKSBjYW4gYmUgc2ltcGxpZmll
ZCBieSB1c2luZwptYWRkcl90b19tZm4uCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CgogICAgQ2hhbmdlcyBpbiB2NDoKICAgICAgICAtIFBhdGNoIGFkZGVk
Ci0tLQogeGVuL2FyY2gvYXJtL3NldHVwLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Nl
dHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRleCAwMzJhNmE4ODJkLi5kZTllOTU4YmZl
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYworKysgYi94ZW4vYXJjaC9hcm0vc2V0
dXAuYwpAQCAtMjY4LDggKzI2OCw4IEBAIHZvaWQgX19pbml0IGRpc2NhcmRfaW5pdGlhbF9tb2R1
bGVzKHZvaWQpCiAgICAgICAgIGlmICggbWktPm1vZHVsZVtpXS5raW5kID09IEJPT1RNT0RfWEVO
ICkKICAgICAgICAgICAgIGNvbnRpbnVlOwogCi0gICAgICAgIGlmICggIW1mbl92YWxpZChfbWZu
KHBhZGRyX3RvX3BmbihzKSkpIHx8Ci0gICAgICAgICAgICAgIW1mbl92YWxpZChfbWZuKHBhZGRy
X3RvX3BmbihlKSkpKQorICAgICAgICBpZiAoICFtZm5fdmFsaWQobWFkZHJfdG9fbWZuKHMpKSB8
fAorICAgICAgICAgICAgICFtZm5fdmFsaWQobWFkZHJfdG9fbWZuKGUpKSApCiAgICAgICAgICAg
ICBjb250aW51ZTsKIAogICAgICAgICBkdF91bnJlc2VydmVkX3JlZ2lvbnMocywgZSwgaW5pdF9k
b21oZWFwX3BhZ2VzLCAwKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
