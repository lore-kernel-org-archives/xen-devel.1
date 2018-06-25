From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-next 5/5] tools: provide
 --with-system-ipxe
Date: Mon, 25 Jun 2018 09:14:56 +0100
Message-ID: <20180625081456.htaplnw2rvrpkirt@citrix.com>
References: <20180515182243.3339-1-wei.liu2@citrix.com>
 <20180515182243.3339-6-wei.liu2@citrix.com>
 <20180604135921.GB9256@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w+qx=jl=citrix.com=prvs=7078eb122=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fXMeL-0007oR-BY
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 08:15:01 +0000
Content-Disposition: inline
In-Reply-To: <20180604135921.GB9256@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMDQsIDIwMTggYXQgMDI6NTk6MjFQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gVHVlLCBNYXkgMTUsIDIwMTggYXQgMDc6MjI6NDNQTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS90b29scy9jb25maWd1cmUuYWMgYi90b29scy9jb25m
aWd1cmUuYWMKPiA+IGluZGV4IDA4MjZhZjhjYmMuLjhlNGIxNzNkNmYgMTAwNjQ0Cj4gPiAtLS0g
YS90b29scy9jb25maWd1cmUuYWMKPiA+ICsrKyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+ID4gQEAg
LTI0MSw2ICsyNDIsMjMgQEAgQVNfSUYoW3Rlc3QgIngkb3ZtZiIgPSAieHkiIC1vIC1uICIkb3Zt
Zl9wYXRoIiBdLCBbCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBbT1ZNRiBwYXRoXSkKPiA+
ICBdKQo+ID4gIAo+ID4gK0FDX0FSR19XSVRIKFtzeXN0ZW0taXB4ZV0sCj4gPiArICAgIEFTX0hF
TFBfU1RSSU5HKFstLXdpdGgtc3lzdGVtLWlweGVAPDpAPVBBVEhAOj5AXSwKPiA+ICsgICAgICAg
W1VzZSBzeXN0ZW0gc3VwcGxpZWQgSVBYRSBQQVRIIGluc3RlYWQgb2YgYnVpbGRpbmcgYW5kIGlu
c3RhbGxpbmcKPiA+ICsgICAgICAgIG91ciBvd24gdmVyc2lvbl0pLFsKPiA+ICsgICAgIyBEaXNh
YmxlIGNvbXBpbGF0aW9uIG9mIElQWEUuCj4gPiArICAgIGlweGU9bgo+ID4gKyAgICBjYXNlICR3
aXRodmFsIGluCj4gPiArICAgICAgICBubykgaXB4ZV9wYXRoPSA7Owo+ID4gKyAgICAgICAgKikg
IGlweGVfcGF0aD0kd2l0aHZhbCA7Owo+ID4gKyAgICBlc2FjCj4gPiArXSxbXSkKPiA+ICtBU19J
RihbdGVzdCAieCRpcHhlIiA9ICJ4eSIgLW8gLW4gIiRpcHhlX3BhdGgiIF0sIFsKPiA+ICsgICAg
QUNfREVGSU5FX1VOUVVPVEVEKFtJUFhFX1BBVEhdLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgWyIke2lweGVfcGF0aDotJFhFTkZJUk1XQVJFRElSL2lweGUuYmlufSJdLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgW0lQWEUgcGF0aF0pCj4gPiArXSkKPiA+ICsKPiAKPiBJIHRoaW5r
IHRoZXJlIGFyZSBpc3N1ZXMgd2l0aCB0aGUgd2F5IHdlIGhhbmRsZSAtLXdpdGgtc3lzdGVtLVgu
IElmIGEKPiB1c2VyIHJ1biBgY29uZmlndXJlIC0td2l0aC1zeXN0ZW0taXB4ZWAsIHdpdGhvdXQg
YSA9IG9yIGEgUEFUSCwgdGhlbiBpbgo+IHRoZSBodW5rIGFicm92ZSwgJHdpdGh2YWwgd2lsbCBi
ZSAieWVzIiBhbmQgdGhpcyB3aWxsIHJlc3VsdCB3aXRoCj4gSVBYRV9QQVRIPXllcwo+IAo+IEkg
ZG9uJ3Qga25vdyBpZiB5b3Ugd2FudCB0byBsb29rIGF0IHRoYXQsIHNpbmNlIHlvdSdyZSBpbnRy
b2R1Y2luZyBhIG5ldwo+IG9uZS4KPiAKCldlIGNhbiBhZGQgYSBicmFuY2ggdG8gYWxsIG9mIHRo
ZW0gdG8gcHJpbnQgb3V0IGFuIGVycm9yIHdoZW4KJHdpdGh2YWwgaXMgeWVzLgoKV2VpLgoKPiAt
LSAKPiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
