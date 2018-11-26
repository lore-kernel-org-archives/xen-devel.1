From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 1/2] amd-iommu: replace occurrences of
 bool_t with bool
Date: Mon, 26 Nov 2018 09:52:56 +0000
Message-ID: <7bc8797572844eb098910f00fad789a4@AMSPEX02CL03.citrite.net>
References: <20181126090526.21737-1-paul.durrant@citrix.com>
 <20181126090526.21737-2-paul.durrant@citrix.com>
 <5BFBBF1902000078001FFCC3@prv1-mh.provo.novell.com>
 <3182a6c90f7249c683abca727f6c4768@AMSPEX02CL03.citrite.net>
 <5BFBC20002000078001FFD0B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xvjc=of=citrix.com=prvs=861df4a88=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gRDZc-0008R8-Ew
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 09:53:00 +0000
In-Reply-To: <5BFBC20002000078001FFD0B@prv1-mh.provo.novell.com>
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
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMjYgTm92ZW1iZXIgMjAxOCAwOTo1MQo+IFRvOiBQ
YXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiBCcmlhbiBXb29kcyA8
YnJpYW4ud29vZHNAYW1kLmNvbT47IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdAo+IDxzdXJhdmVlLnN1
dGhpa3VscGFuaXRAYW1kLmNvbT47IHhlbi1kZXZlbCA8eGVuLQo+IGRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnPgo+IFN1YmplY3Q6IFJFOiBbWGVuLWRldmVsXSBbUEFUQ0ggMS8yXSBhbWQtaW9t
bXU6IHJlcGxhY2Ugb2NjdXJyZW5jZXMgb2YKPiBib29sX3Qgd2l0aCBib29sCj4gCj4gPj4+IE9u
IDI2LjExLjE4IGF0IDEwOjQwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4g
VGhhbmtzLiBBcmUgeW91IGhhcHB5IHRvIGZpeCB1cCBvbiBjb21taXQgb3Igd291bGQgeW91IGxp
a2UgYSB2Mj8KPiAKPiBUbyBiZSBob25lc3QgaW4gdGhpcyBjYXNlIEknZCBwcmVmZXIgYSB2Mi4K
PiAKCk9rLCBzdXJlLiBTaW5jZSBJIG5lZWQgdG8gbWFrZSBhZGp1c3RtZW50cyB0byBwYXRjaCAj
MiB0aGF0J3Mgbm8gcHJvYmxlbS4KCiAgUGF1bAoKPiBKYW4KPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
