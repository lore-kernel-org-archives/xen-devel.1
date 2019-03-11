From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 4/6] x86: stop handling MSR_IA32_XSS
 save/restore in implementation code
Date: Mon, 11 Mar 2019 17:41:31 +0000
Message-ID: <50d7fde5b09144bfb2993cf7b4382540@AMSPEX02CL02.citrite.net>
References: <20190107120258.17897-1-paul.durrant@citrix.com>
 <20190107120258.17897-5-paul.durrant@citrix.com>
 <5C829C6F020000780021CC4C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TKYa=RO=citrix.com=prvs=96668afeb=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h3Ovf-0006og-1I
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 17:41:35 +0000
In-Reply-To: <5C829C6F020000780021CC4C@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDggTWFyY2ggMjAxOSAxNjo0Nwo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBBbmRyZXcgQ29vcGVyIDxB
bmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0
cml4LmNvbT47IFdlaSBMaXUKPiA8d2VpLmxpdTJAY2l0cml4LmNvbT47IEp1biBOYWthamltYSA8
anVuLm5ha2FqaW1hQGludGVsLmNvbT47IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29t
PjsgeGVuLQo+IGRldmVsIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gU3ViamVj
dDogUmU6IFtQQVRDSCA0LzZdIHg4Njogc3RvcCBoYW5kbGluZyBNU1JfSUEzMl9YU1Mgc2F2ZS9y
ZXN0b3JlIGluIGltcGxlbWVudGF0aW9uIGNvZGUKPiAKPiA+Pj4gT24gMDcuMDEuMTkgYXQgMTM6
MDIsIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94
ODYvbXNyLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwo+ID4gQEAgLTE2NCw2ICsxNjQs
MTMgQEAgaW50IGd1ZXN0X3JkbXNyKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBtc3IsIHVpbnQ2
NF90ICp2YWwpCj4gPgo+ID4gICAgICAgICAgYnJlYWs7Cj4gPgo+ID4gKyAgICBjYXNlIE1TUl9J
QTMyX1hTUzoKPiA+ICsgICAgICAgIGlmICggIWlzX2h2bV9kb21haW4oZCkgfHwgIWNwLT54c3Rh
dGUueHNhdmVzICkKPiAKPiBXaHkgdGhlIGlzX2h2bV9kb21haW4oKSBjaGVjayBoZXJlIGFuZCBi
ZWxvdz8KCk9ubHkgdGhlcmUgYmVjYXVzZSB0aGUgb2xkZXIgY29kZSB3YXMgSFZNLXNwZWNpZmlj
LgoKPiBUaGUgQ1BVSUQgcG9saWN5IGJpdAo+IGFsb25lIHNob3VsZCBwcm9wZXJseSByZWZsZWN0
IHRoaW5ncywgYW5kIHRoZXJlIHNob3VsZCBiZSBubyBjaGFuZ2UKPiBuZWVkZWQgaGVyZSBpZiB3
ZSBkZWNpZGVkIHRvIHN1cHBvcnQgWFNBVkVTIGFsc28gZm9yIFBWIGd1ZXN0cy4gV2l0aAo+IHRo
ZW0gZHJvcHBlZAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgpPay4gVGhhbmtzLAoKICBQYXVsCgo+IAo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
