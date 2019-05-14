From: Filippo Sironi <sironi@amazon.de>
Subject: [PATCH v2 2/2] KVM: x86: Implement the arch-specific
 hook to report the VM UUID
Date: Tue, 14 May 2019 17:16:42 +0200
Message-ID: <1557847002-23519-3-git-send-email-sironi__2594.01972159452$1557847888$gmane$org@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jxAo=TO=amazon.com=prvs=030dd7525=sironi@srs-us1.protection.inumbo.net>)
 id 1hQZBh-0004Pl-RT
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 15:17:53 +0000
In-Reply-To: <1557847002-23519-1-git-send-email-sironi@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, borntraeger@de.ibm.com, boris.ostrovsky@oracle.com, cohuck@redhat.com, konrad.wilk@oracle.com, xen-devel@lists.xenproject.org, vasu.srinivasan@oracle.com
Cc: Filippo Sironi <sironi@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24geDg2LCB3ZSByZXBvcnQgdGhlIFVVSUQgaW4gRE1JIFN5c3RlbSBJbmZvcm1hdGlvbiAoaS5l
LiwgRE1JIFR5cGUgMSkKYXMgVk0gVVVJRC4KClNpZ25lZC1vZmYtYnk6IEZpbGlwcG8gU2lyb25p
IDxzaXJvbmlAYW1hem9uLmRlPgotLS0KIGFyY2gveDg2L2tlcm5lbC9rdm0uYyB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2
L2tlcm5lbC9rdm0uYyBiL2FyY2gveDg2L2tlcm5lbC9rdm0uYwppbmRleCA1YzkzYTY1ZWUxZTUu
LjQ0MWNhYjA4YTA5ZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2t2bS5jCisrKyBiL2Fy
Y2gveDg2L2tlcm5lbC9rdm0uYwpAQCAtMjUsNiArMjUsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2tl
cm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L2t2bV9wYXJhLmg+CiAjaW5jbHVkZSA8bGludXgvY3B1
Lmg+CisjaW5jbHVkZSA8bGludXgvZG1pLmg+CiAjaW5jbHVkZSA8bGludXgvbW0uaD4KICNpbmNs
dWRlIDxsaW51eC9oaWdobWVtLmg+CiAjaW5jbHVkZSA8bGludXgvaGFyZGlycS5oPgpAQCAtNjk0
LDYgKzY5NSwxMiBAQCBib29sIGt2bV9wYXJhX2F2YWlsYWJsZSh2b2lkKQogfQogRVhQT1JUX1NZ
TUJPTF9HUEwoa3ZtX3BhcmFfYXZhaWxhYmxlKTsKIAorY29uc3QgY2hhciAqa3ZtX3BhcmFfZ2V0
X3V1aWQodm9pZCkKK3sKKwlyZXR1cm4gZG1pX2dldF9zeXN0ZW1faW5mbyhETUlfUFJPRFVDVF9V
VUlEKTsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKGt2bV9wYXJhX2dldF91dWlkKTsKKwogdW5zaWdu
ZWQgaW50IGt2bV9hcmNoX3BhcmFfZmVhdHVyZXModm9pZCkKIHsKIAlyZXR1cm4gY3B1aWRfZWF4
KGt2bV9jcHVpZF9iYXNlKCkgfCBLVk1fQ1BVSURfRkVBVFVSRVMpOwotLSAKMi43LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
