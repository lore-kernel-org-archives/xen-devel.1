From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 3/5] x86: Fix APIC MSR constant names
Date: Thu, 8 Mar 2018 01:26:00 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19103015E@SHSMSX101.ccr.corp.intel.com>
References: <1520449116-15443-1-git-send-email-andrew.cooper3@citrix.com>
 <1520449116-15443-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1520449116-15443-4-git-send-email-andrew.cooper3@citrix.com>
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
Cj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDgsIDIwMTggMjo1OSBBTQ0KPiANCj4gV2UgY3VycmVu
dGx5IGhhdmUgTVNSX0lBMzJfQVBJQ0JBU0UgYW5kIE1TUl9JQTMyX0FQSUNCQVNFX01TUg0KPiB3
aGljaCBhcmUNCj4gc3lub255bW91cyBmcm9tIGEgbmFtaW5nIHBvaW50IG9mIHZpZXcsIGJ1dCBy
ZWZlciB0byB2ZXJ5IGRpZmZlcmVudCB0aGluZ3MuDQo+IA0KPiBSZW5hbWUgdGhlIHgyQVBJQyBN
U1JzIHRvIE1TUl9YMkFQSUNfKiwgd2hpY2ggYXJlIHNob3J0ZXIgY29uc3RhbnRzDQo+IGFuZA0K
PiB2aXN1YWxseSBzZXBhcmF0ZSB0aGUgcmVnaXN0ZXIgZnVuY3Rpb24gZnJvbSB0aGUgZ2VuZXJp
YyBBUElDIG5hbWUuICBGb3IgdGhlDQo+IGNhc2UgcmFuZ2VzLCBpbnRyb2R1Y2UgTVNSX1gyQVBJ
Q19MQVNULCByYXRoZXIgdGhhbiByZWx5aW5nIG9uIHRoZQ0KPiBrbm93bGVkZ2UNCj4gdGhhdCB0
aGVyZSBhcmUgMHgzZmYgTVNScyBhcmNoaXRlY3R1cmFsbHkgcmVzZXJ2ZWQgZm9yIHgyQVBJQyBm
dW5jdGlvbmFsaXR5Lg0KPiANCj4gRm9yIGZ1bmN0aW9uYWxpdHkgcmVsYXRpbmcgdG8gdGhlIEFQ
SUNfQkFTRSBNU1IsIHVzZSBNU1JfQVBJQ19CQVNFIGZvcg0KPiB0aGUgTVNSDQo+IGl0c2VsZiwg
YnV0IGRyb3AgdGhlIE1TUiBwcmVmaXggZnJvbSB0aGUgb3RoZXIgY29uc3RhbnRzIHRvIHNob3J0
ZW4gdGhlDQo+IG5hbWVzLg0KPiBJbiBhbGwgY2FzZXMsIHRoZSBmYWN0IHRoYXQgd2UgYXJlIGRl
YWxpbmcgd2l0aCB0aGUgQVBJQ19CQVNFIE1TUiBpcyBvYnZpb3VzDQo+IGZyb20gdGhlIGNvbnRl
eHQuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSAodGhlIGNvbWJpbmVkIGJpbmFyeSBpcyBp
ZGVudGljYWwpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4NCj4gLS0tDQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+DQo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4g
Q0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+DQo+IENDOiBKdW4gTmFrYWppbWEgPGp1
bi5uYWthamltYUBpbnRlbC5jb20+DQo+IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT4NCj4gDQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
