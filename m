From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
Date: Thu, 2 May 2019 13:59:55 +0100
Message-ID: <8300afef-e75e-1d81-83e4-7f020595f81a@citrix.com>
References: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Flb6=TC=citrix.com=prvs=018be947d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hMBJf-0000pm-Dx
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:59:59 +0000
In-Reply-To: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDUvMjAxOSAxMzoyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvcGNpLmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
Ywo+IEBAIC0xNDUwLDE3ICsxNDUwLDM2IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1
Y3QgZG9tYWluICoKPiAgICAgIGlmICggIWlvbW11X2VuYWJsZWQgfHwgIWhkLT5wbGF0Zm9ybV9v
cHMgKQo+ICAgICAgICAgIHJldHVybiAwOwo+ICAKPiAtICAgIC8qIFByZXZlbnQgZGV2aWNlIGFz
c2lnbiBpZiBtZW0gcGFnaW5nIG9yIG1lbSBzaGFyaW5nIGhhdmUgYmVlbiAKPiAtICAgICAqIGVu
YWJsZWQgZm9yIHRoaXMgZG9tYWluICovCj4gLSAgICBpZiAoIHVubGlrZWx5KGQtPmFyY2guaHZt
Lm1lbV9zaGFyaW5nX2VuYWJsZWQgfHwKPiAtICAgICAgICAgICAgICAgICAgdm1fZXZlbnRfY2hl
Y2tfcmluZyhkLT52bV9ldmVudF9wYWdpbmcpIHx8Cj4gKyAgICBkb21haW5fbG9jayhkKTsKPiAr
Cj4gKyAgICAvKgo+ICsgICAgICogUHJldmVudCBkZXZpY2UgYXNzaWdubWVudCBpZiBhbnkgb2YK
PiArICAgICAqIC0gbWVtIHBhZ2luZwo+ICsgICAgICogLSBtZW0gc2hhcmluZwo+ICsgICAgICog
LSB0aGUgcDJtX3JhbV9ybyB0eXBlCj4gKyAgICAgKiAtIGdsb2JhbCBsb2ctZGlydHkgbW9kZQoK
WGVuU2VydmVyIGhhcyB3b3JraW5nIGxpdmUgbWlncmF0aW9uIHdpdGggR1BVcywgd2hpY2ggdGhp
cyBjaGFuZ2Ugd291bGQKcmVncmVzcy4KCkJlaGluZCB0aGUgc2NlbmVzLCB3ZSBjb21iaW5lIFhl
bidzIGxvZ2RpcnR5IGJpdG1hcCB3aXRoIG9uZSBwcm92aWRlZCBieQp0aGUgR1BVLCB0byBlbnN1
cmUgdGhhdCBhbGwgZGlydHkgdXBkYXRlcyBhcmUgdHJhY2tlZC4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
