From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 09/14] argo: implement the sendv op;
 evtchn: expose send_guest_global_virq
Date: Tue, 15 Jan 2019 09:10:41 -0700
Message-ID: <5C3E0601020000780020DF35@prv1-mh.provo.novell.com>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
 <1547544466-21135-10-git-send-email-christopher.w.clark@gmail.com>
 <20190115154929.m4vhdpokhn5mubbv@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s15q=PX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gjRIe-0002hp-B8
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 16:10:48 +0000
In-Reply-To: <20190115154929.m4vhdpokhn5mubbv@mac>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAxLjE5IGF0IDE2OjQ5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSmFuIDE1LCAyMDE5IGF0IDAxOjI3OjQxQU0gLTA4MDAsIENocmlzdG9waGVyIENs
YXJrIHdyb3RlOgo+PiArc3RhdGljIGludAo+PiArcGVuZGluZ19yZXF1ZXVlKGNvbnN0IHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCBhcmdvX3JpbmdfaW5mbyAqcmluZ19pbmZvLAo+PiArICAgICAg
ICAgICAgICAgIGRvbWlkX3Qgc3JjX2lkLCB1bnNpZ25lZCBpbnQgbGVuKQo+PiArewo+PiArICAg
IHN0cnVjdCBobGlzdF9ub2RlICpub2RlOwo+PiArICAgIHN0cnVjdCBwZW5kaW5nX2VudCAqZW50
Owo+PiArCj4+ICsgICAgQVNTRVJUKExPQ0tJTkdfTDMoZCwgcmluZ19pbmZvKSk7Cj4+ICsKPj4g
KyAgICBobGlzdF9mb3JfZWFjaF9lbnRyeShlbnQsIG5vZGUsICZyaW5nX2luZm8tPnBlbmRpbmcs
IG5vZGUpCj4+ICsgICAgewo+PiArICAgICAgICBpZiAoIGVudC0+ZG9tYWluX2lkID09IHNyY19p
ZCApCj4+ICsgICAgICAgIHsKPj4gKyAgICAgICAgICAgIC8qCj4+ICsgICAgICAgICAgICAgKiBS
ZXVzZSBhbiBleGlzdGluZyBxdWV1ZSBlbnRyeSBmb3IgYSBub3RpZmljYXRpb24gcmF0aGVyIHRo
YW4gYWRkCj4+ICsgICAgICAgICAgICAgKiBhbm90aGVyLiBJZiB0aGUgZXhpc3RpbmcgZW50cnkg
aXMgd2FpdGluZyBmb3IgYSBzbWFsbGVyIHNpemUgdGhhbgo+PiArICAgICAgICAgICAgICogdGhl
IGN1cnJlbnQgbWVzc2FnZSB0aGVuIGFkanVzdCB0aGUgcmVjb3JkIHRvIHdhaXQgZm9yIHRoZQo+
PiArICAgICAgICAgICAgICogY3VycmVudCAobGFyZ2VyKSBzaXplIHRvIGJlIGF2YWlsYWJsZSBi
ZWZvcmUgdHJpZ2dlcmluZyBhCj4+ICsgICAgICAgICAgICAgKiBub3RpZmljYXRpb24uCj4+ICsg
ICAgICAgICAgICAgKiBUaGlzIGFzc2lzdHMgdGhlIHdhaXRpbmcgc2VuZGVyIGJ5IGVuc3VyaW5n
IHRoYXQgd2hlbmV2ZXIgYQo+PiArICAgICAgICAgICAgICogbm90aWZpY2F0aW9uIGlzIHRyaWdn
ZXJlZCwgdGhlcmUgaXMgc3VmZmljaWVudCBzcGFjZSBhdmFpbGFibGUKPj4gKyAgICAgICAgICAg
ICAqIGZvciAoYXQgbGVhc3QpIGFueSBvbmUgb2YgdGhlIG1lc3NhZ2VzIGF3YWl0aW5nIHRyYW5z
bWlzc2lvbi4KPj4gKyAgICAgICAgICAgICAqLwo+PiArICAgICAgICAgICAgaWYgKCBlbnQtPmxl
biA8IGxlbiApCj4+ICsgICAgICAgICAgICAgICAgZW50LT5sZW4gPSBsZW47Cj4gCj4gTml0Ogo+
IAo+IGVudC0+bGVuID0gbWF4KGVudC0+bGVuLCBsZW4pOwoKSSBkb24ndCB0aGluayB1c2Ugb2Yg
bWF4KCkgc2hvdWxkIGJlIGEgcmVxdWlyZW1lbnQgaW4gY2FzZXMgd2hlcmUKb25lIG9mIHRoZSBp
dGVtcyBjb21wYXJlZCBpcyBhbHNvIHRoZSB2YWx1ZSB0byB1cGRhdGUuIEknbSBub3QKZXZlbiBj
b252aW5jZWQgaXQgaGVscHMgcmVhZGFiaWxpdHkgb2YgdGhlIHNvdXJjZXMsIGxldCBhbG9uZSB0
aGUKcXVhbGl0eSBvZiBnZW5lcmF0ZWQgY29kZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
