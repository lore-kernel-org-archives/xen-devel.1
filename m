From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 07/16] x86/shadow: fetch CPL just once in
 sh_page_fault()
Date: Wed, 11 Jul 2018 14:41:00 +0100
Message-ID: <1de23215-b088-064e-6690-83ccb709fa83@citrix.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B46064302000078001D328C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cheb=j3=citrix.com=prvs=72379a78f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fdFMg-0001h5-8k
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 13:41:06 +0000
In-Reply-To: <5B46064302000078001D328C@prv1-mh.provo.novell.com>
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
Cc: Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDcvMTggMTQ6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgaXNuJ3QgYXMgbXVj
aCBvZiBhbiBvcHRpbWl6YXRpb24gdGhhbiB0byBhdm9pZCB0cmlnZ2VyaW5nIGEgZ2NjIGJ1Zwo+
IGFmZmVjdGluZyA1LnggLi4uIDcueCwgdHJpZ2dlcmVkIGJ5IGFueSBhc20oKSBwdXQgaW5zaWRl
IHRoZSBhZCBob2MKPiAicmV3YWxrIiBsb29wIGFuZCB0YWtpbmcgYXMgYW4gKG91dHB1dD8pIG9w
ZXJhbmQgYSByZWdpc3RlciB2YXJpYWJsZQo+IHRpZWQgdG8gJXJkeCAoYW4gInJkeCIgY2xvYmJl
ciBpcyBmaW5lKS4gVGhlIGlzc3VlIGlzIGR1ZSB0byBhbiBhcHBhcmVudAo+IGNvbGxpc2lvbiBp
biByZWdpc3RlciB1c2Ugd2l0aCB0aGUgbW9kdWxvIG9wZXJhdGlvbiBpbiB2dGxiX2hhc2goKSwK
PiB3aGljaCAod2l0aCBvcHRpbWl6YXRpb24gZW5hYmxlZCkgaW52b2x2ZXMgYSBtdWx0aXBsaWNh
dGlvbiBvZiB0d28KPiA2NC1iaXQgdmFsdWVzIHdpdGggdGhlIHVwcGVyIGhhbGYgKGluICVyZHgp
IG9mIHRoZSAxMjgtYml0IHJlc3VsdCBiZWluZwo+IG9mIGludGVyZXN0Lgo+Cj4gU3VjaCBhbiBh
c20oKSB3YXMgb3JpZ2luYWxseSBtZWFudCB0byBiZSBpbXBsaWNpdGx5IGludHJvZHVjZWQgaW50
byB0aGUKPiBjb2RlIHdoZW4gY29udmVydGluZyBtb3N0IGluZGlyZWN0IGNhbGxzIHRocm91Z2gg
dGhlIGh2bV9mdW5jcyB0YWJsZSB0bwo+IGRpcmVjdCBjYWxscyAodmlhIGFsdGVybmF0aXZlIGlu
c3RydWN0aW9uIHBhdGNoaW5nKTsgdGhhdCBtb2RlbCB3YXMKPiBzd2l0Y2hlZCB0byBjbG9iYmVy
cyBkdWUgdG8gZnVydGhlciBjb21waWxlciBwcm9ibGVtcywgYnV0IEkgdGhpbmsgdGhlCj4gY2hh
bmdlIGhlcmUgaXMgd29ydGh3aGlsZSBuZXZlcnRoZWxlc3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJdCBzY2FyZXMgbWUgaG93IG1hbnkgY29t
cGlsZXIgYnVncyBnZXQgZm91bmQgd2l0aCB3b3JrIGxpa2UgdGhpcy4KCkFzIGZvciB0aGUgY2hh
bmdlIGl0c2VsZiwgSSBhZ3JlZSB0aGF0IGl0IGlzIHdvcnRod2hpbGUgaXJyZXNwZWN0aXZlIG9m
CnRvb2xjaGFpbiBpc3N1ZXMuCgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
