From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] IOMMU/x86: make page type checks
 consistent when mapping pages
Date: Tue, 5 Mar 2019 14:50:32 +0100
Message-ID: <5c1f67ea-59e1-6acd-840a-5c359bb663db@suse.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E78F6020000780021BB21@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h1ASq-0001HG-1J
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 13:50:36 +0000
In-Reply-To: <5C7E78F6020000780021BB21@suse.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxNDoyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlcmUgYXJlIGN1cnJl
bnRseSB0aHJlZSBtb3JlIG9yIGxlc3MgZGlmZmVyZW50IGNoZWNrczoKPiAtIF9nZXRfcGFnZV90
eXBlKCkgYWRqdXN0cyB0aGUgSU9NTVUgbWFwcGluZ3MgYWNjb3JkaW5nIHRvIHRoZSBuZXcgdHlw
ZQo+ICAgYWxvbmUsCj4gLSBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFibGUoKSB3YW50cyBq
dXN0IHRoZSB0eXBlIHRvIGJlCj4gICBQR1Rfd3JpdGFibGVfcGFnZSwKPiAtIGlvbW11X2h3ZG9t
X2luaXQoKSBhZGRpdGlvbmFsbHkgcGVybWl0cyBhbGwgb3RoZXIgdHlwZXMgd2l0aCBhIHR5cGUK
PiAgIHJlZmNvdW50IG9mIHplcm8uCj4gVGhlIGNhbm9uaWNhbCBvbmUgaXMgaW4gX2dldF9wYWdl
X3R5cGUoKSwgYW5kIGFzIG9mIFhTQS0yODgKPiBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFi
bGUoKSBhbHNvIGhhcyBubyBuZWVkIGFueW1vcmUgdG8gZGVhbCB3aXRoCj4gUEdUX25vbmUgcGFn
ZXMuIEluIHRoZSBQViBEb20wIGNhc2UsIGhvd2V2ZXIsIFBHVF9ub25lIHBhZ2VzIGFyZSBzdGls
bAo+IG5lY2Vzc2FyeSB0byBjb25zaWRlciwgc2luY2UgaW4gdGhhdCBjYXNlIHBhZ2VzIGRvbid0
IGdldCBoYW5kZWQgdG8KPiBndWVzdF9waHlzbWFwX2FkZF9lbnRyeSgpLiBGdXJ0aGVybW9yZSwg
dGhlIGZ1bmN0aW9uIHNvIGZhciBhbHNvCj4gZXN0YWJsaXNoZWQgci9vIG1hcHBpbmdzLCB3aGlj
aCBpcyBub3QgaW4gbGluZSB3aXRoIHRoZSBydWxlcyBzZXQgZm9ydGgKPiBieSB0aGUgWFNBLTI4
OCBjaGFuZ2UuCj4gCj4gRm9yIGFyY2hfaW9tbXVfcG9wdWxhdGVfcGFnZV90YWJsZSgpIHRvIG5v
dCBlbmNvdW50ZXIgUEdUX25vbmUgcGFnZXMKPiBhbnltb3JlIGV2ZW4gaW4gY2FzZXMgd2hlcmUg
dGhlIElPTU1VIGdldHMgZW5hYmxlZCBmb3IgYSBkb21haW4gb25seQo+IHdoZW4gaXQgaXMgYWxy
ZWFkeSBydW5uaW5nLCByZXBsYWNlIHRoZSBJT01NVSBkZXBlbmRlbmN5IGluCj4gZ3Vlc3RfcGh5
c21hcF9hZGRfZW50cnkoKSdzIGhhbmRsaW5nIG9mIFBWIGd1ZXN0cyB0byBjaGVjayBqdXN0IHRo
ZQo+IHN5c3RlbSB3aWRlIHN0YXRlIGluc3RlYWQgb2YgdGhlIGRvbWFpbiBwcm9wZXJ0eS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJJ20gdW5h
YmxlIHRvIGRlY2lkZSB3aGV0aGVyIHRoaXMgcGF0Y2ggc2hvdWxkIG1ha2UgaXQgaW50byA0LjEy
IG9yIG5vdAp3aXRoIHRoZSBnaXZlbiBpbmZvcm1hdGlvbi4gV2hhdCBoYXBwZW5zIHdpdGhvdXQg
dGhpcyBwYXRjaCAod29yc3QKY2FzZSk/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
