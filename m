From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v5 3/4] iommu: elide flushing for higher
 order map/unmap operations
Date: Wed, 19 Dec 2018 15:43:05 +0000
Message-ID: <9b88c487-45ee-d552-e476-44863eb8cf7b@arm.com>
References: <20181217092259.19762-1-paul.durrant@citrix.com>
 <20181217092259.19762-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NFW0=O4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gZe06-0005NW-79
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 15:43:10 +0000
In-Reply-To: <20181217092259.19762-4-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Brian Woods <brian.woods@amd.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDE3LzEyLzIwMTggMDk6MjIsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGlz
IHBhdGNoIHJlbW92ZXMgYW55IGltcGxpY2l0IGZsdXNoaW5nIHRoYXQgb2NjdXJzIGluIHRoZSBp
bXBsZW1lbnRhdGlvbgo+IG9mIG1hcCBhbmQgdW5tYXAgb3BlcmF0aW9ucyBhbmQgYWRkcyBuZXcg
aW9tbXVfbWFwL3VubWFwKCkgd3JhcHBlcgo+IGZ1bmN0aW9ucy4gVG8gbWFpbnRhaW4gc2VtYW50
aWNzIG9mIHRoZSBpb21tdV9sZWdhY3lfbWFwL3VubWFwKCkgd3JhcHBlcgo+IGZ1bmN0aW9ucywg
dGhlc2UgYXJlIG1vZGlmaWVkIHRvIGNhbGwgdGhlIG5ldyB3cmFwcGVyIGZ1bmN0aW9ucyBhbmQg
dGhlbgo+IHBlcmZvcm0gYW4gZXhwbGljaXQgZmx1c2ggb3BlcmF0aW9uLgo+IAo+IEJlY2F1c2Ug
VlQtZCBjdXJyZW50bHkgcGVyZm9ybXMgdHdvIGRpZmZlcmVudCB0eXBlcyBvZiBmbHVzaCBkZXBl
bmRlbnQgdXBvbgo+IHdoZXRoZXIgYSBQVEUgaXMgYmVpbmcgbW9kaWZpZWQgdmVyc3VzIG1lcmVs
eSBhZGRlZCAoaS5lLiByZXBsYWNpbmcgYSBub24tCj4gcHJlc2VudCBQVEUpICdpb21tdSBmbHVz
aCBmbGFncycgYXJlIGRlZmluZWQgYnkgdGhpcyBwYXRjaCBhbmQgdGhlCj4gaW9tbXVfb3BzIG1h
cF9wYWdlKCkgYW5kIHVubWFwX3BhZ2UoKSBtZXRob2RzIGFyZSBtb2RpZmllZCB0byBPUiB0aGUg
dHlwZQo+IG9mIGZsdXNoIG5lY2Vzc2FyeSBmb3IgdGhlIFBURSB0aGF0IGhhcyBiZWVuIHBvcHVs
YXRlZCBvciBkZXBvcHVsYXRlZCBpbnRvCj4gYW4gYWNjdW11bGF0ZWQgZmxhZ3MgdmFsdWUuIFRo
ZSBhY2N1bXVsYXRlZCB2YWx1ZSBjYW4gdGhlbiBiZSBwYXNzZWQgaW50bwo+IHRoZSBleHBsaWNp
dCBmbHVzaCBvcGVyYXRpb24uCj4gCj4gVGhlIEFSTSBTTU1VIGltcGxlbWVudGF0aW9ucyBvZiBt
YXBfcGFnZSgpIGFuZCB1bm1hcF9wYWdlKCkgY3VycmVudGx5Cj4gcGVyZm9ybSBubyBpbXBsaWNp
dCBmbHVzaGluZyBhbmQgdGhlcmVmb3JlIHRoZSBtb2RpZmllZCBtZXRob2RzIGRvIG5vdAo+IGFk
anVzdCB0aGUgZmx1c2ggZmxhZ3MuCj4gCj4gTk9URTogVGhlIHBlci1jcHUgJ2lvbW11X2RvbnRf
Zmx1c2hfaW90bGInIGlzIHJlc3BlY3RlZCBieSB0aGUKPiAgICAgICAgaW9tbXVfbGVnYWN5X21h
cC91bm1hcCgpIHdyYXBwZXIgZnVuY3Rpb25zIGFuZCB0aGVyZWZvcmUgdGhpcyBub3cKPiAgICAg
ICAgYXBwbGllcyB0byBhbGwgSU9NTVUgaW1wbGVtZW50YXRpb25zIHJhdGhlciB0aGFuIGp1c3Qg
VlQtZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKQWNrZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
