From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 5/6] x86: remove defunct
 init/load/save_msr() hvm_funcs
Date: Mon, 11 Mar 2019 17:45:35 +0000
Message-ID: <1ac0ae156eeb4de783ef5d495e157ecd@AMSPEX02CL02.citrite.net>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-6-paul.durrant@citrix.com>
 <5C829D50020000780021CC67@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TKYa=RO=citrix.com=prvs=96668afeb=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h3Oza-0006zS-6e
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 17:45:38 +0000
In-Reply-To: <5C829D50020000780021CC67@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDggTWFyY2ggMjAxOSAxNjo1MAo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxB
bmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0
cml4LmNvbT47IFdlaSBMaXUKPiA8d2VpLmxpdTJAY2l0cml4LmNvbT47IHhlbi1kZXZlbCA8eGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS82XSB4
ODY6IHJlbW92ZSBkZWZ1bmN0IGluaXQvbG9hZC9zYXZlX21zcigpIGh2bV9mdW5jcwo+IAo+ID4+
PiBPbiAwNy4wMS4xOSBhdCAxMzowMiwgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPiB3cm90ZToK
PiA+IEBAIC0xNDcyLDEwICsxNDY4LDcgQEAgc3RhdGljIGludCBodm1fbG9hZF9jcHVfbXNycyhz
dHJ1Y3QgZG9tYWluICpkLCBodm1fZG9tYWluX2NvbnRleHRfdCAqaCkKPiA+ICAgICAgICAgICAg
ICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiAgICAgIC8qIENoZWNraW5nIGZpbmlzaGVkICovCj4g
Pgo+ID4gLSAgICBpZiAoIGh2bV9mdW5jcy5sb2FkX21zciApCj4gPiAtICAgICAgICBlcnIgPSBo
dm1fZnVuY3MubG9hZF9tc3IodiwgY3R4dCk7Cj4gPiAtCj4gPiAtICAgIGZvciAoIGkgPSAwOyAh
ZXJyICYmIGkgPCBjdHh0LT5jb3VudDsgKytpICkKPiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBj
dHh0LT5jb3VudDsgKytpICkKPiA+ICAgICAgewo+ID4gICAgICAgICAgc3dpdGNoICggY3R4dC0+
bXNyW2ldLmluZGV4ICkKPiA+ICAgICAgICAgIHsKPiAKPiBlcnIgY2FuIGJlY29tZSBzZXQgdG8g
bm9uLXplcm8gaW4gdGhlIGxvb3AgYm9keSBmdXJ0aGVyIGRvd24gZnJvbSBoZXJlLAo+IHNvIEkg
ZG9uJ3QgdGhpbmsgeW91IHNob3VsZCBhbHRlciB0aGUgbG9vcCBoZWFkZXIuCgpUcnVlLiBCYWls
aW5nIGVhcmx5IGlzIGEgY2hhbmdlIG9mIHNlbWFudGljLCBzbyBJJ2xsIGRyb3AgdGhlIGNoZWNr
LgoKICBQYXVsCgo+IAo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
