From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] ns16550: enable use of PCI MSI
Date: Mon, 03 Dec 2018 01:40:06 -0700
Message-ID: <5C04EBE60200007800202114@prv1-mh.provo.novell.com>
References: <5BB2455202000078001ED685@prv1-mh.provo.novell.com>
 <5BB24A9D02000078001ED6C0@prv1-mh.provo.novell.com>
 <20181130163342.vfcnfjjf5ptw45a4@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gTjm0-0003iE-W2
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 08:40:13 +0000
In-Reply-To: <20181130163342.vfcnfjjf5ptw45a4@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjExLjE4IGF0IDE3OjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgT2N0IDAxLCAyMDE4IGF0IDEwOjI2OjA1QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbXNpLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21z
aS5jCj4+IEBAIC03NDIsNiArNzQyLDE2IEBAIHN0YXRpYyBpbnQgbXNpX2NhcGFiaWxpdHlfaW5p
dChzdHJ1Y3QgcGMKPj4gIAo+PiAgICAgICpkZXNjID0gZW50cnk7Cj4+ICAgICAgLyogUmVzdG9y
ZSB0aGUgb3JpZ2luYWwgTVNJIGVuYWJsZWQgYml0cyAgKi8KPj4gKyAgICBpZiAoICFoYXJkd2Fy
ZV9kb21haW4gKQo+PiArICAgIHsKPj4gKyAgICAgICAgLyoKPj4gKyAgICAgICAgICogLi4uLCBl
eGNlcHQgZm9yIGludGVybmFsIHJlcXVlc3RzIChiZWZvcmUgRG9tMCBzdGFydHMpLCBpbiB3aGlj
aAo+PiArICAgICAgICAgKiBjYXNlIHdlIHJhdGhlciBuZWVkIHRvIGJlaGF2ZSAibm9ybWFsbHki
LCBpLmUuIG5vdCBmb2xsb3cgdGhlIHNwbGl0Cj4+ICsgICAgICAgICAqIGJyYWluIG1vZGVsIHdo
ZXJlIERvbTAgYWN0dWFsbHkgZW5hYmxlcyBNU0kgKGFuZCBkaXNhYmxlcyBJTlR4KS4KPj4gKyAg
ICAgICAgICovCj4+ICsgICAgICAgIHBjaV9pbnR4KGRldiwgMCk7Cj4+ICsgICAgICAgIGNvbnRy
b2wgfD0gUENJX01TSV9GTEFHU19FTkFCTEU7Cj4gCj4gU29ycnkgZm9yIHRoZSBzcGxpdCByZXBs
eSwgSSd2ZSBiZWVuIHdvbmRlcmluZyBhYm91dCB0aGUgTVNJIGVuYWJsaW5nCj4gYW5kIElOVFgg
ZGlzYWJsaW5nIGRvbmUgaGVyZS4gWGVuIGFscmVhZHkgb3ducyBvdGhlciBQQ0kgZGV2aWNlcyAo
QU1ECj4gSU9NTVUgZm9yIGV4YW1wbGUsIHNlZSBzZXRfaW9tbXVfaW50ZXJydXB0X2hhbmRsZXIp
IHRoYXQgdXNlIE1TSSwgeWV0Cj4gdGhleSBzZWVtIHRvIG1hbmFnZSB0byB3b3JrIHdpdGhvdXQg
dGhpcyBieSBkb2luZyBhIG1hbnVhbCBNU0kgZW5hYmxlCj4gKGFuZCBJIGNhbm5vdCBmaWd1cmUg
b3V0IHdoZXJlIHRoZSBJTlRYIGRpc2FibGUgaXMgZG9uZSkuCgpUaGF0J3MgYmVjYXVzZSBJT01N
VXMgZG9uJ3Qgbm9ybWFsbHkgaGF2ZSBhIG1lYW5zIHRvIHNpZ25hbAppbnRlcnJ1cHRzIHZpYSBh
IHBpbi4gSGVuY2UgdGhlcmUncyBub3RoaW5nIHRvIGRpc2FibGUuCgo+IFNob3VsZG4ndCBYZW4g
aGF2ZSBhIG1vcmUgdW5pZm9ybSB3YXkgb2YgZGVhbGluZyB3aXRoIE1TSSBpbnRlcnJ1cHQKPiBz
ZXR1cCBmb3Igc3VjaCBkZXZpY2VzPwoKUGVyaGFwcywgYnV0IHRoZSBjcnVkZSB3YXkgb2Ygc2V0
dGluZyB1cCBJT01NVSBpbnRlcnJ1cHRzIHdhcwppbnZlbnRlZCBieSB0aGUgQ1BVIHZlbmRvciBl
bmdpbmVlcnM7IG9uIHRoZSBBTUQgc2lkZSBsYXRlciBJCnRoZW4gcmUtd29ya2VkIHRoaXMgdG8g
cmUtdXNlIGF0IGxlYXN0IHNvbWUgb2YgdGhlIGdlbmVyaWMgTVNJCmNvZGUgd2UgaGF2ZS4KCj4g
QW5kIGRvZXNuJ3QgeW91ciBjaGFuZ2UgaGVyZSBpbXBseSB0aGF0IHNvbWUgY29kZSBmcm9tIHRo
ZSBjdXJyZW50Cj4gaW50ZXJuYWwgTVNJIHVzZXJzIHNob3VsZCBiZSBkcm9wcGVkPyBUaGVyZSdz
IGEgY2FsbCB0bwo+IF9fbXNpX3NldF9lbmFibGUgaW4gdGhlIEFNRCBJT01NVSBjb2RlIChhbWRf
aW9tbXVfbXNpX2VuYWJsZSkgdGhhdCBJCj4gZ3Vlc3MgY2FuIGJlIGRyb3BwZWQ/CgpRdWl0ZSBw
b3NzaWJsZSAoSSBhZG1pdCBJIGRpZG4ndCBjaGVjayBpbiBkZXRhaWwpLCBidXQgaGVyZSBJIGRp
ZG4ndAp3YW50IHRvIGZpZGRsZSB3aXRoIHVucmVsYXRlZCBjb2RlLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
