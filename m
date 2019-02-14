From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 v2 2/7] amd/npt/shadow: replace
 assert that prevents creating 2M/1G MMIO entries
Date: Thu, 14 Feb 2019 07:48:15 -0700
Message-ID: <5C657FAF0200007800216BF6@prv1-mh.provo.novell.com>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-3-roger.pau@citrix.com>
 <5C643D6A020000780021661A@prv1-mh.provo.novell.com>
 <20190214135910.egdaixdbv6zogwfx@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guIJK-0004Nd-CR
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 14:48:22 +0000
In-Reply-To: <20190214135910.egdaixdbv6zogwfx@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAyLjE5IGF0IDE0OjU5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRmViIDEzLCAyMDE5IGF0IDA4OjUzOjE0QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTEuMDIuMTkgYXQgMTg6NDYsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gVGhlIGFzc2VydCB3YXMgb3JpZ2luYWxseSBhZGRlZCB0byBtYWtlIHN1cmUg
dGhhdCBoaWdoZXIgb3JkZXIKPj4gPiByZWdpb25zICg+IFBBR0VfT1JERVJfNEspIGNvdWxkIG5v
dCBiZSB1c2VkIHRvIGJ5cGFzcyB0aGUKPj4gPiBtbWlvX3JvX3JhbmdlcyBjaGVjayBwZXJmb3Jt
ZWQgYnkgcDJtX3R5cGVfdG9fZmxhZ3MuCj4+ID4gCj4+ID4gVGhpcyBob3dldmVyIGlzIGFscmVh
ZHkgY2hlY2tlZCBpbiBzZXRfbW1pb19wMm1fZW50cnksIHdoaWNoIG1ha2VzCj4+ID4gc3VyZSB0
aGF0IGhpZ2hlciBvcmRlciBtYXBwaW5ncyBkb24ndCBvdmVybGFwIHdpdGggbW1pb19yb19yYW5n
ZXMsCj4+ID4gdGh1cyBhbGxvd2luZyB0aGUgY3JlYXRpb24gb2YgaGlnaCBvcmRlciBNTUlPIG1h
cHBpbmdzIHNhZmVseS4KPj4gPiAKPj4gPiBSZXBsYWNlIHRoZSBhc3NlcnQgdG8gYWxsb3cgMk0v
MUcgZW50cmllcyB0byBiZSBjcmVhdGVkIGZvciBNTUlPCj4+ID4gcmVnaW9ucyBhbmQgYWRkIHNv
bWUgZXh0cmEgYXNzZXJ0cyBhcyBhIHJlcGxhY2VtZW50IHRvIG1ha2Ugc3VyZQo+PiA+IHRoZXJl
J3Mgbm8gb3ZlcmxhcHBpbmcgd2l0aCBNTUlPIHJlYWQtb25seSByYW5nZXMuCj4+ID4gCj4+ID4g
Tm90ZSB0aGF0IDFHIE1NSU8gZW50cmllcyB3aWxsIG5vdCBiZSBjcmVhdGVkIHVubGVzcyBtbWlv
X29yZGVyIGlzCj4+ID4gY2hhbmdlZCB0byBhbGxvdyBpdC4KPj4gPiAKPj4gPiBTdWdnZXN0ZWQt
Ynk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPj4gCj4+IElzIHRo
aXMgc3RpbGwgdGhlIGNhc2U/IElpcmMgdGhlIG9yaWdpbmFsIHN1Z2dlc3Rpb24gd2FzIHRvIHJl
bW92ZQo+PiB0aGUgYXNzZXJ0aW9uIGFsdG9nZXRoZXI/Cj4gCj4gUmlnaHQsIHNob3VsZCBJIGlu
c3RlYWQgYWRkIHlvdXIgc3VnZ2VzdGVkLWJ5IHRhZz8KCk9yIHNpbXBseSBsZWF2ZSBpdCBvdXQ/
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
