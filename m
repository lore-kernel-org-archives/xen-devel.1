From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 7/9] xen: Convert is_xen_heap_mfn
 to use typesafe MFN
Date: Wed, 13 Mar 2019 09:04:31 -0600
Message-ID: <5C891BFF020000780021E35F@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-8-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GbKp=RQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h45Qq-00034X-2s
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 15:04:36 +0000
In-Reply-To: <20190218113600.9540-8-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAyLjE5IGF0IDEyOjM1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAt
NDMwMCw3ICs0MzAwLDggQEAgaW50IHhlbm1lbV9hZGRfdG9fcGh5c21hcF9vbmUoCj4gIHsKPiAg
ICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UgPSBOVUxMOwo+ICAgICAgdW5zaWduZWQgbG9uZyBn
Zm4gPSAwOyAvKiBnY2MgLi4uICovCj4gLSAgICB1bnNpZ25lZCBsb25nIHByZXZfbWZuLCBvbGRf
Z3BmbjsKPiArICAgIG1mbl90IHByZXZfbWZuOwo+ICsgICAgdW5zaWduZWQgbG9uZyBvbGRfZ3Bm
bjsKClBsZWFzZSBjYW4geW91IHB1dCB0aGlzIHRvZ2V0aGVyIHdpdGggImdmbiI/Cgo+IC0tLSBh
L3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMK
PiBAQCAtMjEyMSw5ICsyMTIxLDkgQEAgdm9pZCBpbml0X3hlbmhlYXBfcGFnZXMocGFkZHJfdCBw
cywgcGFkZHJfdCBwZSkKPiAgICAgICAqIFl1ayEgRW5zdXJlIHRoZXJlIGlzIGEgb25lLXBhZ2Ug
YnVmZmVyIGJldHdlZW4gWGVuIGFuZCBEb20gem9uZXMsIHRvCj4gICAgICAgKiBwcmV2ZW50IG1l
cmdpbmcgb2YgcG93ZXItb2YtdHdvIGJsb2NrcyBhY3Jvc3MgdGhlIHpvbmUgYm91bmRhcnkuCj4g
ICAgICAgKi8KPiAtICAgIGlmICggcHMgJiYgIWlzX3hlbl9oZWFwX21mbihwYWRkcl90b19wZm4o
cHMpLTEpICkKPiArICAgIGlmICggcHMgJiYgIWlzX3hlbl9oZWFwX21mbihfbWZuKHBhZGRyX3Rv
X3BmbihwcyktMSkpICkKClBsZWFzZSBhZGQgdGhlIG1pc3NpbmcgYmxhbmtzIGFyb3VuZCAtIGF0
IHRoZSBzYW1lIHRpbWUuCgo+ICAgICAgICAgIHBzICs9IFBBR0VfU0laRTsKPiAtICAgIGlmICgg
IWlzX3hlbl9oZWFwX21mbihwYWRkcl90b19wZm4ocGUpKSApCj4gKyAgICBpZiAoICFpc194ZW5f
aGVhcF9tZm4obWFkZHJfdG9fbWZuKHBlKSkgKQoKV2h5IG1hZGRyX3RvX21mbigpIGhlcmUgYnV0
IHN0aWxsIHBhZGRyX3RvX3BmbigpIGFib3ZlPyBPaCwKd2UgZG9uJ3QgaGF2ZSBhbnkgbWZuX3N1
YigpLCBJIHNlZS4KCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4gQEAgLTI3OCw3ICsyNzgsNyBAQCBzdHJ1Y3QgcGFnZV9p
bmZvCj4gIAo+ICAjZGVmaW5lIGlzX3hlbl9oZWFwX3BhZ2UocGFnZSkgKChwYWdlKS0+Y291bnRf
aW5mbyAmIFBHQ194ZW5faGVhcCkKPiAgI2RlZmluZSBpc194ZW5faGVhcF9tZm4obWZuKSBcCj4g
LSAgICAoX19tZm5fdmFsaWQobWZuKSAmJiBpc194ZW5faGVhcF9wYWdlKG1mbl90b19wYWdlKF9t
Zm4obWZuKSkpKQo+ICsgICAgKF9fbWZuX3ZhbGlkKG1mbl94KG1mbikpICYmIGlzX3hlbl9oZWFw
X3BhZ2UobWZuX3RvX3BhZ2UobWZuKSkpCgpQbGVhc2UgZG9uJ3Qgb3BlbiBjb2RlIG1mbl92YWxp
ZCgpLgoKV2l0aCB0aGVzZSBtaW5vciBpc3N1ZXMgdGFrZW4gY2FyZSBvZgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
