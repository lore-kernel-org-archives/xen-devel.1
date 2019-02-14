From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 7/7] npt/shadow: allow getting foreign
 page table entries
Date: Thu, 14 Feb 2019 05:30:42 -0700
Message-ID: <5C655F720200007800216AE1@prv1-mh.provo.novell.com>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-8-roger.pau@citrix.com>
 <5C65534E0200007800216A5C@prv1-mh.provo.novell.com>
 <20190214121645.rlop5hs5wkpmgchc@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1guGAB-0008W3-Cf
 for xen-devel@lists.xenproject.org; Thu, 14 Feb 2019 12:30:47 +0000
In-Reply-To: <20190214121645.rlop5hs5wkpmgchc@mac>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAyLjE5IGF0IDEzOjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgRmViIDE0LCAyMDE5IGF0IDA0OjM4OjU0QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTEuMDIuMTkgYXQgMTg6NDYsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1wdC5jCj4+ID4gKysrIGIveGVu
L2FyY2gveDg2L21tL3AybS1wdC5jCj4+ID4gQEAgLTg2NSw3ICs4NjUsOCBAQCBwb2RfcmV0cnlf
bDE6Cj4+ID4gICAgICB1bm1hcF9kb21haW5fcGFnZShsMWUpOwo+PiA+ICAKPj4gPiAgICAgIEFT
U0VSVChtZm5fdmFsaWQobWZuKSB8fCAhcDJtX2lzX3JhbSgqdCkgfHwgcDJtX2lzX3BhZ2luZygq
dCkpOwo+PiA+IC0gICAgcmV0dXJuIChwMm1faXNfdmFsaWQoKnQpIHx8IHAybV9pc19ncmFudCgq
dCkpID8gbWZuIDogSU5WQUxJRF9NRk47Cj4+ID4gKyAgICByZXR1cm4gKHAybV9pc192YWxpZCgq
dCkgfHwgcDJtX2lzX2dyYW50KCp0KSB8fCBwMm1faXNfZm9yZWlnbigqdCkpCj4+ID4gKyAgICAg
ICAgICAgPyBtZm4gOiBJTlZBTElEX01GTjsKPj4gPiAgfQo+PiAKPj4gV291bGRuJ3QgeW91IGJl
dHRlciBhbHRlciB0aGUgQVNTRVJUKCkgYXMgd2VsbCwgdXNpbmcgcDJtX2lzX2FueV9yYW0oKQo+
PiBpbnN0ZWFkIG9mIHAybV9pc19yYW0oKSBub3c/IEdyYW50cyBzaG91bGQgaGF2ZSBiZWVuIGlu
Y2x1ZGVkIHRoZXJlCj4+IGJlZm9yZSwgYnV0IG9taXR0aW5nIGZvcmVpZ24gb25lcyB0aGVyZSBi
ZWZvcmUgd2FzIGJlbmlnbi4KPiAKPiBZZXMsIEkgY291bGQgdXNlIHAybV9pc19hbnlfcmFtIGJv
dGggaW4gdGhlIGFzc2VydCBhbmQgaW4gdGhlIHJldHVybgo+IGNvbmRpdGlvbjoKPiAKPiBBU1NF
UlQobWZuX3ZhbGlkKG1mbikgfHwgIXAybV9pc19hbnlfcmFtKCp0KSB8fCBwMm1faXNfcGFnaW5n
KCp0KSk7Cj4gcmV0dXJuIChwMm1faXNfdmFsaWQoKnQpIHx8IHAybV9pc19hbnlfcmFtKCp0KSkg
PyBtZm4gOiBJTlZBTElEX01GTjsKCkFoLCBpbmRlZWQsIGl0IGNhbiBiZSB1c2VkIGluIHRoZSBy
ZXR1cm4gc3RhdGVtZW50IGFzIHdlbGwgKGFuZCBldmVuCmhlbHBzIGl0cyBsZWdpYmlsaXR5KS4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
