From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/shadow: adjust minimum allocation
 calculations
Date: Wed, 6 Feb 2019 18:20:10 +0100
Message-ID: <20190206172010.hepzxaalpvwr37vh@mac>
References: <5C5ABD7102000078002143B1@prv1-mh.provo.novell.com>
 <20190206115205.3awoolhiqayqy46k@mac>
 <5C5AD8BC020000780021446B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eoF8=QN=citrix.com=prvs=93319c3d4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1grQsO-00087i-CX
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 17:20:44 +0000
Content-Disposition: inline
In-Reply-To: <5C5AD8BC020000780021446B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMDYsIDIwMTkgYXQgMDU6NTM6MTZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA2LjAyLjE5IGF0IDEyOjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBGZWIgMDYsIDIwMTkgYXQgMDM6NTY6NDlBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gQEAgLTEzNzMsOSArMTM3NywxNSBAQCBzdGF0aWMgdW5zaWduZWQg
aW50IHNoX21pbl9hbGxvY2F0aW9uKGNvCj4gPj4gIHsKPiA+PiAgICAgIC8qCj4gPj4gICAgICAg
KiBEb24ndCBhbGxvY2F0ZSBsZXNzIHRoYW4gdGhlIG1pbmltdW0gYWNjZXB0YWJsZSwgcGx1cyBv
bmUgcGFnZSBwZXIKPiA+PiAtICAgICAqIG1lZ2FieXRlIG9mIFJBTSAoZm9yIHRoZSBwMm0gdGFi
bGUpLgo+ID4+ICsgICAgICogbWVnYWJ5dGUgb2YgUkFNIChmb3IgdGhlIHAybSB0YWJsZSwgbWlu
aW1hbGx5IGVub3VnaCBmb3IgSFZNJ3Mgc2V0dGluZwo+ID4+ICsgICAgICogdXAgb2Ygc2xvdCB6
ZXJvIGFuZCBWTVgncyBzZXR0aW5nIHVwIG9mIHRoZSBMQVBJQyBwYWdlKSwgcGx1cyBvbmUgZm9y
Cj4gPj4gKyAgICAgKiBIVk0ncyAxLXRvLTEgcGFnZXRhYmxlLgo+ID4+ICAgICAgICovCj4gPj4g
LSAgICByZXR1cm4gc2hhZG93X21pbl9hY2NlcHRhYmxlX3BhZ2VzKGQpICsgKGQtPnRvdF9wYWdl
cyAvIDI1Nik7Cj4gPj4gKyAgICByZXR1cm4gc2hhZG93X21pbl9hY2NlcHRhYmxlX3BhZ2VzKGQp
ICsKPiA+PiArICAgICAgICAgICBtYXgoZC0+dG90X3BhZ2VzIC8gMjU2LAo+ID4+ICsgICAgICAg
ICAgICAgICBpc19odm1fZG9tYWluKGQpID8gQ09ORklHX1BBR0lOR19MRVZFTFMgKyAhIWNwdV9o
YXNfdm14ICogMgo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogMFUpICsK
PiA+PiArICAgICAgICAgICBpc19odm1fZG9tYWluKGQpOwo+ID4gCj4gPiBTaG91bGQgdGhlIGNh
bGwgdG8gc2hhZG93X3NldF9hbGxvY2F0aW9uIGJlIGNoYW5nZWQgc28gaXQgYXR0ZW1wdHMgdG8K
PiA+IGFsbG9jYXRlIHNoX21pbl9hbGxvY2F0aW9uKGQpICsgZC0+YXJjaC5wYWdpbmcuc2hhZG93
LnAybV9wYWdlcz8KPiA+IAo+ID4gSXQgc2VlbXMgYSBsaXR0bGUgbWlzbGVhZGluZyB0byBjaGVj
ayB3aGV0aGVyIHRoZXJlJ3MgYSBjZXJ0YWluIGFtb3VudAo+ID4gb2YgcGFnZXMgaW4gdGhlIHBv
b2wgKHNoX21pbl9hbGxvY2F0aW9uKGQpICsKPiA+IGQtPmFyY2gucGFnaW5nLnNoYWRvdy5wMm1f
cGFnZXMpIGFuZCB0aGVuIHNldCB0aGUgYWxsb2NhdGlvbiB0byA0TQo+ID4gdW5jb25kaXRpb25h
bGx5Lgo+IAo+IFdlbGwsIGFzIHNhaWQgaW4gdGhlIHBvc3QtY29tbWl0LW1lc3NhZ2UgcmVtYXJr
LCBJIHRoaW5rIHdlIHdhbnQgdG8KPiBnZXQgcmlkIG9mIHRoaXMsIGJ1dCBvbmx5IHdpdGggaXQg
cHJvcGVybHkgcmVwbGFjZWQgKHdoaWNoIHdvdWxkIGxpa2VseQo+IHJlcXVpcmUgaG9va2luZyBp
bnRvIHBhdGhzIGluY3JlYXNpbmcgZC0+dG90X3BhZ2VzKS4gUmlnaHQgbm93IGFsbAo+IHdlJ3Jl
IGFmdGVyIGlzIGRlYWxpbmcgd2l0aCB0aGUgcmVncmVzc2lvbi4KCkFjaywgd2l0aCB0aGUgY2hh
bmdlcyByZXF1ZXN0ZWQgYnkgQW5kcmV3OgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
