From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 20/32] libxl_qmp: Handle write to QMP
 socket
Date: Fri, 3 Aug 2018 17:50:33 +0100
Message-ID: <20180803165033.GK1327@perard.uk.xensource.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-21-anthony.perard@citrix.com>
 <20180802110213.g3sikn5ybs5bpqep@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cdu1=ks=citrix.com=prvs=746da072c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fldHh-0004U8-V9
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 16:50:37 +0000
Content-Disposition: inline
In-Reply-To: <20180802110213.g3sikn5ybs5bpqep@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMDIsIDIwMTggYXQgMDE6MDI6MTNQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEp1bCAyNywgMjAxOCBhdCAwMzowNjowMlBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IFRoZSBsaWJ4bF9fZXZfcW1wXyogd2lsbCBub3cgc2VuZCB0
aGUgY29tbWFuZCB0byBRRU1VIHdoZW4gdGhlIHNvY2tldCBpcwo+ID4gcmVhZHkgZm9yIHdyaXRl
cy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+IAo+ID4gK3N0YXRpYyBpbnQgcW1wX2V2X2NhbGxiYWNrX3dyaXRhYmxl
KGxpYnhsX19nYyAqZ2MsIGxpYnhsX19ldl9xbXAgKmV2LCBpbnQgZmQpCj4gPiArewo+ID4gKyAg
ICBpbnQgcmM7Cj4gPiArICAgIGNoYXIgKmJ1ZjsKPiA+ICsgICAgc2l6ZV90IGxlbjsKPiA+ICsg
ICAgaW50IGJ1Zl9mZCA9IC0xOwo+IAo+IEkgd291bGQgbmFtZSB0aGlzIHNlbmRfZmQuCgpJIHdv
bmRlciB3aHkgSSByZW5hbWVkIGl0IGJ1Zl9mZCAuLi4KSSdsbCBjaGFuZ2UgaXQgdG8gc2VuZF9m
ZC4KCj4gPiArCj4gPiArICAgIC8qIE5vIG5lZWQgdG8gY2FsbCBxbXBfZXZfY2FsbGJhY2tfd3Jp
dGFibGUgYWdhaW4sIGV2ZXJ5dGhpbmcgdGhhdCBuZWVkcyB0bwo+ID4gKyAgICAgKiBiZSBzZW5k
IGZvciBub3cgd2lsbCBiZSBpbiB0aGlzIGNhbGwuICovCj4gPiArICAgIGxpYnhsX19ldl9mZF9t
b2RpZnkoZ2MsICZldi0+cW1wX2VmZCwgZXYtPnFtcF9lZmQuZXZlbnRzICYgflBPTExPVVQpOwo+
IAo+IEkgdGhpbmsgeW91IGRvIHRoaXMgYmVjYXVzZSB5b3UgbmVlZCB0byB3YWl0IGZvciB0aGlz
IGNvbW1hbmQgdG8KPiBjb21wbGV0ZSBiZWZvcmUgcXVldWluZyBhbm90aGVyIGNvbW1hbmQ/CgpJ
dCdzIGFjdHVhbGx5IGJlY2F1c2UgdGhlcmUgaXMgbm8gcXVldWluZyB3aXRoIHRoaXMgQVBJLiBU
aGVyZSBpcyByZWFsbHkKbm90aGluZyBlbHNlIHRvIHNlbmQuIEEgdXNlciBvZiB0aGUgQVBJIG1p
Z2h0IHdhbnQgdG8gc2VuZCBzb21ldGhpbmcKZWxzZSwgYnV0IGluIHRoZSBtZWFudGltZSwgdGhl
cmUgaXMgbm90aGluZyB0byBzZW5kLgoKSWYgKGh5cG90aGV0aWNhbCkgdGhlcmUgd2VyZSBhIHF1
ZXVlLCBldmVyeXRoaW5nIGluIHRoZSBxdWV1ZSBjb3VsZCBiZQpzZW50LCB3aXRob3V0IHdhaXRp
bmcgZm9yIHFlbXUgdG8gcmVzcG9uZCwgYW5kIEkgd291bGQgdHVybiBvZiB0aGUKUE9MTE9VVCBi
aXQgb25seSB3aGVuIHRoZSBxdWV1ZSB3YXMgZW1wdHkuCgpUaGFua3MsCgotLSAKQW50aG9ueSBQ
RVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
