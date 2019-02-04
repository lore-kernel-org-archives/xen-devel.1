From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH -next] drm/xen-front: Drop pointless static
 qualifier in fb_destroy()
Date: Mon, 4 Feb 2019 06:56:51 +0000
Message-ID: <0e7914bf-98e8-654a-83a0-cb59833d9280__657.962337002971$1549263477$gmane$org@epam.com>
References: <1548504338-114487-1-git-send-email-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548504338-114487-1-git-send-email-yuehaibing@huawei.com>
Content-Language: en-US
Content-ID: <D0D0D8A274CA424D9F625AC9DD889250@eurprd03.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: YueHaibing <yuehaibing@huawei.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMS8yNi8xOSAyOjA1IFBNLCBZdWVIYWliaW5nIHdyb3RlOg0KPiBUaGVyZSBpcyBubyBuZWVk
IHRvIGhhdmUgdGhlICdzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYicgdmFyaWFibGUNCj4gc3Rh
dGljIHNpbmNlIG5ldyB2YWx1ZSBhbHdheXMgYmUgYXNzaWduZWQgYmVmb3JlIHVzZSBpdC4NCj4N
Cj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMgfCAyICstDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMgYi9kcml2
ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMNCj4gaW5kZXggODYwZGEwNS4uYzI5
NTVkMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2tt
cy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYw0KPiBA
QCAtNTQsNyArNTQsNyBAQCBzdGF0aWMgdm9pZCBmYl9kZXN0cm95KHN0cnVjdCBkcm1fZnJhbWVi
dWZmZXIgKmZiKQ0KPiAgIAkgIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9mYl9jbWQyICptb2RlX2Nt
ZCkNCj4gICB7DQo+ICAgCXN0cnVjdCB4ZW5fZHJtX2Zyb250X2RybV9pbmZvICpkcm1faW5mbyA9
IGRldi0+ZGV2X3ByaXZhdGU7DQo+IC0Jc3RhdGljIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZi
Ow0KPiArCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiOw0KPiAgIAlzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKmdlbV9vYmo7DQo+ICAgCWludCByZXQ7DQo+ICAgDQpBcHBsaWVkIHRvIGRybS1taXNj
LW5leHQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
