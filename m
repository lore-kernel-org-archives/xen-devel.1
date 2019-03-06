From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH 0/6] iomem cacheability
Date: Wed, 6 Mar 2019 22:59:06 +0000
Message-ID: <7b7c45ee-745f-1ede-1063-7fd66449194b@arm.com>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <CABHD4K-UAuyv0Cwmk1d-SBUgGvUarWq-fsAsJATbg3r+ovGLrg@mail.gmail.com>
 <alpine.DEB.2.10.1903051321390.17552@sstabellini-ThinkPad-X260>
 <CAF3u54Di61CufwzwJ35sqPrBRVt2ewrmR=siDHPWA8ur29db7Q@mail.gmail.com>
 <CABHD4K8JQdhi8P4ZbYndUFs90w0eH9QqMAa_XDPJM-QA_yr=QA@mail.gmail.com>
 <alpine.DEB.2.10.1903061429230.17248@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yqT7=RJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h1fVH-0004pB-Va
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 22:59:12 +0000
In-Reply-To: <alpine.DEB.2.10.1903061429230.17248@sstabellini-ThinkPad-X260>
Content-Language: en-US
Content-ID: <231DC87F175BC14FA75FF79A9CF9395E@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Amit Tomer <amittomer25@gmail.com>
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "ian.jackson@citrix.com" <ian.jackson@citrix.com>, nd <nd@arm.com>
List-Id: xen-devel@lists.xenproject.org

SGksDQoNCk9uIDA2LzAzLzIwMTkgMjI6NDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gV2VkLCA2IE1hciAyMDE5LCBBbWl0IFRvbWVyIHdyb3RlOg0KPj4gSGksDQo+Pj4gTG9va2lu
ZyBhdCB0aGUgc3RhY2sgdHJhY2UsIHRoaXMgaXMgdmVyeSBsaWtlbHkgZHVlIHRvIHRoZSBpc3N1
ZSBJIHBvaW50ZWQgb3V0IGVhcmxpZXIgb24uIEkuZSByZXNlcnZlZC1tZW1vcnkgcmVnaW9uIHNo
b3VsZCBiZSBkZXNjcmliZWQgaW4gdGhlIG1lbW9yeSBub2Rlcy4NCj4+DQo+PiBEbyB5b3UgbWVh
biwgc29tZXRoaW5nIGxpa2UgdGhpcyhyZXNlcnZlZC1tZW1vcnkgbm9kZSBpcyB1bmRlciBtZW1v
cnkgbm9kZSkgPw0KPiANCj4gTm8sIEkgdGhpbmsgSnVsaWVuIG1lYW50IHRoYXQgYWxsIHRoZSBy
ZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyByYW5nZXMNCj4gc2hvdWxkIGJlICJjb3ZlcmVkIiBieSB0
aGUgcmFuZ2VzIG9mIHRoZSBtZW1vcnkgbm9kZS4NCj4gDQo+IElmIGEgcmVzZXJ2ZWQtbWVtb3J5
IG5vZGUgcmFuZ2UgaXMgMHg1NDAwMDAwMCAtIDB4NTcwMDAwMDAsIHRoZW4gd2UgbmVlZA0KPiB0
byBtYWtlIHN1cmUgdGhhdCB0aGUgbWVtb3J5IG5vZGUgaW5jbHVkZXMgdGhhdCByYW5nZS4gSW4g
eW91ciBjYXNlLCB0aGUNCj4gZmlyc3QgbWVtb3J5IGJhbmsgaXMgMHg0ODAwMDAwMCAtIDB4ODAw
MDAwMDAgc28gaXQgd291bGQgY2xlYXJseSBpbmNsdWRlDQo+IHRoZSByYW5nZSAweDU0MDAwMDAw
IC0gMHg1NzAwMDAwMC4gU28sIGl0IGxvb2tzIGxpa2UgaXQgaXMgY29ycmVjdCBmcm9tDQo+IHRo
YXQgcG9pbnQgb2Ygdmlldy4NCg0KTm90IHJlYWxseSwgdGhlIERUIHByb3ZpZGVkIGJ5IEFtaXQg
aXMgZm9yIHRoZSBob3N0LiBUaGUgbWVtb3J5IG5vZGUgDQp3aWxsIGJlIHJld3JpdHRlbiBieSBY
ZW4gZm9yIERvbTAgIGFuZCBkb2VzIG5vdCBpbmNsdWRlIHRoZSANCnJlc2VydmVkLW1lbW9yeSBy
ZWdpb25zIHNvIGZhci4NCg0KPiANCj4gSSBhbSBzdXNwZWN0aW5nIHRoZXJlIGlzIGEgYnVnIGlu
IHRoZSBwYXRjaCAieGVuL2FybTogbWFwDQo+IHJlc2VydmVkLW1lbW9yeSByZWdpb25zIGFzIG5v
cm1hbCBtZW1vcnkgaW4gZG9tMCIsIHNwZWNpZmljYWxseSBpbiB0aGUNCj4gaW1wbGVtZW50YXRp
b24gb2YgY2hlY2tfcmVzZXJ2ZWRfbWVtb3J5Lg0KDQpJIGRvbid0IHRoaW5rIHRoZSBpc3N1ZSBp
cyBpbiB0aGF0IGNvZGUgKHNlZSBhYm92ZSkuDQoNCkNoZWVycywNCg0KLS0gDQpKdWxpZW4gR3Jh
bGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
