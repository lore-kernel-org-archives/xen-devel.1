From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v12 4/9] iommu: don't domain_crash() inside
 iommu_map/unmap_page()
Date: Mon, 1 Oct 2018 11:23:22 +0100
Message-ID: <e1c4f5fc-1898-717c-56b0-8692b0336ec6@arm.com>
References: <20180927143333.17516-1-paul.durrant@citrix.com>
 <20180927143333.17516-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7rit=mn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g6vMN-0003zI-DK
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 10:23:27 +0000
In-Reply-To: <20180927143333.17516-5-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDA5LzI3LzIwMTggMDM6MzMgUE0sIFBhdWwgRHVycmFudCB3cm90ZToKPiBU
aGlzIHBhdGNoIHJlbW92ZXMgdGhlIGltcGxpY2l0IGRvbWFpbl9jcmFzaCgpIGZyb20gaW9tbXVf
bWFwKCksCj4gdW5tYXBfcGFnZSgpIGFuZCBpb21tdV9pb3RsYl9mbHVzaCgpIGFuZCB0dXJucyB0
aGVtIGludG8gc3RyYWlnaHRmb3J3YXJkCj4gd3JhcHBlcnMgdGhhdCBjaGVjayB0aGUgZXhpc3Rl
bmNlIG9mIHRoZSByZWxldmFudCBpb21tdV9vcCBhbmQgY2FsbAo+IHRocm91Z2ggdG8gaXQuIFRo
aXMgbWFrZXMgdGhlbSB1c2FibGUgYnkgUFYgSU9NTVUgY29kZSB0byBiZSBkZWxpdmVyZWQgaW4K
PiBmdXR1cmUgcGF0Y2hlcy4gPiBUaGlzIHBhdGNoIGFkZHMgYSBoZWxwZXIgbWFjcm8sIGRvbXVf
Y3Jhc2goKSwgdGhhdCB3aWxsIG9ubHkgaW52b2tlCj4gZG9tYWluX2NyYXNoKCkgaWYgdGhlIGRv
bWFpbiBpcyBub3QgdGhlIGhhcmR3YXJlIGRvbWFpbiBhbmQgbW9kaWZpZXMKPiBjYWxsZXJzIG9m
IGlvbW11X21hcCgpLCB1bm1hcF9wYWdlKCkgYW5kIGlvbW11X2lvdGxiX2ZsdXNoKCkgdG8gdXNl
IHRoaXMKPiBzaG91bGQgYW4gb3BlcmF0aW9uIGZhaWwuCj4gCj4gTk9URTogVGhpcyBwYXRjaCBp
bmNsdWRlcyBvbmUgYml0IG9mIGNsZWFuLXVwIGluIHNldF9pZGVudGl0eV9wMm1fZW50cnkoKQo+
ICAgICAgICByZXBsYWNpbmcgdXNlIG9mIHAybS0+ZG9tYWluIHdpdGggdGhlIGRvbWFpbiBwb2lu
dGVyIHBhc3NlZCBpbnRvIHRoZQo+ICAgICAgICBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKRm9yIHRoZSBBcm0gYml0czoKCkFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
