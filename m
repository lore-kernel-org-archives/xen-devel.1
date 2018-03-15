From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Implementaiton of cc-option in Config.mk
Date: Thu, 15 Mar 2018 11:44:52 +0000
Message-ID: <20180315114452.decpvqfbkxe6umlc@citrix.com>
References: <20180314171128.52ln4efljqd56mnu@citrix.com>
 <5AAA40AB02000078001B1F71@prv-mh.provo.novell.com>
 <20180315112202.7u56metqc2h5iw24@citrix.com>
 <5AAA673302000078001B2104@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7wu/=gf=citrix.com=prvs=605a65143=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ewRJd-0008Py-5d
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 11:45:01 +0000
Content-Disposition: inline
In-Reply-To: <5AAA673302000078001B2104@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMTUsIDIwMTggYXQgMDU6Mjk6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE1LjAzLjE4IGF0IDEyOjIyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUaHUsIE1hciAxNSwgMjAxOCBhdCAwMjo0NToxNUFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMTQuMDMuMTggYXQgMTg6MTEsIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IFRoZSBpbXBsZW1lbnRhdGlvbiBvZiBjYy1vcHRpb24gKGdy
ZXBwaW5nIHRoZSBvcHRpb24gYmVpbmcgdGVzdGVkIGluCj4gPj4gPiBvdXRwdXQpIGluIENvbmZp
Zy5tayBub3cgbWFrZXMgaXQgbm90IHBvc3NpYmxlIHRvIGRldGVjdCBpZiAtT2cgaXMKPiA+PiA+
IHN1cHBvcnRlZCBiZWNhdXNlICItT2ciIGRvZXNuJ3QgYXBwZWFyIGluIHRoZSBvdXRwdXQgaWYg
aXQgaXMgbm90Cj4gPj4gPiBzdXBwb3J0ZWQuIEkgc3VzcGVjdCB0aGVyZSB3aWxsIGJlIG90aGVy
IG9wdGlvbnMgdGhhdCBjYy1vcHRpb24gY2FuJ3Qgd29yawo+ID4+ID4gd2l0aC4KPiA+PiA+IAo+
ID4+ID4gSXQgaXMgaW1wbGVtZW50ZWQgbGlrZSB0aGF0IGJlY2F1c2Ugd2UgdHJ5IHRvIGRldGVj
dCAtV25vLSogb3B0aW9uLiBCdXQKPiA+PiA+IHdoeSBpcyB0aGF0IGltcG9ydGFudD8gQ2FuJ3Qg
d2UganVzdCBpZ25vcmUgLVduby0qIGlmIHRoZXkgYXJlbid0Cj4gPj4gPiBzdXBwb3J0ZWQ/Cj4g
Pj4gCj4gPj4gV2VsbCwgdGhlIGV4cGxhbmF0aW9uIGZvciBpdHMgYmVoYXZpb3IgaXMgZ2l2ZW4g
aW4gdGhlIGNvbW1lbnQKPiA+PiBuZXh0IHRvIGl0cyBkZWZpbml0aW9uOgo+ID4gCj4gPiBZZWFo
LCBJIGtub3cgdGhhdC4gSSdtIGp1c3Qgbm90IHN1cmUgd2h5IG5vbmV4aXN0ZW50IC1Xbm8tKiBz
aG91bGQgYmUKPiA+IHJlamVjdGVkLiBJZiB0aGVyZSBpcyBubyBjb3JyZXNwb25kaW5nIC1XKiBv
cHRpb24gaW4gdGhlIGZpcnN0IHBsYWNlLAo+ID4gLVduby0qIHNob3VsZG4ndCBjYXVzZSBhbnkg
ZGlmZmVyZW5jZSBpbiB0aGUgZW5kIHJlc3VsdC4KPiAKPiBUaGUgcHJvYmxlbSBpcyB0aGF0IGF0
IGxlYXN0IHNvbWUgY29tcGlsZXIgdmVyc2lvbnMgZXJyb3Igb24gdW5rbm93bgo+IC1Xbm8tKiB0
aGUgZmlyc3QgdGltZSB0aGV5IHByb2R1Y2Ugc29tZSAob3RoZXIpIHdhcm5pbmcuIEhlbmNlIHdl
Cj4gY2FuJ3QgYmxpbmRseSBwYXNzIC1Xbm8tKi4KPiAKClVyZ2gsIE9LLiBUaGFua3MgZm9yIHRo
ZSBleHBsYW5hdGlvbi4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
