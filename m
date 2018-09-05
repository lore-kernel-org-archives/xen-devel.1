From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: re-work viridian APIC assist
 code
Date: Wed, 5 Sep 2018 09:43:22 +0000
Message-ID: <2135f2c459ee45e2a038a9fbc9145392@AMSPEX02CL03.citrite.net>
References: <20180118151059.1336-1-paul.durrant@citrix.com>
 <1535153880.24926.28.camel@infradead.org>
 <c724b17a001041a7a755ec6c7d654ca7@AMSPEX02CL03.citrite.net>
 <1536093061.31549.47.camel@infradead.org>
 <88abe6b0dee947ad93af543653dde12a@AMSPEX02CL03.citrite.net>
 <1536140422.31549.59.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7qsy=lt=citrix.com=prvs=779ddce85=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fxUME-0001jr-Ew
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 09:44:18 +0000
In-Reply-To: <1536140422.31549.59.camel@infradead.org>
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
aWx0bzpkd213MkBpbmZyYWRlYWQub3JnXQ0KPiBTZW50OiAwNSBTZXB0ZW1iZXIgMjAxOCAxMDo0
MA0KPiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3Bl
cjNAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoDQo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEVzbGFt
IEVsbmlrZXR5IDxlbG5pa2V0eUBhbWF6b24uZGU+OyBTaGFuIEhhaXRhbw0KPiA8aGFpdGFvLnNo
YW5AaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYyXSB4ODYv
aHZtOiByZS13b3JrIHZpcmlkaWFuIEFQSUMgYXNzaXN0DQo+IGNvZGUNCj4gDQo+IE9uIFdlZCwg
MjAxOC0wOS0wNSBhdCAwOTozNiArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+DQo+ID4g
SSBzZWUuIEdpdmVuIHRoYXQgV2luZG93cyBoYXMgdXNlZCBBUElDIGFzc2lzdCB0byBjaXJjdW12
ZW50IGl0cyBFT0kNCj4gPiB0aGVuIEkgd29uZGVyIHdoZXRoZXIgd2UgY2FuIGdldCBhd2F5IHdp
dGggZXNzZW50aWFsbHkgZG9pbmcgdGhlDQo+ID4gc2FtZS4gSS5lLiBmb3IgYSBjb21wbGV0ZWQg
QVBJQyBhc3Npc3QgZm91bmQgaW4NCj4gPiB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKCkgd2Ugc2lt
cGx5IGNsZWFyIHRoZSBBUElDIGFzc2lzdCBhbmQgaGlnaGVzdA0KPiA+IHZlY3RvciBpbiB0aGUg
SVNSLCByYXRoZXIgdGhhbiBjYWxsaW5nIHRocm91Z2ggdG8gdmxhcGljX0VPSV9zZXQoKQ0KPiA+
IGFuZCBzdWZmZXJpbmcgdGhlIG92ZXJoZWFkLiBJJ2xsIHNwaW4gdXAgYSBwYXRjaCBhbmQgZ2l2
ZSBpdCBhIHdoaXJsLg0KPiANCj4gSSB0aGluayB0aGF0J3MgZmluZSBpZiB5b3UgZG9uJ3QgYWN0
dWFsbHkgcGFzcyB1bm1hc2thYmxlIE1TSXMgdGhyb3VnaA0KPiB0byB0aGUgZ3Vlc3QgaW4gcXVl
c3Rpb24sIGJ1dCBpZiB5b3UgKmRvKiB0aGVuIHlvdSBzdGlsbCBuZWVkIHRoZSBFT0kNCj4gdG8g
aGFwcGVuIHByb3Blcmx5IHRvICJ1bm1hc2siIGl0Lg0KPiANCj4gSGVuY2UgbXkgYXBwcm9hY2gg
d2hpY2ggaXMgYmFzaWNhbGx5IGRvaW5nIHdoYXQgeW91IHNhaWQgYW5kIGJ5cGFzc2luZw0KPiB0
aGUgZXhwZW5zaXZlIHBhcnQgb2YgaHZtX2RwY2lfbXNpX2VvaSgpLCBidXQgKm9ubHkqIGlmIHRo
ZXJlJ3Mgbm8NCj4gdW5tYXNrYWJsZSBNU0kgdG8gd29ycnkgYWJvdXQuDQoNClllYWgsIEknbSBr
aW5kIG9mIHRydXN0aW5nIFdpbmRvd3MgdG8gb25seSB1c2UgQVBJQyBhc3Npc3QgaW4gdGhlIGNh
c2Ugd2hlcmUgaXQgaXMgc3VyZSB0aGVyZSBpcyBubyBuZWVkIHRvIEVPSS4gUGVyaGFwcyB5b3Vy
IGFwcHJvYWNoIGlzIHNhZmVyLg0KDQogIFBhdWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
