From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 4/8] mm: introduce a helper to get the
 memory type of a page
Date: Fri, 17 Aug 2018 04:31:21 -0600
Message-ID: <5B76A3F902000078001DF595@prv1-mh.provo.novell.com>
References: <20180814134336.75539-1-roger.pau@citrix.com>
 <20180814134336.75539-5-roger.pau@citrix.com>
 <5B76A0BB02000078001DF53B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ndfk=la=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fqc2P-0006bi-3M
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 10:31:25 +0000
In-Reply-To: <5B76A0BB02000078001DF53B@prv1-mh.provo.novell.com>
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

Pj4+IE9uIDE3LjA4LjE4IGF0IDEyOjE3LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDE0LjA4LjE4IGF0IDE1OjQzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiAr
ICAgICAgICAgICAgc3dpdGNoICggZTgyMC5tYXBbaV0udHlwZSApCj4+ICsgICAgICAgICAgICB7
Cj4+ICsgICAgICAgICAgICBjYXNlIEU4MjBfUkFNOgo+PiArICAgICAgICAgICAgICAgIHJldHVy
biBSQU1fVFlQRV9DT05WRU5USU9OQUw7Cj4+ICsKPj4gKyAgICAgICAgICAgIGNhc2UgRTgyMF9S
RVNFUlZFRDoKPj4gKyAgICAgICAgICAgICAgICByZXR1cm4gUkFNX1RZUEVfUkVTRVJWRUQ7Cj4+
ICsKPj4gKyAgICAgICAgICAgIGNhc2UgRTgyMF9VTlVTQUJMRToKPj4gKyAgICAgICAgICAgICAg
ICByZXR1cm4gUkFNX1RZUEVfVU5VU0FCTEU7Cj4+ICsKPj4gKyAgICAgICAgICAgIGNhc2UgRTgy
MF9BQ1BJOgo+PiArICAgICAgICAgICAgY2FzZSBFODIwX05WUzoKPj4gKyAgICAgICAgICAgICAg
ICByZXR1cm4gUkFNX1RZUEVfQUNQSTsKPj4gKwo+PiArICAgICAgICAgICAgZGVmYXVsdDoKPj4g
KyAgICAgICAgICAgICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPj4gKyAgICAgICAgICAgICAg
ICByZXR1cm4gLTE7Cj4+ICsgICAgICAgICAgICB9Cj4+ICsgICAgfQo+PiArCj4+ICsgICAgcmV0
dXJuIC0xOwo+PiArfQo+IAo+IE9uZSBtb3JlIGNhc2UgdG8gY29uc2lkZXI6IFdoYXQgYWJvdXQg
YSBwYWdlIHBhcnQgb2Ygd2hpY2ggaXMKPiBhIGdpdmVuIHR5cGUsIGFuZCB0aGUgb3RoZXIgcGFy
dCBvZiB3aGljaCBpcyBzaW1wbHkgbWlzc2luZyBmcm9tCj4gdGhlIEU4MjAgdGFibGU/IEknbSB1
bmNlcnRhaW4gd2hldGhlciBpbiB0aGF0IGNhc2UgaXQgbWlnaHQgYmUgYQo+IGdvb2QgaWRlYSBp
biBnZW5lcmFsIHRvIHJlcG9ydCBpdCBhcyBoYXZpbmcgdGhlIGdpdmVuIHR5cGU7IGZvciB0aGUK
PiBzcGVjaWZpYyBwdXJwb3NlIHlvdSB3YW50IHRoZSBmdW5jdGlvbiBmb3IsIHRoYXQgd291bGQg
aW1vIGJlCj4gcXVpdGUgaGVscGZ1bC4KCkNvbnNpZGVyaW5nIFJBTV9UWVBFXyogYXJlIGJpdCBt
YXNrcyAtIHBlcmhhcHMgdGhlIGZ1bmN0aW9uCnNob3VsZCBPUiB0b2dldGhlciBhbGwgdHlwZXMg
Zm91bmQgZm9yIHRoZSByZXF1ZXN0ZWQgcGFnZSwgYW5kCmxldCB0aGUgY2FsbGVyIGdvIGZyb20g
dGhlcmU/IEFuZCB0byBhY2NvdW50IGZvciBteSBlYXJsaWVyIHJlbWFyaywKYWRkIGEgc2VwYXJh
dGUgUkFNX1RZUEVfVU5LTk9XTiAoYW5kIG5ldmVyIGhhdmUgdGhlIGZ1bmN0aW9uCnJldHVybiAt
MSBvciBzb21lIHN1Y2g7IGl0cyByZXR1cm4gdHlwZSB0aGVuIHdvdWxkIGJldHRlciBiZQp1bnNp
Z25lZCBpbnQpPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
