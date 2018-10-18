From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 21/22] xen/arm: platform: Don't include p2m.h in
 exynos5 and omap5
Date: Thu, 18 Oct 2018 14:21:08 +0100
Message-ID: <20181018132109.31192-22-julien.grall@arm.com>
References: <20181018132109.31192-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181018132109.31192-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

Tm9uZSBvZiB0aGUgcGxhdGZvcm1zIGFyZSB1c2luZyB0aGUgcDJtIGhlbHBlcnMuCgpTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNo
L2FybS9wbGF0Zm9ybXMvZXh5bm9zNS5jIHwgMSAtCiB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL29t
YXA1LmMgICB8IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvZXh5bm9zNS5jIGIveGVuL2FyY2gvYXJtL3BsYXRm
b3Jtcy9leHlub3M1LmMKaW5kZXggZTJjMGI3Yjg3OC4uNjU2MDUwNzA5MiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9leHlub3M1LmMKKysrIGIveGVuL2FyY2gvYXJtL3BsYXRm
b3Jtcy9leHlub3M1LmMKQEAgLTE3LDcgKzE3LDYgQEAKICAqIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCiAgKi8KIAotI2luY2x1ZGUgPGFzbS9wMm0uaD4KICNp
bmNsdWRlIDx4ZW4vZGV2aWNlX3RyZWUuaD4KICNpbmNsdWRlIDx4ZW4vZG9tYWluX3BhZ2UuaD4K
ICNpbmNsdWRlIDx4ZW4vbW0uaD4KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMv
b21hcDUuYyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvb21hcDUuYwppbmRleCA3ZGJiYTk1NzU2
Li5hZWUyNGU0ZDI4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL29tYXA1LmMK
KysrIGIveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9vbWFwNS5jCkBAIC0xNyw3ICsxNyw2IEBACiAg
KiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgogICovCiAKLSNp
bmNsdWRlIDxhc20vcDJtLmg+CiAjaW5jbHVkZSA8YXNtL3BsYXRmb3JtLmg+CiAjaW5jbHVkZSA8
YXNtL3BsYXRmb3Jtcy9vbWFwNS5oPgogI2luY2x1ZGUgPHhlbi9tbS5oPgotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
