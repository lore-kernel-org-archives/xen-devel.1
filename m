From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3] iommu / p2m: add a page_order parameter
 to iommu_map/unmap_page()...
Date: Mon, 19 Nov 2018 17:51:18 +0000
Message-ID: <52c1fc73-9482-a637-002c-8b6382f6bf1f@citrix.com>
References: <20181031152142.17049-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v//2=N6=citrix.com=prvs=8541ae097=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gOnhk-0006Jl-PV
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 17:51:24 +0000
In-Reply-To: <20181031152142.17049-1-paul.durrant@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMzEvMTggMzoyMSBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC4uLmFuZCByZS1uYW1l
IHRoZW0gdG8gaW9tbXVfbWFwL3VubWFwKCkgc2luY2UgdGhleSBubyBsb25nZXIgbmVjZXNzYXJp
bHkKPiBvcGVyYXRlIG9uIGEgc2luZ2xlIHBhZ2UuCj4gCj4gVGhlIFAyTSBjb2RlIGN1cnJlbnRs
eSBjb250YWlucyBtYW55IGxvb3BzIHRvIGRlYWwgd2l0aCB0aGUgZmFjdCB0aGF0LAo+IHdoaWxl
IGl0IG1heSBiZSByZXF1aXJlIHRvIGhhbmRsZSBwYWdlIG9yZGVycyBncmVhdGVyIHRoYW4gMCwg
dGhlCj4gSU9NTVUgbWFwIGFuZCB1bm1hcCBmdW5jdGlvbnMgZG8gbm90Lgo+IFRoaXMgcGF0Y2gg
YWRkcyBhIHBhZ2Vfb3JkZXIgcGFyYW1ldGVyIHRvIHRob3NlIGZ1bmN0aW9ucyBhbmQgaW1wbGVt
ZW50cwo+IHRoZSBuZWNlc3NhcnkgbG9vcHMgd2l0aGluLiBUaGlzIGFsbG93cyB0aGUgUDJNIGNv
ZGUgdG8gYmUgc3Vic3RhbnRpYWxseQo+IHNpbXBsaWZpZWQuCj4gCj4gVGhpcyBwYXRjaCBhbHNv
IGFkZHMgZW1hY3MgYm9pbGVycGxhdGUgdG8geGVuL2lvbW11LmggdG8gYXZvaWQgdGFiYmluZwo+
IHByb2JsZW0uCj4gCj4gTk9URTogVGhpcyBwYXRjaCBkb2VzIG5vdCBtb2RpZnkgdGhlIHVuZGVy
bHlpbmcgdmVuZG9yIElPTU1VCj4gICAgICAgaW1wbGVtZW50YXRpb25zIHRvIGRlYWwgd2l0aCBt
b3JlIHRoYW4gYSBzaW5nbGUgcGFnZSBhdCBvbmNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpHb29kIHN0dWZmOgoKUmV2aWV3ZWQt
Ynk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
