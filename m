From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/2] x86/e820: fix build with gcc9
Date: Thu, 7 Mar 2019 10:55:34 +0000
Message-ID: <20190307105534.42f4byw4l3k4cu65@zion.uk.xensource.com>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
 <5C80F30F020000780021C623@prv1-mh.provo.novell.com>
 <20190307104608.dsexwz7dn6qceel7@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4dte=RK=citrix.com=prvs=962e1a8a8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h1qgi-0002YT-R4
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 10:55:44 +0000
Content-Disposition: inline
In-Reply-To: <20190307104608.dsexwz7dn6qceel7@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Charles Arnold <CARNOLD@suse.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMTE6NDY6MDhBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIE1hciAwNywgMjAxOSBhdCAwMzozMTo0M0FNIC0wNzAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+IGU4MjAuYzogSW4gZnVuY3Rpb24g4oCYY2xpcF90b19saW1pdOKA
mToKPiA+IC4uLi94ZW4vaW5jbHVkZS9hc20vc3RyaW5nLmg6MTA6MjY6IGVycm9yOiDigJhfX2J1
aWx0aW5fbWVtbW92ZeKAmSBvZmZzZXQgWy0xNiwgLTM2XSBpcyBvdXQgb2YgdGhlIGJvdW5kcyBb
MCwgMjA0ODRdIG9mCj4gPiBvYmplY3Qg4oCYZTgyMOKAmSB3aXRoIHR5cGUg4oCYc3RydWN0IGU4
MjBtYXDigJkgWy1XZXJyb3I9YXJyYXktYm91bmRzXQo+ID4gICAgMTAgfCAjZGVmaW5lIG1lbW1v
dmUoZCwgcywgbikgX19idWlsdGluX21lbW1vdmUoZCwgcywgbikKPiA+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiBlODIwLmM6
NDA0OjEzOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYbWVtbW92ZeKAmQo+ID4gICA0
MDQgfCAgICAgICAgICAgICBtZW1tb3ZlKCZlODIwLm1hcFtpXSwgJmU4MjAubWFwW2krMV0sCj4g
PiAgICAgICB8ICAgICAgICAgICAgIF5+fn5+fn4KPiA+IGU4MjAuYzozNjoxNjogbm90ZTog4oCY
ZTgyMOKAmSBkZWNsYXJlZCBoZXJlCj4gPiAgICAzNiB8IHN0cnVjdCBlODIwbWFwIGU4MjA7Cj4g
PiAgICAgICB8ICAgICAgICAgICAgICAgIF5+fn4KPiA+IAo+ID4gV2hpbGUgSSBjYW4ndCBzZWUg
d2hlcmUgdGhlIG5lZ2F0aXZlIG9mZnNldHMgd291bGQgY29tZSBmcm9tLCBjb252ZXJ0aW5nCj4g
PiB0aGUgbG9vcCBpbmRleCB0byB1bnNpZ25lZCB0eXBlIGhlbHBzLiBUYWtlIHRoZSBvcHBvcnR1
bml0eSBhbmQgYWxzbwo+ID4gY29udmVydCBzZXZlcmFsIG90aGVyIGxvY2FsIHZhcmlhYmxlcyBh
bmQgY29weV9lODIwX21hcCgpJ3Mgc2Vjb25kCj4gPiBwYXJhbWV0ZXIgdG8gdW5zaWduZWQgaW50
IChhbmQgYm9vbCBpbiBvbmUgY2FzZSkuCj4gCj4gSSBhbHNvIGNhbm5vdCBzZWUgaG93IHlvdSBj
YW4gZW5kIHVwIHdpdGggbmVnYXRpdmUgb2Zmc2V0cywgYnV0Cj4gY2hhbmdpbmcgdG8gdW5zaWdu
ZWQgaW50IGlzIGRlZmluaXRlbHkgYW5kIGltcHJvdmVtZW50IElNTy4KCkdjYyBpcyBiZWNvbWlu
ZyBtb3JlIGFuZCBtb3JlIGFnZ3Jlc3NpdmUgaW4gaW5mZXJyaW5nIHdoYXQgeW91IG1lYW4gd2l0
aAp5b3VyIGNvZGUuIFRoZXJlIGFyZSBkZWZpbml0ZWx5IGJ1Z3MgaW4gdGhhdCBhcmVhLgoKVGhp
cyBvbmUgY29tZXMgdG8gbWluZDoKaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1
Zy5jZ2k/aWQ9ODY4MjcKCkFsdGhvdWdoIEknbSBub3Qgc3VyZSBpZiAtV2FycmF5LWJvdW5kcyBp
cyB0aGUgY3VscHJpdCBpbiB0aGlzIGNhc2UuCgo+IAo+ID4gUmVwb3J0ZWQtYnk6IENoYXJsZXMg
QXJub2xkIDxjYXJub2xkQHN1c2UuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
