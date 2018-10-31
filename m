From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libvchan: create xenstore entries in one
 transaction
Date: Wed, 31 Oct 2018 10:17:03 +0000
Message-ID: <20181031101703.emdlgaazvxsyq6jg@zion.uk.xensource.com>
References: <20181030234905.26142-1-marmarek@invisiblethingslab.com>
 <e8b0cc9d963d4afca2c9cd140cfe8567@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qv1o=nl=citrix.com=prvs=835e3026f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHnYp-0000hQ-D5
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 10:17:15 +0000
Content-Disposition: inline
In-Reply-To: <e8b0cc9d963d4afca2c9cd140cfe8567@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, 'Marek =?iso-8859-1?Q?Marczykowski-G=F3recki'?= <marmarek@invisiblethingslab.com>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMTA6MDg6MjZBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFhlbi1kZXZlbCBb
bWFpbHRvOnhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnXSBPbiBCZWhhbGYK
PiA+IE9mIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraQo+ID4gU2VudDogMzAgT2N0b2JlciAy
MDE4IDIzOjQ5Cj4gPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gPiBDYzog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBj
aXRyaXguY29tPjsKPiA+IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52
aXNpYmxldGhpbmdzbGFiLmNvbT4KPiA+IFN1YmplY3Q6IFtYZW4tZGV2ZWxdIFtQQVRDSF0gbGli
dmNoYW46IGNyZWF0ZSB4ZW5zdG9yZSBlbnRyaWVzIGluIG9uZQo+ID4gdHJhbnNhY3Rpb24KPiA+
IAo+ID4gVGhpcyB3aWxsIHByZXZlbnQgcmFjZSB3aGVuIGNsaWVudCB3YWl0cyBmb3Igc2VydmVy
IHdpdGggeHNfd2F0Y2ggLSBhbGwKPiA+IGVudHJpZXMgc2hvdWxkIGFwcGVhciBhdCBvbmNlLgo+
IAo+IFdhdGNoZXMgc2hvdWxkIGJlIHB1dCBvbiB0aGUgInN0YXRlIiBrZXkgdG8gYXZvaWQgdGhp
cyBraW5kIG9mIHRoaW5nLiBUaGF0IGtleSBzaG91bGQgYWx3YXlzIGJlIHRoZSBsYXN0IHRoaW5n
IG1vZGlmaWVkIGFuZCBoZW5jZSB0aGVyZSBzaG91bGQgbmV2ZXIgcmVhbGx5IGJlIHRoZSBuZWVk
IGZvciB4ZW5zdG9yZSB0cmFuc2FjdGlvbnMgYXQgYWxsLgoKQUlVSSBsaWJ4ZW52Y2hhbiBkb2Vz
bid0IGhhdmUgYSAic3RhdGUiIGtleS4gV2UgY2FuIGludHJvZHVjZSBvbmUgbm93CmJ1dCB3ZSBz
dGlsbCBuZWVkIHRvIGhhbmRsZSBvbGQgY29kZSB3aGljaCBkb2Vzbid0IGtub3cgYWJvdXQgdGhl
IG5ldwprZXkuCgpJIGNvdWxkIGJlIHdyb25nIGFib3V0IHRoZSBwcm90b2NvbCB0aG91Z2guCgpX
ZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
