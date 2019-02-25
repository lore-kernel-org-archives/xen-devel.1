From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/shadow: don't use
 map_domain_page_global() on paths that may not fail
Date: Mon, 25 Feb 2019 21:04:43 +0100
Message-ID: <d7840065-dfe1-471b-d059-d40f9c7775d9@suse.com>
References: <5C6D6F11020000780021883E@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kH8z=RA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gyMUX-0000xA-I3
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 20:04:45 +0000
In-Reply-To: <5C6D6F11020000780021883E@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDIvMjAxOSAxNjoxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGFzc3VtcHRpb24g
KGFjY29yZGluZyB0byBvbmUgY29tbWVudCkgYW5kIGhvcGUgKGFjY29yZGluZyB0bwo+IGFub3Ro
ZXIpIHRoYXQgbWFwX2RvbWFpbl9wYWdlX2dsb2JhbCgpIGNhbid0IGZhaWwgYXJlIGJvdGggd3Jv
bmcgb24KPiBsYXJnZSBlbm91Z2ggc3lzdGVtcy4gRG8gYXdheSB3aXRoIHRoZSBndWVzdF92dGFi
bGUgZmllbGQgYWx0b2dldGhlciwKPiBhbmQgZXN0YWJsaXNoIC8gdGVhciBkb3duIHRoZSBkZXNp
cmVkIG1hcHBpbmcgYXMgbmVjZXNzYXJ5Lgo+IAo+IFRoZSBhbHRlcm5hdGl2ZXMsIGRpc2NhcmRl
ZCBhcyBiZWluZyB1bmRlc2lyYWJsZSwgd291bGQgaGF2ZSBiZWVuIHRvCj4gZWl0aGVyIGNyYXNo
IHRoZSBndWVzdCBpbiBzaF91cGRhdGVfY3IzKCkgd2hlbiB0aGUgbWFwcGluZyBmYWlscywgb3Ig
dG8KPiBidWJibGUgdXAgYW4gZXJyb3IgaW5kaWNhdG9yLCB3aGljaCB1cHBlciBsYXllcnMgd291
bGQgaGF2ZSBhIGhhcmQgdGltZQo+IHRvIGRlYWwgd2l0aCAob3RoZXIgdGhhbiBhZ2FpbiBieSBj
cmFzaGluZyB0aGUgZ3Vlc3QpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
