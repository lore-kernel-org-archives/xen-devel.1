From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v11 6/9] xen/common: use DECLARE_BOUNDS as
 required
Date: Wed, 6 Mar 2019 13:08:18 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1903061307350.17248@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-6-git-send-email-sstabellini@kernel.org>
 <5C7FE93D020000780021C2DA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+lMa=RJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1h1dm1-0005fn-1C
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 21:08:21 +0000
In-Reply-To: <5C7FE93D020000780021C2DA@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, ian.jackson@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCA2IE1hciAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDUuMDMuMTkg
YXQgMjM6MzgsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IC0tLSBhL3hlbi9j
b21tb24va2VybmVsLmMKPiA+ICsrKyBiL3hlbi9jb21tb24va2VybmVsLmMKPiA+IEBAIC0zMDYs
MjAgKzMwNiwyNSBAQCB2b2lkIGFkZF90YWludCh1bnNpZ25lZCBpbnQgZmxhZykKPiA+ICAgICAg
dGFpbnRlZCB8PSBmbGFnOwo+ID4gIH0KPiA+ICAKPiA+IC1leHRlcm4gY29uc3QgaW5pdGNhbGxf
dCBfX2luaXRjYWxsX3N0YXJ0W10sIF9fcHJlc21wX2luaXRjYWxsX2VuZFtdLAo+ID4gLSAgICBf
X2luaXRjYWxsX2VuZFtdOwo+ID4gK0RFQ0xBUkVfQVJSQVlfQk9VTkRTKGluaXRjYWxsKTsKPiA+
ICt0eXBlZGVmIGluaXRjYWxsX3QgcHJlc21wX2luaXRjYWxsX3Q7Cj4gPiArREVDTEFSRV9BUlJB
WV9CT1VORFMocHJlc21wX2luaXRjYWxsKTsKPiA+ICAKPiA+ICB2b2lkIF9faW5pdCBkb19wcmVz
bXBfaW5pdGNhbGxzKHZvaWQpCj4gPiAgewo+ID4gICAgICBjb25zdCBpbml0Y2FsbF90ICpjYWxs
Owo+ID4gLSAgICBmb3IgKCBjYWxsID0gX19pbml0Y2FsbF9zdGFydDsgY2FsbCA8IF9fcHJlc21w
X2luaXRjYWxsX2VuZDsgY2FsbCsrICkKPiA+ICsgICAgZm9yICggY2FsbCA9IF9fcHJlc21wX2lu
aXRjYWxsX3N0YXJ0Owo+ID4gKwkJICBwcmVzbXBfaW5pdGNhbGxfbHQoY2FsbCwgX19wcmVzbXBf
aW5pdGNhbGxfZW5kKTsKPiA+ICsJCSAgY2FsbCsrICkKPiAKPiBIYXJkIHRhYnMgc2xpcHBlZCBp
bi4gQWxzbyB3b3VsZCB5b3UgbWluZCBhZGRpbmcgdGhlIG1pc3NpbmcgYmxhbmsgbGluZQo+IGFo
ZWFkIG9mIHRoZSBvbmUgeW91IG1vZGlmeT8KCkFyZ2ghIEknbGwgZG8uCgoKPiA+ICAgICAgICAg
ICgqY2FsbCkoKTsKPiA+ICB9Cj4gPiAgCj4gPiAgdm9pZCBfX2luaXQgZG9faW5pdGNhbGxzKHZv
aWQpCj4gPiAgewo+ID4gICAgICBjb25zdCBpbml0Y2FsbF90ICpjYWxsOwo+ID4gLSAgICBmb3Ig
KCBjYWxsID0gX19wcmVzbXBfaW5pdGNhbGxfZW5kOyBjYWxsIDwgX19pbml0Y2FsbF9lbmQ7IGNh
bGwrKyApCj4gPiArICAgIGZvciAoIGNhbGwgPSBfX2luaXRjYWxsX3N0YXJ0Owo+ID4gKyAgICAg
ICAgICBpbml0Y2FsbF9sdChjYWxsLCBfX2luaXRjYWxsX2VuZCk7Cj4gPiArICAgICAgICAgIGNh
bGwrKyApCj4gCj4gQWdhaW4gbm8gbmVlZCBmb3Igc3BsaXR0aW5nIHRoZSBsaW5lIGFzIGl0IHNl
ZW1zLgoKQWN0dWFsbHkgaXQgd2FzIDc5IGluIHRoZSBvdGhlciBjYXNlIGFuZCA3OCBoZXJlLCBz
byBJJ2xsIGZpeCBib3RoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
