From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 19/32] libxl_qmp: Prepare the command to
 be sent
Date: Fri, 3 Aug 2018 17:35:38 +0100
Message-ID: <20180803163538.GJ1327@perard.uk.xensource.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-20-anthony.perard@citrix.com>
 <20180802104126.oxnqjyj62xfmze77@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cdu1=ks=citrix.com=prvs=746da072c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fld3H-00034m-CR
 for xen-devel@lists.xenproject.org; Fri, 03 Aug 2018 16:35:43 +0000
Content-Disposition: inline
In-Reply-To: <20180802104126.oxnqjyj62xfmze77@mac>
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

T24gVGh1LCBBdWcgMDIsIDIwMTggYXQgMTI6NDE6MjZQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEp1bCAyNywgMjAxOCBhdCAwMzowNjowMVBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IFRoZSBhY3R1YWwgc2VudCB3aWxsIGJlIGRvbmUgaW4gYSBz
ZXBhcmF0ZSBwYXRjaC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy9saWJ4bC9saWJ4bF9p
bnRlcm5hbC5oIHwgIDQgKysrKwo+ID4gIHRvb2xzL2xpYnhsL2xpYnhsX3FtcC5jICAgICAgfCAz
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQxIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCj4gPiBpbmRleCA3
ZjIwMGU3YTQ2Li4xMTBiOTUxYmJlIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxf
aW50ZXJuYWwuaAo+ID4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAo+ID4gQEAg
LTQzOCw2ICs0MzgsNyBAQCBzdHJ1Y3QgbGlieGxfX2V2X3FtcCB7Cj4gPiAgICAgIGxpYnhsX19j
YXJlZmQgKnFtcF9jZmQ7Cj4gPiAgICAgIGxpYnhsX19ldl9mZCBxbXBfZWZkOwo+ID4gICAgICBs
aWJ4bF9fcW1wX3N0YXRlIHFtcF9zdGF0ZTsKPiA+ICsgICAgdW5zaWduZWQgaW50IGxhc3RfaWRf
dXNlZDsKPiAKPiBOb3cgdGhlcmUgYXJlIHR3byBsYXN0X2lkX3VzZWQgZmllbGRzIGluIGRpZmZl
cmVudCBzdHJ1Y3R1cmVzPwo+IFNob3VsZG4ndCB0aGUgcHJldmlvdXMgb25lIGJlIHJlbW92ZWQg
d2hlbiB5b3UgaW50cm9kdWNlIHRoaXMgbmV3IG9uZT8KClNvcnJ5IGZvciB0aGUgY29uZnVzaW9u
LCBJJ20gbWFraW5nIG1vZGlmaWNhdGlvbiB0byB0aGUgY3VycmVudCBxbXAKZW5naW5lIGluIG9y
ZGVyIHRvIHJldXNlIHBhcnQgdGhhdCBjYW4gYmUgcmV1c2UgaW4gdGhlIG5ldywgYmV0dGVyIG9u
ZS4KVGhpcyBpcyB3aHkgdGhlcmUncyB0d28gbGFzdF9pZF91c2VkLCBvbmUgZm9yIHRoZSBjdXJy
ZW50CmltcGxlbWVudGF0aW9uLCBhbmQgb25lIGZvciB0aGUgbmV3IG9uZSwgbGlieGxfX2V2X3Ft
cC4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
