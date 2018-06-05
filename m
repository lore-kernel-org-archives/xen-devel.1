From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v1 01/13] xen/arm: domain: Zero the per-vCPU
 cpu_info
Date: Tue,  5 Jun 2018 16:22:51 +0100
Message-ID: <20180605152303.14450-2-julien.grall@arm.com>
References: <20180605152303.14450-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=s9k6=ix=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fQDnt-0005AR-0Y
 for xen-devel@lists.xenproject.org; Tue, 05 Jun 2018 15:23:21 +0000
In-Reply-To: <20180605152303.14450-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

QSBzdGFjayBpcyBhbGxvY2F0ZWQgcGVyIHZDUFUgdG8gYmUgdXNlZCBieSBYZW4uIFRoZSBhbGxv
Y2F0aW9uIGlzIGRvbmUKd2l0aCBhbGxvY194ZW5oZWFwX3BhZ2VzIHRoYXQgZG9lcyBub3QgemVy
byB0aGUgbWVtb3J5IHJldHVybmVkLiBIb3dldmVyCnRoZSB0b3Agb2YgdGhlIHN0YWNrIGlzIGNv
bnRhaW5pbmcgaW5mb3JtYXRpb24gdGhhdCB3aWxsIGJlIHVzZWQgdG8Kc3RvcmUgdGhlIGluaXRp
YWwgc3RhdGUgb2YgdGhlIHZDUFUgKHNlZSBzdHJ1Y3QgY3B1X2luZm8pLiBTb21lIG9mIHRoZQpm
aWVsZHMgbWF5IG5vdCBiZSBpbml0aWFsaXplZCBhbmQgd2lsbCBsZWFkIHRvIHVzZS9sZWFrIGJp
dHMgb2YgcHJldmlvdXMKbWVtb3J5IGluIHNvbWUgY2FzZXMgb24gdGhlIGZpcnN0IHJ1biBvZiB2
Q1BVIChBRkFJQ1QgdGhpcyBvbmx5IGhhcHBlbiBvbgp2Q1BVMCBmb3IgRG9tMCkuCgpUaGlzIGlz
IHBhcnQgb2YgWFNBLTI2My4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6CiAgICAgICAgLSBaZXJvIG9ubHkg
Y3B1X2luZm8KLS0tCiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBiL3hl
bi9hcmNoL2FybS9kb21haW4uYwppbmRleCBlYzBmMDQyYmY3Li41YTJhOWE2YjgzIDEwMDY0NAot
LS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCkBA
IC01NTAsNiArNTUwLDcgQEAgaW50IHZjcHVfaW5pdGlhbGlzZShzdHJ1Y3QgdmNwdSAqdikKICAg
ICB2LT5hcmNoLmNwdV9pbmZvID0gKHN0cnVjdCBjcHVfaW5mbyAqKSh2LT5hcmNoLnN0YWNrCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKyBTVEFDS19TSVpFCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBzaXplb2Yoc3RydWN0
IGNwdV9pbmZvKSk7CisgICAgbWVtc2V0KHYtPmFyY2guY3B1X2luZm8sIDAsIHNpemVvZigqdi0+
YXJjaC5jcHVfaW5mbykpOwogCiAgICAgbWVtc2V0KCZ2LT5hcmNoLnNhdmVkX2NvbnRleHQsIDAs
IHNpemVvZih2LT5hcmNoLnNhdmVkX2NvbnRleHQpKTsKICAgICB2LT5hcmNoLnNhdmVkX2NvbnRl
eHQuc3AgPSAocmVnaXN0ZXJfdCl2LT5hcmNoLmNwdV9pbmZvOwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
