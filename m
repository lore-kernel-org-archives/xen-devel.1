From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH 04/18] xen/arm: While a domain is suspended
 put its watchdogs on pause
Date: Mon, 12 Nov 2018 16:31:14 +0100
Message-ID: <CAKPH-Nhnvc4VMtD5OL1KZwfm5VbVMaHwb7fX5zf45oNvaps7Sg@mail.gmail.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-5-git-send-email-mirela.simonovic@aggios.com>
 <5BE9684802000078001FADC0@prv1-mh.provo.novell.com>
 <CAKPH-NgJ=YFcdQtL4iN3RbFTLyiV7VgHWo1YVZw4qA5Sh5MtHw@mail.gmail.com>
 <5BE99AD802000078001FB100@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5BE99AD802000078001FB100@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Davorin Mista <dm@aggios.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Xen Devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gTW9uLCBOb3YgMTIsIDIwMTggYXQgNDoyMyBQTSBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDEyLjExLjE4IGF0IDE2OjE3LCA8bWly
ZWxhLnNpbW9ub3ZpY0BhZ2dpb3MuY29tPiB3cm90ZToKPiA+IEhpIEphbiwKPiA+Cj4gPiBPbiBN
b24sIE5vdiAxMiwgMjAxOCBhdCAxMjo0NyBQTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5j
b20+IHdyb3RlOgo+ID4+Cj4gPj4gPj4+IE9uIDEyLjExLjE4IGF0IDEyOjMwLCA8bWlyZWxhLnNp
bW9ub3ZpY0BhZ2dpb3MuY29tPiB3cm90ZToKPiA+PiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi90
aW1lci5oCj4gPj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vdGltZXIuaAo+ID4+ID4gQEAgLTE4
LDYgKzE4LDkgQEAgc3RydWN0IHRpbWVyIHsKPiA+PiA+ICAgICAgLyogU3lzdGVtIHRpbWUgZXhw
aXJ5IHZhbHVlIChuYW5vc2Vjb25kcyBzaW5jZSBib290KS4gKi8KPiA+PiA+ICAgICAgc190aW1l
X3QgZXhwaXJlczsKPiA+PiA+Cj4gPj4gPiArICAgIC8qIFN1c3BlbmQgdGltZXN0YW1wIHZhbHVl
IChuYW5vc2Vjb25kcyBzaW5jZSBib290KS4gKi8KPiA+PiA+ICsgICAgc190aW1lX3Qgc3VzcGVu
ZGVkOwo+ID4+Cj4gPj4gSSBjYW4ndCBzZWUgaG93IHRoaXMgYmVjb21lcyBhIHVuaXZlcnNhbGx5
IHVzZWZ1bCBmaWVsZCwgc28gSQo+ID4+IGRvbid0IHRoaW5rIGl0IGJlbG9uZ3MgaGVyZS4gRm9y
IHlvdXIgcHVycG9zZSBkZXJpdmluZyBhIG5ldwo+ID4+IHN0cnVjdHVyZSBjb250YWluaW5nIHN0
cnVjdCB0aW1lciBhbmQgdGhpcyBvbmUgZmllbGQgc2hvdWxkCj4gPj4gd29yay4KPiA+Cj4gPiBF
YWNoICdleHBpcmVzJyB2YWx1ZSBuZWVkcyB0byBiZSBjb3VwbGVkIHdpdGggJ3N1c3BlbmRlZCcg
dmFsdWUgdG8gYmUKPiA+IGFibGUgdG8gZGVhbCB3aXRoIHdhdGNoZG9ncyB3aGVuIHN1c3BlbmRp
bmcgYSBkb21haW4uIFRoaXMgaXMgc3BlY2lmaWMKPiA+IHRvIGEgd2F0Y2hkb2cuCj4gPiBJZiB3
ZSBhZGQgYSBkZXJpdmVkIHN0cnVjdHVyZSB0byBjb250YWluIHRoaXMgZmllbGQgd2Ugc3RpbGwg
bmVlZCB0bwo+ID4gYXNzb2NpYXRlIHN1Y2ggYSBzdHJ1Y3R1cmUgd2l0aCBlYWNoIHdhdGNoZG9n
IG9mIGEgZG9tYWluLCB3aGljaCBpcwo+ID4gYWxzbyBkb21haW4gZ2VuZXJpYyBpbmZvIGFuZCBy
ZXF1aXJlcyBhIGxvdCBtb3JlIChpbiBteSBvcGluaW9uCj4gPiB1bm5lY2Vzc2FyeSkgY2hhbmdl
cy4gUGxlYXNlIGxldCBtZSBrbm93IGlmIEkgbWlzaW50ZXJwcmV0ZWQgeW91cgo+ID4gcHJvcG9z
YWwuCj4KPiBZb3UgYWRkIHRoZSBmaWVsZCB0byBhbGwgdGltZXIgaW5zdGFuY2VzLCB5ZXQgeW91
IG5lZWQgaXQgb25seSBmb3IKPiB2ZXJ5IGZldy4gV2h5IG5vdCBoYXZlIGEgc3RydWN0IHdhdGNo
ZG9nX3RpbWVyLCBhbmQgdXNlIGl0Cj4gZm9yIHN0cnVjdCBkb21haW4ncyB3YXRjaGRvZ190aW1l
cltdPyBJJ20gYWZyYWlkIEkgZG9uJ3Qgc2VlIHRoZQo+IGRpZmZpY3VsdGllcyB5b3UgYXBwZWFy
IHRvIHNlZS4KPgoKVGhhbmtzLCBub3cgaXQncyBjbGVhci4gV2UgbmVlZCB0byBjaGFuZ2UgdGhl
IHR5cGUgZm9yIHdhdGNoZG9nX3RpbWVyCnRvIGJlIHRoZSBkZXJpdmVkIHN0cnVjdHVyZSBvZiB0
aW1lciB0aGF0IGFkZGl0aW9uYWxseSBjb250YWlucwonc3VzcGVuZGVkJyB2YXJpYWJsZS4gVGhh
dCBtYWtlcyBzZW5zZSwgd2UnbGwgZG8gc28uCgpUaGFua3MsCk1pcmVsYQoKPiBKYW4KPgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
