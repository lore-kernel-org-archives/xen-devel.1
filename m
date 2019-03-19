From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 1/2] x86: decouple xen alignment setting
 from EFI/ELF build
Date: Tue, 19 Mar 2019 13:44:25 +0000
Message-ID: <20190319134425.GG14641@zion.uk.xensource.com>
References: <20190319130550.32570-1-wei.liu2@citrix.com>
 <20190319130550.32570-2-wei.liu2@citrix.com>
 <e05c0ae5-5931-d03c-a40d-d84c482d7b1a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yczf=RW=citrix.com=prvs=9744cf058=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h6F2c-00034W-2u
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 13:44:30 +0000
Content-Disposition: inline
In-Reply-To: <e05c0ae5-5931-d03c-a40d-d84c482d7b1a@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMDE6MDk6MzVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOS8wMy8yMDE5IDEzOjA1LCBXZWkgTGl1IHdyb3RlOgo+ID4gQEAgLTIwLDEz
ICsxOSwyMiBAQCBFTlRSWShlZmlfc3RhcnQpCj4gPiAgI2Vsc2UgLyogIUVGSSAqLwo+ID4gIAo+
ID4gICNkZWZpbmUgRk9STUFUICJlbGY2NC14ODYtNjQiCj4gPiAtI2RlZmluZSBTRUNUSU9OX0FM
SUdOIFBBR0VfU0laRQo+ID4gICNkZWZpbmUgREVDTF9TRUNUSU9OKHgpIHggOiBBVChBRERSKHgp
IC0gX19YRU5fVklSVF9TVEFSVCkKPiA+ICAKPiA+ICBFTlRSWShzdGFydF9wYSkKPiA+ICAKPiA+
ICAjZW5kaWYgLyogRUZJICovCj4gPiAgCj4gPiArI2lmZGVmIENPTkZJR19YRU5fQUxJR05fMk0K
PiA+ICsjZGVmaW5lIFNFQ1RJT05fQUxJR04gTUIoMikKPiA+ICsjZWxzZSAvKiBEZWZhdWx0IGFs
aWdubWVudCAqLwo+ID4gKyNpZmRlZiBFRkkKPiA+ICsjZGVmaW5lIFNFQ1RJT05fQUxJR04gTUIo
MikKPiA+ICsjZWxzZQo+ID4gKyNkZWZpbmUgU0VDVElPTl9BTElHTiBQQUdFX1NJWkUKPiA+ICsj
ZW5kaWYKPiA+ICsjZW5kaWYKPiAKPiBBcyBhIHRyaXZpYWwgY2hhbmdlLCBjYW4gdGhpcyBwbGVh
c2UgYmU6Cj4gCj4gI2lmZGVmIENPTkZJR19YRU5fQUxJR05fMk0KPiAjIGRlZmluZSBTRUNUSU9O
X0FMSUdOIE1CKDIpCj4gI2Vsc2UgLyogRGVmYXVsdCBhbGlnbm1lbnQgKi8KPiAjIGlmZGVmIEVG
SQo+ICPCoCBkZWZpbmUgU0VDVElPTl9BTElHTiBNQigyKQo+ICMgZWxzZQo+ICPCoCBkZWZpbmUg
U0VDVElPTl9BTElHTiBQQUdFX1NJWkUKPiAjIGVuZGlmCj4gI2VuZGlmCj4gCj4gVG8gaGVscCBo
aWdobGlnaHQgdGhlIG5lc3RpbmcgbGV2ZWxzLgoKU3VyZS4KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
