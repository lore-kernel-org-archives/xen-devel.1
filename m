From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 8/8] tools/libvchan:
 libxenvchan_client_init: use ENOENT for no server
Date: Tue, 6 Nov 2018 15:57:41 +0000
Message-ID: <23521.47605.230117.611652@mariner.uk.xensource.com>
References: <23516.33005.649128.145551@mariner.uk.xensource.com>
 <20181102170113.11646-1-ian.jackson@eu.citrix.com>
 <20181102170113.11646-9-ian.jackson@eu.citrix.com>
 <20181106100016.hawdyzngqvo3zi73@zion.uk.xensource.com>
 <23521.32491.467037.246289@mariner.uk.xensource.com>
 <20181106121555.GU1638@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdlp=nr=citrix.com=prvs=841612198=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gK3je-0001V8-6F
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 15:57:46 +0000
In-Reply-To: <20181106121555.GU1638@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIlJlOiBbUEFUQ0ggOC84XSB0b29s
cy9saWJ2Y2hhbjogbGlieGVudmNoYW5fY2xpZW50X2luaXQ6IHVzZSBFTk9FTlQgZm9yIG5vIHNl
cnZlciIpOgo+IE9uIFR1ZSwgTm92IDA2LCAyMDE4IGF0IDExOjQ1OjQ3QU0gKzAwMDAsIElhbiBK
YWNrc29uIHdyb3RlOgo+ID4gUmlnaHQuICBNYXJlaywgdGhpcyBzZXJpZXMgd2FzIGludGVuZGVk
IHRvIGhlbHAgd2l0aCB2Y2hhbiBmb3IgcW1wLgo+ID4gQnV0IG9idmlvdXNseSBJIGRvbid0IHdh
bnQgdG8gYnJlYWsgYW55dGhpbmcgZWxzZS4gIEkgZG9uJ3QgdGhpbmsgdGhpcwo+ID4gc2hvdWxk
IGJyZWFrIGFueXRoaW5nIGJ1dCBJIHdvdWxkIGFwcHJlY2lhdGUgYSByZXZpZXcgb3IgYXQgbGVh
c3QgYW4KPiA+IG9waW5pb24uLi4KPiAKPiBEb2VzIHhlbnRvb2xsb2cgcmVxdWlyZSBhbnkgZXhw
bGljaXQgY29uZmlndXJhdGlvbj8gSWYgeWVzLCB0aGF0IHdvdWxkCj4gYnJlYWsgbm9uLXhlbi10
b29scyB1c2VycyAoaW5jbHVkaW5nIFF1YmVzKS4gT3RoZXJ3aXNlIGxvb2tzIGdvb2QuCj4gVGhh
bmtzIQoKSHJtLgoKbGlidmNoYW4gYWxyZWFkeSB0YWtlcyBhbiB4dGwgbG9nZ2VyIGFzIGFuIGFy
Z3VtZW50LCBhbmQgcGFzc2VzIHRoYXQKb24gdG8gbG93ZXItbGF5ZXIgbGlicmFyaWVzLiAgU28g
aXQncyBhbHJlYWR5IGluIHRoZXJlLiAgVGhlIG9ubHkKZGlmZmVyZW5jZSBpcyB0aGF0IGl0IGlz
IHVzZWQgZGlyZWN0bHkgYnkgbGliY2hhbiBub3cuCgpCdXQgSSB0cmllZCB0byBtYWtlIGFuIGFy
Z3VtZW50IHRoYXQgdGhlIG5ldyBsb2cgbWVzc2FnZSBjb3VsZCBjYXVzZQpubyBwcm9ibGVtIGFu
ZCBJIHRoaW5rIHRoYXQncyBhY3R1YWxseSB3cm9uZy4gIGxpYnZjaGFuIHJpZ2h0IG5vdwpwYXNz
ZXMgdGhhdCBsb2dnZXIgdG8geGVuZ250c2hyX29wZW4gYW5kIHhlbmV2dGNobl9vcGVuLCBidXQg
dGhvc2UKYm90aCB0b2xlcmF0ZSBOVUxMIChhbmQgbWFrZSB1cCB0aGVpciBvd24gbG9nZ2VyIHdo
aWNoIHdyaXRlcyB0bwpzdGRlcnIpLgoKQnV0IHdpdGggbXkgY2hhbmdlLCBOVUxMIHdpbGwgY2F1
c2UgYSBjcmFzaCBpZiBuZXcgZXJyb3IgY29uZGl0aW9uCm9jY3Vycy4KCklhbi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
