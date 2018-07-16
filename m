From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 06/13] public / x86: introduce
 __HYPERCALL_iommu_op
Date: Mon, 16 Jul 2018 10:00:53 +0000
Message-ID: <10d882a88a244021852deaff7527c3b7@AMSPEX02CL02.citrite.net>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-7-paul.durrant@citrix.com>
 <930ea67e-3e33-d939-892a-d7b0ee6dc64e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tukk=ka=citrix.com=prvs=728920bf3=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ff0Jd-0003IV-W8
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 10:01:14 +0000
In-Reply-To: <930ea67e-3e33-d939-892a-d7b0ee6dc64e@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZW9yZ2UgRHVubGFwIFttYWls
dG86Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tXQ0KPiBTZW50OiAxMSBKdWx5IDIwMTggMTA6MTAN
Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIz
QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+
OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IEphbg0KPiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IFRpbQ0KPiAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT47IERhbmllbCBEZSBHcmFhZg0KPiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292Pg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyIDA2LzEzXSBwdWJsaWMgLyB4ODY6IGludHJvZHVjZQ0KPiBfX0hZ
UEVSQ0FMTF9pb21tdV9vcA0KPiANCj4gT24gMDcvMDcvMjAxOCAxMjowNSBQTSwgUGF1bCBEdXJy
YW50IHdyb3RlOg0KPiA+ICtsb25nIGRvX2lvbW11X29wKHVuc2lnbmVkIGludCBucl9idWZzLA0K
PiA+ICsgICAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2lvbW11X29w
X2J1Zl90KSBidWZzKQ0KPiA+ICt7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4gPiArICAg
IGxvbmcgcmM7DQo+ID4gKw0KPiA+ICsgICAgcmMgPSB4c21faW9tbXVfb3AoWFNNX1BSSVYsIGN1
cnJlbnQtPmRvbWFpbik7DQo+IA0KPiBNeSBvbmx5IGNvbW1lbnQgaGVyZSBpcywgZG9lc24ndCB0
aGlzIG1lYW4gdGhhdCBYU00gY2FuIG9ubHkgcHJvdmlkZQ0KPiAieWVzL25vIiBmdW5jdGlvbmFs
aXR5IGZvciB0aGlzIGVudGlyZSBoeXBlcmNhbGwsIHJhdGhlciB0aGFuIGJlaW5nIGFibGUNCj4g
dG8gZW5hYmxlIG9yIGRpc2FibGUgaW5kaXZpZHVhbCBvcGVyYXRpb25zPw0KDQpUaGF0J3MgdHJ1
ZS4gSSBoYWQgbm90IHJlYWxseSBjb25zaWRlcmVkIHRoZSBuZWVkIHRvIGhhdmUgZmluZXIgZ3Jh
aW5lZCBjb250cm9sLCBidXQgc2luY2UgeW91IHF1ZXJpZWQgaXQsIEknbGwgcmUtd29yayBpdCBz
byB0aGF0IGl0IGlzIHBvc3NpYmxlIHRvIHZldG8gaW5kaXZpZHVhbCBvcHMuDQoNCiAgUGF1bA0K
DQo+IA0KPiAgLUdlb3JnZQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
