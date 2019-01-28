From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 4/6] x86: stop handling MSR_IA32_XSS
 save/restore in implementation code
Date: Mon, 28 Jan 2019 02:37:03 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C915039@SHSMSX104.ccr.corp.intel.com>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eaaH=QE=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gnwnM-0002SF-NR
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 02:37:08 +0000
In-Reply-To: <20190107120258.17897-5-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4LmNvbV0NCj4g
U2VudDogTW9uZGF5LCBKYW51YXJ5IDcsIDIwMTkgODowMyBQTQ0KPiANCj4gU2F2aW5nIGFuZCBy
ZXN0b3JpbmcgdGhlIHZhbHVlIG9mIHRoaXMgTVNSIGlzIGN1cnJlbnRseSBoYW5kbGVkIGJ5DQo+
IGltcGxlbWVudGF0aW9uLXNwZWNpZmljIGNvZGUgZGVzcGl0ZSBpdCBiZWluZyBhcmNoaXRlY3R1
cmFsLiBUaGlzIHBhdGNoDQo+IG1vdmVzIGhhbmRsaW5nIG9mIGFjY2Vzc2VzIHRvIHRoaXMgTVNS
IGZyb20gaHZtLmMgaW50byB0aGUgbXNyLmMsIHRodXMNCj4gYWxsb3dpbmcgdGhlIGNvbW1vbiBN
U1Igc2F2ZS9yZXN0b3JlIGNvZGUgdG8gaGFuZGxlIGl0Lg0KPiANCj4gVGhpcyBwYXRjaCBhbHNv
IGFkZHMgcHJvcGVyIGNoZWNrcyBvZiBDUFVJRCBwb2xpY3kgaW4gdGhlIG5ldyBnZXQvc2V0IGNv
ZGUuDQo+IA0KPiBOT1RFOiBNU1JfSUEzMl9YU1MgaXMgdGhlIGxhc3QgTVNSIHRvIGJlIHNhdmVk
IGFuZCByZXN0b3JlZCBieQ0KPiAgICAgICBpbXBsZW1lbnRhdGlvbi1zcGVjaWZpYyBjb2RlLiBU
aGlzIHBhdGNoIHRoZXJlZm9yZSByZW1vdmVzIHRoZQ0KPiAgICAgICAoVk1YKSBkZWZpbml0aW9u
cyBhbmQgb2YgdGhlIGluaXRfbXNyKCksIHNhdmVfbXNyKCkgYW5kDQo+ICAgICAgIGxvYWRfbXNy
KCkgaHZtX2Z1bmNzLCBhcyB0aGV5IGFyZSBubyBsb25nZXIgbmVjZXNzYXJ5LiBUaGUNCj4gICAg
ICAgZGVjbGFyYXRpb25zIG9mIGFuZCBjYWxscyB0byB0aG9zZSBodm1fZnVuY3Mgd2lsbCBiZSBj
bGVhbmVkIHVwDQo+ICAgICAgIGJ5IGEgc3Vic2VxdWVudCBwYXRjaC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+DQoNClJldmlld2Vk
LWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
