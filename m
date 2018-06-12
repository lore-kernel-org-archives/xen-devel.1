From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 6/9] x86/vmx: Pass an MSR value into
 vmx_msr_add()
Date: Tue, 12 Jun 2018 03:11:55 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191204955@SHSMSX101.ccr.corp.intel.com>
References: <1528483723-4128-1-git-send-email-andrew.cooper3@citrix.com>
 <1528483723-4128-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528483723-4128-7-git-send-email-andrew.cooper3@citrix.com>
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
dXJwb3NlIG9mIHRoaXMgY2hhbmdlIGlzIHRvIGFsbG93IHVzIHRvIHNldCBhIHNwZWNpZmljIE1T
UiB2YWx1ZSwNCj4gd2l0aG91dCBuZWVkaW5nIHRvIGtub3cgd2hldGhlciB0aGVyZSBpcyBhbHJl
YWR5IGEgbG9hZC9zYXZlIGxpc3Qgc2xvdCBmb3IgaXQuDQo+IA0KPiBQcmV2aW91c2x5LCBjYWxs
ZXJzIHdhbnRpbmcgdGhpcyBwcm9wZXJ0eSBuZWVkZWQgdG8gY2FsbCBib3RoDQo+IHZteF9hZGRf
Kl9tc3IoKQ0KPiBhbmQgdm14X3dyaXRlXypfbXNyKCkgdG8gY292ZXIgYm90aCBjYXNlcywgYW5k
IHRoZXJlIGFyZSBubyBjYWxsZXJzIHdoaWNoDQo+IHdhbnQNCj4gdGhlIG9sZCBiZWhhdmlvdXIg
b2YgYmVpbmcgYSBuby1vcCBpZiBhbiBlbnRyeSBhbHJlYWR5IGV4aXN0ZWQgZm9yIHRoZSBNU1Iu
DQo+IA0KPiBBcyBhIHJlc3VsdCBvZiB0aGlzIEFQSSBpbXByb3ZlbWVudCwgdGhlIGRlZmF1bHQg
dmFsdWUgZm9yIGd1ZXN0IE1TUnMgbmVlZA0KPiBub3QNCj4gYmUgMCwgYW5kIHRoZSBkZWZhdWx0
IGZvciBob3N0IE1TUnMgbmVlZCBub3QgYmUgcGFzc2VkIHZpYSBoYXJkd2FyZQ0KPiByZWdpc3Rl
ci4NCj4gSW4gcHJhY3RpY2UsIHRoaXMgY2xlYW5zIHVwIHRoZSBWUE1VIGFsbG9jYXRpb24gbG9n
aWMsIGFuZCBhdm9pZHMgYW4gTVNSDQo+IHJlYWQNCj4gYXMgcGFydCBvZiB2Y3B1IGNvbnN0cnVj
dGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
