From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/shadow: don't use
 map_domain_page_global() on paths that may not fail
Date: Fri, 22 Feb 2019 12:33:07 +0000
Message-ID: <20190222123307.GE258@deinos.phlegethon.org>
References: <5C6D6F11020000780021883E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ipoK=Q5=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1gxA0t-0001jk-OQ
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 12:33:11 +0000
Content-Disposition: inline
In-Reply-To: <5C6D6F11020000780021883E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgMDg6MTUgLTA3MDAgb24gMjAgRmViICgxNTUwNjUwNTI5KSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gVGhlIGFzc3VtcHRpb24gKGFjY29yZGluZyB0byBvbmUgY29tbWVudCkgYW5kIGhvcGUgKGFj
Y29yZGluZyB0bwo+IGFub3RoZXIpIHRoYXQgbWFwX2RvbWFpbl9wYWdlX2dsb2JhbCgpIGNhbid0
IGZhaWwgYXJlIGJvdGggd3Jvbmcgb24KPiBsYXJnZSBlbm91Z2ggc3lzdGVtcy4gRG8gYXdheSB3
aXRoIHRoZSBndWVzdF92dGFibGUgZmllbGQgYWx0b2dldGhlciwKPiBhbmQgZXN0YWJsaXNoIC8g
dGVhciBkb3duIHRoZSBkZXNpcmVkIG1hcHBpbmcgYXMgbmVjZXNzYXJ5Lgo+IAo+IFRoZSBhbHRl
cm5hdGl2ZXMsIGRpc2NhcmRlZCBhcyBiZWluZyB1bmRlc2lyYWJsZSwgd291bGQgaGF2ZSBiZWVu
IHRvCj4gZWl0aGVyIGNyYXNoIHRoZSBndWVzdCBpbiBzaF91cGRhdGVfY3IzKCkgd2hlbiB0aGUg
bWFwcGluZyBmYWlscywgb3IgdG8KPiBidWJibGUgdXAgYW4gZXJyb3IgaW5kaWNhdG9yLCB3aGlj
aCB1cHBlciBsYXllcnMgd291bGQgaGF2ZSBhIGhhcmQgdGltZQo+IHRvIGRlYWwgd2l0aCAob3Ro
ZXIgdGhhbiBhZ2FpbiBieSBjcmFzaGluZyB0aGUgZ3Vlc3QpLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkkgZm9sbG93IHlvdXIgYXJndW1lbnQs
IHNvIEFja2VkLWJ5OiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KCkkgd291bGQgZXhwZWN0IHRo
aXMgdG8gaGF2ZSBhIG1lYXN1cmFibGUgY29zdCBvbiBwYWdlIGZhdWx0IHRpbWVzIChvbgpjb25m
aWd1cmF0aW9ucyB3aGVyZSBnbG9iYWwgbWFwIGlzbid0IGp1c3QgYSBkaXJlY3RtYXApLiAgSXQg
d291bGQgYmUKZ29vZCB0byBrbm93IGlmIHRoYXQncyB0aGUgY2FzZS4KCkNoZWVycywKClRpbS4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
