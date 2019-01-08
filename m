From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Subject: Re: [RFC PATCH 2/6] tools/libxc: Define VM_EVENT type
Date: Tue, 8 Jan 2019 15:01:34 +0000
Message-ID: <142d7345bb84e972ffbc097aede42251ab8ee040.camel@bitdefender.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <beb32f568f2e4f3630ffd6d59f9a3b7ca0e6f3d2.1545245243.git.ppircalabu@bitdefender.com>
 <20190102111112.okgqqktbrhtx7gem@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gnh4=PQ=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1ggsst-00016P-Gh
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 15:01:39 +0000
In-Reply-To: <20190102111112.okgqqktbrhtx7gem@zion.uk.xensource.com>
Content-Language: en-US
Content-ID: <3C4F84C9085B1A4CA34C19CD56FF5B7C@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMDE5LTAxLTAyIGF0IDExOjExICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBPbiBX
ZWQsIERlYyAxOSwgMjAxOCBhdCAwODo1MjowNVBNICswMjAwLCBQZXRyZSBQaXJjYWxhYnUgd3Jv
dGU6DQo+ID4gRGVmaW5lIHRoZSB0eXBlIGZvciBlYWNoIG9mIHRoZSBzdXBwb3J0ZWQgdm1fZXZl
bnQgcmluZ3MgKHBhZ2luZywNCj4gPiBtb25pdG9yIGFuZCBzaGFyaW5nKSBhbmQgcmVwbGFjZSB0
aGUgcmluZyBwYXJhbSBmaWVsZCB3aXRoIHRoaXMNCj4gPiB0eXBlLg0KPiA+IA0KPiA+IFJlcGxh
Y2UgWEVOX0RPTUNUTF9WTV9FVkVOVF9PUF8gb2NjdXJyZW5jZXMgd2l0aCB0aGVpcg0KPiA+IGNv
cnJlc3BvbmRpbmcNCj4gPiBYRU5fVk1fRVZFTlRfVFlQRV8gY291bnRlcnBhcnQuDQo+ID4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVy
LmNvbT4NCj4gPiAtLS0NCj4gPiAgdG9vbHMvbGlieGMveGNfbWVtX3BhZ2luZy5jIHwgIDYgKyst
LQ0KPiA+ICB0b29scy9saWJ4Yy94Y19tb25pdG9yLmMgICAgfCAgNiArKy0tDQo+ID4gIHRvb2xz
L2xpYnhjL3hjX3ByaXZhdGUuaCAgICB8ICA4ICsrKy0tLQ0KPiA+ICB0b29scy9saWJ4Yy94Y192
bV9ldmVudC5jICAgfCA2OCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gPiAt
LS0tLS0tLS0tLS0NCj4gPiAgeGVuL2NvbW1vbi92bV9ldmVudC5jICAgICAgIHwgMTIgKysrKy0t
LS0NCj4gPiAgeGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIHwgNDUgKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tDQo+IA0KPiBZb3UgYWxzbyBuZWVkIHRvIGNoYW5nZSBYRU5fRE9NQ1RM
X0lOVEVSRkFDRV9WRVJTSU9OIGluIHRoaXMgcGF0Y2guDQo+IA0KPiBXZWkuDQoNClhFTl9ET01D
VExfSU5URVJGQUNFX1ZFUlNJT04gd2FzIGluY3JlbWVudGVkIGluIGFub3RoZXIgcGF0Y2ggb2Yg
dGhlDQpzZXJpZXMgKHZtX2V2ZW50OiBVc2Ugc2xvdHRlZCBjaGFubmVscyBmb3Igc3luYyByZXF1
ZXN0cykuIElzIGl0DQpuZWNlc3NhcnkgdG8gaGF2ZSBpdCBpbmNyZW1lbnRlZCB0d2ljZT8gDQoN
Ck1hbnkgdGhhbmtzLA0KUGV0cmUNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
