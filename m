From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: re-work viridian APIC assist
 code
Date: Wed, 5 Sep 2018 10:48:14 +0000
Message-ID: <087206f74c8044da8bed3dd1101243fe@AMSPEX02CL03.citrite.net>
References: <20180118151059.1336-1-paul.durrant@citrix.com>
 <1535153880.24926.28.camel@infradead.org>
 <c724b17a001041a7a755ec6c7d654ca7@AMSPEX02CL03.citrite.net>
 <1536093061.31549.47.camel@infradead.org>
 <88abe6b0dee947ad93af543653dde12a@AMSPEX02CL03.citrite.net>
 <1536140422.31549.59.camel@infradead.org>
 <2135f2c459ee45e2a038a9fbc9145392@AMSPEX02CL03.citrite.net>
 <c8285b35d7454faeb8bae5d558807522@AMSPEX02CL03.citrite.net>
 <1536144300.31549.63.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qsy=lt=citrix.com=prvs=779ddce85=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fxVM9-0007Fi-94
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 10:48:17 +0000
In-Reply-To: <1536144300.31549.63.camel@infradead.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'David Woodhouse' <dwmw2@infradead.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Eslam Elnikety <elnikety@amazon.de>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Shan Haitao <haitao.shan@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYXZpZCBXb29kaG91c2UgW21h
aWx0bzpkd213MkBpbmZyYWRlYWQub3JnXQ0KPiBTZW50OiAwNSBTZXB0ZW1iZXIgMjAxOCAxMTo0
NQ0KPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogRXNsYW0gRWxuaWtldHkgPGVsbmlrZXR5QGFt
YXpvbi5kZT47IEFuZHJldyBDb29wZXINCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBT
aGFuIEhhaXRhbyA8aGFpdGFvLnNoYW5AaW50ZWwuY29tPjsgSmFuDQo+IEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYyXSB4ODYv
aHZtOiByZS13b3JrIHZpcmlkaWFuIEFQSUMgYXNzaXN0DQo+IGNvZGUNCj4gDQo+IE9uIFdlZCwg
MjAxOC0wOS0wNSBhdCAxMDo0MCArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+DQo+ID4g
QWN0dWFsbHkgdGhlIG5lYXRlc3QgYXBwcm9hY2ggd291bGQgYmUgdG8gZ2V0IGluZm9ybWF0aW9u
IGludG8gdGhlDQo+ID4gdmxhcGljIGNvZGUgYXMgdG8gd2hldGhlciBBUElDIGFzc2lzdCBpcyBz
dWl0YWJsZSBmb3IgdGhlIGdpdmVuDQo+ID4gdmVjdG9yIHNvIHRoYXQgdGhlIGNvZGUgdGhlcmUg
Y2FuIHNlbGVjdGl2ZWx5IGVuYWJsZSBpdCwgYW5kIHRoZW4gWGVuDQo+ID4gd291bGQga25vdyBp
dCB3YXMgc2FmZSB0byBhdm9pZCBmdWxseSBlbXVsYXRpbmcgYW4gRU9JIGZvciBhbnl0aGluZw0K
PiA+IHRoYXQgZGlkIGhhdmUgYXNzaXN0IGVuYWJsZWQuDQo+IA0KPiBJJ20gbm90IHN1cmUgSSB1
bmRlcnN0YW5kIHdoeSBhbiBhc3Npc3RlZCBFT0kgc2hvdWxkIGJlIGFueSBkaWZmZXJlbnQNCj4g
ZnJvbSAibm9ybWFsIiBFT0kuDQo+IA0KPiBUaGUgZ2xvYmFsIGxvY2sgYW5kIGluZGlyZWN0IGZ1
bmN0aW9uIGNhbGxzIGFuZCBhbGwgdGhhdCBzdHVmZiB0aGF0DQo+IGh2bV9kcGNpX21zaV9lb2ko
KSBkb2VzIGFyZSAqZXhwZW5zaXZlKiwgZm9yIGEgcmFyZSBjYXNlLg0KPiANCj4gV2h5IG5vdCBi
eXBhc3MgYWxsIHRoYXQgd2hlbiBpdCdzIG5vdCBuZWVkZWQsIGZvciAibm9ybWFsIiBFT0kgYW5k
DQo+IEFQSUMtYXNzaXN0ZWQgRU9JIGFsaWtlPyBXaHkgaGF2ZSBhIGRpc3RpbmN0aW9uIGJldHdl
ZW4gdGhlIHR3bz8NCg0KVHJ1ZS4gSSBndWVzcyB0aGF0J3MgbW9yZSBnbG9iYWxseSBhcHBsaWNh
YmxlLi4uIGkuZS4gaXQgd291bGQgaGVscCBndWVzdHMgbm90IGF3YXJlIG9mIHRoZSBlbmxpZ2h0
ZW5tZW50LCBvciB0aG9zZSB3aXRoIGl0IGRpc2FibGVkLg0KDQogIFBhdWwNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
