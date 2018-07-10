From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 03/13] iommu: make use of type-safe BFN
 and MFN in exported functions
Date: Tue, 10 Jul 2018 15:00:39 +0100
Message-ID: <42026221-c065-9b31-20e9-21ea6b9a8548@citrix.com>
References: <20180707110526.35822-1-paul.durrant@citrix.com>
 <20180707110526.35822-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sxqp=j2=citrix.com=prvs=722797069=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fctCG-0000c6-1c
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 14:00:52 +0000
In-Reply-To: <20180707110526.35822-4-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDcvMjAxOCAxMjowNSBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoaXMgcGF0Y2gg
bW9kaWZpZXMgdGhlIGRlY2xhcmF0aW9uIG9mIHRoZSBlbnRyeSBwb2ludHMgdG8gdGhlIElPTU1V
Cj4gc3ViLXN5c3RlbSB0byB1c2UgYmZuX3QgYW5kIG1mbl90IGluIHBsYWNlIG9mIHVuc2lnbmVk
IGxvbmcuIEEgc3Vic2VxdWVudAo+IHBhdGNoIHdpbGwgc2ltaWxhcmx5IG1vZGlmeSB0aGUgbWV0
aG9kcyBpbiB0aGUgaW9tbXVfb3BzIHN0cnVjdHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVs
IER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4
LmNvbT4KPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6
IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDYzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4K
PiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDYzogSnVuIE5ha2FqaW1hIDxq
dW4ubmFrYWppbWFAaW50ZWwuY29tPgo+IENjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVs
LmNvbT4KPiBDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgo+
IAo+IHYyOgo+ICAtIEFkZHJlc3NlZCBjb21tZW50cyBmcm9tIEphbi4KPiAgLSBVc2UgaW50ZXJt
ZWRpYXRlICdmcmFtZScgdmFyaWFibGUgdG8gYXZvaWQgZGlyZWN0bHkgZW5jYXBzdWxhdGluZwo+
ICAgIG1mbiBvciBnZm4gdmFsdWVzIGFzIGJmbnMuCgpFeHBsYWluIHRoaXMgb25lIHRvIG1lPyAg
QXQgdGhlIG1vbWVudCBJIGRvbid0IHNlZSBhbnkgdmFsdWUgZnJvbSBoYXZpbmcKdGhlIGV4dHJh
IHZhcmlhYmxlIGluIHRoZSBtaWRkbGUuCgpFdmVyeXRoaW5nIGVsc2UgbG9va3MgZ29vZC4KCiAt
R2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
