From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 1/7] xen: xsm: flask: introduce
 XENMAPSPACE_gmfn_share for memory sharing
Date: Fri, 03 Aug 2018 00:37:55 -0600
Message-ID: <5B63F84302000078001DA7AF@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1807311119160.26773@sstabellini-ThinkPad-X260>
 <1533061389-6504-1-git-send-email-sstabellini@kernel.org>
 <5B6171CE02000078001D9C39@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1808011457120.5781@sstabellini-ThinkPad-X260>
 <5B62A8E802000078001DA1FA@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1808021347150.1127@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1808021347150.1127@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Sky Liu <blackskygg@gmail.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA4LjE4IGF0IDIyOjU3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gVGh1LCAyIEF1ZyAyMDE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4gPiArLyoKPj4g
Pj4gPiArICogVGhpcyBhY3Rpb24gYWxzbyByZXF1aXJlcyB0aGF0IEBjdXJyZW50IHRhcmdldHMg
QGQsIGJ1dCBpdCBoYXMgYWxyZWFkeSBiZWVuCj4+ID4+ID4gKyAqIGNoZWNrZWQgc29tZXdoZXJl
IGhpZ2hlciBpbiB0aGUgY2FsbCBzdGFjay4KPj4gPj4gCj4+ID4+IEknbSBub3QgY29udmluY2Vk
IGl0IGlzIGEgZ29vZCBpZGVhIHRvIGhhdmUgc3VjaCBhIGRlcGVuZGVuY3ksIGV2ZW4KPj4gPj4g
bW9yZSBzbyB3aXRoIHRoaXMgY2xvdWR5IGEgcmVmZXJlbmNlLiBJZiB0aGVyZSdzIGFub3RoZXIg
WFNNIGNoZWNrCj4+ID4+IHRoYXQgaGFzIG5lY2Vzc2FyaWx5IGJlZW4gZG9uZSBiZWZvcmUsIHlv
dSBzaG91bGQgYXQgbGVhc3QgbmFtZSBpdAo+PiA+PiBoZXJlIHNvIGl0J3MgZWFzeSB0byBsYXRl
ciB2ZXJpZnkgdGhhdCB0aGUgYXNzdW1wdGlvbiBzdGlsbCBob2xkcy4gQnV0Cj4+ID4+IGV2ZW4g
YmV0dGVyIHdvdWxkIGltbyBiZSB0byByZS1kbyB0aGUgY2hlY2sgaGVyZSwganVzdCBpbiBjYXNl
Lgo+PiA+IAo+PiA+IEkgYW0gZmluZSB3aXRoIHRoYXQuIEl0IHNob3VsZCBiZSBqdXN0IGEgbWF0
dGVyIG9mIGRvaW5nIHRoZSBmb2xsb3dpbmcsCj4+ID4gcmlnaHQ/Cj4+ID4gCj4+ID4gc3RhdGlj
IFhTTV9JTkxJTkUgaW50IHhzbV9tYXBfZ21mbl9zaGFyZShYU01fREVGQVVMVF9BUkcgc3RydWN0
IGRvbWFpbiAqZCwKPj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBkb21haW4gKnQpCj4+ID4gewo+PiA+ICAgICBYU01fQVNTRVJUX0FDVElPTihYU01f
VEFSR0VUKTsKPj4gPiAgICAgcmV0dXJuIHhzbV9kZWZhdWx0X2FjdGlvbihYU01fVEFSR0VULCBj
dXJyZW50LT5kb21haW4sIGQpICYmCj4+ID4gICAgICAgICAgICB4c21fZGVmYXVsdF9hY3Rpb24o
YWN0aW9uLCBjdXJyZW50LT5kb21haW4sIHQpOwo+PiAKPj4gTm90IGV4YWN0bHkgLSB4c21fZGVm
YXVsdF9hY3Rpb24oKSBkb2Vzbid0IHJldHVybiBib29sZWFuLCBub3Igc2hvdWxkCj4+IHRoZSBm
dW5jdGlvbiBoZXJlLgo+IAo+IFlvdSBhcmUgcmlnaHQsIHplcm8gaXMgc3VjY2Vzcy4gU28gc29t
ZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZzoKPiAKPiAgICAgaW50IHJjID0geHNtX2RlZmF1bHRf
YWN0aW9uKFhTTV9UQVJHRVQsIGN1cnJlbnQtPmRvbWFpbiwgZCk7Cj4gICAgIGlmICggcmMgKQo+
ICAgICAgICAgcmV0dXJuIHJjOwo+ICAgICByZXR1cm4geHNtX2RlZmF1bHRfYWN0aW9uKGFjdGlv
biwgY3VycmVudC0+ZG9tYWluLCB0KTsKCkRpZG4ndCB5b3UgaW5oZXJpdCB0aGUgcGF0Y2ggZnJv
bSBzb21lb25lPyBJIHRoaW5rIHdlIGhhZCBhbHJlYWR5CmFycml2ZWQgYXQKCiAgICByZXR1cm4g
eHNtX2RlZmF1bHRfYWN0aW9uKFhTTV9UQVJHRVQsIGN1cnJlbnQtPmRvbWFpbiwgZCkKICAgICAg
ICAgICAgPzogeHNtX2RlZmF1bHRfYWN0aW9uKGFjdGlvbiwgY3VycmVudC0+ZG9tYWluLCB0KTsK
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
