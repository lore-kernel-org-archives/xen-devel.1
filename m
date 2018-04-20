From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6] x86/setup: properly update PTEs if
 src/dst overlaps when relocating Xen image
Date: Fri, 20 Apr 2018 03:32:22 -0600
Message-ID: <5AD9B3A602000078001BCE28@prv1-mh.provo.novell.com>
References: <1524148118-12982-1-git-send-email-daniel.kiper@oracle.com>
 <5AD8B03F02000078001BCB65@prv1-mh.provo.novell.com>
 <20180420091535.GG6312@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xcz5=hj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f9SOy-0006l8-3m
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 09:32:20 +0000
In-Reply-To: <20180420091535.GG6312@olila.local.net-space.pl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA0LjE4IGF0IDExOjE1LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IE9uIFRodSwgQXByIDE5LCAyMDE4IGF0IDA5OjA1OjM1QU0gLTA2MDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+PiA+Pj4gT24gMTkuMDQuMTggYXQgMTY6MjgsIDxkYW5pZWwua2lwZXJAb3JhY2xl
LmNvbT4gd3JvdGU6Cj4+ID4gQEAgLTEwMTksNiArMTAyMCwxNSBAQCB2b2lkIF9faW5pdCBub3Jl
dHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+PiA+ICAgICAgICAgICAgICBi
b290c3ltKHRyYW1wb2xpbmVfeGVuX3BoeXNfc3RhcnQpID0gZTsKPj4gPgo+PiA+ICAgICAgICAg
ICAgICAvKgo+PiA+ICsgICAgICAgICAgICAgKiBBbGwgUFRFcyBwb2ludGluZyBhYm92ZSB0aGF0
IGFkZHJlc3MgYXJlIG5vdCBjYW5kaWRhdGVzIGZvcgo+PiA+ICsgICAgICAgICAgICAgKiByZWxv
Y2F0aW9uLiBEdWUgdG8gcG9zc2liaWxpdHkgb2YgcGFydGlhbCBvdmVybGFwIG9mIHRoZSBlbmQK
Pj4gPiArICAgICAgICAgICAgICogb2Ygc291cmNlIGltYWdlIGFuZCB0aGUgYmVnaW5uaW5nIG9m
IHJlZ2lvbiBmb3IgZGVzdGluYXRpb24KPj4gPiArICAgICAgICAgICAgICogaW1hZ2Ugc29tZSBQ
VEVzIG1heSBwb2ludCB0byBhZGRyZXNzZXMgaW4KPj4gPiArICAgICAgICAgICAgICogcmFuZ2Ug
W2UsIGUgKyBYRU5fSU1HX09GRlNFVCkuCj4+ID4gKyAgICAgICAgICAgICAqLwo+PiA+ICsgICAg
ICAgICAgICBwdGVfdXBkYXRlX2xpbWl0ID0gUEZOX0RPV04oZSArIFhFTl9JTUdfT0ZGU0VUKTsK
Pj4KPj4gUGVyaGFwcyBiZXR0ZXIgc3RhcnQgd2l0aCAiTm8gUFRFcyBwb2ludGluZyBhYm92ZSB0
aGlzIGFkZHJlc3MgYXJlCj4+IGNhbmRpZGF0ZXMgLi4uIj8KPiAKPiBJIGFtIE9LIHdpdGggdGhh
dCBjaGFuZ2UuIFNob3VsZCBJIHBvc3Qgdjcgb3IgYXJlIHlvdSBnb2luZyB0byB1cGRhdGUKPiB0
aGUgY29tbWVudCBiZWZvcmUgY29tbWl0dGluZz8gQm90aCB3b3JrcyBmb3IgbWUuCgpJJ3ZlIHJl
Y29yZGVkIGEgbm90ZSB0byB0aGF0IGVmZmVjdCwgYnV0IEkgY2VydGFpbmx5IHdvdWxkbid0IG1p
bmQgaWYgSSBkaWRuJ3QKaGF2ZSB0byBlZGl0IHRoZSBwYXRjaCBiZWZvcmUgY29tbWl0dGluZy4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
