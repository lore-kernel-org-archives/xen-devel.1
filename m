From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 03/44] x86emul: correct EVEX decoding
Date: Fri, 26 Oct 2018 15:33:04 +0100
Message-ID: <84052c1f-256c-8fa3-a171-b0b340bafd72@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5BAA34B502000078001EB9B6@prv1-mh.provo.novell.com>
 <5BAA37B902000078001EB9E6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f8h9=ng=citrix.com=prvs=8302ac893=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gG3Ai-0003Fb-Lv
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 14:33:08 +0000
In-Reply-To: <5BAA37B902000078001EB9E6@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDkvMjAxOCAxNDoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRml4IGFuIGludmVydGVk
IHBhaXIgb2YgY2hlY2tzLCBkcm9wIGFuIGluY29ycmVjdCBpbnN0YW5jZSBvZiAjVUQKPiByYWlz
aW5nIGZvciBub24tNjQtYml0IG1vZGUsIGFuZCBhZGQgZnVydGhlciBnZW5lcmljIGNoZWNrcy4K
Pgo+IE5vdGU6IE90aGVyIHRoYW4gU0RNIFZvbCAyIHJldiAwNjcgc3RhdGVzLCBFVkVYLlYnIGlz
IF9ub3RfIGlnbm9yZWQKCiJEZXNwaXRlIHdoYXQgU0RNIC4uLiIgd291bGQgYmUgYSBtb3JlIG5v
cm1hbCB3YXkgb2YgcGhyYXNpbmcgdGhpcywgSSB0aGluay4KCgo+ICAgICAgIG91dHNpZGUgb2Yg
NjQtYml0IG1vZGUgd2hlbiB0aGUgZmllbGQgZG9lcyBub3QgZW5jb2RlIGEgcmVnaXN0ZXIuCj4g
ICAgICAgSnVzdCBsaWtlIEVWRVguVlZWViBpcyByZXF1aXJlZCB0byBiZSAwYjExMTEgaW4gdGhh
dCBjYXNlLCBFVkVYLlYnCj4gICAgICAgaXMgcmVxdWlyZWQgdG8gYmUgMSB0aGVyZS4KPgo+IEFs
c28gcmVuYW1lIHRoZSBiY3N0IGZpZWxkIHRvIGJyLCBhcyAjVUQgZ2VuZXJhdGlvbiBmb3IgaW5k
aXZpZHVhbCBpbnNucwo+IHdpbGwgbmVlZCB0byBjb25zaWRlciBib3RoIG9mIGl0cyBwb3NzaWJs
ZSBtZWFuaW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKSSBzdGlsbCBkb24ndCBsaWtlIGhvdyBoYXJkIGl0IGlzIHRvIGNvbXBhcmUgdGhlIGNvZGUg
dG8gdGhlIG1hbnVhbCwgYnV0CmdpdmVuIG5vIHBsYXVzaWJsZSBzb2x1dGlvbiwgSSdtIG5vdCBz
dXJlIHdoYXQgdG8gZG8uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
