From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 08/32] libxl: Add
 libxl__prepare_sockaddr_un() helper
Date: Thu, 2 Aug 2018 10:36:16 +0200
Message-ID: <20180802083616.fzw6wcohwcsg6qrl@mac>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-9-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=os/m=kr=citrix.com=prvs=7454c2131=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fl95u-00067u-T0
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 08:36:26 +0000
Content-Disposition: inline
In-Reply-To: <20180727140614.13256-9-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdWwgMjcsIDIwMTggYXQgMDM6MDU6NTBQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhlcmUgaXMgZ29pbmcgdG8gYmUgYSBmZXcgbW9yZSB1c2VycyB0aGF0IHdhbnQg
dG8gdXNlIFVOSVggc29ja2V0LCB0aGlzCj4gaGVscGVyIGlzIHRvIHByZXBhcmUgdGhlIGBzdHJ1
Y3Qgc29ja2FkZHJfdW5gIGFuZCBjaGVjayB0aGF0IHRoZSBwYXRoCj4gaXNuJ3QgdG9vIGxvbmcu
Cj4gCj4gQWxzbyBzdGFydCB0byB1c2UgaXQgaW4gbGlieGxfcW1wLmMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpSZXZpZXdl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpMR1RNLCBqdXN0
IG9uZSBzdHlsZSBuaXQuCgo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF91dGlscy5j
IGIvdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYwo+IGluZGV4IDUwN2VlNTZjN2MuLjc5MDdlMjA2
NzIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYwo+ICsrKyBiL3Rvb2xz
L2xpYnhsL2xpYnhsX3V0aWxzLmMKPiBAQCAtMTIzNCw2ICsxMjM0LDIwIEBAIGludCBsaWJ4bF9f
cmFuZG9tX2J5dGVzKGxpYnhsX19nYyAqZ2MsIHVpbnQ4X3QgKmJ1Ziwgc2l6ZV90IGxlbikKPiAg
ICAgIHJldHVybiByZXQ7Cj4gIH0KPiAgCj4gK2ludCBsaWJ4bF9fcHJlcGFyZV9zb2NrYWRkcl91
bihsaWJ4bF9fZ2MgKmdjLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHNvY2thZGRyX3VuICp1biwgY29uc3QgY2hhciAqcGF0aCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IGNoYXIgKndoYXQpIHsKClRoZSBicmFjZSBzaG91bGQgYmUgb24g
YSBuZXdsaW5lIGFjY29yZGluZyB0byB0aGUgY29kaW5nIHN0eWxlLgoKVGhhbmtzLCBSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
