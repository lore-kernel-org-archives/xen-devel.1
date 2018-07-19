From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 02/11] x86/vmx: Don't clobber %dr6 while
 debugging state is lazy
Date: Thu, 19 Jul 2018 02:14:49 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19126FDE3@SHSMSX101.ccr.corp.intel.com>
References: <1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com>
 <1528120755-17455-3-git-send-email-andrew.cooper3@citrix.com>
 <7c115a9e-e4ca-a69e-df89-93fcc0c123ce@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7c115a9e-e4ca-a69e-df89-93fcc0c123ce@citrix.com>
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
Cj4gU2VudDogVHVlc2RheSwgSnVseSAxNywgMjAxOCA1OjI4IFBNDQo+IA0KPiBPbiAwNC8wNi8x
OCAxNDo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gPiBjL3MgNGYzNjQ1MmI2MyBpbnRyb2R1
Y2VkIGEgd3JpdGUgdG8gJWRyNiBpbiB0aGUgI0RCIGludGVyY2VwdCBjYXNlLCBidXQNCj4gdGhl
DQo+ID4gZ3Vlc3RzIGRlYnVnIHJlZ2lzdGVycyBtYXkgYmUgbGF6eSBhdCB0aGlzIHBvaW50LCBh
dCB3aGljaCBwb2ludCB0aGUgZ3Vlc3RzDQo+ID4gbGF0ZXIgYXR0ZW1wdCB0byByZWFkICVkcjYg
d2lsbCBkaXNjYXJkIHRoaXMgdmFsdWUgYW5kIHVzZSB0aGUgb2xkZXIgc3RhbGUNCj4gPiB2YWx1
ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+DQo+ID4gLS0tDQo+ID4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4NCj4gPiBDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4NCj4gPiBDQzogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4gQ0M6IEp1biBOYWthamlt
YSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4NCj4gPiBDQzogS2V2aW4gVGlhbiA8a2V2aW4udGlh
bkBpbnRlbC5jb20+DQo+IA0KPiBQaW5nDQoNCkFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50
aWFuQGludGVsLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
