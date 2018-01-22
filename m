From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 5/7] x86: relocate pvh_info
Date: Mon, 22 Jan 2018 12:46:33 +0000
Message-ID: <20180122124633.6hcelxlcivn3qxhi@citrix.com>
References: <20180119153458.22535-1-wei.liu2@citrix.com>
 <20180119153458.22535-6-wei.liu2@citrix.com>
 <20180119162931.3mcwyzqya6wb2r7h@MacBook-Pro-de-Roger.local>
 <20180119163900.auf6tkm7o2vjvy5g@citrix.com>
 <5A65CB8A02000078001A0FC8@prv-mh.provo.novell.com>
 <20180122123521.vbeuvdiau2jaolpk@citrix.com>
 <20180122124441.26ojjq6kl3m3nnig@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wfn3=er=citrix.com=prvs=55302b5eb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1edbUj-0002bR-GS
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 12:46:37 +0000
Content-Disposition: inline
In-Reply-To: <20180122124441.26ojjq6kl3m3nnig@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjIsIDIwMTggYXQgMTI6NDQ6NDFQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIEphbiAyMiwgMjAxOCBhdCAxMjozNToyMVBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gVG8gYXZvaWQgc3BhbW1pbmcgdGhlIGxpc3Qgd2l0aCBhbGwgdGhlIG90
aGVyIGFja2VkIHBhdGNoZXMsIGhlcmUgaXMgdGhlCj4gPiB1cGRhdGVkIHBhdGNoLgo+ID4gCj4g
PiAtLS04PC0tLQo+ID4gRnJvbSAxYWMwYWZiYmMwZWNkNjIwYzVmYmEzYTAzYmIwODRiYzRkYWZj
NzhlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gRnJvbTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KPiA+IERhdGU6IFdlZCwgMTcgSmFuIDIwMTggMTg6Mzg6MDIgKzAwMDAKPiA+
IFN1YmplY3Q6IFtQQVRDSF0geDg2OiByZWxvY2F0ZSBwdmhfaW5mbwo+ID4gTUlNRS1WZXJzaW9u
OiAxLjAKPiA+IENvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ID4gQ29u
dGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ID4gCj4gPiBNb2RpZnkgZWFybHkgYm9vdCBj
b2RlIHRvIHJlbG9jYXRlIHB2aCBpbmZvIGFzIHdlbGwsIHNvIHRoYXQgd2UgY2FuIGJlCj4gPiBz
dXJlIF9fdmEgaW4gX19zdGFydF94ZW4gd29ya3MuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IAo+IFdpdGggb25lIHF1ZXN0aW9uIGJlbG93
Lgo+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUyBiL3hlbi9hcmNo
L3g4Ni9ib290L2hlYWQuUwo+ID4gaW5kZXggMGY2NTJjZWExMS4uYWEyZTJhOTNjOCAxMDA2NDQK
PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwo+ID4gKysrIGIveGVuL2FyY2gveDg2
L2Jvb3QvaGVhZC5TCj4gPiBAQCAtNDE0LDYgKzQxNCw3IEBAIF9fcHZoX3N0YXJ0Ogo+ID4gIAo+
ID4gICAgICAgICAgLyogU2V0IHRyYW1wb2xpbmVfcGh5cyB0byB1c2UgbWZuIDEgdG8gYXZvaWQg
aGF2aW5nIGEgbWFwcGluZyBhdCBWQSAwICovCj4gPiAgICAgICAgICBtb3Z3ICAgICQweDEwMDAs
IHN5bV9lc2kodHJhbXBvbGluZV9waHlzKQo+ID4gKyAgICAgICAgbW92bCAgICAoJWVieCksICVl
YXggLyogbW92ICRYRU5fSFZNX1NUQVJUX01BR0lDX1ZBTFVFLCAlZWF4ICovCj4gCj4gRG8geW91
IHJlYWxseSBuZWVkIHRoZSBsIHN1ZmZpeCBoZXJlPwoKSSBndWVzcyBuby4gSSBjb3BpZWQgaXQg
ZnJvbSB5b3VyIHByZXZpb3VzIHJlcGx5LiA7LSkKCldlaS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
