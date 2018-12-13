From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: rename paging function
Date: Thu, 13 Dec 2018 03:17:05 -0700
Message-ID: <5C1231A10200007800205C65@prv1-mh.provo.novell.com>
References: <5C0FD8B40200007800205267@prv1-mh.provo.novell.com>
 <20181212091455.xziv2gbsswljlur2@mac>
 <5C10DA96020000780020560C@prv1-mh.provo.novell.com>
 <20181212100407.j5hg4vqi2l4kjvsk@mac>
 <5C10E3D5020000780020564D@prv1-mh.provo.novell.com>
 <20181212155608.nujhjevz2yyqfjdw@mac>
 <5C11340D02000078002058FA@prv1-mh.provo.novell.com>
 <20181212170519.remicvdevdl6r65n@mac>
 <3F7E1F6E020000A10063616D@prv1-mh.provo.novell.com>
 <5C120E030200007800205B30@prv1-mh.provo.novell.com>
 <20181213091456.7wocasd422zs5u6y@mac>
 <3F7E1F6E020000A10063616D@prv1-mh.provo.novell.com>
 <5C120E030200007800205B30@prv1-mh.provo.novell.com>
 <12305AED020000300063616D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXO3L-0007sr-Qz
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 10:17:11 +0000
In-Reply-To: <12305AED020000300063616D@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjEyLjE4IGF0IDEwOjE0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgRGVjIDEzLCAyMDE4IGF0IDEyOjQ1OjA3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTIuMTIuMTggYXQgMTg6MDUsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gV2VkLCBEZWMgMTIsIDIwMTggYXQgMDk6MTU6MDlBTSAtMDcwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+IFRoZSBNTUlPIHNpZGUgb2YgdGhpbmdzIG9mIGNvdXJzZSBz
dGlsbCByZW1haW5zIHVuY2xlYXIuCj4+ID4gCj4+ID4gUmlnaHQsIGZvciB0aGUgTU1JTyBhbmQg
dGhlIGhhbmRsaW5nIG9mIGdyYW50IGFuZCBmb3JlaWduIG1hcHBpbmdzIGl0J3MKPj4gPiBub3Qg
Y2xlYXIgaG93IHdlIHdhbnQgdG8gcHJvY2VlZC4KPj4gPiAKPj4gPiBNYXliZSBhY2NvdW50IGZv
ciBhbGwgaG9zdCBSQU0gKHRvdGFsX3BhZ2VzKSBwbHVzIE1NSU8gQkFScz8KPj4gCj4+IFdlbGws
IEkgdGhvdWdodCB3ZSd2ZSBhbHJlYWR5IHNldHRsZWQgb24gaXQgYmVpbmcgaW1wb3NzaWJsZSB0
bwo+PiBhY2NvdW50IGZvciBhbGwgTU1JTyBCQVJzIGF0IHRoaXMgcG9pbnQuCj4gCj4gV2VsbCwg
SSBjb3VsZCBpdGVyYXRlIG92ZXIgYWxsIHRoZSByZWdpc3RlcmVkIFBDSSBkZXZpY2VzIGFuZCBz
aXplCj4gdGhlIEJBUnMgKHdpdGhvdXQgVkYgQkFScyBhdCBsZWFzdCBpbml0aWFsbHkpLiBUaGlz
IGlzIHF1aXRlCj4gY3VtYmVyc29tZSwgbXkgb3RoZXIgb3B0aW9uIHdvdWxkIGJlIHVzaW5nIG1h
eF9wYWdlIGFuZCBob3BlIHRoYXQKPiB0aGVyZSBhcmUgZW5vdWdoIGhvbGVzIHRvIG1ha2UgdXAg
Zm9yIEJBUiBNTUlPIHJlZ2lvbnMuCgpXZWxsLCBtYXliZSB3ZSBjb3VsZCBsaXZlIHdpdGggdGhp
cyBmb3Igbm93LiBJIGNlcnRhaW5seSB3b3VsZApwcmVmZXIgdG8gaGF2ZSBhIDNyZCBvcGluaW9u
IHRob3VnaCwgYXMgSSBjb250aW51ZSB0byBmZWVsIHVuZWFzeQp3aXRoIHRoaXMgcmF0aGVyIGlt
cHJlY2lzZSBlc3RpbWF0aW9uIChpLmUuIEknZCBtdWNoIHByZWZlciBhIG1vcmUKZHluYW1pYyAv
IG9uLWRlbWFuZCBhcHByb2FjaCkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
