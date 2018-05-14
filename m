From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 4/5] libxc/pvh: set default MTRR type to
 write-back
Date: Mon, 14 May 2018 17:50:48 +0100
Message-ID: <20180514165047.42fj54spldgfhxbw@citrix.com>
References: <20180510171505.37309-1-roger.pau@citrix.com>
 <20180510171505.37309-5-roger.pau@citrix.com>
 <20180514160051.uf3idifgc4n6p7wl@citrix.com>
 <20180514160247.fyvfgu3hstupexe5@MacBook-Pro-de-Roger.local>
 <20180514164252.xxesskz23rvirg6b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zpky=ib=citrix.com=prvs=66564b2c0=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fIGgV-0001D3-R9
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 16:50:51 +0000
Content-Disposition: inline
In-Reply-To: <20180514164252.xxesskz23rvirg6b@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTQsIDIwMTggYXQgMDU6NDI6NTNQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIE1heSAxNCwgMjAxOCBhdCAwNTowMjo0N1BNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gTW9uLCBNYXkgMTQsIDIwMTggYXQgMDU6MDA6NTFQTSArMDEwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gVGh1LCBNYXkgMTAsIDIwMTggYXQgMDY6MTU6MDRQTSAr
MDEwMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiA+IEBAIC0xMDE0LDYgKzEwMzQsMzAg
QEAgc3RhdGljIGludCB2Y3B1X2h2bShzdHJ1Y3QgeGNfZG9tX2ltYWdlICpkb20pCj4gPiA+ID4g
ICAgICBpZiAoIGRvbS0+c3RhcnRfaW5mb19zZWcucGZuICkKPiA+ID4gPiAgICAgICAgICBic3Bf
Y3R4LmNwdS5yYnggPSBkb20tPnN0YXJ0X2luZm9fc2VnLnBmbiA8PCBQQUdFX1NISUZUOwo+ID4g
PiA+ICAKPiA+ID4gPiArICAgIC8qIFNldCB0aGUgTVRSUi4gKi8KPiA+ID4gPiArICAgIGJzcF9j
dHgubXRycl9kLnR5cGVjb2RlID0gSFZNX1NBVkVfQ09ERShNVFJSKTsKPiA+ID4gPiArICAgIGJz
cF9jdHgubXRycl9kLmluc3RhbmNlID0gMDsKPiA+ID4gPiArICAgIGJzcF9jdHgubXRycl9kLmxl
bmd0aCA9IEhWTV9TQVZFX0xFTkdUSChNVFJSKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICBtdHJy
X3JlY29yZCA9IGh2bV9nZXRfc2F2ZV9yZWNvcmQoZnVsbF9jdHgsIEhWTV9TQVZFX0NPREUoTVRS
UiksIDApOwo+ID4gPiA+ICsgICAgaWYgKCAhbXRycl9yZWNvcmQgKQo+ID4gPiA+ICsgICAgewo+
ID4gPiA+ICsgICAgICAgIHhjX2RvbV9wYW5pYyhkb20tPnhjaCwgWENfSU5URVJOQUxfRVJST1Is
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICIlczogdW5hYmxlIHRvIGdldCBNVFJSIHNh
dmUgcmVjb3JkIiwgX19mdW5jX18pOwo+ID4gPiA+ICsgICAgICAgIGdvdG8gb3V0Owo+ID4gPiA+
ICsgICAgfQo+ID4gPiAKPiA+ID4gV2lsbCB0aGlzIGJyZWFrIGNyb3NzIHZlcnNpb24gbWlncmF0
aW9uIHdoZW4gdGhlIG9sZGVyIGh5cGVydmlzb3IKPiA+ID4gZG9lc24ndCBoYXZlIHN1Y2ggcmVj
b3JkPwo+ID4gCj4gPiBUaGlzIG1pZ3JhdGlvbiByZWNvcmQgaXMgYWxyZWFkeSBwcmVzZW50LCBp
dCdzIG5vdCBpbnRyb2R1Y2VkIGluIHRoaXMKPiA+IHBhdGNoIHNlcmllcy4gSSdtIHNpbXBseSBt
YWtpbmcgdXNlIG9mIGl0IGluIG9yZGVyIHRvIHNldCBhIHZhbGlkCj4gPiBpbml0aWFsIE1UUlIg
c3RhdGUuCj4gPiAKPiAKPiBUaGVuIEknbSBldmVuIG1vcmUgY29uZnVzZWQ6IGRvZXMgdGhpcyBt
ZWFuIHRoZSByZWNvcmQgaXMgbm90IHByb3Blcmx5Cj4gaG9ub3VyZWQgaW4gdGhlIGh5cGVydmlz
b3I/IEkuZS4gdGhpcyBpcyBhIGh5cGVydmlzb3IgYnVnPwo+IAoKT3IgbWF5YmUgdGhpcyBtZWFu
cyB0aGUgc2V0dGluZyBvZiB0aGUgZGVmYXVsdCB0eXBlIHNob3VsZCBoYXBwZW4Kc29tZXdoZXJl
IGVsc2U/IExldCBtZSByZWFkIGFsbCB0aGUgY29kZSB0byBtYWtlIHN1cmUgSSdtIG5vdCB0YWxr
aW5nCm5vbnNlbnNlIGFuZCBtaXNndWlkZSB5b3UgaGVyZS4KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
