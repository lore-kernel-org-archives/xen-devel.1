From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] x86: improve vCPU selection in
 pagetable_dying()
Date: Tue, 18 Sep 2018 06:44:35 -0600
Message-ID: <5BA0F33302000078001E9717@prv1-mh.provo.novell.com>
References: <5B96796B02000078001E6CF4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2FMu-0006C2-6J
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 12:44:40 +0000
In-Reply-To: <5B96796B02000078001E6CF4@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <George.Dunlap@eu.citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA5LjE4IGF0IDE2OjAyLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IFJh
dGhlciB0aGFuIHVuY29uZGl0aW9uYWxseSB1c2luZyB2Q1BVIDAsIHVzZSB0aGUgY3VycmVudCB2
Q1BVIGlmIHRoZQo+IHN1YmplY3QgZG9tYWluIGlzIHRoZSBjdXJyZW50IG9uZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gLS0tIGEveGVu
L2FyY2gveDg2L21tL3BhZ2luZy5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jCj4g
QEAgLTg1OCw3ICs4NTgsNyBAQCB2b2lkIHBhZ2V0YWJsZV9keWluZyhzdHJ1Y3QgZG9tYWluICpk
LCBwCj4gIAo+ICAgICAgQVNTRVJUKHBhZ2luZ19tb2RlX3NoYWRvdyhkKSk7Cj4gIAo+IC0gICAg
diA9IGQtPnZjcHVbMF07Cj4gKyAgICB2ID0gKGQgPT0gY3VycmVudC0+ZG9tYWluKSA/IGN1cnJl
bnQgOiBkLT52Y3B1WzBdOwo+ICAgICAgdi0+YXJjaC5wYWdpbmcubW9kZS0+c2hhZG93LnBhZ2V0
YWJsZV9keWluZyh2LCBncGEpOwo+ICAjZWxzZQo+ICAgICAgQlVHKCk7CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
