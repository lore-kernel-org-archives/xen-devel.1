From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 02/11] vpci/msix: add lock to protect the
 list of MSIX regions
Date: Wed, 26 Sep 2018 04:42:49 -0600
Message-ID: <5BAB62A902000078001EC186@prv1-mh.provo.novell.com>
References: <20180717094830.54806-1-roger.pau@citrix.com>
 <20180717094830.54806-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=an3h=mi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g57HS-00085u-5K
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 10:42:54 +0000
In-Reply-To: <20180717094830.54806-3-roger.pau@citrix.com>
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

Pj4+IE9uIDE3LjA3LjE4IGF0IDExOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jCj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9t
c2l4LmMKPiBAQCAtMTQ4LDEwICsxNDgsMTEgQEAgc3RhdGljIHZvaWQgY29udHJvbF93cml0ZShj
b25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywKPiAgICAgICAgICBw
Y2lfY29uZl93cml0ZTE2KHBkZXYtPnNlZywgcGRldi0+YnVzLCBzbG90LCBmdW5jLCByZWcsIHZh
bCk7Cj4gIH0KPiAgCj4gLXN0YXRpYyBzdHJ1Y3QgdnBjaV9tc2l4ICptc2l4X2ZpbmQoY29uc3Qg
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBhZGRyKQo+ICtzdGF0aWMgc3RydWN0IHZw
Y2lfbXNpeCAqbXNpeF9maW5kKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgYWRkcikK
PiAgewo+ICAgICAgc3RydWN0IHZwY2lfbXNpeCAqbXNpeDsKPiAgCj4gKyAgICByZWFkX2xvY2so
JmQtPmFyY2guaHZtX2RvbWFpbi5tc2l4X2xvY2spOwo+ICAgICAgbGlzdF9mb3JfZWFjaF9lbnRy
eSAoIG1zaXgsICZkLT5hcmNoLmh2bV9kb21haW4ubXNpeF90YWJsZXMsIG5leHQgKQo+ICAgICAg
ewo+ICAgICAgICAgIGNvbnN0IHN0cnVjdCB2cGNpX2JhciAqYmFycyA9IG1zaXgtPnBkZXYtPnZw
Y2ktPmhlYWRlci5iYXJzOwo+IEBAIC0xNjAsOCArMTYxLDEyIEBAIHN0YXRpYyBzdHJ1Y3QgdnBj
aV9tc2l4ICptc2l4X2ZpbmQoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBh
ZGRyKQo+ICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRShtc2l4LT50YWJsZXMp
OyBpKysgKQo+ICAgICAgICAgICAgICBpZiAoIGJhcnNbbXNpeC0+dGFibGVzW2ldICYgUENJX01T
SVhfQklSTUFTS10uZW5hYmxlZCAmJgo+ICAgICAgICAgICAgICAgICAgIFZNU0lYX0FERFJfSU5f
UkFOR0UoYWRkciwgbXNpeC0+cGRldi0+dnBjaSwgaSkgKQo+ICsgICAgICAgICAgICB7Cj4gKyAg
ICAgICAgICAgICAgICByZWFkX3VubG9jaygmZC0+YXJjaC5odm1fZG9tYWluLm1zaXhfbG9jayk7
Cj4gICAgICAgICAgICAgICAgICByZXR1cm4gbXNpeDsKPiArICAgICAgICAgICAgfQo+ICAgICAg
fQo+ICsgICAgcmVhZF91bmxvY2soJmQtPmFyY2guaHZtX2RvbWFpbi5tc2l4X2xvY2spOwo+ICAK
PiAgICAgIHJldHVybiBOVUxMOwo+ICB9CgpEb24ndCB5b3UgcmF0aGVyIG5lZWQgdGhlIGNhbGxl
ciB0byBhY3F1aXJlIHRoZSBsb2NrLCBzbyB0aGF0IHRoZSByZXR1cm4KdmFsdWUgaXMgZ3VhcmFu
dGVlZCBub24tc3RhbGUgYnkgdGhlIHRpbWUgdGhlIGNhbGxlciBsb29rcyBhdCBpdD8KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
