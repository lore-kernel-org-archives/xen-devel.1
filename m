From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [RFC PATCH 2/2] x86/mm: Add mem access rights to NPT
Date: Wed, 9 Jan 2019 09:30:59 +0000
Message-ID: <821c3f9e-698d-7247-a095-6572e73d36d1@bitdefender.com>
References: <20180926164741.13405-1-george.dunlap@citrix.com>
 <20180926164741.13405-2-george.dunlap@citrix.com>
 <6c2e77c5-fe94-3644-8b33-ac8785e4d065@citrix.com>
 <0f46782a-66f5-f2c6-4ed1-3e4dc4c7e6a7@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E6za=PR=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ghACY-0006pt-1Z
 for xen-devel@lists.xenproject.org; Wed, 09 Jan 2019 09:31:06 +0000
In-Reply-To: <0f46782a-66f5-f2c6-4ed1-3e4dc4c7e6a7@citrix.com>
Content-Language: en-US
Content-ID: <13ED044F1A8CE24A9F9A58B08D59FEEE@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Tamas K Lengyel <tamas.lengyel@zentific.com>, Paul Durrant <paul.durrant@citrix.com>, Tim Deegan <tim@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

UGluZw0KDQpTdXJhdmVlIC8gQnJpYW4gLyBCb3JpcyBhbnkgaWRlYXMgb24gdGhpcyB0b3BpYyBh
cmUgYXBwcmVjaWF0ZWQuDQoNClJlZ2FyZHMsDQpBbGV4DQoNCk9uIDI3LjA5LjIwMTggMTM6Mzcs
IEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIDA5LzI2LzIwMTggMDY6MjIgUE0sIEFuZHJldyBD
b29wZXIgd3JvdGU6DQo+PiBPbiAyNi8wOS8xOCAxNzo0NywgR2VvcmdlIER1bmxhcCB3cm90ZToN
Cj4+PiBGcm9tOiBJc2FpbGEgQWxleGFuZHJ1IDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4NCj4+
Pg0KPj4+IFRoaXMgcGF0Y2ggYWRkcyBhY2Nlc3MgY29udHJvbCBmb3IgTlBUIG1vZGUuDQo+Pj4N
Cj4+PiBUaGVyZSBhcmVu4oCZdCBlbm91Z2ggZXh0cmEgYml0cyB0byBzdG9yZSB0aGUgYWNjZXNz
IHJpZ2h0cyBpbiB0aGUgTlBUIHAybQ0KPj4+IHRhYmxlLCBzbyB3ZSBhZGQgYSByYWRpeCB0cmVl
IHRvIHN0b3JlIGV4dHJhIGluZm9ybWF0aW9uLg0KPj4NCj4+IEknbSBzb3JyeSB0byByZS1vcGVu
IHRoaXMgYXJndW1lbnQsIGJ1dCB3aHk/DQo+Pg0KPj4gSVNUUiB0aGVyZSBiZWluZyBzb21lIGFy
Z3VtZW50IGJhc2VkIG9uIHBhZ2V0YWJsZSBzaGFyaW5nIHdpdGggdGhlDQo+PiBJT01NVSwgYnV0
IHRoYXQgZG9lc24ndCB3b3JrIGF0IHRoZSBtb21lbnQgYW5kIGNhbid0IHJlYXNvbmFibHkgYmUg
bWFkZQ0KPj4gdG8gd29yay7CoCBGb3Igb25lLCBhdHRlbXB0aW5nIHRvIHVzZSBwdCBzaGFyaW5n
IHdpbGwgYnJlYWsgYXMgc29vbiBhcw0KPj4geW91IHRyeSBhbmQgRE1BIHRvIGEgbWFwcGVkIGdy
YW50Lg0KPj4NCj4+IEknbSBkaXNpbmNsaW5lZCB0byBsZXQgYSBicm9rZW4gdmVzdGlnaWFsIGZl
YXR1cmUgZ2V0IGluIHRoZSB3YXkgb2YgcmVhbA0KPj4gaW1wcm92ZW1lbnRzLg0KPj4NCj4+IEJl
eW9uZCB0aGF0LCBhbiBOUFQgUFRFIGhhcyBiYXNpY2FsbHkgdGhlIHNhbWUgbnVtYmVyIG9mIHNv
ZnR3YXJlDQo+PiBhdmFpbGFibGUgYml0cyBhcyBhbiBFUFQgUFRFLg0KPj4NCj4+IEFtIEkgbWlz
c2luZyBhbnl0aGluZz8NCj4gDQo+IFdvdyAtLSBsb29rcyBsaWtlIElPTU1VL3AybSBzaGFyaW5n
IGhhcyBiZWVuIGRpc2FibGVkIHVuY29uZGl0aW9uYWxseQ0KPiBzaW5jZSAyMDE0LiAgSWYgbm9i
b2R5IGhhcyBjb21wbGFpbmVkIHNpbmNlIHRoZW4sIHRoYXQgc2VlbXMgbGlrZSBhIGdvb2QNCj4g
ZW5vdWdoIHJlYXNvbiB0byBtZSB0byByaXAgaXQgb3V0Lg0KPiANCj4gU3VyYXZlZSAvIEJyaWFu
IC8gQm9yaXMgLS0gYW55IG9waW5pb25zPw0KPiANCj4gVGhlIG1haW4gcmVhc29uIHRvIGdvIHdp
dGggdGhlICdleHRyYSBiaXRzJyBzb2x1dGlvbiByYXRoZXIgdGhhbiB0aGUNCj4gJ3JpcCBvdXQg
aW9tbXUvcDJtIHNoYXJpbmcnIHNvbHV0aW9uIGlzIGJlY2F1c2UgcGVvcGxlIGhhdmUgYmVlbg0K
PiBwcm9nbm9zdGljYXRpbmcgZm9yIHllYXJzIHRoYXQgd2Ugd291bGQgYmUgcnVubmluZyBvdXQg
b2YgYml0cyBhbmQgbmVlZA0KPiBtb3JlIGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVyZS4gIEkg
dGhvdWdodCBQYXVsLCBmb3IgaW5zdGFuY2UsIG1pZ2h0DQo+IGhhdmUgYSB1c2UgZm9yIHRoZSBl
eHRyYSBiaXRzLiAgQnV0IEknbSBoYXBweSB0byB3YWl0IHVudGlsIHN1Y2ggdGltZSBhcw0KPiB3
ZSBuZWVkIGl0IGFuZCB0aGVuIGZpc2ggdGhpcyBwYXRjaCBvdXQgb2YgdGhlIG1haWwgYXJjaGl2
ZXMuDQo+IA0KPiAgIC1HZW9yZ2UNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
