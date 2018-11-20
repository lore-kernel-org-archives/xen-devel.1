From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [faster-by-no-jump-table] retpoline: disable jump
 tables
Date: Tue, 20 Nov 2018 09:16:35 -0700
Message-ID: <5BF4336302000078001FE25C@prv1-mh.provo.novell.com>
References: <1542728274-29599-1-git-send-email-nmanthey@amazon.de>
 <5BF42BDF02000078001FE1DF@prv1-mh.provo.novell.com>
 <20181120155704.x4p4fiu6lu6e6yk7@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gP8hc-00080L-W3
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 16:16:41 +0000
In-Reply-To: <20181120155704.x4p4fiu6lu6e6yk7@mac>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Hongjiu Lu <hongjiu.lu@intel.com>, nmanthey@amazon.de, xen-devel <xen-devel@lists.xenproject.org>, David Woodhouse <dwmw2@infradead.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjExLjE4IGF0IDE2OjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgTm92IDIwLCAyMDE4IGF0IDA4OjQ0OjMxQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjAuMTEuMTggYXQgMTY6MzcsIDxubWFudGhleUBhbWF6b24uZGU+IHdy
b3RlOgo+PiA+IFRvIG1pdGlnYXRlIE1lbHRkb3duLCBYZW4gaGFzIGJlZW4gZml4ZWQgd2l0aCBh
IHNvZnR3YXJlIGZpeCwgbmFtZWx5Cj4+ID4gdXNpbmcgcmV0cG9saW5lIHNlcXVlbmNlcyBnZW5l
cmF0ZWQgYnkgdGhlIGNvbXBpbGVyLiBUaGlzIHdheSwgaW5kaXJlY3QKPj4gPiBicmFuY2hlcyBh
cmUgcHJvdGVjdGVkIGFnYWluc3QgdGhlIGF0dGFjay4KPj4gPiAKPj4gPiBIb3dldmVyLCB0aGUg
cmV0cG9saW5lIHNlcXVlbmNlIGNvbWVzIHdpdGggYSBzbG93IGRvd24uIFRvIG1ha2UgdXAgZm9y
Cj4+ID4gdGhpcywgd2UgcHJvcG9zZSB0byBhdm9pZCBqdW1wIHRhYmxlcyBpbiB0aGUgZmlyc3Qg
cGxhY2UuIFdpdGhvdXQgdGhlCj4+ID4gcmV0cG9saW5lIHNlcXVlbmNlcywgdGhpcyBjb2RlIHdv
dWxkIGJlIGxlc3MgZWZmaWNpZW50LiBIb3dldmVyLCB3aGVuCj4+ID4gcmV0cG9saW5lIGlzIGVu
YWJsZWQsIHRoaXMgYWN0dWFsbHkgcmVzdWx0cyBpbiBhIHNsaWdodCBwZXJmb3JtYW5jZQo+PiA+
IGltcHJvdmVtZW50Lgo+PiA+IAo+PiA+IFRoaXMgY2hhbmdlIG1pZ2h0IGJlY29tZSBpcnJlbGV2
YW50IG9uY2UgdGhlIGNvbXBpbGVyIHN0YXJ0cyBhdm9pZGluZwo+PiA+IGp1bXAgdGFibGVzIGlu
IGNhc2UgcmV0cG9saW5lcyBhcmUgdXNlZDoKPj4gPiBodHRwczovL2djYy5nbnUub3JnL2J1Z3pp
bGxhL3Nob3dfYnVnLmNnaT9pZD04Njk1MiAKPj4gPiAKPj4gPiBSZXBvcnRlZC1ieTogSnVsaWFu
IFN0ZWNrbGluYSA8anN0ZWNrbGlAYW1hem9uLmRlPgo+PiA+IFJlcG9ydGVkLWJ5OiBQYXdlbCBX
aWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4+ID4gU2lnbmVkLW9mZi1ieTogTm9y
YmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4gCj4gU2hvdWxkbid0IHRoaXMgdXNl
IGNjLW9wdGlvbi1hZGQsIG9yIGlzIGl0IGd1YXJhbnRlZWQgdGhhdCBldmVyeQo+IGNvbXBpbGVy
IHRoYXQgc3VwcG9ydHMgLW1pbmRpcmVjdC1icmFuY2gtcmVnaXN0ZXIgd2lsbCBhbHNvIHN1cHBv
cnQKPiAtZm5vLWp1bXAtdGFibGVzPwoKSSd2ZSBjaGVja2VkIHRoYXQgZ2NjIHN1cHBvcnRzIHRo
aXMgYXQgbGVhc3QgYmFjayB0byA0LjEueC4gV2l0aAp0aGlzIGxvbmcgaGlzdG9yeSBJJ20gcHJl
dHR5IHN1cmUgY2xhbmcgaGFzIGJlZW4gZG9pbmcgc28gdG9vIGZvcgphIGxvbmcgdGltZS4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
