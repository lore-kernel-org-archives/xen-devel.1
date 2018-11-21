From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V8 4/7] x86/p2m: refactor p2m_reset_altp2m()
Date: Wed, 21 Nov 2018 03:49:41 -0700
Message-ID: <5BF5384502000078001FE654@prv1-mh.provo.novell.com>
References: <1542795594-4252-1-git-send-email-rcojocaru@bitdefender.com>
 <1542795594-4252-5-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ffyj=oa=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPQ4o-0004pD-PZ
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 10:49:46 +0000
In-Reply-To: <1542795594-4252-5-git-send-email-rcojocaru@bitdefender.com>
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
dGU6Cj4gUmVmYWN0b3IgcDJtX3Jlc2V0X2FsdHAybSgpIHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQg
dG8gcmVtb3ZlCj4gcmVkdW5kYW50IGNvZGVwYXRocywgZml4aW5nIHRoZSBsb2NraW5nIHdoaWxl
IHdlJ3JlIGF0IGl0LgoKU3RpbGwgbm8gd29yZCBhYm91dCAuLi4KCj4gK3N0YXRpYyB2b2lkIHAy
bV9yZXNldF9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIGFsdHAybV9yZXNldF90eXBlIHJlc2V0X3R5
cGUpCj4gK3sKPiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm07Cj4gKwo+ICsgICAgQVNTRVJU
KGlkeCA8IE1BWF9BTFRQMk0pOwo+ICsgICAgcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2lkeF07
Cj4gKwo+ICsgICAgcDJtX2xvY2socDJtKTsKPiArCj4gKyAgICBwMm1fZmx1c2hfdGFibGVfbG9j
a2VkKHAybSk7Cj4gKwo+ICsgICAgaWYgKCByZXNldF90eXBlID09IEFMVFAyTV9ERUFDVElWQVRF
ICkKPiArICAgICAgICBwMm1fZnJlZV9sb2dkaXJ0eShwMm0pOwo+ICsKPiArICAgIC8qIFVuaW5p
dCBhbmQgcmVpbml0IGVwdCB0byBmb3JjZSBUTEIgc2hvb3Rkb3duICovCj4gKyAgICBlcHRfcDJt
X3VuaW5pdChwMm0pOwo+ICsgICAgZXB0X3AybV9pbml0KHAybSk7Cj4gKwo+ICsgICAgcDJtLT5t
aW5fcmVtYXBwZWRfZ2ZuID0gZ2ZuX3goSU5WQUxJRF9HRk4pOwo+ICsgICAgcDJtLT5tYXhfcmVt
YXBwZWRfZ2ZuID0gMDsKCi4uLiB0aGVzZSBub3cgZG9uZSBldmVuIHdoZW4gcHJldmlvdXNseSB0
aGV5IHdlcmVuJ3Q/IEluIGZhY3QsCmhhdmluZyBsb29rZWQgYWdhaW4sIGl0IHNlZW1zIGFzIGlm
IHRoZWlyIG9taXNzaW9uIGZyb20gZS5nLgpwMm1fZmx1c2hfYWx0cDJtKCkgd2FzIGEgbWlzdGFr
ZSBiZWZvcmUsIHdoaWNoIHlvdSBub3cgZml4LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
