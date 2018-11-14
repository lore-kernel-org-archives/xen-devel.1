From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] iommu / p2m: add a page_order parameter
 to iommu_map/unmap_page()...
Date: Wed, 14 Nov 2018 12:00:44 +0100
Message-ID: <20181114110044.5hzhwei6bvfk5hvd@mac>
References: <20181031152142.17049-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zmga=nz=citrix.com=prvs=849b1dda4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gMsuj-0000w7-N2
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 11:00:53 +0000
Content-Disposition: inline
In-Reply-To: <20181031152142.17049-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMDM6MjE6NDJQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLmFuZCByZS1uYW1lIHRoZW0gdG8gaW9tbXVfbWFwL3VubWFwKCkgc2luY2UgdGhl
eSBubyBsb25nZXIgbmVjZXNzYXJpbHkKPiBvcGVyYXRlIG9uIGEgc2luZ2xlIHBhZ2UuCj4gCj4g
VGhlIFAyTSBjb2RlIGN1cnJlbnRseSBjb250YWlucyBtYW55IGxvb3BzIHRvIGRlYWwgd2l0aCB0
aGUgZmFjdCB0aGF0LAo+IHdoaWxlIGl0IG1heSBiZSByZXF1aXJlIHRvIGhhbmRsZSBwYWdlIG9y
ZGVycyBncmVhdGVyIHRoYW4gMCwgdGhlCiAgICAgICAgICAgICAgICAgICAgICAgICBeZAo+IElP
TU1VIG1hcCBhbmQgdW5tYXAgZnVuY3Rpb25zIGRvIG5vdC4KPiBUaGlzIHBhdGNoIGFkZHMgYSBw
YWdlX29yZGVyIHBhcmFtZXRlciB0byB0aG9zZSBmdW5jdGlvbnMgYW5kIGltcGxlbWVudHMKPiB0
aGUgbmVjZXNzYXJ5IGxvb3BzIHdpdGhpbi4gVGhpcyBhbGxvd3MgdGhlIFAyTSBjb2RlIHRvIGJl
IHN1YnN0YW50aWFsbHkKPiBzaW1wbGlmaWVkLgo+IAo+IFRoaXMgcGF0Y2ggYWxzbyBhZGRzIGVt
YWNzIGJvaWxlcnBsYXRlIHRvIHhlbi9pb21tdS5oIHRvIGF2b2lkIHRhYmJpbmcKPiBwcm9ibGVt
Lgo+IAo+IE5PVEU6IFRoaXMgcGF0Y2ggZG9lcyBub3QgbW9kaWZ5IHRoZSB1bmRlcmx5aW5nIHZl
bmRvciBJT01NVQo+ICAgICAgIGltcGxlbWVudGF0aW9ucyB0byBkZWFsIHdpdGggbW9yZSB0aGFu
IGEgc2luZ2xlIHBhZ2UgYXQgb25jZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
