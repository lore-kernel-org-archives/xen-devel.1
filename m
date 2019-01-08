From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/4] x86/shim: only mark special pages as
 RAM in pvshim mode
Date: Tue, 08 Jan 2019 02:00:34 -0700
Message-ID: <5C3466B2020000780020B31A@prv1-mh.provo.novell.com>
References: <20181228120404.50346-1-roger.pau@citrix.com>
 <20181228120404.50346-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4mQY=PQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggnFZ-0003ik-GG
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 09:00:41 +0000
In-Reply-To: <20181228120404.50346-5-roger.pau@citrix.com>
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

Pj4+IE9uIDI4LjEyLjE4IGF0IDEzOjA0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC0xMTMsNiArMTE1LDQ3IEBAIHVpbnQ2NF90IHB2X3NoaW1fbWVtKHVpbnQ2NF90IGF2YWls
KQo+ICAgICAgcmV0dXJuIHNoaW1fbnJwYWdlczsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgX19p
bml0IG1hcmtfcGZuX2FzX3JhbShzdHJ1Y3QgZTgyMG1hcCAqZTgyMCwgdWludDY0X3QgcGZuKQo+
ICt7Cj4gKyAgICBpZiAoICFlODIwX2FkZF9yYW5nZShlODIwLCBwZm4gPDwgUEFHRV9TSElGVCwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgIChwZm4gPDwgUEFHRV9TSElGVCkgKyBQQUdFX1NJ
WkUsIEU4MjBfUkFNKSApCj4gKyAgICAgICAgaWYgKCAhZTgyMF9jaGFuZ2VfcmFuZ2VfdHlwZShl
ODIwLCBwZm4gPDwgUEFHRV9TSElGVCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIChwZm4gPDwgUEFHRV9TSElGVCkgKyBQQUdFX1NJWkUsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBFODIwX1JFU0VSVkVELCBFODIwX1JBTSkgKQo+ICsgICAg
ICAgICAgICBwYW5pYygiVW5hYmxlIHRvIGFkZC9jaGFuZ2UgbWVtb3J5IHR5cGUgb2YgcGZuICUj
bHggdG8gUkFNXG4iLCBwZm4pOwoKV2hpbGUgZG9pbmcgdGhlIG1vdmUgaXQgd291bGQgaGF2ZSBi
ZWVuIG5pY2UgaWYgeW91IGZvbGRlZCB0aGUgdHdvCmlmKCktcy4gKEFyZ3VhYmx5IHBmbl90b19w
YWRkcigpIGNvdWxkIGFsc28gYmUgdXNlZCBoZXJlLikKCj4gK3ZvaWQgcHZfc2hpbV9maXh1cF9l
ODIwKHN0cnVjdCBlODIwbWFwICplODIwKQoKWW91J3ZlIGxvc3QgdGhlIF9faW5pdCBoZXJlLgoK
PiBAQCAtOTEsNiArOTMsMTYgQEAgc3RhdGljIGlubGluZSB1aW50NjRfdCBwdl9zaGltX21lbSh1
aW50NjRfdCBhdmFpbCkKPiAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwo+ICAgICAgcmV0dXJu
IDA7Cj4gIH0KPiArc3RhdGljIGlubGluZSB2b2lkIHB2X3NoaW1fZml4dXBfZTgyMChzdHJ1Y3Qg
ZTgyMG1hcCAqZTgyMCkKPiArewo+ICsgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gK30KPiAr
c3RhdGljIGlubGluZSBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fYmFkX3BhZ2UKPiArKnB2X3NoaW1f
cmVzZXJ2ZWRfcGFnZXModW5zaWduZWQgaW50ICpzKQoKSSBjYW4gc2VlIHdoeSB5b3Ugc3BsaXQg
dGhlIHByZXZpb3VzbHkgdG9vIGxvbmcgbGluZSwgYnV0IHN1cmVseSBpdApzaG91bGRuJ3QgYmUg
c3BsaXQgaW4gdGhlIG1pZGRsZSBvZiB0aGUgcmV0dXJuIHR5cGUuCgpJJ3ZlIHRha2VuIHRoZSBs
aWJlcnR5IGFuZCBtYWRlIGFsbCB0aHJlZSBtb2RpZmljYXRpb25zIGluIHByZXBhcmF0aW9uCmZv
ciBjb21taXR0aW5nLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
