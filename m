From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 2/6] x86/hvm: Handle viridian MSRs via the
 new guest_{rd, wr}msr() infrastructure
Date: Tue, 27 Feb 2018 01:27:17 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19101BF73@SHSMSX101.ccr.corp.intel.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519666519-16311-3-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMjcsIDIwMTggMTozNSBBTQ0KPiANCj4gRGlzcGF0
Y2ggZnJvbSB0aGUgZ3Vlc3Rfe3JkLHdyfW1zcigpIGZ1bmN0aW9ucywgYWZ0ZXIgY29uZmlybWlu
ZyB0aGF0IHRoZQ0KPiBkb21haW4gaXMgY29uZmlndXJlZCB0byB1c2UgdmlyaWRpYW4uICBUaGlz
IGFsbG93cyBmb3Igc2ltcGxpZmljdGlvbiBvZiB0aGUNCj4gdmlyaWRpYW4gaGVscGVycyBhcyB0
aGV5IGRvbid0IG5lZWQgdG8gY29wZSB3aXRoIHRoZSAibm90IGEgdmlyaWRpYW4gTVNSIg0KPiBj
YXNlLiAgSXQgYWxzbyBtZWFucyB0aGF0IHZpcmlkaWFuIE1TUnMgd2hpY2ggYXJlIHVuaW1wbGVt
ZW50ZWQsIG9yDQo+IGV4Y2x1ZGVkDQo+IGJlY2F1c2Ugb2YgZmVhdHVyZXMsIGRvbid0IGZhbGwg
YmFjayBpbnRvIGRlZmF1bHQgaGFuZGxpbmcgcGF0aC4NCj4gDQo+IFJlbmFtZSB7cmQsd3J9bXNy
X3ZpcmlkaWFuX3JlZ3MoKSB0byBndWVzdF97cmQsd3J9bXNyX3ZpcmlkaWFuKCkgZm9yDQo+IGNv
bnNpc3RlbmN5LCBhbmQgYmVjYXVzZSB0aGUgX3JlZ3Mgc3VmZml4IGlzbid0IHZlcnkgYXBwcm9w
cmlhdGUuDQo+IA0KPiBVcGRhdGUgdGhlbSB0byB0YWtlIGEgdmNwdSBwb2ludGVyIHJhdGhlciB0
aGFuIHByZXN1bWluZyB0aGF0IHRoZXkgYWN0IG9uDQo+IGN1cnJlbnQsIHdoaWNoIGlzIHNhZmUg
Zm9yIGFsbCBpbXBsZW1lbnRlZCBvcGVyYXRpb25zLiAgQWxzbyB1cGRhdGUgdGhlbSB0bw0KPiB1
c2UgWDg2RU1VTF8qIHJldHVybiB2YWx1ZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4g
VGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
