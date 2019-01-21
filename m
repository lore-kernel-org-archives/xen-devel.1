From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: [PATCH 1/2] iommu/arm: Misc fixes for arch specific part
Date: Mon, 21 Jan 2019 19:04:06 +0200
Message-ID: <1548090247-20078-2-git-send-email-andrii.anisov@gmail.com>
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8+6Q=P5=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1glczf-0007qr-Pq
 for xen-devel@lists.xenproject.org; Mon, 21 Jan 2019 17:04:15 +0000
Received: by mail-lf1-x141.google.com with SMTP id c16so16008978lfj.8
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jan 2019 09:04:14 -0800 (PST)
In-Reply-To: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKMS4gQWRkIG1pc3NpbmcgcmV0dXJuIGluIGNhc2UgaWYgSU9NTVUgb3BzIGhhdmUgYmVlbiBh
bHJlYWR5IHNldC4KMi4gQWRkIGNoZWNrIGZvciBzaGFyZWQgSU9NTVUgYmVmb3JlIHJldHVybmlu
ZyBhbiBlcnJvci4KClNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMg
fCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYwppbmRleCAzMjU5OTdiLi5jYmY5Yjgy
IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYworKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYwpAQCAtMzIsNyArMzIsMTAgQEAgdm9p
ZCBfX2luaXQgaW9tbXVfc2V0X29wcyhjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHMpCiAgICAg
QlVHX09OKG9wcyA9PSBOVUxMKTsKIAogICAgIGlmICggaW9tbXVfb3BzICYmIGlvbW11X29wcyAh
PSBvcHMgKQorICAgIHsKICAgICAgICAgcHJpbnRrKCJXQVJOSU5HOiBDYW5ub3Qgc2V0IElPTU1V
IG9wcywgYWxyZWFkeSBzZXQgdG8gYSBkaWZmZXJlbnQgdmFsdWVcbiIpOworICAgICAgICByZXR1
cm47CisgICAgfQogCiAgICAgaW9tbXVfb3BzID0gb3BzOwogfQpAQCAtNzAsOCArNzMsOCBAQCB2
b2lkIGFyY2hfaW9tbXVfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkKIAogaW50IGFy
Y2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90YWJsZShzdHJ1Y3QgZG9tYWluICpkKQogewotICAgIC8q
IFRoZSBJT01NVSBzaGFyZXMgdGhlIHAybSB3aXRoIHRoZSBDUFUgKi8KLSAgICByZXR1cm4gLUVO
T1NZUzsKKyAgICAvKiBSZXR1cm4gYW4gZXJyb3IgaWYgdGhlIElPTU1VIHNoYXJlcyB0aGUgcDJt
IHdpdGggdGhlIENQVSAqLworICAgIHJldHVybiBpb21tdV91c2VfaGFwX3B0KGQpID8gLUVOT1NZ
UyA6IDA7CiB9CiAKIHZvaWQgX19od2RvbV9pbml0IGFyY2hfaW9tbXVfaHdkb21faW5pdChzdHJ1
Y3QgZG9tYWluICpkKQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
