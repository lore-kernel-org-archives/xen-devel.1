From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 01/11] vpci: introduce basic handlers to
 trap accesses to the PCI config space
Date: Fri, 23 Feb 2018 08:55:04 -0700
Message-ID: <5A90476802000078001AAFF1@prv-mh.provo.novell.com>
References: <20180123150735.74779-1-roger.pau@citrix.com>
 <20180123150735.74779-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwfe=fr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1epFgn-0005sq-MV
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 15:55:13 +0000
In-Reply-To: <20180123150735.74779-2-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAxLjE4IGF0IDE2OjA3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TIGIveGVuL2FyY2gvYXJtL3hlbi5s
ZHMuUwo+IGluZGV4IGM5Yjk1NDY0MzUuLjk4YjgyNjgwYzYgMTAwNjQ0Cj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL3hlbi5sZHMuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKPiBAQCAtNjUs
NiArNjUsMTMgQEAgU0VDVElPTlMKPiAgICAgICAgIF9fcGFyYW1fc3RhcnQgPSAuOwo+ICAgICAg
ICAgKiguZGF0YS5wYXJhbSkKPiAgICAgICAgIF9fcGFyYW1fZW5kID0gLjsKPiArCj4gKyNpZiBk
ZWZpbmVkKENPTkZJR19IQVNfUENJKSAmJiBkZWZpbmVkKENPTkZJR19MQVRFX0hXRE9NKQo+ICsg
ICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOwo+ICsgICAgICAgX19zdGFydF92cGNpX2Fy
cmF5ID0gLjsKPiArICAgICAgICooLmRhdGEudnBjaSkKPiArICAgICAgIF9fZW5kX3ZwY2lfYXJy
YXkgPSAuOwo+ICsjZW5kaWYKPiAgICB9IDp0ZXh0Cj4gIAo+ICAjaWYgZGVmaW5lZChCVUlMRF9J
RCkKPiBAQCAtMTczLDYgKzE4MCwxMyBAQCBTRUNUSU9OUwo+ICAgICAgICAgKiguaW5pdF9hcnJh
eSkKPiAgICAgICAgICooU09SVCguaW5pdF9hcnJheS4qKSkKPiAgICAgICAgIF9fY3RvcnNfZW5k
ID0gLjsKPiArCj4gKyNpZiBkZWZpbmVkKENPTkZJR19IQVNfUENJKSAmJiAhZGVmaW5lZChDT05G
SUdfTEFURV9IV0RPTSkKPiArICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsKPiArICAg
ICAgIF9fc3RhcnRfdnBjaV9hcnJheSA9IC47Cj4gKyAgICAgICAqKC5kYXRhLnZwY2kpCj4gKyAg
ICAgICBfX2VuZF92cGNpX2FycmF5ID0gLjsKPiArI2VuZGlmCj4gICAgfSA6dGV4dAo+ICAgIF9f
aW5pdF9lbmRfZWZpID0gLjsKPiAgICAuID0gQUxJR04oU1RBQ0tfU0laRSk7CgpTYWRseSB5b3Ug
Zm9yZ290IHRvIENjIHRoZSBBUk0gbWFpbnRhaW5lcnMuIFN0ZWZhbm8sIEp1bGllbiwgdGhlCmFi
b3ZlIHdvdWxkIHJlcXVpcmUgeW91ciBhY2suCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
