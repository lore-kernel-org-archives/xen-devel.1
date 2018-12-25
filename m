From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH V12 3/5] x86/altp2m: fix display frozen when
 switching to a new view early
Date: Tue, 25 Dec 2018 02:30:47 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BEBE83C@SHSMSX101.ccr.corp.intel.com>
References: <1545327518-5731-1-git-send-email-rcojocaru@bitdefender.com>
 <1545327518-5731-4-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f35z=PC=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gbcUg-0002DW-Ho
 for xen-devel@lists.xenproject.org; Tue, 25 Dec 2018 02:30:54 +0000
In-Reply-To: <1545327518-5731-4-git-send-email-rcojocaru@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBSYXp2YW4gQ29qb2NhcnUgW21haWx0bzpyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
XQ0KPiBTZW50OiBGcmlkYXksIERlY2VtYmVyIDIxLCAyMDE4IDE6MzkgQU0NCj4gDQo+IFdoZW4g
YW4gbmV3IGFsdHAybSB2aWV3IGlzIGNyZWF0ZWQgdmVyeSBlYXJseSBvbiBndWVzdCBib290LCB0
aGUNCj4gZGlzcGxheSB3aWxsIGZyZWV6ZSAoYWx0aG91Z2ggdGhlIGd1ZXN0IHdpbGwgcnVuIG5v
cm1hbGx5KS4gVGhpcw0KPiBtYXkgYWxzbyBoYXBwZW4gb24gcmVzaXppbmcgdGhlIGRpc3BsYXku
IFRoZSByZWFzb24gaXMgdGhlIHdheQ0KPiBYZW4gY3VycmVudGx5IChtaXMpaGFuZGxlcyBsb2dk
aXJ0eSBWR0E6IGl0IGludGVudGlvbmFsbHkNCj4gbWlzY29uZmlndXJlcyBWR0EgcGFnZXMgc28g
dGhhdCB0aGV5IHdpbGwgZmF1bHQuDQo+IA0KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IGl0IG9ubHkg
ZG9lcyB0aGlzIGluIHRoZSBob3N0IHAybS4gT25jZSB3ZQ0KPiBzd2l0Y2ggdG8gYSBuZXcgYWx0
cDJtLCB0aGUgbWlzY29uZmlndXJlZCBlbnRyaWVzIHdpbGwgbm8gbG9uZ2VyDQo+IGZhdWx0LCBz
byB0aGUgZGlzcGxheSB3aWxsIG5vdCBiZSB1cGRhdGVkLg0KPiANCj4gVGhpcyBwYXRjaDoNCj4g
KiB1cGRhdGVzIGVwdF9oYW5kbGVfbWlzY29uZmlnKCkgdG8gdXNlIHRoZSBhY3RpdmUgYWx0cDJt
IGluc3RlYWQNCj4gICBvZiB0aGUgaG9zdHAybTsNCj4gKiBtb2RpZmllcyBwMm1fY2hhbmdlX2Vu
dHJ5X3R5cGVfZ2xvYmFsKCksDQo+ICAgcDJtX21lbW9yeV90eXBlX2NoYW5nZWQoKSwgcDJtX2No
YW5nZV90eXBlX3JhbmdlKCkgYW5kDQo+ICAgcDJtX2ZpbmlzaF90eXBlX2NoYW5nZSgpIHRvIHBy
b3BhZ2F0ZSB0aGVpciBjaGFuZ2VzIHRvIGFsbA0KPiAgIHZhbGlkIGFsdHAybXMuDQo+IA0KPiBX
aXRoIHRoZSBpbnRyb2R1Y3Rpb24gb2YgYWx0cDJtIGZpZWxkcyBpbiBwMm1fbWVtb3J5X3R5cGVf
Y2hhbmdlZCgpDQo+IHRoZSB3aG9sZSBmdW5jdGlvbiBoYXMgYmVlbiBwdXQgdW5kZXIgQ09ORklH
X0hWTS4NCj4gDQo+IFN1Z2dlc3RlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBj
aXRyaXguY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBi
aXRkZWZlbmRlci5jb20+DQo+IFRlc3RlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPg0KPiBBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
