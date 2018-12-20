From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
Date: Thu, 20 Dec 2018 14:37:24 +0000
Message-ID: <922521be-ee79-e4da-6209-811788103f4d@bitdefender.com>
References: <20181123085402.663pdh75rhqtxsf4@mac>
 <67fa7dc6-3aff-a5fd-4105-dce19a89448c@bitdefender.com>
 <20181127113205.ohli6saatlwid7ua@mac>
 <516bea73-f88a-9f96-9619-fa32f9726dca@bitdefender.com>
 <20181219174003.prbkwhmkmga7cx45@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7Eoj=O5=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1gZzS4-00030r-0s
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 14:37:28 +0000
In-Reply-To: <20181219174003.prbkwhmkmga7cx45@mac.citrite.net>
Content-Language: en-US
Content-ID: <18FE7021A224714BA448306E6920746E@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, =?utf-8?B?TWloYWkgRG9uyJt1?= <mdontu@bitdefender.com>, Andrei Vlad LUTAS <vlutas@bitdefender.com>, "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDE5LjEyLjIwMTggMTk6NDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdl
ZCwgRGVjIDE5LCAyMDE4IGF0IDA0OjQ5OjQzUE0gKzAwMDAsIEFsZXhhbmRydSBTdGVmYW4gSVNB
SUxBIHdyb3RlOg0KPj4gT24gMjcuMTEuMjAxOCAxMzozMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBhZGQgc29tZSBraW5kIG9mIGZsYWcgdG8g
dGhlIGVtdWxhdG9yIHRvDQo+Pj4gc2lnbmFsIHdoZXRoZXIgcDJtIHJlc3RyaWN0aW9ucyBzaG91
bGQgYmUgZW5mb3JjZWQvaWdub3JlZD8NCj4+PiBodm1lbXVsX2FjcXVpcmVfcGFnZSBzZWVtcyBs
aWtlIGEgc3VpdGFibGUgcGxhY2UsIGJ1dCBJJ20gbm90IHRoYXQNCj4+PiBmYW1pbGlhciB3aXRo
IHRoZSBlbXVsYXRvci4NCj4+Pg0KPj4+IFRoZW4geW91IGNvdWxkIGdlbmVyYXRlIHZtIGV2ZW50
cyBmcm9tIHRoZSBlbXVsYXRvciBpdHNlbGYsIHdoaWNoDQo+Pj4gQUZBSUNUIGlzIHRoZSBvbmx5
IHdheSB0byBoYW5kbGUgdGhpcyBpbnN0cnVjdGlvbiBleGVjdXRpb24gaXNzdWUuDQo+Pg0KPj4g
SSd2ZSBiZWVuIHRlc3Rpbmcgd2hhdCBwbGFjZSB3b3VsZCBiZSB0aGUgYmVzdCB0byBoYXZlIHRo
ZSBlbXVsYXRvciBzZW5kDQo+PiBhIGV2ZW50IGFuZCBpdCB0dXJucyBvdXQgdGhlIGh2bWVtdWxf
YWNxdWlyZV9wYWdlIGlzIG5vdCBvay4gV2hhdCB3b3JrZWQNCj4+IGZvcm0gbWUgd2FzIGhhdmlu
ZyB0aGUgZW11bGF0b3Igc2VuZCB3cml0ZSBhY2Nlc3MgdmlvbGF0aW9ucyBmcm9tDQo+PiBodm1l
bXVsX21hcF9saW5lYXJfYWRkcigpLiBIZXJlIEkgY2FuIGdldCB0aGUgZ2ZuLCBnbGEgYW5kIG9m
ZnNldCBmb3INCj4+IHRoZSBldmVudC4NCj4+DQo+PiBGb3IgdGhlIGV4ZWMgYWNjZXNzIHZpb2xh
dGlvbiBJJ3ZlIHRyaWVkIHRvIHNlbmQgZXZlbnRzIGZyb20NCj4+IGh2bWVtdWxfaW5zbl9mZXRj
aCgpIGJ1dCB0aGVyZSBpcyBhIHByb2JsZW0gdG8gZ2V0IHRoZSBzYW1lIHZhcmlhYmxlcw0KPj4g
Zm9yIHRoZSBldmVudC4gSXMgdGhlcmUgYSB3YXkgdG8gZ28gYXJvdW5kIGFuZCBnZXQgdGhvc2Ug
cGFyYW1zIGZvciB0aGUNCj4+IGV2ZW50PyBBbnkgdGhvdWdodHMgYXJlIGFwcHJlY2lhdGVkLg0K
PiANCj4gWW91IGhhdmUgdGhlIElQIGluIGh2bWVtdWxfaW5zbl9mZXRjaCwgY2FuJ3QgeW91IGdl
dCB0aGUgZ2ZuIGZyb20NCj4gdGhlcmU/IEVpdGhlciBkaXJlY3RseSBvciBieSB0cmFuc2xhdGlu
ZyB0aGUgZ2xhIHRvIGEgZ2ZuIGlmIHRoZSBndWVzdA0KPiBpcyBydW5uaW5nIHdpdGggcGFnaW5n
IGVuYWJsZWQ/DQo+IA0KSSd2ZSBtYW5hZ2VkIHRvIHNvbHZlIHRoZSBpc3N1ZSB3aXRoIGh2bWVt
dWxfbGluZWFyX3RvX3BoeXMoKSBmb3IgZ3BhDQphbmQgaHZtZW11bF92aXJ0dWFsX3RvX2xpbmVh
cigpIGZvciBnbGEuIEkgd2lsbCBwb3N0IHRoZSBwYXRjaCBpbiBhIHJmYyANCmFmdGVyIEkgd2ls
bCB0ZXN0IGlmIGV2ZXJ5dGhpbmcgaW4gb2suDQoNClRoYW5rcywNCkFsZXgNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
