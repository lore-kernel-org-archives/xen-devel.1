From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v8 1/8] xen: xsm: flask: introduce
 XENMAPSPACE_gmfn_share for memory sharing
Date: Mon, 3 Dec 2018 14:02:37 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812031357571.527@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1810081606390.28877@sstabellini-ThinkPad-X260>
 <1539041841-17655-1-git-send-email-sstabellini@kernel.org>
 <5BBC54C702000078001EFD71@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1811061441130.21987@sstabellini-ThinkPad-X260>
 <5BE2974102000078001F8F25@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BE2974102000078001F8F25@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Sky Liu <blackskygg@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCA3IE5vdiAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDYuMTEuMTgg
YXQgMjM6NDIsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IE9uIFR1ZSwgOSBP
Y3QgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDA5LjEwLjE4IGF0IDAxOjM3
LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4gPiAtLS0gYS94ZW4vaW5jbHVk
ZS94c20vZHVtbXkuaAo+ID4+ID4gKysrIGIveGVuL2luY2x1ZGUveHNtL2R1bW15LmgKPiA+PiA+
IEBAIC01MzUsNiArNTM1LDIwIEBAIHN0YXRpYyBYU01fSU5MSU5FIGludCB4c21fbWFwX2dtZm5f
Zm9yZWlnbihYU01fREVGQVVMVF9BUkcgc3RydWN0IGRvbWFpbiAqZCwgc3RyCj4gPj4gPiAgICAg
IHJldHVybiB4c21fZGVmYXVsdF9hY3Rpb24oYWN0aW9uLCBkLCB0KTsKPiA+PiA+ICB9Cj4gPj4g
PiAgCj4gPj4gPiArLyoKPiA+PiA+ICsgKiBCZSBhd2FyZSB0aGF0IHRoaXMgaXMgbm90IGFuIGV4
YWN0IGRlZmF1bHQgZXF1aXZhbGVuY2Ugb2YgaXRzIGZsYXNrCj4gPj4gPiArICogdmFyaWFudCB3
aGljaCBhbHNvIGNoZWNrcyBpZiBAZCBhbmQgQHQgImFyZSBhbGxvd2VkIHRvIHNoYXJlIG1lbW9y
eQo+ID4+ID4gKyAqIHBhZ2VzIiwgZm9yIG5vdywgd2UgZG9uJ3QgaGF2ZSBhIHByb3BlciBkZWZh
dWx0IGVxdWl2YWxlbmNlIG9mIHN1Y2ggYQo+ID4+ID4gKyAqIGNoZWNrLgo+ID4+ID4gKyAqLwo+
ID4+ID4gK3N0YXRpYyBYU01fSU5MSU5FIGludCB4c21fbWFwX2dtZm5fc2hhcmUoWFNNX0RFRkFV
TFRfQVJHIHN0cnVjdCBkb21haW4gKmQsCj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZG9tYWluICp0KQo+ID4+ID4gK3sKPiA+PiA+ICsgICAg
WFNNX0FTU0VSVF9BQ1RJT04oWFNNX1RBUkdFVCk7Cj4gPj4gPiArICAgIHJldHVybiB4c21fZGVm
YXVsdF9hY3Rpb24oWFNNX1RBUkdFVCwgY3VycmVudC0+ZG9tYWluLCBkKSA/Ogo+ID4+ID4gKyAg
ICAgICAgICAgeHNtX2RlZmF1bHRfYWN0aW9uKGFjdGlvbiwgY3VycmVudC0+ZG9tYWluLCB0KTsK
PiA+PiA+ICt9Cj4gPj4gCj4gPj4gRG9lcyB0aGlzIChzcGVjaWZpY2FsbHkgeHNtL2R1bW15LmMp
KSBidWlsZCB3aXRoIFhTTSBlbmFibGVkPwo+ID4+IEFmYWljdCAiYWN0aW9uIiBpcyBnb2luZyB0
byBiZSBhbiB1bmRlZmluZWQgc3ltYm9sIGluIHRoYXQgY2FzZS4KPiA+IAo+ID4gSSB0cmllZCBp
dCBhbmQgaXQgZG9lcyBidWlsZCBPSwo+IAo+IE9oLCBJIHNlZSAtIHRoYXQgYmVjYXVzZSBvZiB0
aGUgd2F5IFhTTV9BU1NFUlRfQUNUSU9OKCkgaXMKPiBkZWZpbmVkIGluIHRoYXQgY2FzZS4gSXQn
cyBpbiBmYWN0IHRoZSBvdGhlciB3YXkgYXJvdW5kOiBGb3IKPiBjb25zaXN0ZW5jeSB3aXRoIG90
aGVyIGNvZGUsIHlvdSBzaG91bGRuJ3QgdXNlIGxpdGVyYWwKPiBYU01fVEFSR0VUIGluIHRoZSBm
aXJzdCBmdW5jdGlvbiBpbnZvY2F0aW9uLgoKT0ssIEknbGwgdXNlICJhY3Rpb24iIGluIGJvdGgg
aW52b2NhdGlvbnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
