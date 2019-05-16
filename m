From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH] coverage: GCC coverage libfdt Makefile fix
Date: Thu, 16 May 2019 11:37:33 +0000
Message-ID: <611b22f7-8125-15e0-6154-93638c2a14ad@arm.com>
References: <20190516111354.15195-1-viktor.mitin.19@gmail.com>
 <20190516112638.GX2798@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vv4c=TQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hREhd-0002eD-P4
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:37:37 +0000
In-Reply-To: <20190516112638.GX2798@zion.uk.xensource.com>
Content-Language: en-US
Content-ID: <EA281503DA72F246AD7BCF3522AB3FBE@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDE2LzA1LzIwMTkgMTI6MjYsIFdlaSBMaXUgd3JvdGU6DQo+IE9uIFRodSwgTWF5IDE2
LCAyMDE5IGF0IDAyOjEzOjU0UE0gKzAzMDAsIFZpa3RvciBNaXRpbiB3cm90ZToNCj4+IFRoZSBw
YXRjaCByZXNvbHZlcyAneGVuY292JyBjcmFzaGVzIGluIGNhc2Ugb2YgQWFyY2g2NC4NCj4+DQo+
PiBBbGwgdGhlIC5pbml0Liogc2VjdGlvbnMgYXJlIHN0cmlwcGVkIGFmdGVyIGJvb3QsDQo+PiBp
dCBtZWFucyB0aGF0IGFueXRoaW5nIGluIC5pbml0LmRhdGEgY2Fubm90IGJlIGFjY2Vzc2VkIGFu
eW1vcmUuDQo+PiBUaGUgYnVpbGQgc3lzdGVtIGV4cGxpY2l0bHkgY29tcGlsZXMgYW55IC5pbml0
IGJpbmFyeSB3aXRob3V0IGdjb3Ygb3B0aW9uLg0KPj4gVGhlIHByb2JsZW0gaXMgY29taW5nIGZy
b20gbGliZmR0Lg0KPj4gVGhlIGVudGlyZSBsaWJyYXJ5IGlzIG1vdmVkIHRvIC5pbml0IHVzaW5n
Og0KPj4gJChPQkpDT1BZKSAkKGZvcmVhY2ggcywkKFNFQ1RJT05TKSwtLXJlbmFtZS1zZWN0aW9u
IC4kKHMpPS5pbml0LiQocykpICQ8ICRADQo+PiBTbyB3ZSBuZWVkIHRvIHRlbGwgdGhlIHRvcCBN
YWtlZmlsZSB0byBmaWx0ZXIgb3V0IGxpYmZkdC4NCj4+DQo+PiBSZXBvcnRlZC1ieTogVmlrdG9y
IE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4+IFRlc3RlZC1ieTogVmlrdG9yIE1p
dGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+DQo+IA0KPiBBbHRob3VnaCBJIHdvdWxkIGxpa2UgdG8g
YXNrIHlvdSB0byBhZGp1c3QgdGhlIHN1YmplY3QgdG8gYmUgbW9yZQ0KPiBzcGVjaWZpYzoNCj4g
DQo+ICAgIGNvdmVyYWdlOiBmaWx0ZXIgb3V0IGxpYmZkdC5vDQo+IA0KPiBpZiB5b3UgYWdyZWUs
IHRoaXMgY2FuIGJlIGRvbmUgd2hpbGUgY29tbWl0dGluZy4NCg0KVGhlcmUgYXJlIG1vcmUgdGhh
biB0aGF0IHRoZSB0aXRsZSB0byBmaXggb24gY29tbWl0LiBUaGUgU2lnbmVkLW9mZi1ieSANCmFu
ZCBkb2VzIG5vdCBtYXRjaCB0aGUgRnJvbSBmb3IgaW5zdGFuY2UuDQoNCkkgaW5pdGlhbGx5IHN1
Z2dlc3RlZCB0aGUgY2hhbmdlLCBzbyBTdWdnZXN0ZWQtYnkgd291bGQgYmUgbW9yZSANCnN1aXRh
YmxlLiBBbmQgdGhlbiBWaWt0b3IgbmVlZHMgdG8gYWRkIGhpcyBzaWduZWQtb2ZmLWJ5Lg0KDQpB
bHNvLCBjb3VsZCB3ZSBhbHNvIGZpeCBsaWJlbGYgYXQgdGhlIHNhbWUgdGltZT8NCg0KQ2hlZXJz
LA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
