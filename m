From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 5/7] x86: relocate pvh_info
Date: Mon, 22 Jan 2018 12:10:11 +0000
Message-ID: <20180122121011.bfzfjtupdsp6r2ag@citrix.com>
References: <20180119153458.22535-1-wei.liu2@citrix.com>
 <20180119153458.22535-6-wei.liu2@citrix.com>
 <20180119162931.3mcwyzqya6wb2r7h@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wfn3=er=citrix.com=prvs=55302b5eb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1edavc-0006fV-6v
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 12:10:20 +0000
Content-Disposition: inline
In-Reply-To: <20180119162931.3mcwyzqya6wb2r7h@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMTksIDIwMTggYXQgMDQ6Mjk6MzFQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEphbiAxOSwgMjAxOCBhdCAwMzozNDo1NlBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ib290L2J1aWxkMzIubWsg
Yi94ZW4vYXJjaC94ODYvYm9vdC9idWlsZDMyLm1rCj4gPiBpbmRleCA0OGM3NDA3YzAwLi4wMjhh
YzE5Yjk2IDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvYnVpbGQzMi5tawo+ID4g
KysrIGIveGVuL2FyY2gveDg2L2Jvb3QvYnVpbGQzMi5tawo+ID4gQEAgLTM2LDUgKzM2LDggQEAg
Q0ZMQUdTIDo9ICQoZmlsdGVyLW91dCAtZmx0bywkKENGTEFHUykpCj4gPiAgY21kbGluZS5vOiBj
bWRsaW5lLmMgJChDTURMSU5FX0RFUFMpCj4gPiAgCj4gPiAgcmVsb2MubzogcmVsb2MuYyAkKFJF
TE9DX0RFUFMpCj4gPiAraWZlcSAoJChDT05GSUdfUFZIX0dVRVNUKSx5KQo+ID4gK3JlbG9jLm86
IENGTEFHUyArPSAtRENPTkZJR19QVkhfR1VFU1QKPiA+ICtlbmRpZgo+IAo+IEkgd291bGQgbWF5
YmUgZG8gdGhpcyBhYm92ZSwgd2hlcmUgdGhlIHJlc3Qgb2YgdGhlIENGTEFHUyBhcmUgc2V0Lgo+
IENlcnRhaW5seSBzZXR0aW5nIC1EQ09ORklHX1BWSF9HVUVTVCBzaG91bGRuJ3QgY2F1c2UgaXNz
dWVzIGVsc2V3aGVyZS4KPiAKPiBDRkxBR1MtJChDT05GSUdfUFZIX0dVRVNUKSArPSAtRENPTkZJ
R19QVkhfR1VFU1QKPiBDRkxBR1MgKz0gJChDRkxBR1MteSkKPiAKCk1pc3NlZCB0aGlzIG9uZS4K
Ckkgd291bGQgcmF0aGVyIG9ubHkgaGF2ZSAtRENPTkZJR19QVkhfR1VFU1QgZm9yIHRoZSBmaWxl
IHRoYXQgbmVlZHMgaXQuCkxldCBtZSBrbm93IGlmIHlvdSBmZWVsIHN0cm9uZ2x5IGFib3V0IHRo
aXMuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
