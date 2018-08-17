From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 8/8] x86/iommu: add map-reserved
 dom0-iommu option to map reserved memory ranges
Date: Fri, 17 Aug 2018 05:46:57 -0600
Message-ID: <5B76B5B102000078001DF65B@prv1-mh.provo.novell.com>
References: <20180814134336.75539-1-roger.pau@citrix.com>
 <20180814134336.75539-9-roger.pau@citrix.com>
 <5B76AC9802000078001DF612@prv1-mh.provo.novell.com>
 <20180817111720.aedpnm4txojp7lfo@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqdDZ-00060D-ID
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 11:47:01 +0000
In-Reply-To: <20180817111720.aedpnm4txojp7lfo@mac>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDEzOjE3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgQXVnIDE3LCAyMDE4IGF0IDA1OjA4OjA4QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTQuMDguMTggYXQgMTU6NDMsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gQEAgLTE4NSw3ICsyMTksMTMgQEAgdm9pZCBfX2h3ZG9tX2luaXQgYXJjaF9p
b21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4+ID4gICAgICAgICAgaWYgKCAhaHdk
b21faW9tbXVfbWFwKGQsIHBmbiwgbWF4X3BmbikgKQo+PiA+ICAgICAgICAgICAgICBjb250aW51
ZTsKPj4gPiAgCj4+ID4gLSAgICAgICAgcmMgPSBpb21tdV9tYXBfcGFnZShkLCBwZm4sIHBmbiwg
SU9NTVVGX3JlYWRhYmxlfElPTU1VRl93cml0YWJsZSk7Cj4+ID4gKyAgICAgICAgaWYgKCBpb21t
dV91c2VfaGFwX3B0KGQpICkKPj4gPiArICAgICAgICB7Cj4+ID4gKyAgICAgICAgICAgIEFTU0VS
VChpc19odm1fZG9tYWluKGQpKTsKPj4gPiArICAgICAgICAgICAgcmMgPSBzZXRfaWRlbnRpdHlf
cDJtX2VudHJ5KGQsIHBmbiwgcDJtX2FjY2Vzc19ydywgMCk7Cj4+ID4gKyAgICAgICAgfQo+PiA+
ICsgICAgICAgIGVsc2UKPj4gPiArICAgICAgICAgICAgcmMgPSBpb21tdV9tYXBfcGFnZShkLCBw
Zm4sIHBmbiwgSU9NTVVGX3JlYWRhYmxlfElPTU1VRl93cml0YWJsZSk7Cj4+IAo+PiBXaHkgaW9t
bXVfdXNlX2hhcF9wdCgpPyBTaG91bGRuJ3QgSEFQIHdpdGggb3Igd2l0aG91dCBzaGFyZWQKPj4g
cGFnZSB0YWJsZXMgYXMgd2VsbCBhcyBzaGFkb3cgYWxsIGdldCB0aGUgc2FtZSBpbi1zeW5jIHAy
bSBhbmQKPj4gSU9NTVUgbWFwcGluZ3M/Cj4gCj4gaW9tbXVfbWFwX3BhZ2UgaXMgYSBub29wIGlm
IGlvbW11X3VzZV9oYXBfcHQgaXMgdHJ1ZSAoc2VlCj4gaW50ZWxfaW9tbXVfbWFwX3BhZ2UgZm9y
IGV4YW1wbGUpLiBIZW5jZSBpbiB0aGUgY2FzZSB0aGUgSU9NTVUgcGFnZQo+IHRhYmxlcyBhcmUg
c2hhcmVkIHdpdGggSEFQIHRoZSBwYWdlcyBtdXN0IGJlIGFkZGVkIHRvIHRoZSBwMm0uCgpUaGlz
IHdhc24ndCB3aGF0IEknbSBhZnRlciwgd2hpbGUgLi4uCgo+IEkgY291bGQgc3dpdGNoIHRoaXMg
dG8gdXNlIHNldF9pZGVudGl0eV9wMm1fZW50cnkgaWYgdGhlIGd1ZXN0IGlzCj4gYXV0by10cmFu
c2xhdGVkIGFuZCBvbmx5IHVzZSBpb21tdV9tYXBfcGFnZSBmb3Igbm9uLWF1dG90cmFuc2xhdGVk
Cj4gZ3Vlc3RzLgoKLi4uLiBpbmRlZWQgdGhpcyBpcyB3aGF0IEkgd291bGQgcHJlZmVyICh1bmxl
c3MgdGhlcmUgYSByZWFzb25zCmZvciBub3QgZG9pbmcgc28pLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
