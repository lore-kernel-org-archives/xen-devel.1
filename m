From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v6 4/6] mm: introduce a helper to get the
 memory type of a page
Date: Tue, 21 Aug 2018 17:26:27 +0200
Message-ID: <20180821152627.tpjdkkxz2wtfy4za@mac>
References: <20180821074944.38773-1-roger.pau@citrix.com>
 <20180821074944.38773-5-roger.pau@citrix.com>
 <5B7C0B3102000078001E0801@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=js+4=le=citrix.com=prvs=7646db883=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fs8YX-0004BL-Ip
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 15:26:53 +0000
Content-Disposition: inline
In-Reply-To: <5B7C0B3102000078001E0801@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMDY6NTM6MDVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIxLjA4LjE4IGF0IDA5OjQ5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gUmV0dXJucyBhbGwgdGhlIG1lbW9yeSB0eXBlcyBhcHBsaWNhYmxlIHRvIGEgcGFn
ZS4KPiA+IAo+ID4gVGhpcyBmdW5jdGlvbiBpcyB1bmltcGxlbWVudGVkIGZvciBBUk0uCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4g
QnV0IHRoaXMgc2hvdWxkIG9ubHkgZ28gaW4gdG9nZXRoZXIgd2l0aCB0aGUgY29uc3VtZXIgb2Yg
dGhlIG5ldyBmdW5jdGlvbgo+IHNlZWluZyB0aGF0IHlvdSBkaWRuJ3QgZm9sZCB0aGUgcGF0Y2hl
cy4KCk9oLCBzb3JyeS4gSSd2ZSBvbmx5IGZvbGRlZCB0aGUgdnBjaSBNTUNGRyBwYXRjaCBpbnRv
IHBhdGNoIDYuCgpTaW5jZSBJIGhhdmUgdG8gcmVzZW5kIHRoaXMgYW55d2F5IGluIG9yZGVyIHRv
IGFwcGx5IHRoZSByZXF1ZXN0ZWQKY2hhbmdlcyB0byBwYXRjaCA2IHdvdWxkIHlvdSBsaWtlIG1l
IHRvIGZvbGQgdGhpcyBpbnRvIHBhdGNoIDUgd2hlcmUKaXQncyBhY3R1YWxseSB1c2VkPwoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
