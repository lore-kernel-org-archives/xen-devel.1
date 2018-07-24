From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 2/2] vhpet: add support for level
 triggered interrupts
Date: Tue, 24 Jul 2018 07:36:39 -0600
Message-ID: <5B572B6702000078001D7407@prv1-mh.provo.novell.com>
References: <20180717103854.55773-1-roger.pau@citrix.com>
 <20180717103854.55773-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vgmm=ki=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fhxUa-00074G-23
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 13:36:44 +0000
In-Reply-To: <20180717103854.55773-3-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefan Bader <stefan.bader@canonical.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA3LjE4IGF0IDEyOjM4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IExldmVsIHRyaWdnZXJlZCBpbnRlcnJ1cHRzIGFyZSBub3QgYW4gb3B0aW9uYWwgZmVhdHVyZSBv
ZiBIUEVULCBhbmQKPiBtdXN0IGJlIGltcGxlbWVudGVkIGluIG9yZGVyIHRvIGNvbXBseSB3aXRo
IHRoZSBIUEVUIHNwZWNpZmljYXRpb24uCj4gCj4gSW1wbGVtZW50IHRoZW0gYnkgYWRkaW5nIGEg
Y2FsbGJhY2sgdG8gdGhlIHRpbWVyIHdoaWNoIHNldHMgdGhlCj4gaW50ZXJydXB0IGJpdCBpbiB0
aGUgZ2VuZXJhbCBpbnRlcnJ1cHQgc3RhdHVzIHJlZ2lzdGVyLiBGdXJ0aGVyCj4gaW50ZXJydXB0
cyAoaW4gY2FzZSBvZiBwZXJpb2RpYyBtb2RlKSB3aWxsIG5vdCBiZSBpbmplY3RlZCB1bnRpbCB0
aGUKPiBiaXQgaXMgY2xlYXJlZC4KPiAKPiBJbiBvcmRlciB0byByZXNldCB0aGUgaW50ZXJydXB0
cyB3aGVuIHRoZSBzdGF0dXMgYml0IGlzIGNsZWFyIFhlbiBtdXN0Cj4gYWxzbyBkZXRlY3QgYWNj
ZXNzZXMgdG8gc3VjaCByZWdpc3Rlci4KPiAKPiBXaGlsZSB0aGVyZSBjb252ZXJ0IHRuIGFuZCBp
IGluIGhwZXRfd3JpdGUgdG8gdW5zaWduZWQuCj4gCj4gUmVwb3J0ZWQtYnk6IFN0ZWZhbiBCYWRl
ciA8c3RlZmFuLmJhZGVyQGNhbm9uaWNhbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
