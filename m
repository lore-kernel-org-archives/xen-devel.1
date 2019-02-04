From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] drm/xen-front: Fix mmap attributes for
 display buffers
Date: Mon, 4 Feb 2019 06:55:41 +0000
Message-ID: <fd0a3e68-a190-51ee-2b25-6de790f8b845@epam.com>
References: <20190129150422.19867-1-andr2000@gmail.com>
 <bf8cf8d9-7092-d956-44d2-e55233f495d2@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gKq0=QL=epam.com=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1gqYAV-0003aq-7d
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 06:55:47 +0000
In-Reply-To: <bf8cf8d9-7092-d956-44d2-e55233f495d2@arm.com>
Content-Language: en-US
Content-ID: <CC8547AECF180D44AE93EA8E3212C597@eurprd03.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, "jgross@suse.com" <jgross@suse.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "kraxel@redhat.com" <kraxel@redhat.com>, "noralf@tronnes.org" <noralf@tronnes.org>, "hch@infradead.org" <hch@infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gMS8yOS8xOSA5OjA3IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+IEhpIE9sZWtzYW5kciwN
Cj4NCj4gT24gMS8yOS8xOSAzOjA0IFBNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToN
Cj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5r
b0BlcGFtLmNvbT4NCj4+DQo+PiBXaGVuIEdFTSBiYWNraW5nIHN0b3JhZ2UgaXMgYWxsb2NhdGVk
IHRob3NlIGFyZSBub3JtYWwgcGFnZXMsDQo+PiBzbyB0aGVyZSBpcyBubyBwb2ludCB1c2luZyBw
Z3Byb3Rfd3JpdGVjb21iaW5lIHdoaWxlIG1tYXBpbmcuDQo+PiBUaGlzIGZpeGVzIG1pc21hdGNo
IG9mIGJ1ZmZlciBwYWdlcycgbWVtb3J5IGF0dHJpYnV0ZXMgYmV0d2Vlbg0KPj4gdGhlIGZyb250
ZW5kIGFuZCBiYWNrZW5kIHdoaWNoIG1heSBjYXVzZSBzY3JlZW4gYXJ0aWZhY3RzLg0KPj4NCj4+
IEZpeGVzOiBjNTc1YjdlZWI4OWYgKCJkcm0veGVuLWZyb250OiBBZGQgc3VwcG9ydCBmb3IgWGVu
IFBWIGRpc3BsYXkgDQo+PiBmcm9udGVuZCIpDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gDQo+PiA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+
DQo+PiBTdWdnZXN0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+
PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYyB8IDUg
KystLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9u
dF9nZW0uYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jDQo+
PiBpbmRleCBkMzAzYTJlMTdmNWUuLjlkNWMwM2Q3NjY4ZCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jDQo+PiBAQCAtMjM1LDggKzIzNSw3IEBAIHN0YXRp
YyBpbnQgZ2VtX21tYXBfb2JqKHN0cnVjdCB4ZW5fZ2VtX29iamVjdCANCj4+ICp4ZW5fb2JqLA0K
Pj4gwqDCoMKgwqDCoCB2bWEtPnZtX2ZsYWdzICY9IH5WTV9QRk5NQVA7DQo+PiDCoMKgwqDCoMKg
IHZtYS0+dm1fZmxhZ3MgfD0gVk1fTUlYRURNQVA7DQo+PiDCoMKgwqDCoMKgIHZtYS0+dm1fcGdv
ZmYgPSAwOw0KPj4gLcKgwqDCoCB2bWEtPnZtX3BhZ2VfcHJvdCA9DQo+PiAtIHBncHJvdF93cml0
ZWNvbWJpbmUodm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKSk7DQo+PiArwqDCoMKgIHZt
YS0+dm1fcGFnZV9wcm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKTsNCj4NCj4g
VGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuIEl0IHdvdWxkIGJlIHdvcnRoIGV4cGFuZGluZyB0
aGUgY29tbWVudCBhIA0KPiBiaXQgYmVmb3JlIHRvIGV4cGxhaW4gdGhhdCB3ZSBvdmVyd3JpdGUg
dm1fcGFnZV9wcm90IHRvIHVzZSBjYWNoZWFibGUgDQo+IGF0dHJpYnV0ZSBhcyByZXF1aXJlZCBi
eSB0aGUgWGVuIEFCSS4NCj4NCj4gV2l0aCB0aGUgY29tbWVudCB1cGRhdGVkOg0KPg0KPiBBY2tl
ZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4NCj4gQ2hlZXJzLA0K
Pg0KQXBwbGllZCB0byBkcm0tbWlzYy1uZXh0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
