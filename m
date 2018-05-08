From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 1/3] drm/xen-front: checking for NULL
 instead of IS_ERR
Date: Tue, 8 May 2018 14:50:57 +0300
Message-ID: <1d60df53-8c37-0830-951c-ec0b34b5af53__48160.7777918272$1525780239$gmane$org@gmail.com>
References: <20180508092650.GA661@mwanda>
 <0d0ce12b-5dbc-dc36-b57b-6d93e98f3f04@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0d0ce12b-5dbc-dc36-b57b-6d93e98f3f04@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDgvMjAxOCAxMjozNCBQTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDUvMDgvMjAxOCAxMjoyNiBQTSwgRGFuIENhcnBlbnRlciB3cm90ZToKPj4gZHJtX2Rldl9h
bGxvYygpIHJldHVybnMgZXJyb3IgcG9pbnRlcnMsIGl0IG5ldmVyIHJldHVybnMgTlVMTC4KPj4K
Pj4gRml4ZXM6IGM1NzViN2VlYjg5ZiAoImRybS94ZW4tZnJvbnQ6IEFkZCBzdXBwb3J0IGZvciBY
ZW4gUFYgZGlzcGxheSAKPj4gZnJvbnRlbmQiKQo+PiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVu
dGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gVGhhbmsgeW91LAo+IFJldmlld2VkLWJ5
OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5j
b20+CkFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dCwKVGhhbmsgeW91Cj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYyAKPj4gYi9kcml2ZXJzL2dwdS9k
cm0veGVuL3hlbl9kcm1fZnJvbnQuYwo+PiBpbmRleCAxYjBlYTlhYzMzMGUuLjg2MTVlODUyMmM3
YSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKPj4gQEAgLTU0Myw4ICs1
NDMsOCBAQCBzdGF0aWMgaW50IHhlbl9kcm1fZHJ2X2luaXQoc3RydWN0IAo+PiB4ZW5fZHJtX2Zy
b250X2luZm8gKmZyb250X2luZm8pCj4+IMKgwqDCoMKgwqAgZnJvbnRfaW5mby0+ZHJtX2luZm8g
PSBkcm1faW5mbzsKPj4gwqAgwqDCoMKgwqDCoCBkcm1fZGV2ID0gZHJtX2Rldl9hbGxvYygmeGVu
X2RybV9kcml2ZXIsIGRldik7Cj4+IC3CoMKgwqAgaWYgKCFkcm1fZGV2KSB7Cj4+IC3CoMKgwqDC
oMKgwqDCoCByZXQgPSAtRU5PTUVNOwo+PiArwqDCoMKgIGlmIChJU19FUlIoZHJtX2RldikpIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IFBUUl9FUlIoZHJtX2Rldik7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIGZhaWw7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoCBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
