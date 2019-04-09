From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC 31/55] efi: add emacs block to boot.c
Date: Tue, 9 Apr 2019 13:23:05 +0100
Message-ID: <20190409122305.GA30543@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-32-wei.liu2@citrix.com>
 <1552943681.6788.105.camel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpmQ-0008NO-AJ
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:23:10 +0000
Content-Disposition: inline
In-Reply-To: <1552943681.6788.105.camel@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Nuernberger, Stefan" <snu@amazon.de>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDk6MTQ6NDFQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDItMDcgYXQgMTY6NDQgKzAwMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+
ID4gLS0tCj4gPiDCoHhlbi9jb21tb24vZWZpL2Jvb3QuYyB8IDEwICsrKysrKysrKysKPiA+IMKg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24vZWZpL2Jvb3QuYyBiL3hlbi9jb21tb24vZWZpL2Jvb3QuYwo+ID4gaW5kZXggMWQx
NDIwZjAyYy4uMzg2ODI5M2QwNiAxMDA2NDQKPiA+IC0tLSBhL3hlbi9jb21tb24vZWZpL2Jvb3Qu
Ywo+ID4gKysrIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jCj4gPiBAQCAtMTcwNSwzICsxNzA1LDEz
IEBAIHZvaWQgX19pbml0IGVmaV9pbml0X21lbW9yeSh2b2lkKQo+ID4gwqAjZW5kaWYKPiA+IMKg
fQo+ID4gwqAjZW5kaWYKPiA+ICsKPiA+ICsvKgo+ID4gKyAqIExvY2FsIHZhcmlhYmxlczoKPiA+
ICsgKiBtb2RlOiBDCj4gPiArICogYy1maWxlLXN0eWxlOiAiQlNEIgo+ID4gKyAqIGMtYmFzaWMt
b2Zmc2V0OiA0Cj4gPiArICogdGFiLXdpZHRoOiA0Cj4gPiArICogaW5kZW50LXRhYnMtbW9kZTog
bmlsCj4gPiArICogRW5kOgo+ID4gKyAqLwo+IAo+IE5vdCByZWxldmFudCB0byB0aGUgcGF0Y2gg
c2VyaWVzLiBXaGF0J3MgdGhlIHVwc3RyZWFtIHBvc2l0aW9uIG9uIHRoZXNlCj4gY2hhbmdlcz8g
U2hvdWxkIHRoZXkgYmUgaW50cm9kdWNlZCBpbiBzZXBhcmF0ZSAnY2xlYW51cCcgc2VyaWVzIG9y
IGlzCj4gaXQgY29tbW9uIHRvIGluY2x1ZGUgdGhhdCBhcyBwYXJ0IG9mIHVucmVsYXRlZCBmdW5j
dGlvbmFsIGNoYW5nZQo+IHNlcmllcz8gSSBwZXJzb25hbGx5IGRvbid0IG1pbmQgZWl0aGVyIHdh
eS4gKEFuZCBzYW1lIGFwcGxpZXMgdG8gdGhlCj4gb3RoZXIgZW1hY3MgYmxvY2sgY29tbWl0IGlu
IHRoZSBzZXJpZXMsIG9mIGNvdXJzZS4pCj4gCgpJIG5vcm1hbGx5IGRvIGNsZWFudXBzIGFzIEkg
Y2hhbmdlIGV4aXN0aW5nIGNvZGUgdG8gYXZvaWQgdG9vIG11Y2ggY29kZQpjaHVybiBpbiBvbmUg
Z28uCgpXZWkuCgo+IC0gU3RlZmFuCj4gCj4gCj4gCj4gCj4gQW1hem9uIERldmVsb3BtZW50IENl
bnRlciBHZXJtYW55IEdtYkgKPiBLcmF1c2Vuc3RyLiAzOAo+IDEwMTE3IEJlcmxpbgo+IEdlc2No
YWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCj4gVXN0LUlE
OiBERSAyODkgMjM3IDg3OQo+IEVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5i
dXJnIEhSQiAxNDkxNzMgQgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
