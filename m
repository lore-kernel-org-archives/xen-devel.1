From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v8 3/9] xen/x86: support per-domain flag for
 xpti
Date: Wed, 18 Apr 2018 17:33:54 +0200
Message-ID: <499544e3-848e-09c4-568e-cd5f0c9f7bc8@suse.com>
References: <20180418083051.8334-1-jgross@suse.com>
 <20180418083051.8334-4-jgross@suse.com> <5AD7647502000078001BC6C8@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=v9n4=hh=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f8p5r-0003sC-72
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 15:33:59 +0000
In-Reply-To: <5AD7647502000078001BC6C8@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDQvMTggMTc6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE4LjA0LjE4IGF0
IDEwOjMwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L21t
L3NoYWRvdy9tdWx0aS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvbXVsdGkuYwo+
PiBAQCAtOTY3LDcgKzk2Nyw3IEBAIHN0YXRpYyBpbnQgc2hhZG93X3NldF9sNGUoc3RydWN0IGRv
bWFpbiAqZCwKPj4gICAgICAgICAgc2hfcHV0X3JlZihkLCBvc2wzbWZuLCBwYWRkcik7Cj4+ICAg
ICAgfQo+PiAgCj4+IC0gICAgaWYgKCAhY3B1X2hhc19ub194cHRpICkKPj4gKyAgICBpZiAoIGlz
X3B2X2RvbWFpbihkKSAmJiBkLT5hcmNoLnB2X2RvbWFpbi54cHRpICkKPj4gICAgICAgICAgLyoK
Pj4gICAgICAgICAgICogTGF6eSBmbHVzaGluZyBpcyBlbm91Z2g6IGVpdGhlciB3ZSBkbyBhIFRM
QiBmbHVzaCByaWdodCBhZnRlcndhcmRzCj4+ICAgICAgICAgICAqIHdoaWNoIHdpbGwgcGljayB1
cCB0aGUgbmV3IHJvb3QgcGFnZSB0YWJsZSBvbiBhbGwgYWZmZWN0ZWQgY3B1cwo+IAo+IEhvdyBj
b21lIHRoZSBpc19wdl9kb21haW4oKSBpcyBhcHBlYXJpbmcgb25seSBoZXJlPwoKSXQgaXMgbWFu
ZGF0b3J5IGZvciB0ZXN0aW5nIHRoZSBwZXItZG9tYWluIHhwdGkgZmxhZy4gSSBjb3VsZCBhZGQg
aXQgaW4KcGF0Y2ggMSBhbHJlYWR5IGlmIHlvdSBsaWtlIHRoYXQgYmV0dGVyLgoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
