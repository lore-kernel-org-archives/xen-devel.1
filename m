From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 5/5] xen/keyhandler: Drop
 keyhandler_scratch
Date: Tue, 30 Oct 2018 15:46:23 +0000
Message-ID: <20181030154623.f6gwtwlgzgedwav6@zion.uk.xensource.com>
References: <1540213082-616-1-git-send-email-andrew.cooper3@citrix.com>
 <1540213082-616-6-git-send-email-andrew.cooper3@citrix.com>
 <5BD330DF02000078001F54B8@prv1-mh.provo.novell.com>
 <20181030153215.bssybxba5sc75qxj@zion.uk.xensource.com>
 <5BD87B6102000078001F6627@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5BD87B6102000078001F6627@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMzAsIDIwMTggYXQgMDk6NDA6MTdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMwLjEwLjE4IGF0IDE2OjMyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIE9jdCAyNiwgMjAxOCBhdCAwOToyMTowM0FNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMjIuMTAuMTggYXQgMTQ6NTgsIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPiA+PiA+IC0tLSBhL3hlbi9jb21tb24vZWZpL2Jvb3QuYwo+
ID4+ID4gKysrIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCj4gPj4gPiBAQCAtNDg3LDYgKzQ4Nyw3
IEBAIHN0YXRpYyBFRklfRklMRV9IQU5ETEUgX19pbml0IGdldF9wYXJlbnRfaGFuZGxlKEVGSV9M
T0FERURfSU1BR0UgKmxvYWRlZF9pbWFnZSwKPiA+PiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBDSEFSMTYgKipsZWFmKQo+ID4+ID4gIHsKPiA+PiA+
ICAgICAgc3RhdGljIEVGSV9HVUlEIF9faW5pdGRhdGEgZnNfcHJvdG9jb2wgPSBTSU1QTEVfRklM
RV9TWVNURU1fUFJPVE9DT0w7Cj4gPj4gPiArICAgIHN0YXRpYyBDSEFSMTYgX19pbml0ZGF0YSBi
dWZmZXJbMjU2XTsKPiA+PiAKPiA+PiBEaWQgeW91IGludGVudGlvbmFsbHkgaGFsdmUgdGhlIHNp
emUgb2YgdGhlIGJ1ZmZlcj8KPiA+IAo+ID4gCj4gPiBTZWVpbmcgdGhlIGxlbmd0aCBmaWVsZCBj
b25zaXN0cyBvZiB0d28gdWludDgsIHRoZSBtYXhpbXVtIGxlbmd0aCBvZiB0aGUKPiA+IHBhdGgg
aXMgMjU2Lgo+IAo+IFdpdGgKPiAKPiAjZGVmaW5lIERldmljZVBhdGhOb2RlTGVuZ3RoKGEpICAg
ICAoICgoYSktPkxlbmd0aFswXSkgfCAoKGEpLT5MZW5ndGhbMV0gPDwgOCkgKQo+IAo+IEknZCBy
YXRoZXIgc2F5IDY1NTM2LgoKWWVzIHlvdSdyZSByaWdodC4gQ2FuJ3QgZG8gY2FsY3VsYXRpb24g
d2hlbiBJJ20gaGF2aW5nIGEgY29sZC4gOi0oCkJ1dCBoYXZpbmcgNjU1MzYgaXMgdW5yZWFsaXN0
aWMuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
