From: Pasha Tatashin <Pavel.Tatashin@microsoft.com>
Subject: Re: [PATCH] x86/xen: enable early use of set_fixmap in
 32-bit Xen PV guest
Date: Wed, 22 Aug 2018 19:28:17 +0000
Message-ID: <CAGM2rebMaogjr-EbwBOxzB8GZqGqrM-4rG-m95O6O=WwzjJ2Rw__27934.5097755597$1534999622$gmane$org@mail.gmail.com>
References: <20180817134016.19957-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=esyw=lf=microsoft.com=pavel.tatashin@srs-us1.protection.inumbo.net>)
 id 1fsYpM-00056J-Jo
 for xen-devel@lists.xenproject.org; Wed, 22 Aug 2018 19:30:00 +0000
In-Reply-To: <20180817134016.19957-1-jgross@suse.com>
Content-Language: en-US
Content-ID: <3B2DCAE84E10B441B85B1DECC2CB57F4@namprd21.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "jgross@suse.com" <jgross@suse.com>
Cc: "x86@kernel.org" <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "pasha.tatashin@oracle.com" <pasha.tatashin@oracle.com>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgOTo0MSBBTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOg0KPg0KPiBDb21taXQgN2IyNWI5Y2IwZGFkODMgKCJ4ODYveGVuL3RpbWU6
IEluaXRpYWxpemUgcHYgeGVuIHRpbWUgaW4NCj4gaW5pdF9oeXBlcnZpc29yX3BsYXRmb3JtKCki
KSBtb3ZlZCB0aGUgbWFwcGluZyBvZiB0aGUgc2hhcmVkIGluZm8gYXJlYQ0KPiBiZWZvcmUgcGFn
ZXRhYmxlX2luaXQoKS4gVGhpcyBicmVha3MgYm9vdGluZyBhcyAzMi1iaXQgUFYgZ3Vlc3QgYXMg
dGhlDQo+IHVzZSBvZiBzZXRfZml4bWFwIGlzbid0IHBvc3NpYmxlIGF0IHRoaXMgdGltZSBvbiAz
Mi1iaXQuDQo+DQo+IFRoaXMgY2FuIGJlIHdvcmtlZCBhcm91bmQgYnkgcG9wdWxhdGluZyB0aGUg
bmVlZGVkIFBNRCBvbiAzMi1iaXQNCj4ga2VybmVsIGVhcmxpZXIuDQo+DQo+IEluIG9yZGVyIG5v
dCB0byByZWltcGxlbWVudCBwb3B1bGF0ZV9leHRyYV9wdGUoKSB1c2luZyBleHRlbmRfYnJrKCkN
Cj4gZm9yIGFsbG9jYXRpbmcgbmV3IHBhZ2UgdGFibGVzIGV4dGVuZCBhbGxvY19sb3dfcGFnZXMo
KSB0byBkbyB0aGF0IGluDQo+IGNhc2UgdGhlIGVhcmx5IHBhZ2UgdGFibGUgcG9vbCBpcyBub3Qg
eWV0IGF2YWlsYWJsZS4NCj4NCj4gRml4ZXM6IDdiMjViOWNiMGRhZDgzDQoNCkZpeGVzOiA3YjI1
YjljYjBkYWQgKCJ4ODYveGVuL3RpbWU6IEluaXRpYWxpemUgcHYgeGVuIHRpbWUgaW4NCmluaXRf
aHlwZXJ2aXNvcl9wbGF0Zm9ybSgpIikNCg0KUmV2aWV3ZWQtYnk6IFBhdmVsIFRhdGFzaGluIDxw
YXZlbC50YXRhc2hpbkBtaWNyb3NvZnQuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
