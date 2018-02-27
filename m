From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [ping] Re: [PATCH 2/5] x86/pv: Avoid leaking other
 guests' MSR_TSC_AUX values into PV context
Date: Tue, 27 Feb 2018 05:38:36 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19101C68B@SHSMSX101.ccr.corp.intel.com>
References: <1519127923-23539-1-git-send-email-andrew.cooper3@citrix.com>
 <1519127923-23539-3-git-send-email-andrew.cooper3@citrix.com>
 <5A93FCC002000078001ABB41@prv-mh.provo.novell.com>
 <4b4acfe6-23c3-8a05-cdce-16252fec6f7e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <4b4acfe6-23c3-8a05-cdce-16252fec6f7e@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMjcsIDIwMTggMzoxMSBBTQ0KPiANCj4gT24gMjYv
MDIvMTggMTE6MjUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+Pj4+IE9uIDIwLjAyLjE4IGF0IDEy
OjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+ID4+IElmIHRoZSBDUFUg
cGlwZWxpbmUgc3VwcG9ydHMgUkRUU0NQIG9yIFJEUElELCBhIGd1ZXN0IGNhbiBvYnNlcnZlIHRo
ZQ0KPiB2YWx1ZSBpbg0KPiA+PiBNU1JfVFNDX0FVWCwgaXJyZXNwZWN0aXZlIG9mIHdoZXRoZXIg
dGhlIHJlbGV2YW50IENQVUlEIGZlYXR1cmVzIGFyZQ0KPiA+PiBhZHZlcnRpc2VkL2hpZGRlbi4N
Cj4gPj4NCj4gPj4gQXQgdGhlIG1vbWVudCwgcGFyYXZpcnRfY3R4dF9zd2l0Y2hfdG8oKSBvbmx5
IHdyaXRlcyB0byBNU1JfVFNDX0FVWCBpZg0KPiA+PiBUU0NfTU9ERV9QVlJEVFNDUCBtb2RlIGlz
IGVuYWJsZWQsIGJ1dCB0aGlzIGlzIG5vdCB0aGUgZGVmYXVsdCBtb2RlLg0KPiA+PiBUaGVyZWZv
cmUsIGRlZmF1bHQgUFYgZ3Vlc3RzIGNhbiByZWFkIHRoZSB2YWx1ZSBmcm9tIGEgcHJldmlvdXNs
eQ0KPiBzY2hlZHVsZWQNCj4gPj4gSFZNIHZjcHUsIG9yIFRTQ19NT0RFX1BWUkRUU0NQLWVuYWJs
ZWQgUFYgZ3Vlc3QuDQo+ID4+DQo+ID4+IEFsdGVyIHRoZSBQViBwYXRoIHRvIGFsd2F5cyB3cml0
ZSB0byBNU1JfVFNDX0FVWCwgdXNpbmcgMCBpbiB0aGUNCj4gY29tbW9uDQo+ID4+IGNhc2UuDQo+
ID4+DQo+ID4+IFRvIGFtb3J0aXNlIG92ZXJoZWFkIGNvc3QsIGludHJvZHVjZSB3cm1zcl90c2Nf
YXV4KCkgd2hpY2ggcGVyZm9ybXMNCj4gYSBsYXp5DQo+ID4+IHVwZGF0ZSBvZiB0aGUgTVNSLCBh
bmQgdXNlIHRoaXMgZnVuY3Rpb24gY29uc2lzdGVudGx5IGFjcm9zcyB0aGUNCj4gY29kZWJhc2Uu
DQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQo+ID4gRGVzcGl0ZSBtZSBjb250aW51aW5nIHRvIHRoaW5rIHRoYXQgUkRU
U0NQIGFuZCBSRFBJRCBzaG91bGQgYmUNCj4gPiBmdWxseSBpbmRlcGVuZGVudCBmZWF0dXJlcywg
dGhpcyBiZWluZyBpbiBsaW5lIHdpdGggdGhlIFNETToNCj4gPiBBY2tlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCj4gVGhhbmtzLg0KPiANCj4gR2l2ZW4gdGhlIGlt
cG9ydGFudCBvZiB0aGlzIHBhdGNoLCBJIGZlZWwgaXQgaXMgdGltZSB0byBwaW5nIHRoZSBWVC14
DQo+IGFuZCBTVk0gbWFpbnRhaW5lcnMgZm9yIHRoZWlyIGlucHV0Lg0KPiANCj4gfkFuZHJldw0K
DQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
