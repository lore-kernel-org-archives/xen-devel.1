From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xenforeignmemory: work around bug in older
 privcmd
Date: Fri, 24 Aug 2018 14:24:38 +0100
Message-ID: <20180824132438.m3ic2xonpy4eaf46@citrix.com>
References: <20180824121626.27261-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8yf=lh=citrix.com=prvs=76773b150=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftC4w-0000zL-Ic
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 13:24:42 +0000
Content-Disposition: inline
In-Reply-To: <20180824121626.27261-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMjQsIDIwMTggYXQgMDE6MTY6MjZQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFZlcnNpb25zIG9mIGxpbnV4IHByaXZjbWQgcHJpb3IgdG8gY29tbWl0IGRjOWVhYjZm
ZDk0ZCAoInJldHVybiAtRU5PVFRZCj4gZm9yIHVuaW1wbGVtZW50ZWQgSU9DVExzIikgd2lsbCBy
ZXR1cm4gLUVJTlZBTCByYXRoZXIgdGhhbiB0aGUgY29udmVudGlvbmFsCj4gLUVOT1RUWSBmb3Ig
dW5pbXBsZW1lbnRlZCBjb2Rlcy4gVGhpcyBicmVha3MgdGhlIGVycm9yIHBhdGggaW4KPiBsaWJ4
ZW5mb3JlaWdubWVtb3J5IHJlc291cmNlIG1hcHBpbmcsIHdoaWNoIG9ubHkgdHJhbnNsYXRlcyBF
Tk9UVFkgaW50bwo+IEVPUE5PVFNVUFAgdG8gaW5mb3JtIGNhbGxlcnMgb2YgdGhlIG5lZWQgdG8g
dXNlIGFuIGFsdGVybmF0aXZlIChsZWdhY3kpCj4gbWVjaGFuaXNtLgo+IAo+IFRoaXMgcGF0Y2gg
YWRkcyBhIG5ldyAndW5pbXBsZW1lbnRlZCcgWzFdIGlvY3RsIGNvZGUgaW50byB0aGUgbG9jYWwK
PiBwcml2Y21kIGhlYWRlciB3aGljaCBpcyB0aGVuIHVzZWQgdG8gcHJvYmUgZm9yIHRoZSBhcHBy
b3ByaWF0ZSBlcnJubyB0bwo+IHRyYW5zbGF0ZSBpbiB0aGUgcmVzb3VyY2UgbWFwcGluZyBlcnJv
ciBwYXRoCj4gCj4gWzFdIHRoaXMgaXMgYSBjb2RlIHRoYXQgaGFzLCBzbyBmYXIsIG5ldmVyIGJl
ZW4gdXNlZCBpbiBhbnkgdmVyc2lvbiBvZgo+ICAgICBwcml2Y21kIGFuZCB3aWxsIGJlIGFkZGVk
IHRvIGZ1dHVyZSB2ZXJzaW9ucyBvZiB0aGUgaGVhZGVyIGluIHRoZQo+ICAgICBsaW51eCBzb3Vy
Y2UsIHRvIG1ha2Ugc3VyZSBpdCBzdGF5cyB1bmltcGxlbWVudGVkLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gLS0tCgpBY2tlZC1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
