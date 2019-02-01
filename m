From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH -next] drm/xen-front: Drop pointless static
 qualifier in fb_destroy()
Date: Fri, 1 Feb 2019 08:55:47 +0000
Message-ID: <abc50111-8924-dbfa-9f5d-16f102f30cac__46558.8615204737$1549011411$gmane$org@epam.com>
References: <1548504338-114487-1-git-send-email-yuehaibing@huawei.com>
 <4c371af3-8856-39a7-d06e-6b55749567e5@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4c371af3-8856-39a7-d06e-6b55749567e5@epam.com>
Content-Language: en-US
Content-ID: <627F55A0C668C648BFE3709A3B6726AC@eurprd03.prod.outlook.com>
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

T24gMS8yOC8xOSA4OjM2IEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4gT24g
MS8yNi8xOSAyOjA1IFBNLCBZdWVIYWliaW5nIHdyb3RlOg0KPj4gVGhlcmUgaXMgbm8gbmVlZCB0
byBoYXZlIHRoZSAnc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmInIHZhcmlhYmxlDQo+PiBzdGF0
aWMgc2luY2UgbmV3IHZhbHVlIGFsd2F5cyBiZSBhc3NpZ25lZCBiZWZvcmUgdXNlIGl0Lg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4NCj4g
R29vZCBjYXRjaCwgdGhhbmsgeW91IQ0KPiBSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KSWYgbm9ib2R5IG9iamVj
dHMgSSdsbCBhcHBseSB0aGlzIHRvIGRybS1taXNjLWZpeGVzIG5leHQgTW9uZGF5DQo+PiAtLS0N
Cj4+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyB8IDIgKy0NCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMgDQo+
PiBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYw0KPj4gaW5kZXggODYw
ZGEwNS4uYzI5NTVkMyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2Ry
bV9mcm9udF9rbXMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250
X2ttcy5jDQo+PiBAQCAtNTQsNyArNTQsNyBAQCBzdGF0aWMgdm9pZCBmYl9kZXN0cm95KHN0cnVj
dCBkcm1fZnJhbWVidWZmZXIgKmZiKQ0KPj4gwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGRy
bV9tb2RlX2ZiX2NtZDIgKm1vZGVfY21kKQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
eGVuX2RybV9mcm9udF9kcm1faW5mbyAqZHJtX2luZm8gPSBkZXYtPmRldl9wcml2YXRlOw0KPj4g
LcKgwqDCoCBzdGF0aWMgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmI7DQo+PiArwqDCoMKgIHN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiOw0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKmdlbV9vYmo7DQo+PiDCoMKgwqDCoMKgIGludCByZXQ7DQo+Pg0KPj4NCj4+DQo+Pg0K
Pj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
