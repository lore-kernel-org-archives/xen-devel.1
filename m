From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH fuzzer v1] Added the --ignore-sigill option
 for AFL fuzzing
Date: Tue, 23 Apr 2019 11:25:42 +0100
Message-ID: <c9bcf477-72b4-39d9-7d3b-bf346b4d9765@citrix.com>
References: <20190418150238.15352-1-samcacc@amazon.de>
 <bf2d1ac9-ae2f-4e37-f7ab-7d21373fb597@citrix.com>
 <1556010631911.24573@amazon.com>
 <75edc89a-cda7-81ec-afca-1d31f08d6897@citrix.com>
 <1556014350963.34293@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RGA1=SZ=citrix.com=prvs=00953f314=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hIsdF-0005K4-Co
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:26:33 +0000
In-Reply-To: <1556014350963.34293@amazon.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Caccavale, Samuel" <samcacc@amazon.com>, Sam Caccavale <samcacc@amazon.de>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, "Woodhouse, David" <dwmw@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>, "Doebel,
 Bjoern" <doebel@amazon.de>, "Manthey, Norbert" <nmanthey@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDQvMjAxOSAxMToxMiwgQ2FjY2F2YWxlLCBTYW11ZWwgd3JvdGU6Cj4gWWVzLiAgQ3Vy
cmVudCBzdGFnaW5nIHJlc29sdmVzIGFsbCBvZiB0aGUgU0lHLUlMTCByZWxhdGVkIGNyYXNoZXMu
Cj4KPiBUYW5nZW50aWFsbHkgSSBoYXZlIH4xMDAwIGNyYXNoZXMgd2hpY2ggZmFpbCB0aGUgYGN0
eHQtPnJlZ3MtPnIoaXApID09IG9yaWdfaXAnCj4gYXNzZXJ0IGF0IHg4Nl9lbXVsYXRlL3g4Nl9l
bXVsYXRlLmM6OTg2MiB3aGVuIGNvbXBpbGluZyBhZmwtaGFybmVzcyBzdGF0aWNhbGx5Cj4gd2l0
aCBhZmwtY2xhbmctZmFzdC4gIFRoZXkgZG8gbm90IHJlcHJvZHVjZSB3aGVuIGNvbXBpbGVkIGR5
bmFtaWNhbGx5IG9yCj4gY29tcGlsZWQgaW4gYW55IHdheSB3aXRoIGFmbC1nY2MuCj4KPiBJIHdp
bGwgbG9vayBpbnRvIHRoZXNlIGFuZCBvcGVuIGEgbmV3IGVtYWlsIGNoYWluIGlmIHRoaXMgaXMg
YSBwcm9ibGVtIHdpdGggWGVuLAo+IHRob3VnaCBpdCBsb29rcyBsaWtlIGFuIGFmbCBvciBsbHZt
IGlzc3VlLiAgSWYgeW91IGhhdmUgYW55IGluc2lnaHQgdGhlbiBwbGVhc2UKPiBsZXQgbWUga25v
dy4KCkhtbSAtIHRoYXQgaXMgY3VyaW91cy4KCk15IGd1dCBmZWVsaW5ncyBhcmUgZWl0aGVyIGEg
Y29tcGlsZXIgaXNzdWUgKHRoZSBzd2l0Y2ggc3RhdGVtZW50IGlzIGEKbW9uc3RlciwgYW5kIHRo
ZXJlIGlzIGEgbG90IG9mIGNvbXBsaWNhdGVkIGFzbSgpKSwgb3IgdGhhdAphZmwtY2xhbmctZmFz
dCBoYXMgZm91bmQgYW4gb3B0aW1pc2F0aW9uIHdoaWNoIGRlY2lkZWQgdGhhdCBhIHBpZWNlIG9m
CmxvZ2ljIGlzIGRlYWQsIGFuZCBoYXMgdGFrZW4gaXQgb3V0LgoKVGhhdCBwYXJ0aWN1bGFyIGFz
c2VydCBpcyBjaGVja2luZyB0aGF0IHdoZW4geDg2X2VtdWxhdGUoKSByZXR1cm4KWDg2RU1VTF9F
WENFUFRJT04sIFJJUCBkb2Vzbid0IG1vdmUsIGkuZS4gaGFzIGZhdWx0IHNlbWFudGljcywgd2hp
Y2ggaXMKcmVxdWlyZWQgYnkgdGhlIGhpZ2hlciBsZXZlbCBsb2dpYy7CoCBJJ2QgdHJ5IHRyYWNp
bmcgb25lIHNwZWNpZmljIGNyYXNoCmNhc2UgdGhyb3VnaCB0aGUgZGlmZmVyZW50IGhhcm5lc3Mg
YmluYXJpZXMgYW5kIHNlZSB3aGVyZSB0aGVpcgpleGVjdXRpb24gZGl2ZXJnZXMuCgp+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
