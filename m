From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] tools: add option to explicitly enable
 VirtFS in QEMU build
Date: Tue, 11 Sep 2018 07:44:37 -0600
Message-ID: <5B97C6C502000078001E750F@prv1-mh.provo.novell.com>
References: <20180911133727.31194-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fziyB-0002AS-Bn
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 13:44:43 +0000
In-Reply-To: <20180911133727.31194-1-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA5LjE4IGF0IDE1OjM3LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IDlwZnMgc3VwcG9ydCBoYXMgYmVlbiBhIGRvY3VtZW50ZWQgZmVhdHVyZSBzaW5jZSBYZW4g
NC45LCBidXQgUUVNVSB3aWxsCj4gbm90IGJlIGJ1aWx0IHdpdGggYmFja2VuZCBzdXBwb3J0IHVu
bGVzcyBWaXJ0RlMgaXMgZW5hYmxlZCwgd2hpY2ggaXMKPiBwcmVkaWNhdGVkIG9uIHRoZSBsaWJj
YXAgYW5kIGxpYmF0dHIgZGV2IHBhY2thZ2VzIGJlaW5nIGluc3RhbGxlZC4gVGhpcyBpcwo+IG5v
dCBvYnZpb3VzIHRvIGFueW9uZSBpbnRlbmRpbmcgdG8gdXNlIDlwZnMuCj4gCj4gVGhpcyBwYXRj
aCBhZGRzIGFuICdlbmFibGUtOXBmcycgb3B0aW9uIHRvIGNvbmZpZ3VyZSB3aGljaCwgaWYgc3Bl
Y2lmaWVkLAo+IHdpbGwgY2F1c2UgJy0tZW5hYmxlLXZpcnRmcycgdG8gYmUgcGFzc2VkIHRvIFFF
TVUncyBjb25maWd1cmUuIFRoaXMgd2lsbAo+IGNhdXNlIHRoZSBkZXBlbmRlbmN5IG9uIGxpYmNh
cCBhbmQgbGliYXR0ciB0byBiZSBjYWxsZWQgb3V0IGlmIHRoZSBwYWNrYWdlcwo+IGFyZSBub3Qg
aW4gaW5zdGFsbGVkLgo+IAo+IEZvciBjb21wbGV0ZW5lc3MsIHNwZWNpZnlpbmcgJ2Rpc2FibGUt
OXBmcycgd2lsbCBjYXVzZSAnLS1kaXNhYmxlLXZpcnRmcycgdG8KPiBiZSBwYXNzZWQgdG8gUUVN
VSdzIGNvbmZndXJlIGFuZCBub3Qgc3BlY2lmeWluZyBhbiBvcHRpb24gd2lsbCBrZWVwIHRoZQo+
IHByZXZpb3VzIGJlaGF2aW91ciBvZiBwcmVkaWNhdGluZyBWaXJ0RlMgb24gd2hldGhlciB0aGUg
bGliY2FwIGFuZCBsaWJhdHRyCj4gcGFja2FnZXMgYXJlIGluc3RhbGxlZC4KPiAKPiBOT1RFOiBU
aGUgc2hlbGwgc2NyaXB0IGluIGNvbmZpZ3VyZSBtaWdodCBsb29rIG9kZCwgYnV0IGl0IGlzIGNv
ZGVkIGZvcgo+ICAgICAgIGNvbnNpc3RlbmN5IHdpdGggb3RoZXIgc2ltaWxhciBsb2dpYyBibG9j
a3Mgd2l0aGluIHRoZSBmaWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUu
Y2l0cml4LmNvbT4KPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
Cj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+Cj4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENjOiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IHYyOgo+ICAtIEFkZCB0aGUgY29uZmlndXJlIG9w
dGlvbiByYXRoZXIgdGhlbiBlbmFibGluZyBWaXJ0RlMgaW4gYWxsIExpbnV4IGJ1aWxkcy4KPiAt
LS0KPiAgY29uZmlnL1Rvb2xzLm1rLmluIHwgIDEgKwo+ICB0b29scy9NYWtlZmlsZSAgICAgfCAx
MCArKysrKysrKystCj4gIHRvb2xzL2NvbmZpZ3VyZSAgICB8IDI5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKV291bGRuJ3QgeW91IGZpcnN0IGFuZCBmb3JlbW9zdCBuZWVkIHRvIGVkaXQgdG9v
bHMvY29uZmlndXJlLmFjPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
