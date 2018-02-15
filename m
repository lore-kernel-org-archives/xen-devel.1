From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH v3 15/17] xen/arm: vpsci: Update the return type
	for MIGRATE_INFO_TYPE
Date: Thu, 15 Feb 2018 15:02:46 +0000
Message-ID: <20180215150248.28922-16-julien.grall@arm.com>
References: <20180215150248.28922-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180215150248.28922-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, volodymyr_babchuk@epam.com, mirela.simonovic@aggios.com, andre.przywara@linaro.org
List-Id: xen-devel@lists.xenproject.org

RnJvbSB0aGUgc3BlY2lmaWNhdGlvbiwgdGhlIFBTQ0kgY2FsbCBNSUdSQVRFX0lORk9fVFlQRSB3
aWxsIHJldHVybiBhbgppbnQzMl90LiBVcGRhdGUgdGhlIGZ1bmN0aW9uIHJldHVybiB0eXBlIHRv
IG1hdGNoIGl0LgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KQ2M6IG1pcmVsYS5zaW1vbm92aWNAYWdnaW9zLmNvbQoKLS0tCiAgICBDaGFuZ2VzIGlu
IHYzOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vdnBzY2kuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL2FybS92cHNjaS5jIGIveGVuL2FyY2gvYXJtL3Zwc2NpLmMKaW5kZXgg
N2VhM2VhNThlMy4uOWEwODJhYTZlZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3Zwc2NpLmMK
KysrIGIveGVuL2FyY2gvYXJtL3Zwc2NpLmMKQEAgLTE4Niw3ICsxODYsNyBAQCBzdGF0aWMgaW50
MzJfdCBkb19wc2NpXzBfMl9hZmZpbml0eV9pbmZvKHJlZ2lzdGVyX3QgdGFyZ2V0X2FmZmluaXR5
LAogICAgIHJldHVybiBQU0NJXzBfMl9BRkZJTklUWV9MRVZFTF9PRkY7CiB9CiAKLXN0YXRpYyB1
aW50MzJfdCBkb19wc2NpXzBfMl9taWdyYXRlX2luZm9fdHlwZSh2b2lkKQorc3RhdGljIGludDMy
X3QgZG9fcHNjaV8wXzJfbWlncmF0ZV9pbmZvX3R5cGUodm9pZCkKIHsKICAgICByZXR1cm4gUFND
SV8wXzJfVE9TX01QX09SX05PVF9QUkVTRU5UOwogfQotLSAKMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
