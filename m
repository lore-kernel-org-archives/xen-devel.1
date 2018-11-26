From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 2/2] amd-iommu: replace occurrences of
 u<N> with uint<N>_t...
Date: Mon, 26 Nov 2018 11:57:05 +0000
Message-ID: <531a89ae4ec24f898d16f49b27b0b740@AMSPEX02CL03.citrite.net>
References: <20181126113253.5349-1-paul.durrant@citrix.com>
 <20181126113253.5349-3-paul.durrant@citrix.com>
 <5BFBDDB802000078001FFEAD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xvjC=OF=citrix.com=prvs=861df4a88=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gRFVl-0004LF-Dc
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 11:57:09 +0000
In-Reply-To: <5BFBDDB802000078001FFEAD@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjYgTm92ZW1iZXIgMjAxOCAxMTo0OQo+IFRvOiBQ
YXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBCcmlhbiBXb29kcyA8
YnJpYW4ud29vZHNAYW1kLmNvbT47IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdAo+IDxzdXJhdmVlLnN1
dGhpa3VscGFuaXRAYW1kLmNvbT47IHhlbi1kZXZlbCA8eGVuLQo+IGRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnPgo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjIgMi8yXSBhbWQt
aW9tbXU6IHJlcGxhY2Ugb2NjdXJyZW5jZXMgb2YKPiB1PE4+IHdpdGggdWludDxOPl90Li4uCj4g
Cj4gPj4+IE9uIDI2LjExLjE4IGF0IDEyOjMyLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQEAgLTMwNiw3ICszMDcsOCBAQCB2b2lkIGlvbW11X2R0ZV9zZXRfZ3Vlc3RfY3Iz
KHUzMiAqZHRlLCB1MTYgZG9tX2lkLAo+IHU2NCBnY3IzLAo+ID4gIHVpbnQ2NF90IGFtZF9pb21t
dV9nZXRfYWRkcmVzc19mcm9tX3B0ZSh2b2lkICpwdGUpCj4gPiAgewo+ID4gICAgICB1aW50MzJf
dCAqZW50cnkgPSBwdGU7Cj4gPiAtICAgIHVpbnQ2NF90IGFkZHJfbG8sIGFkZHJfaGksIHB0cjsK
PiA+ICsgICAgdWludDMyX3QgYWRkcl9sbywgYWRkcl9oaTsKPiA+ICsgICAgdWludDY0X3QgcHRy
Owo+ID4KPiA+ICAgICAgYWRkcl9sbyA9IGdldF9maWVsZF9mcm9tX3JlZ191MzIoZW50cnlbMF0s
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX1BURV9BRERS
X0xPV19NQVNLLAo+ID4gQEAgLTMxNiwyOSArMzE4LDMwIEBAIHVpbnQ2NF90IGFtZF9pb21tdV9n
ZXRfYWRkcmVzc19mcm9tX3B0ZSh2b2lkICpwdGUpCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIElPTU1VX1BURV9BRERSX0hJR0hfTUFTSywKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfUFRFX0FERFJfSElHSF9TSElGVCk7Cj4g
Pgo+ID4gLSAgICBwdHIgPSAoYWRkcl9oaSA8PCAzMikgfCAoYWRkcl9sbyA8PCBQQUdFX1NISUZU
KTsKPiA+ICsgICAgcHRyID0gKCh1aW50NjRfdClhZGRyX2hpIDw8IDMyKSB8Cj4gPiArICAgICAg
ICAgICgodWludDY0X3QpYWRkcl9sbyA8PCBQQUdFX1NISUZUKTsKPiA+ICAgICAgcmV0dXJuIHB0
cjsKPiA+ICB9Cj4gCj4gVGhpcyBpcyBhY3R1YWxseSBhbiBpbmNyZWFzZSBpbiBjYXN0cy4gSSBh
c3N1bWUgeW91J3ZlIGRvbmUgdGhpcyBmb3IKPiBjb25zaXN0ZW5jeSwgYnV0IGl0IHdvdWxkIGhh
dmUgYmVlbiBuaWNlIGlmIHRoZSBkZXNjcmlwdGlvbiBzYWlkIHNvLgoKWWVzLCBpdCB3YXMgaW5k
ZWVkIGZvciBjb25zaXN0ZW5jeS4gU3RpbGwgYSBuZXQgcmVkdWN0aW9uIG92ZXJhbGwgYnV0LCB5
ZXMsIHRoZSBjb21tZW50IGNvdWxkIGhhdmUgYmVlbiBjbGVhcmVyLgoKPiBBbnl3YXksCj4gUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKClRoYW5rcywKCiAg
UGF1bAoKPiBKYW4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
