From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 7/7] x86: add iommu_ops to map and unmap
 pages, and also to flush the IOTLB
Date: Tue, 13 Feb 2018 06:55:48 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191002766@SHSMSX101.ccr.corp.intel.com>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-8-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xgkp=fh=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1elUVS-0003bh-FA
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 06:55:58 +0000
In-Reply-To: <20180212104714.1922-8-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQNCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAxMiwgMjAxOCA2
OjQ3IFBNDQo+IA0KPiBUaGlzIHBhdGNoIGFkZHMgaW9tbXVfb3BzIHRvIGFsbG93IGEgZG9tYWlu
IHdpdGggY29udHJvbF9pb21tdQ0KPiBwcml2aWxlZ2UNCj4gdG8gbWFwIGFuZCB1bm1hcCBwYWdl
cyBmcm9tIGFueSBndWVzdCBvdmVyIHdoaWNoIGl0IGhhcyBtYXBwaW5nDQo+IHByaXZpbGVnZQ0K
PiBpbiB0aGUgSU9NTVUuDQo+IFRoZXNlIG9wZXJhdGlvbnMgaW1wbGljaXRseSBkaXNhYmxlIElP
VExCIGZsdXNoaW5nIHNvIHRoYXQgdGhlIGNhbGxlciBjYW4NCj4gYmF0Y2ggb3BlcmF0aW9ucyBh
bmQgdGhlbiBleHBsaWNpdGx5IGZsdXNoIHRoZSBJT1RMQiB1c2luZyB0aGUgaW9tbXVfb3ANCj4g
YWxzbyBhZGRlZCBieSB0aGlzIHBhdGNoLg0KDQpnaXZlbiB0aGF0IGxhc3QgZGlzY3Vzc2lvbiBp
cyAyeXJzIGFnbyBhbmQgeW91IHNhaWQgYWN0dWFsIGltcGxlbWVudGF0aW9uDQphbHJlYWR5IGJp
YXNlZCBmcm9tIG9yaWdpbmFsIHNwZWMsIGl0J2QgYmUgZGlmZmljdWx0IHRvIGp1ZGdlIHdoZXRo
ZXIgY3VycmVudA0KY2hhbmdlIGlzIHN1ZmZpY2llbnQgb3IganVzdCAxc3Qgc3RlcC4gQ291bGQg
eW91IHN1bW1hcml6ZSB3aGF0IGhhdmUNCmJlZW4gY2hhbmdlZCBmcm9tIGxhc3Qgc3BlYywgYW5k
IGFsc28gYW55IGZ1cnRoZXIgdGFza3MgaW4geW91ciBUT0RPIGxpc3Q/DQoNCmF0IGxlYXN0IGp1
c3QgbWFwL3VubWFwIG9wZXJhdGlvbnMgZGVmaW5pdGVseSBub3QgbWVldCBYZW5HVCByZXF1aXJl
bWVudC4uLg0KDQpUaGFua3MNCmtldmluDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
