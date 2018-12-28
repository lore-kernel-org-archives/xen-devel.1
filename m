From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/4] x86/e820: assume memmap provided when
 booted as a Xen guest is correct
Date: Fri, 28 Dec 2018 12:23:26 +0100
Message-ID: <20181228112326.azwkjacdui6mciz7@mac>
References: <20181227155614.42292-1-roger.pau@citrix.com>
 <20181227155614.42292-4-roger.pau@citrix.com>
 <eb54ef71-4aaf-3792-89ff-4237304d38e2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SD/o=PF=citrix.com=prvs=893533f24=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gcqF3-0002oT-89
 for xen-devel@lists.xenproject.org; Fri, 28 Dec 2018 11:23:49 +0000
Content-Disposition: inline
In-Reply-To: <eb54ef71-4aaf-3792-89ff-4237304d38e2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@cirix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMjcsIDIwMTggYXQgMDk6MDM6MDBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNy8xMi8yMDE4IDE1OjU2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBU
aGlzIGltcGxpZXMgdGhlcmUncyBubyBuZWVkIHRvIGZvcmNlZnVsbHkgcmVzZXJ2ZSB0aGUgVkdB
IE1NSU8KPiA+IHJlZ2lvbiwgc2luY2UgdGhlIG1lbW9yeSBtYXAgcHJvdmlkZWQgd2lsbCBiZSBj
b3JyZWN0Lgo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpcml4LmNvbT4KPiA+IC0tLQo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiA+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
ID4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+ICB4ZW4vYXJj
aC94ODYvZTgyMC5jIHwgMTEgKysrKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvZTgyMC5jIGIveGVuL2FyY2gveDg2L2U4MjAuYwo+ID4gaW5kZXggN2M1Yjg1MTE4Zi4uNWU0
NmQ0ZWM1MyAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lODIwLmMKPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9lODIwLmMKPiA+IEBAIC01MzcsMTEgKzUzNywxMiBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgbWFjaGluZV9zcGVjaWZpY19tZW1vcnlfc2V0dXAoc3RydWN0IGU4MjBtYXAgKnJhdykK
PiA+ICAKPiA+ICAgICAgcmVzZXJ2ZV9kbWlfcmVnaW9uKCk7Cj4gPiAgCj4gPiAtICAgIC8qCj4g
PiAtICAgICAqIFNvbWUgQklPU2VzIGNsYWltIFJBTSBpbiB0aGUgNjQwayAtIDFNIHJlZ2lvbi4K
PiA+IC0gICAgICogTm90IHJpZ2h0LiBGaXggaXQgdXAuCj4gPiAtICAgICAqLwo+ID4gLSAgICBy
ZXNlcnZlX3ZnYV9yZWdpb24oKTsKPiA+ICsgICAgaWYgKCAheGVuX2d1ZXN0ICkKPiAKPiBIYXZp
bmcgdGhvdWdodCBvbiB0aGlzIHNvbWUgbW9yZSwgaG93IGFib3V0IHVzaW5nICFjcHVfaGFzX2h5
cGVydmlzb3IKPiBoZXJlP8KgIEJvb3RpbmcgUFZIIHVuZGVyIFhlbiBpc24ndCB0aGUgb25seSBj
YXNlIHdoZXJlIHdlIHdvbid0IGhhdmUgYQo+IGxlZ2FjeSBWR0EgcmFuZ2UuwqAgSHlwZXJWIGdl
bi0yIFZNcyBhcmUgdGhlIG5leHQgbW9zdCBvYnZpb3VzIGNhbmRpZGF0ZS4KCkkgdGhpbmsgaXQn
cyBPSyB0byBhc3N1bWUgdGhhdCB0aGUgbWVtb3J5IG1hcCBwcm92aWRlZCBieSBhbgpoeXBlcnZp
c29yIG11c3QgYmUgY29ycmVjdCwgbGV0IG1lIHNlbmQgdjIuCgpOb3RlIHRoYXQgYm9vdGluZyB0
aGUgWGVuIGtlcm5lbCB1bmRlciBIeXBlclYgZ2VuLTIgaXMgcXVpdGUKdHJpdmlhbCwgdGhlIG1h
aW4gcHJvYmxlbSBpcyBnZXR0aW5nIHRoZSBkb20wIGtlcm5lbCB0byB3b3JrIGluIFhlbiBQVgpt
b2RlIHdoaWxlIHVzaW5nIHRoZSBIeXBlclYgZXh0ZW5zaW9ucy4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
