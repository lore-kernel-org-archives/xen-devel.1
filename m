From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH v2 0/7] x86: Meltdown band-aid overhead
	reduction
Date: Wed, 28 Feb 2018 04:52:49 -0700
Message-ID: <5A96A62102000078001ACAF7@prv-mh.provo.novell.com>
References: <5A7B31DF02000078001A61F9@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ets7=fw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1er0I9-0003X9-4Y
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 11:53:01 +0000
In-Reply-To: <5A7B31DF02000078001A61F9@prv-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE4IGF0IDE3OjA1LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IDE6
IHNsaWdodGx5IHJlZHVjZSBNZWx0ZG93biBiYW5kLWFpZCBvdmVyaGVhZAo+IDI6IHJlbW92ZSBD
UiByZWFkcyBmcm9tIGV4aXQtdG8tZ3Vlc3QgcGF0aAo+IDM6IGludHJvZHVjZSBhbHRpbnN0cnVj
dGlvbl9ub3AgYXNzZW1ibGVyIG1hY3JvCj4gNDogTk9QIG91dCBtb3N0IFhQVEkgZW50cnkvZXhp
dCBjb2RlIHdoZW4gaXQncyBub3QgaW4gdXNlCgpJJ3ZlIHVwZGF0ZWQgdGhpcyBvbmUgdG8gcGF0
Y2ggYWxsIHBhdGhzLCBidXQgSSdkIGxpa2UgdG8gYXZvaWQgc2VuZGluZwp2MyBvZiB0aGUgc2Vy
aWVzIHdpdGhvdXQgaGF2aW5nIGhhZCBhbnkgZmVlZGJhY2sgb24gdjIgKGxlYXZpbmcKYXNpZGUg
YSB0aW55IGJpdCBvbiBwYXRjaCAxKS4KCkphbgoKPiA1OiBhdm9pZCBkb3VibGUgQ1IzIHJlbG9h
ZCB3aGVuIHN3aXRjaGluZyB0byBndWVzdCB1c2VyIG1vZGUKPiA2OiBkaXNhYmxlIFhQVEkgd2hl
biBSRENMX05PCj4gNzogeDg2OiBsb2cgWFBUSSBlbmFibGVkIHN0YXR1cwo+IAo+IEkgd29uJ3Qg
bWluZCBpZiBpdCB3YXMgZGVjaWRlZCBmb3Igc29tZSBvZiB0aGVtIHRvIGJlIHBvaW50bGVzcywg
YnV0IEkKPiB0aGluayAxIChiZWNhdXNlIG9mIGEgbWVhc3VyYWJsZSBpbXByb3ZlbWVudCBvZiAx
LTMlKSwgNCAoaGVscGluZwo+IHRoZSAieHB0aT1ubyIgY2FzZSwgZXZlbiBpZiBvbmx5IGEgbGl0
dGxlOyB0YWtpbmcgMyBhcyBwcmVyZXEpLCBhbmQKPiA2Kzcgc2hvdWxkIGJlIGNvbnNpZGVyZWQg
c2VyaW91c2x5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
