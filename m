From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xenforeignmemory: work around bug in older
 privcmd
Date: Mon, 27 Aug 2018 03:04:55 -0600
Message-ID: <5B83BEB702000078001E20AA@prv1-mh.provo.novell.com>
References: <20180824121626.27261-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jola=lk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuDSH-0004Mk-6f
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 09:05:01 +0000
In-Reply-To: <20180824121626.27261-1-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA4LjE4IGF0IDE0OjE2LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFZlcnNpb25zIG9mIGxpbnV4IHByaXZjbWQgcHJpb3IgdG8gY29tbWl0IGRjOWVhYjZmZDk0
ZCAoInJldHVybiAtRU5PVFRZCj4gZm9yIHVuaW1wbGVtZW50ZWQgSU9DVExzIikgd2lsbCByZXR1
cm4gLUVJTlZBTCByYXRoZXIgdGhhbiB0aGUgY29udmVudGlvbmFsCj4gLUVOT1RUWSBmb3IgdW5p
bXBsZW1lbnRlZCBjb2Rlcy4gVGhpcyBicmVha3MgdGhlIGVycm9yIHBhdGggaW4KPiBsaWJ4ZW5m
b3JlaWdubWVtb3J5IHJlc291cmNlIG1hcHBpbmcsIHdoaWNoIG9ubHkgdHJhbnNsYXRlcyBFTk9U
VFkgaW50bwo+IEVPUE5PVFNVUFAgdG8gaW5mb3JtIGNhbGxlcnMgb2YgdGhlIG5lZWQgdG8gdXNl
IGFuIGFsdGVybmF0aXZlIChsZWdhY3kpCj4gbWVjaGFuaXNtLgo+IAo+IFRoaXMgcGF0Y2ggYWRk
cyBhIG5ldyAndW5pbXBsZW1lbnRlZCcgWzFdIGlvY3RsIGNvZGUgaW50byB0aGUgbG9jYWwKPiBw
cml2Y21kIGhlYWRlciB3aGljaCBpcyB0aGVuIHVzZWQgdG8gcHJvYmUgZm9yIHRoZSBhcHByb3By
aWF0ZSBlcnJubyB0bwo+IHRyYW5zbGF0ZSBpbiB0aGUgcmVzb3VyY2UgbWFwcGluZyBlcnJvciBw
YXRoCj4gCj4gWzFdIHRoaXMgaXMgYSBjb2RlIHRoYXQgaGFzLCBzbyBmYXIsIG5ldmVyIGJlZW4g
dXNlZCBpbiBhbnkgdmVyc2lvbiBvZgo+ICAgICBwcml2Y21kIGFuZCB3aWxsIGJlIGFkZGVkIHRv
IGZ1dHVyZSB2ZXJzaW9ucyBvZiB0aGUgaGVhZGVyIGluIHRoZQo+ICAgICBsaW51eCBzb3VyY2Us
IHRvIG1ha2Ugc3VyZSBpdCBzdGF5cyB1bmltcGxlbWVudGVkLgoKU2hvdWxkbid0IHRoaXMgYWRk
aXRpb24gaGFwcGVuIGJlZm9yZSB0aGUgWGVuIHRvb2xzIHNpZGUgY2hhbmdlIGdvZXMKaW4/CgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
