From: Samuel Ortiz <sameo@linux.intel.com>
Subject: [PATCH v5 15/24] hw: i386: Export the i386 ACPI SRAT
 build method
Date: Mon,  5 Nov 2018 02:40:38 +0100
Message-ID: <20181105014047.26447-16-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j2jf=nq=linux.intel.com=sameo@srs-us1.protection.inumbo.net>)
 id 1gJTuu-00049s-N4
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 01:43:00 +0000
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyB0aGUgc3RhbmRhcmQgd2F5IG9mIGJ1aWxkaW5nIFNSQVQgb24geDg2IHBsYXRmb21z
LiBCdXQgZnV0dXJlCm1hY2hpbmUgdHlwZXMgY291bGQgZGVjaWRlIHRvIGRlZmluZSB0aGVpciBv
d24gY3VzdG9tIFNSQVQgYnVpbGQgbWV0aG9kCnRocm91Z2ggdGhlIEFDUEkgYnVpbGRlciBtZXRo
b2RzLgpNb3Jlb3Zlciwgd2Ugd2lsbCBhbHNvIG5lZWQgdG8gcmVhY2ggYnVpbGRfc3JhdCgpIGZy
b20gb3V0c2lkZSBvZgphY3BpLWJ1aWxkIGluIG9yZGVyIHRvIHVzZSBpdCBhcyB0aGUgQUNQSSBi
dWlsZGVyIFNSQVQgYnVpbGQgbWV0aG9kLgoKU2lnbmVkLW9mZi1ieTogU2FtdWVsIE9ydGl6IDxz
YW1lb0BsaW51eC5pbnRlbC5jb20+Ci0tLQogaHcvaTM4Ni9hY3BpLWJ1aWxkLmggfCA1ICsrKysr
CiBody9pMzg2L2FjcGktYnVpbGQuYyB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9hY3BpLWJ1aWxkLmgg
Yi9ody9pMzg2L2FjcGktYnVpbGQuaAppbmRleCAwNjVhMWQ4MjUwLi5kNzNjNDFmZThmIDEwMDY0
NAotLS0gYS9ody9pMzg2L2FjcGktYnVpbGQuaAorKysgYi9ody9pMzg2L2FjcGktYnVpbGQuaApA
QCAtNCw2ICs0LDExIEBACiAKICNpbmNsdWRlICJody9hY3BpL2FjcGkuaCIKIAorLyogQUNQSSBT
UkFUIChTdGF0aWMgUmVzb3VyY2UgQWZmaW5pdHkgVGFibGUpIGJ1aWxkIG1ldGhvZCBmb3IgeDg2
ICovCit2b2lkCitidWlsZF9zcmF0KEdBcnJheSAqdGFibGVfZGF0YSwgQklPU0xpbmtlciAqbGlu
a2VyLAorICAgICAgICAgICBNYWNoaW5lU3RhdGUgKm1hY2hpbmUsIEFjcGlDb25maWd1cmF0aW9u
ICphY3BpX2NvbmYpOworCiB2b2lkIGFjcGlfc2V0dXAoTWFjaGluZVN0YXRlICptYWNoaW5lLCBB
Y3BpQ29uZmlndXJhdGlvbiAqYWNwaV9jb25mKTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS9ody9p
Mzg2L2FjcGktYnVpbGQuYyBiL2h3L2kzODYvYWNwaS1idWlsZC5jCmluZGV4IDFlZjFhMzg0NDEu
LjY3M2M1ZGZhZmMgMTAwNjQ0Ci0tLSBhL2h3L2kzODYvYWNwaS1idWlsZC5jCisrKyBiL2h3L2kz
ODYvYWNwaS1idWlsZC5jCkBAIC0xNjE1LDcgKzE2MTUsNyBAQCBidWlsZF90cG0yKEdBcnJheSAq
dGFibGVfZGF0YSwgQklPU0xpbmtlciAqbGlua2VyLCBHQXJyYXkgKnRjcGFsb2cpCiAjZGVmaW5l
IEhPTEVfNjQwS19TVEFSVCAgKDY0MCAqIEtpQikKICNkZWZpbmUgSE9MRV82NDBLX0VORCAgICgx
ICogTWlCKQogCi1zdGF0aWMgdm9pZAordm9pZAogYnVpbGRfc3JhdChHQXJyYXkgKnRhYmxlX2Rh
dGEsIEJJT1NMaW5rZXIgKmxpbmtlciwKICAgICAgICAgICAgTWFjaGluZVN0YXRlICptYWNoaW5l
LCBBY3BpQ29uZmlndXJhdGlvbiAqYWNwaV9jb25mKQogewotLSAKMi4xOS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
