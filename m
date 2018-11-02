From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] iommu / p2m: add a page_order parameter
 to iommu_map/unmap_page()...
Date: Fri, 02 Nov 2018 06:57:31 -0600
Message-ID: <5BDC49BB02000078001F7361@prv1-mh.provo.novell.com>
References: <20181031152142.17049-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrw=nn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gIZOA-0006zp-Dq
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 13:21:26 +0000
In-Reply-To: <20181031152142.17049-1-paul.durrant@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjEwLjE4IGF0IDE2OjIxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC4uLmFuZCByZS1uYW1lIHRoZW0gdG8gaW9tbXVfbWFwL3VubWFwKCkgc2luY2UgdGhleSBu
byBsb25nZXIgbmVjZXNzYXJpbHkKPiBvcGVyYXRlIG9uIGEgc2luZ2xlIHBhZ2UuCj4gCj4gVGhl
IFAyTSBjb2RlIGN1cnJlbnRseSBjb250YWlucyBtYW55IGxvb3BzIHRvIGRlYWwgd2l0aCB0aGUg
ZmFjdCB0aGF0LAo+IHdoaWxlIGl0IG1heSBiZSByZXF1aXJlIHRvIGhhbmRsZSBwYWdlIG9yZGVy
cyBncmVhdGVyIHRoYW4gMCwgdGhlCj4gSU9NTVUgbWFwIGFuZCB1bm1hcCBmdW5jdGlvbnMgZG8g
bm90Lgo+IFRoaXMgcGF0Y2ggYWRkcyBhIHBhZ2Vfb3JkZXIgcGFyYW1ldGVyIHRvIHRob3NlIGZ1
bmN0aW9ucyBhbmQgaW1wbGVtZW50cwo+IHRoZSBuZWNlc3NhcnkgbG9vcHMgd2l0aGluLiBUaGlz
IGFsbG93cyB0aGUgUDJNIGNvZGUgdG8gYmUgc3Vic3RhbnRpYWxseQo+IHNpbXBsaWZpZWQuCj4g
Cj4gVGhpcyBwYXRjaCBhbHNvIGFkZHMgZW1hY3MgYm9pbGVycGxhdGUgdG8geGVuL2lvbW11Lmgg
dG8gYXZvaWQgdGFiYmluZwo+IHByb2JsZW0uCj4gCj4gTk9URTogVGhpcyBwYXRjaCBkb2VzIG5v
dCBtb2RpZnkgdGhlIHVuZGVybHlpbmcgdmVuZG9yIElPTU1VCj4gICAgICAgaW1wbGVtZW50YXRp
b25zIHRvIGRlYWwgd2l0aCBtb3JlIHRoYW4gYSBzaW5nbGUgcGFnZSBhdCBvbmNlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CgpSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
