From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/2] ns16550: enable use of PCI MSI
Date: Mon, 3 Dec 2018 16:39:52 +0100
Message-ID: <20181203153952.7feetls3yez37pwp@mac>
References: <5BB2455202000078001ED685@prv1-mh.provo.novell.com>
 <5BB24A9D02000078001ED6C0@prv1-mh.provo.novell.com>
 <20181130163342.vfcnfjjf5ptw45a4@mac>
 <5C04EBE60200007800202114@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=evar=om=citrix.com=prvs=8687ba703=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gTqLJ-0000RD-2R
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 15:41:05 +0000
Content-Disposition: inline
In-Reply-To: <5C04EBE60200007800202114@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMDMsIDIwMTggYXQgMDE6NDA6MDZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMwLjExLjE4IGF0IDE3OjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gTW9uLCBPY3QgMDEsIDIwMTggYXQgMTA6MjY6MDVBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L21zaS5jCj4gPj4gKysrIGIveGVu
L2FyY2gveDg2L21zaS5jCj4gPj4gQEAgLTc0Miw2ICs3NDIsMTYgQEAgc3RhdGljIGludCBtc2lf
Y2FwYWJpbGl0eV9pbml0KHN0cnVjdCBwYwo+ID4+ICAKPiA+PiAgICAgICpkZXNjID0gZW50cnk7
Cj4gPj4gICAgICAvKiBSZXN0b3JlIHRoZSBvcmlnaW5hbCBNU0kgZW5hYmxlZCBiaXRzICAqLwo+
ID4+ICsgICAgaWYgKCAhaGFyZHdhcmVfZG9tYWluICkKPiA+PiArICAgIHsKPiA+PiArICAgICAg
ICAvKgo+ID4+ICsgICAgICAgICAqIC4uLiwgZXhjZXB0IGZvciBpbnRlcm5hbCByZXF1ZXN0cyAo
YmVmb3JlIERvbTAgc3RhcnRzKSwgaW4gd2hpY2gKPiA+PiArICAgICAgICAgKiBjYXNlIHdlIHJh
dGhlciBuZWVkIHRvIGJlaGF2ZSAibm9ybWFsbHkiLCBpLmUuIG5vdCBmb2xsb3cgdGhlIHNwbGl0
Cj4gPj4gKyAgICAgICAgICogYnJhaW4gbW9kZWwgd2hlcmUgRG9tMCBhY3R1YWxseSBlbmFibGVz
IE1TSSAoYW5kIGRpc2FibGVzIElOVHgpLgo+ID4+ICsgICAgICAgICAqLwo+ID4+ICsgICAgICAg
IHBjaV9pbnR4KGRldiwgMCk7Cj4gPj4gKyAgICAgICAgY29udHJvbCB8PSBQQ0lfTVNJX0ZMQUdT
X0VOQUJMRTsKPiA+IAo+ID4gU29ycnkgZm9yIHRoZSBzcGxpdCByZXBseSwgSSd2ZSBiZWVuIHdv
bmRlcmluZyBhYm91dCB0aGUgTVNJIGVuYWJsaW5nCj4gPiBhbmQgSU5UWCBkaXNhYmxpbmcgZG9u
ZSBoZXJlLiBYZW4gYWxyZWFkeSBvd25zIG90aGVyIFBDSSBkZXZpY2VzIChBTUQKPiA+IElPTU1V
IGZvciBleGFtcGxlLCBzZWUgc2V0X2lvbW11X2ludGVycnVwdF9oYW5kbGVyKSB0aGF0IHVzZSBN
U0ksIHlldAo+ID4gdGhleSBzZWVtIHRvIG1hbmFnZSB0byB3b3JrIHdpdGhvdXQgdGhpcyBieSBk
b2luZyBhIG1hbnVhbCBNU0kgZW5hYmxlCj4gPiAoYW5kIEkgY2Fubm90IGZpZ3VyZSBvdXQgd2hl
cmUgdGhlIElOVFggZGlzYWJsZSBpcyBkb25lKS4KPiAKPiBUaGF0J3MgYmVjYXVzZSBJT01NVXMg
ZG9uJ3Qgbm9ybWFsbHkgaGF2ZSBhIG1lYW5zIHRvIHNpZ25hbAo+IGludGVycnVwdHMgdmlhIGEg
cGluLiBIZW5jZSB0aGVyZSdzIG5vdGhpbmcgdG8gZGlzYWJsZS4KPiAKPiA+IFNob3VsZG4ndCBY
ZW4gaGF2ZSBhIG1vcmUgdW5pZm9ybSB3YXkgb2YgZGVhbGluZyB3aXRoIE1TSSBpbnRlcnJ1cHQK
PiA+IHNldHVwIGZvciBzdWNoIGRldmljZXM/Cj4gCj4gUGVyaGFwcywgYnV0IHRoZSBjcnVkZSB3
YXkgb2Ygc2V0dGluZyB1cCBJT01NVSBpbnRlcnJ1cHRzIHdhcwo+IGludmVudGVkIGJ5IHRoZSBD
UFUgdmVuZG9yIGVuZ2luZWVyczsgb24gdGhlIEFNRCBzaWRlIGxhdGVyIEkKPiB0aGVuIHJlLXdv
cmtlZCB0aGlzIHRvIHJlLXVzZSBhdCBsZWFzdCBzb21lIG9mIHRoZSBnZW5lcmljIE1TSQo+IGNv
ZGUgd2UgaGF2ZS4KPiAKPiA+IEFuZCBkb2Vzbid0IHlvdXIgY2hhbmdlIGhlcmUgaW1wbHkgdGhh
dCBzb21lIGNvZGUgZnJvbSB0aGUgY3VycmVudAo+ID4gaW50ZXJuYWwgTVNJIHVzZXJzIHNob3Vs
ZCBiZSBkcm9wcGVkPyBUaGVyZSdzIGEgY2FsbCB0bwo+ID4gX19tc2lfc2V0X2VuYWJsZSBpbiB0
aGUgQU1EIElPTU1VIGNvZGUgKGFtZF9pb21tdV9tc2lfZW5hYmxlKSB0aGF0IEkKPiA+IGd1ZXNz
IGNhbiBiZSBkcm9wcGVkPwo+IAo+IFF1aXRlIHBvc3NpYmxlIChJIGFkbWl0IEkgZGlkbid0IGNo
ZWNrIGluIGRldGFpbCksIGJ1dCBoZXJlIEkgZGlkbid0Cj4gd2FudCB0byBmaWRkbGUgd2l0aCB1
bnJlbGF0ZWQgY29kZS4KCkFjaywgSSBndWVzcyBpdCdzIHNvbWV0aGluZyB0byBhZGQgdG8gdGhl
IGxpc3Qgb2YgbmljZS10by1oYXZlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
