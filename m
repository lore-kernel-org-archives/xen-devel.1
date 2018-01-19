From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/9] x86/guest: clean up guest/xen.h
Date: Fri, 19 Jan 2018 12:22:48 +0000
Message-ID: <20180119122248.ecdxyzkyxqtgtjf5@citrix.com>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
 <20180118181652.26397-4-wei.liu2@citrix.com>
 <20180119102146.v5fjl5url2m4wh2p@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pswu=eo=citrix.com=prvs=5505d9d7e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecVhB-0002Rq-07
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 12:22:57 +0000
Content-Disposition: inline
In-Reply-To: <20180119102146.v5fjl5url2m4wh2p@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTksIDIwMTggYXQgMTA6MjE6NDZBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEphbiAxOCwgMjAxOCBhdCAwNjoxNjo0NlBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gUmVtb3ZlIGV4dHJhbmVvdXMgc2VtaWNvbG9uLiBBZGQgYmxhbmsgbGlu
ZXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+
Cj4gPiAtLS0KPiA+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiBDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIHhl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmggfCAxMiArKysrKysrKy0tLS0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaCBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QveGVuLmgKPiA+IGluZGV4IDExMjQzZmU2MGQuLjMxMzI2NDQyZjcgMTAwNjQ0
Cj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCj4gPiArKysgYi94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCj4gPiBAQCAtNDksNyArNDksOCBAQCBERUNMQVJF
X1BFUl9DUFUoc3RydWN0IHZjcHVfaW5mbyAqLCB2Y3B1X2luZm8pOwo+ID4gICNkZWZpbmUgeGVu
X2d1ZXN0IDAKPiA+ICAjZGVmaW5lIHB2X2NvbnNvbGUgMAo+ID4gIAo+ID4gLXN0YXRpYyBpbmxp
bmUgdm9pZCBwcm9iZV9oeXBlcnZpc29yKHZvaWQpIHt9Owo+ID4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBwcm9iZV9oeXBlcnZpc29yKHZvaWQpIHt9Cj4gPiArCj4gPiAgc3RhdGljIGlubGluZSB2b2lk
IGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKPiA+ICB7Cj4gPiAgICAgIEFTU0VSVF9VTlJFQUNIQUJM
RSgpOwo+ID4gQEAgLTYzLDIwICs2NCwyMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNv
cl9maXh1cF9lODIwKHN0cnVjdCBlODIwbWFwICplODIwKQo+ID4gIHsKPiA+ICAgICAgQVNTRVJU
X1VOUkVBQ0hBQkxFKCk7Cj4gPiAgfQo+ID4gKwo+ID4gIHN0YXRpYyBpbmxpbmUgY29uc3QgdW5z
aWduZWQgbG9uZyAqaHlwZXJ2aXNvcl9yZXNlcnZlZF9wYWdlcyh1bnNpZ25lZCBpbnQgKnNpemUp
Cj4gPiAgewo+ID4gICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPiA+ICAgICAgcmV0dXJuIE5V
TEw7Cj4gPiAtfTsKPiA+ICt9Cj4gPiArCj4gPiAgc3RhdGljIGlubGluZSB1aW50MzJfdCBoeXBl
cnZpc29yX2NwdWlkX2Jhc2Uodm9pZCkKPiA+ICB7Cj4gPiAgICAgIEFTU0VSVF9VTlJFQUNIQUJM
RSgpOwo+ID4gICAgICByZXR1cm4gMDsKPiA+IC19Owo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMg
aW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCkKPiA+ICB7Cj4gPiAgICAgIEFTU0VS
VF9VTlJFQUNIQUJMRSgpOwo+ID4gLX07Cj4gPiArfQo+IAo+IEFGQUlDVCBoeXBlcnZpc29yX2Nw
dWlkX2Jhc2UgYW5kIGh5cGVydmlzb3JfcmVzdW1lIGNvdWxkIGJlIHJlbW92ZWQsCj4gYmVjYXVz
ZSB0aG9zZSBhcmUgb25seSBjYWxsZWQgZnJvbSBzaGltIGNvZGUsIGFuZCBpdCdzIG5vdCBldmVu
Cj4gcG9zc2libGUgdG8gY29tcGlsZSB0aGUgc2hpbSBjb2RlIHdpdGhvdXQgaGF2aW5nIFhlbiBn
dWVzdCBzdXBwb3J0Cj4gZW5hYmxlZC4KClRoZXkgbmVlZCB0byBzdGF5LiBUaGlzIGhlYWRlciBp
cyBpbmNsdWRlZCBieSB0aGUgc2hpbSBjb2RlIGl0c2VsZi4KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
