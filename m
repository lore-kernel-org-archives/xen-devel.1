From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V8 3/7] x86/p2m: allocate logdirty_ranges
 for altp2ms
Date: Wed, 21 Nov 2018 03:45:09 -0700
Message-ID: <5BF5373502000078001FE63C@prv1-mh.provo.novell.com>
References: <1542795594-4252-1-git-send-email-rcojocaru@bitdefender.com>
 <1542795594-4252-4-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ffyj=oa=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPQ0P-0004bS-GF
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 10:45:13 +0000
In-Reply-To: <1542795594-4252-4-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE4IGF0IDExOjE5LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gK3N0YXRpYyBpbnQgcDJtX2FjdGl2YXRlX2FsdHAybShzdHJ1Y3QgZG9tYWluICpkLCB1
bnNpZ25lZCBpbnQgaWR4KQo+ICt7Cj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaG9zdHAybSwg
KnAybTsKPiArICAgIGludCByYzsKPiArCj4gKyAgICBBU1NFUlQoaWR4IDwgTUFYX0FMVFAyTSk7
Cj4gKwo+ICsgICAgcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2lkeF07Cj4gKyAgICBob3N0cDJt
ID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+ICsKPiArICAgIHAybV9sb2NrKHAybSk7Cj4gKwo+ICsg
ICAgcmMgPSBwMm1faW5pdF9sb2dkaXJ0eShwMm0pOwo+ICsKPiArICAgIGlmICggcmMgKQo+ICsg
ICAgICAgIGdvdG8gb3V0Owo+ICsKPiArICAgIC8qIFRoZSBmb2xsb3dpbmcgaXMgcmVhbGx5IGp1
c3QgYSByYW5nZXNldCBjb3B5LiAqLwo+ICsgICAgcmMgPSByYW5nZXNldF9tZXJnZShwMm0tPmxv
Z2RpcnR5X3JhbmdlcywgaG9zdHAybS0+bG9nZGlydHlfcmFuZ2VzKTsKCklzIHAybSAhPSBob3N0
cDJtIGd1YXJhbnRlZWQgaGVyZSAocmVjYWxsaW5nIHRoZSBkaXNjdXNzaW9uIGFib3V0CmFycmF5
IHNsb3QgMCk/IFRoZSBmdW5jdGlvbiBtYXkgaGFwcGVuIHRvIHdvcmsgd2l0aCBib3RoIHJhbmdl
c2V0cwp0aGUgc2FtZSwgYnV0IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBndWFyYW50ZWVkLgoKPiAr
ICAgIGlmICggcmMgKQo+ICsgICAgewo+ICsgICAgICAgIHAybV9mcmVlX2xvZ2RpcnR5KHAybSk7
Cj4gKyAgICAgICAgZ290byBvdXQ7Cj4gKyAgICB9Cj4gKwo+ICsgICAgcDJtX2luaXRfYWx0cDJt
X2VwdChkLCBpZHgpOwo+ICsKPiArb3V0OgoKTGFiZWxzIGluZGVudGVkIGJ5IGF0IGxlYXN0IG9u
ZSBibGFuayBwbGVhc2UuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
