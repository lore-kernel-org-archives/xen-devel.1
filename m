From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/6] xen/pvh: place the trampoline at page
	0x1
Date: Wed, 17 Jan 2018 11:37:52 +0000
Message-ID: <20180117113752.6xl4ra2nuy5p4wzw@citrix.com>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-3-roger.pau@citrix.com>
 <20180117105522.5tg2i3wfpflziqhz@citrix.com>
 <20180117113515.42fxxwtbycxpdtza@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=s8/r=em=citrix.com=prvs=5488b24bb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ebm2V-0008S3-G2
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 11:37:55 +0000
Content-Disposition: inline
In-Reply-To: <20180117113515.42fxxwtbycxpdtza@MacBook-Pro-de-Roger.local>
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

T24gV2VkLCBKYW4gMTcsIDIwMTggYXQgMTE6MzU6MTVBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiAKPiA+ID4gKyAgICAgICAgbW92dyAgICAkMHgxMDAwLCBzeW1fZXNpKHRyYW1w
b2xpbmVfcGh5cykKPiA+ID4gICAgICAgICAgam1wICAgICB0cmFtcG9saW5lX3NldHVwCj4gPiA+
ICAKPiA+ID4gICNlbmRpZiAvKiBDT05GSUdfUFZIX0dVRVNUICovCj4gPiA+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gPiA+IGluZGV4IDExNDdh
MWFmYjEuLjU4NmFmMmJhOWEgMTAwNjQ0Cj4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4g
PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gPiA+IEBAIC0yOTIsOSArMjkyLDEzIEBAIHZv
aWQgX19pbml0IGFyY2hfaW5pdF9tZW1vcnkodm9pZCkKPiA+ID4gICAgICAvKgo+ID4gPiAgICAg
ICAqIEZpcnN0IDFNQiBvZiBSQU0gaXMgaGlzdG9yaWNhbGx5IG1hcmtlZCBhcyBJL08uICBJZiB3
ZSBib290ZWQgUFZILAo+ID4gPiAgICAgICAqIHJlY2xhaW0gdGhlIHNwYWNlLiAgSXJyZXNwZWN0
aXZlLCBsZWF2ZSBNRk4gMCBhcyBzcGVjaWFsIGZvciB0aGUgc2FrZQo+ID4gPiAtICAgICAqIG9m
IDAgYmVpbmcgYSB2ZXJ5IGNvbW1vbiBkZWZhdWx0IHZhbHVlLgo+ID4gPiArICAgICAqIG9mIDAg
YmVpbmcgYSB2ZXJ5IGNvbW1vbiBkZWZhdWx0IHZhbHVlLiBBbHNvIHJlc2VydmUgcGFnZSAweDEg
d2hpY2ggaXMKPiA+ID4gKyAgICAgKiB1c2VkIGJ5IHRoZSB0cmFtcG9saW5lIGNvZGUuCj4gPiA+
ICAgICAgICovCj4gPiA+IC0gICAgZm9yICggaSA9IDA7IGkgPCAocHZoX2Jvb3QgPyAxIDogMHgx
MDApOyBpKysgKQo+ID4gPiArICAgIGZvciAoIGkgPSAwOwo+ID4gPiArICAgICAgICAgIGkgPCAo
cHZoX2Jvb3QgPyAoMSArIFBGTl9VUCh0cmFtcG9saW5lX2VuZCAtIHRyYW1wb2xpbmVfc3RhcnQp
KQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgOiAweDEwMCk7Cj4gPiA+ICsgICAgICAg
ICAgaSsrICkKPiA+IAo+ID4gVGhlcmUgaXMgbm93IGEgaGFyZGNvZGVkIGFzc3VtcHRpb24gdGhh
dCB0aGUgdHJhbXBvbGluZSBpcyBtYXBwZWQgYXQKPiA+IHBhZ2UgMHgxLiBNYXliZSB0aGVyZSBz
aG91bGQgYmUgYSBkZWRpY2F0ZWQgbG9vcCB0byBzaGFyZSB0aGUgdHJhbXBvbGluZQo+ID4gd2l0
aCBkb21faW8/Cj4gCj4gSSBjb3VsZCBhZGQgYSBsb29wIGxpa2U6Cj4gCj4gZm9yICggaSA9IFBG
Tl9ET1dOKHRyYW1wb2xpbmVfcGh5cyk7Cj4gICAgICAgaSA8IChwdmhfYm9vdCA/IChQRk5fVVAo
dHJhbXBvbGluZV9waHlzICsgdHJhbXBvbGluZV9lbmQgLSB0cmFtcG9saW5lX3N0YXJ0KSkKPiAg
ICAgICAgICAgICAgICAgICAgIDogMCk7Cj4gICAgICAgaSsrICkKPiAKPiBCdXQgaXQgc2VlbXMg
cXVpdGUgcmVkdW5kYW50Lgo+IAo+IFRoZSBjb21tZW50IGFib3ZlIHRoZSBsb29wIGFscmVhZHkg
ZXhwbGFpbnMgdGhlIHBvc2l0aW9uIG9mIHRoZQo+IHRyYW1wb2xpbmUgZm9yIFBWSCwgZG8geW91
IHRoaW5rIGl0IHdvdWxkIGJlIGZpbmUgdG8gYWRkIHNvbWV0aGluZwoKV2hhdCBJJ20gYWZyYWlk
IGlzIHRoYXQgb25jZSB3ZSBtb3ZlIHRoZSB0cmFtcG9saW5lIHNvbWV3aGVyZSBlbHNlIHRoZQpj
b21tZW50IGFuZCBjb2RlIHdpbGwgYmUgc3RhbGUgYW5kIHdlIGNhbid0IGVhc2lseSBrbm93IGFi
b3V0IHRoYXQuCgo+IGxpa2U6Cj4gCj4gQlVHX09OKHB2aF9ib290ICYmIHRyYW1wb2xpbmVfcGh5
cyAhPSAweDEwMDApOwo+IAo+IEp1c3QgYmVmb3JlIHRoZSBsb29wPwoKVGhpcyB3aWxsIGRvLCB0
b28uCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
