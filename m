From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/7] xen: xsm: flask: introduce
 XENMAPSPACE_gmfn_share for memory sharing
Date: Fri, 3 Aug 2018 13:17:48 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808031315320.1127@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1807311119160.26773@sstabellini-ThinkPad-X260>
 <1533061389-6504-1-git-send-email-sstabellini@kernel.org>
 <5B6171CE02000078001D9C39@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1808011457120.5781@sstabellini-ThinkPad-X260>
 <5B62A8E802000078001DA1FA@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1808021347150.1127@sstabellini-ThinkPad-X260>
 <5B63F84302000078001DA7AF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B63F84302000078001DA7AF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Sky Liu <blackskygg@gmail.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAzIEF1ZyAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDIuMDguMTgg
YXQgMjI6NTcsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IE9uIFRodSwgMiBB
dWcgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4gPiArLyoKPiA+PiA+PiA+ICsgKiBU
aGlzIGFjdGlvbiBhbHNvIHJlcXVpcmVzIHRoYXQgQGN1cnJlbnQgdGFyZ2V0cyBAZCwgYnV0IGl0
IGhhcyBhbHJlYWR5IGJlZW4KPiA+PiA+PiA+ICsgKiBjaGVja2VkIHNvbWV3aGVyZSBoaWdoZXIg
aW4gdGhlIGNhbGwgc3RhY2suCj4gPj4gPj4gCj4gPj4gPj4gSSdtIG5vdCBjb252aW5jZWQgaXQg
aXMgYSBnb29kIGlkZWEgdG8gaGF2ZSBzdWNoIGEgZGVwZW5kZW5jeSwgZXZlbgo+ID4+ID4+IG1v
cmUgc28gd2l0aCB0aGlzIGNsb3VkeSBhIHJlZmVyZW5jZS4gSWYgdGhlcmUncyBhbm90aGVyIFhT
TSBjaGVjawo+ID4+ID4+IHRoYXQgaGFzIG5lY2Vzc2FyaWx5IGJlZW4gZG9uZSBiZWZvcmUsIHlv
dSBzaG91bGQgYXQgbGVhc3QgbmFtZSBpdAo+ID4+ID4+IGhlcmUgc28gaXQncyBlYXN5IHRvIGxh
dGVyIHZlcmlmeSB0aGF0IHRoZSBhc3N1bXB0aW9uIHN0aWxsIGhvbGRzLiBCdXQKPiA+PiA+PiBl
dmVuIGJldHRlciB3b3VsZCBpbW8gYmUgdG8gcmUtZG8gdGhlIGNoZWNrIGhlcmUsIGp1c3QgaW4g
Y2FzZS4KPiA+PiA+IAo+ID4+ID4gSSBhbSBmaW5lIHdpdGggdGhhdC4gSXQgc2hvdWxkIGJlIGp1
c3QgYSBtYXR0ZXIgb2YgZG9pbmcgdGhlIGZvbGxvd2luZywKPiA+PiA+IHJpZ2h0Pwo+ID4+ID4g
Cj4gPj4gPiBzdGF0aWMgWFNNX0lOTElORSBpbnQgeHNtX21hcF9nbWZuX3NoYXJlKFhTTV9ERUZB
VUxUX0FSRyBzdHJ1Y3QgZG9tYWluICpkLAo+ID4+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZG9tYWluICp0KQo+ID4+ID4gewo+ID4+ID4gICAgIFhT
TV9BU1NFUlRfQUNUSU9OKFhTTV9UQVJHRVQpOwo+ID4+ID4gICAgIHJldHVybiB4c21fZGVmYXVs
dF9hY3Rpb24oWFNNX1RBUkdFVCwgY3VycmVudC0+ZG9tYWluLCBkKSAmJgo+ID4+ID4gICAgICAg
ICAgICB4c21fZGVmYXVsdF9hY3Rpb24oYWN0aW9uLCBjdXJyZW50LT5kb21haW4sIHQpOwo+ID4+
IAo+ID4+IE5vdCBleGFjdGx5IC0geHNtX2RlZmF1bHRfYWN0aW9uKCkgZG9lc24ndCByZXR1cm4g
Ym9vbGVhbiwgbm9yIHNob3VsZAo+ID4+IHRoZSBmdW5jdGlvbiBoZXJlLgo+ID4gCj4gPiBZb3Ug
YXJlIHJpZ2h0LCB6ZXJvIGlzIHN1Y2Nlc3MuIFNvIHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dp
bmc6Cj4gPiAKPiA+ICAgICBpbnQgcmMgPSB4c21fZGVmYXVsdF9hY3Rpb24oWFNNX1RBUkdFVCwg
Y3VycmVudC0+ZG9tYWluLCBkKTsKPiA+ICAgICBpZiAoIHJjICkKPiA+ICAgICAgICAgcmV0dXJu
IHJjOwo+ID4gICAgIHJldHVybiB4c21fZGVmYXVsdF9hY3Rpb24oYWN0aW9uLCBjdXJyZW50LT5k
b21haW4sIHQpOwo+IAo+IERpZG4ndCB5b3UgaW5oZXJpdCB0aGUgcGF0Y2ggZnJvbSBzb21lb25l
PyBJIHRoaW5rIHdlIGhhZCBhbHJlYWR5Cj4gYXJyaXZlZCBhdAo+IAo+ICAgICByZXR1cm4geHNt
X2RlZmF1bHRfYWN0aW9uKFhTTV9UQVJHRVQsIGN1cnJlbnQtPmRvbWFpbiwgZCkKPiAgICAgICAg
ICAgICA/OiB4c21fZGVmYXVsdF9hY3Rpb24oYWN0aW9uLCBjdXJyZW50LT5kb21haW4sIHQpOwoK
SWYgeW91IGFyZSByZWZlcnJpbmcgdG8gdGhlIGNvZGUgc3R5bGUsIEkgZG9uJ3QgaGF2ZSBhbiBv
cGluaW9uLCBJIGFtCmhhcHB5IHRvIGRvIHRoZSBhYm92ZS4gSSBjaGFuZ2VkIGl0IGluIHRoZXNl
IGNvZGUgc25pcHBldHMgb25seSBiZWNhdXNlCmluIHRoZSBvdGhlciBmdW5jdGlvbiAoZmxhc2tf
bWFwX2dtZm5fc2hhcmUpIHRoZSA/OiBtb2RlbCB3b3VsZCBiZWNvbWUKYXdrd2FyZCBhcyB0aGVy
ZSBhcmUgdGhyZWUgY29uc2VjdXRpdmUgY2hlY2tzLiBCdXQgaGVyZSBpdCB3b3VsZCBiZQpmaW5l
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
