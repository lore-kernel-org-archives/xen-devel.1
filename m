From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH -next] drm/xen-front: Drop pointless static
 qualifier in fb_destroy()
Date: Mon, 28 Jan 2019 06:36:08 +0000
Message-ID: <4c371af3-8856-39a7-d06e-6b55749567e5__19297.7722546615$1548657429$gmane$org@epam.com>
References: <1548504338-114487-1-git-send-email-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548504338-114487-1-git-send-email-yuehaibing@huawei.com>
Content-Language: en-US
Content-ID: <221780DB5666A6408C5CCE91CF0BE7C5@eurprd03.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: YueHaibing <yuehaibing@huawei.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMS8yNi8xOSAyOjA1IFBNLCBZdWVIYWliaW5nIHdyb3RlOg0KPiBUaGVyZSBpcyBubyBuZWVk
IHRvIGhhdmUgdGhlICdzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYicgdmFyaWFibGUNCj4gc3Rh
dGljIHNpbmNlIG5ldyB2YWx1ZSBhbHdheXMgYmUgYXNzaWduZWQgYmVmb3JlIHVzZSBpdC4NCj4N
Cj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPg0KR29v
ZCBjYXRjaCwgdGhhbmsgeW91IQ0KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94
ZW5fZHJtX2Zyb250X2ttcy5jDQo+IGluZGV4IDg2MGRhMDUuLmMyOTU1ZDMgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYw0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMNCj4gQEAgLTU0LDcgKzU0LDcgQEAg
c3RhdGljIHZvaWQgZmJfZGVzdHJveShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYikNCj4gICAJ
ICBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQpDQo+ICAgew0KPiAgIAlz
dHJ1Y3QgeGVuX2RybV9mcm9udF9kcm1faW5mbyAqZHJtX2luZm8gPSBkZXYtPmRldl9wcml2YXRl
Ow0KPiAtCXN0YXRpYyBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYjsNCj4gKwlzdHJ1Y3QgZHJt
X2ZyYW1lYnVmZmVyICpmYjsNCj4gICAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW1fb2JqOw0K
PiAgIAlpbnQgcmV0Ow0KPiAgIA0KPg0KPg0KPg0KPg0KPg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
