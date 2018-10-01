From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v12 2/9] iommu: make use of type-safe DFN
 and MFN in exported functions
Date: Mon, 1 Oct 2018 11:19:29 +0100
Message-ID: <97eeeaf9-550d-b498-b549-d8743a98f75e@arm.com>
References: <20180927143333.17516-1-paul.durrant@citrix.com>
 <20180927143333.17516-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7rit=mn=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1g6vIb-0003F3-3g
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 10:19:33 +0000
In-Reply-To: <20180927143333.17516-3-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgUGF1bCwKCk9uIDA5LzI3LzIwMTggMDM6MzMgUE0sIFBhdWwgRHVycmFudCB3cm90ZToKPiBU
aGlzIHBhdGNoIG1vZGlmaWVzIHRoZSBkZWNsYXJhdGlvbiBvZiB0aGUgZW50cnkgcG9pbnRzIHRv
IHRoZSBJT01NVQo+IHN1Yi1zeXN0ZW0gdG8gdXNlIGRmbl90IGFuZCBtZm5fdCBpbiBwbGFjZSBv
ZiB1bnNpZ25lZCBsb25nLiBBIHN1YnNlcXVlbnQKPiBwYXRjaCB3aWxsIHNpbWlsYXJseSBtb2Rp
ZnkgdGhlIG1ldGhvZHMgaW4gdGhlIGlvbW11X29wcyBzdHJ1Y3R1cmUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlh
biA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uZSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCkZvciB0aGUgQXJtIGJpdHM6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
