From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/shadow: don't use
 map_domain_page_global() on paths that may not fail
Date: Wed, 20 Feb 2019 18:22:10 +0000
Message-ID: <daeab5cd-8129-f5bc-dd97-43218682ee47@citrix.com>
References: <5C6D6F11020000780021883E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4WCc=Q3=citrix.com=prvs=94761b710=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gwWWm-0004BC-4s
 for xen-devel@lists.xenproject.org; Wed, 20 Feb 2019 18:23:28 +0000
In-Reply-To: <5C6D6F11020000780021883E@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDIvMjAxOSAxNToxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGFzc3VtcHRpb24g
KGFjY29yZGluZyB0byBvbmUgY29tbWVudCkgYW5kIGhvcGUgKGFjY29yZGluZyB0bwo+IGFub3Ro
ZXIpIHRoYXQgbWFwX2RvbWFpbl9wYWdlX2dsb2JhbCgpIGNhbid0IGZhaWwgYXJlIGJvdGggd3Jv
bmcgb24KPiBsYXJnZSBlbm91Z2ggc3lzdGVtcy4gRG8gYXdheSB3aXRoIHRoZSBndWVzdF92dGFi
bGUgZmllbGQgYWx0b2dldGhlciwKPiBhbmQgZXN0YWJsaXNoIC8gdGVhciBkb3duIHRoZSBkZXNp
cmVkIG1hcHBpbmcgYXMgbmVjZXNzYXJ5Lgo+Cj4gVGhlIGFsdGVybmF0aXZlcywgZGlzY2FyZGVk
IGFzIGJlaW5nIHVuZGVzaXJhYmxlLCB3b3VsZCBoYXZlIGJlZW4gdG8KPiBlaXRoZXIgY3Jhc2gg
dGhlIGd1ZXN0IGluIHNoX3VwZGF0ZV9jcjMoKSB3aGVuIHRoZSBtYXBwaW5nIGZhaWxzLCBvciB0
bwo+IGJ1YmJsZSB1cCBhbiBlcnJvciBpbmRpY2F0b3IsIHdoaWNoIHVwcGVyIGxheWVycyB3b3Vs
ZCBoYXZlIGEgaGFyZCB0aW1lCj4gdG8gZGVhbCB3aXRoIChvdGhlciB0aGFuIGFnYWluIGJ5IGNy
YXNoaW5nIHRoZSBndWVzdCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
