From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 0/4] xen/arm: GIC fixes and improvement
Date: Tue, 23 Oct 2018 19:17:05 +0100
Message-ID: <20181023181709.11883-1-julien.grall@arm.com>
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
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKVGhlIGZpcnN0IHR3byBwYXRjaGVzIHJlc29sdmVzIHRvIG91dC1vZi1vcmRlciBi
dWcgaW4gdGhlIEdJQyBjb2RlLiBUaGV5IGFyZQpjYW5kaWRhdGUgZm9yIGJhY2twb3J0aW5nLgoK
VGhlIGxhc3QgcGF0Y2ggaXMgYW4gcmVsYXhhdGlvbiBpbiB0aGUgYmFycmllciB1c2VkIHdoZW4g
c2VuZGluZyBhbiBTR0kuCgpDaGVlcnMsCgpKdWxpZW4gR3JhbGwgKDQpOgogIHhlbi9hcm06IGdp
YzogRW5zdXJlIHdlIGhhdmUgYW4gSVNCIGJldHdlZW4gYWNrIGFuZCBkb19JUlEoKQogIHhlbi9h
cm06IGdpYzogRW5zdXJlIG9yZGVyaW5nIGJldHdlZW4gcmVhZCBvZiBJTlRBQ0sgYW5kIHNoYXJl
ZCBkYXRhCiAgeGVuL2FybTogZ2ljOiBSZW1vdmUgZHVwbGljYXRlZCBjb21tZW50IGluIGRvX3Nn
aQogIHhlbi9hcm06IGdpYzogUmVsYXggYmFycmllciB3aGVuIHNlbmRpbmcgYW4gU0dJCgogeGVu
L2FyY2gvYXJtL2dpYy12Mi5jIHwgIDYgKysrKysrCiB4ZW4vYXJjaC9hcm0vZ2ljLXYzLmMgfCAg
NiArKysrKysKIHhlbi9hcmNoL2FybS9naWMuYyAgICB8IDEzICsrKysrKysrKy0tLS0KIDMgZmls
ZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
