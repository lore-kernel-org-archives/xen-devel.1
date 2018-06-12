From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 5/9] x86/vmx: Improvements to LBR MSR
 handling
Date: Tue, 12 Jun 2018 02:58:43 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191204919@SHSMSX101.ccr.corp.intel.com>
References: <1528483723-4128-1-git-send-email-andrew.cooper3@citrix.com>
 <1528483723-4128-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528483723-4128-6-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogU2F0dXJkYXksIEp1bmUgOSwgMjAxOCAyOjQ5IEFNDQo+IA0KPiBUaGUgbWFpbiBw
dXJwb3NlIG9mIHRoaXMgcGF0Y2ggaXMgdG8gb25seSBldmVyIGluc2VydCB0aGUgTEJSIE1TUnMg
aW50byB0aGUNCj4gZ3Vlc3QgbG9hZC9zYXZlIGxpc3Qgb25jZSwgYXMgYSBmdXR1cmUgcGF0Y2gg
d2FudHMgdG8gY2hhbmdlIHRoZSBiZWhhdmlvdXINCj4gb2YNCj4gdm14X2FkZF9ndWVzdF9tc3Io
KS4NCj4gDQo+IFRoZSByZXBlYXRlZCBwcm9jZXNzaW5nIG9mIGxicl9pbmZvIGFuZCB0aGUgZ3Vl
c3RzIE1TUiBsb2FkL3NhdmUgbGlzdCBpcw0KPiByZWR1bmRhbnQsIGFuZCBhIGd1ZXN0IHVzaW5n
IExCUiBpdHNlbGYgd2lsbCBoYXZlIHRvIHJlLWVuYWJsZQ0KPiBNU1JfREVCVUdDVEwuTEJSIGlu
IGl0cyAjREIgaGFuZGxlciwgbWVhbmluZyB0aGF0IFhlbiB3aWxsIHJlcGVhdCB0aGlzDQo+IHJl
ZHVuZGFudCBwcm9jZXNzaW5nIGV2ZXJ5IHRpbWUgdGhlIGd1ZXN0IGdldHMgYSBkZWJ1ZyBleGNl
cHRpb24uDQo+IA0KPiBSZW5hbWUgbGJyX2ZpeHVwX2VuYWJsZWQgdG8gbGJyX2ZsYWdzIHRvIGJl
IGEgbGl0dGxlIG1vcmUgZ2VuZXJpYywgYW5kIHVzZQ0KPiBvbmUNCj4gYml0IHRvIGluZGljYXRl
IHRoYXQgdGhlIE1TUnMgaGF2ZSBiZWVuIGluc2VydGVkIGludG8gdGhlIGxvYWQvc2F2ZSBsaXN0
Lg0KPiBTaG9ydGVuIHRoZSBleGlzdGluZyBGSVhVUCogaWRlbnRpZmllcnMgdG8gcmVkdWNlIGNv
ZGUgdm9sdW1lLg0KPiANCj4gRmluYWxseSwgdGhlIGVuYWJsZW1lbnQgb2YgdGhlIGZpeHVwcyBv
bmx5IG5lZWQgdG8gYmUgY2FsY3VsYXRlZCBvbmNlLA0KPiByYXRoZXINCj4gdGhhbiBpbnNpZGUg
YSBkb3VibHkgbmVzdGVkIGxvb3AuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpBY2tlZC1ieTogS2V2aW4gVGlhbiA8a2V2
aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
