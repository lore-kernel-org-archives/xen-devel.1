From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] build: remove shim related targets
Date: Tue, 20 Feb 2018 11:26:44 +0000
Message-ID: <20180220112644.ckwhclrdb2vokfv4@MacBook-Pro-de-Roger.local>
References: <5A8ADDCD02000078001A908E@prv-mh.provo.novell.com>
 <20180220082351.24967-1-roger.pau@citrix.com>
 <20180220111747.kjxvxiuqipjdbfcu@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6c15=fo=citrix.com=prvs=582a52a2f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eo64X-0001lT-Qr
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 11:26:57 +0000
Content-Disposition: inline
In-Reply-To: <20180220111747.kjxvxiuqipjdbfcu@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMTE6MTc6NDdBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIEZlYiAyMCwgMjAxOCBhdCAwODoyMzo1MUFNICswMDAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gPiBUaGVyZSdzIG5vIG5lZWQgdG8gaGF2ZSBzaGltIHNwZWNpZmljIHRhcmdl
dHMsIHNvIGp1c3QgdXNlIHRoZSByZWd1bGFyCj4gPiB4ZW4gbWFrZWZpbGUgdGFyZ2V0cyBpbiBv
cmRlciB0byBidWlsZCB0aGUgc2hpbSBiaW5hcnkuCj4gPiAKPiA+IFdoZW4gdGhlIHNoaW0gaXMg
YnVpbGQgYXMgcGFydCBvZiB0aGUgZmlybXdhcmUgZGlyZWN0b3J5IHVzZSB0aGUKPiA+IHhlbi1z
eW1zIGFzIHRoZSBzaGltIGJpbmFyeS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gPiBpbmRleCAzODkwOTYxMzlj
Li41NTYzYzgxM2RkIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gPiAr
KysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKPiA+IEBAIC03OCwxMiArNzgsMTIgQEAgZWZpLXkg
Oj0gJChzaGVsbCBpZiBbICEgLXIgJChCQVNFRElSKS9pbmNsdWRlL3hlbi9jb21waWxlLmggLW8g
XAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAtTyAkKEJBU0VESVIpL2luY2x1ZGUveGVuL2Nv
bXBpbGUuaCBdOyB0aGVuIFwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZWNobyAnJChU
QVJHRVQpLmVmaSc7IGZpKQo+ID4gIAo+ID4gLXNoaW0tJChDT05GSUdfUFZIX0dVRVNUKSA6PSAk
KFRBUkdFVCktc2hpbQo+ID4gLQo+ID4gIGlmbmVxICgkKGJ1aWxkX2lkX2xpbmtlciksKQo+ID4g
IG5vdGVzX3BoZHJzID0gLS1ub3Rlcwo+ID4gIGVsc2UKPiA+IC1ub3Rlc19waGRycyA9Cj4gPiAr
aWZlcSAoJChDT05GSUdfUFZIX0dVRVNUKSx5KQo+ID4gK25vdGVzX3BoZHJzID0gLS1ub3Rlcwo+
ID4gK2VuZGlmCj4gPiAgZW5kaWYKPiA+ICAKPiAKPiBUaGUgbWFudWFsIHN1Z2dlc3RzIGZvbGxv
d2luZyBzeW50YXggaXMgc3VwcG9ydGVkOgo+IAo+IAo+ICAgY29uZGl0aW9uYWwtZGlyZWN0aXZl
LW9uZQo+ICAgdGV4dC1pZi1vbmUtaXMtdHJ1ZQo+ICAgZWxzZSBjb25kaXRpb25hbC1kaXJlY3Rp
dmUtdHdvCj4gICB0ZXh0LWlmLXR3by1pcy10cnVlCj4gICBlbHNlCj4gICB0ZXh0LWlmLW9uZS1h
bmQtdHdvLWFyZS1mYWxzZQo+ICAgZW5kaWYKPiAKPiBJIHNsaWdodGx5IHByZWZlcgo+IAo+ICAg
IGlmbmVxIGJ1aWxkX2lkX2xpbmtlcgo+ICAgIG5vdGVzX3BoZHJzID0gLi4uCj4gICAgZWxzZSBp
ZiBDT05GSUdfUFZIX0dVRVNUCj4gICAgbm90ZXNfcGhkcnMgPSAuLi4KPiAgICBlbHNlCj4gICAg
bm90ZXNfcGhkcnMgPQo+ICAgIGVuZGlmCgpJcyB0aGlzIHN1cHBvcnRlZCBieSBtYWtlIDMuODA/
CgpKYW4gcG9pbnRlZCBvdXQgaW4gYW5vdGhlciB0aHJlYWQgdGhhdCB1c2luZyAiZWxzZSBpZiIg
b24gYSBzaW5nbGUKbGluZSBpcyBub3Qgc3VwcG9ydGVkIGJ5IDMuODA6CgpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMDIvbXNnMDE2NTku
aHRtbAoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
