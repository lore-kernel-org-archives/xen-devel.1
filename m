From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: report use of PCID together with
 reporting XPTI status
Date: Wed, 18 Jul 2018 00:40:10 -0600
Message-ID: <5B4EE0CA02000078001D52D8@prv1-mh.provo.novell.com>
References: <5B4CCB9B02000078001D4901@prv1-mh.provo.novell.com>
 <20180717205235.de6kk2bnnqng426t@MacBook-Pro.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rjtn=kc=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ffg8E-0004IU-J1
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 06:40:14 +0000
In-Reply-To: <20180717205235.de6kk2bnnqng426t@MacBook-Pro.localdomain>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA3LjE4IGF0IDIyOjUyLCA8Y2FyZG9lQGNhcmRvZS5jb20+IHdyb3RlOgo+IE9u
IE1vbiwgSnVsIDE2LCAyMDE4IGF0IDEwOjQ1OjE1QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+PiAtLS0gYS94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMKPj4gKysrIGIveGVuL2FyY2gveDg2
L3NwZWNfY3RybC5jCj4+IEBAIC0yNTYsOSArMjU2LDEwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBw
cmludF9kZXRhaWxzKGVudW0gaW4KPj4gICAgICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFU
VVJFX1NDX1JTQl9IVk0pICAgICAgPyAiIFJTQiIgICAgICAgICAgIDogIiIsCj4+ICAgICAgICAg
ICAgIG9wdF9lYWdlcl9mcHUgICAgICAgICAgICAgICAgICAgICAgICAgICAgID8gIiBFQUdFUl9G
UFUiICAgICA6ICIiKTsKPj4gIAo+PiAtICAgIHByaW50aygiICBYUFRJICg2NC1iaXQgUFYgb25s
eSk6IERvbTAgJXMsIERvbVUgJXNcbiIsCj4+ICsgICAgcHJpbnRrKCIgIFhQVEkgKDY0LWJpdCBQ
ViBvbmx5KTogRG9tMCAlcywgRG9tVSAlcyAod2l0aCVzIFBDSUQpXG4iLAo+IAo+IERvIHlvdSBl
dmVyIGZvcmVzZWUgd2FudGluZyB0byBhZGQgYW5vdGhlciBmbGFnIGluIGhlcmU/IEl0IG1pZ2h0
IGJlCj4gYmV0dGVyIHRvIGp1c3QgaGF2ZSAid2l0aDogJXMiIGFuZCBkbyB4cHRpX3BjaWRfZW5h
YmxlZCA/ICJQQ0lEIiA6ICIiIGlmCj4geW91IGRvLiBJZiBub3QgdGhlbiB0aGlzIHNlZW1zIGxp
a2UgYSBnb29kIGFkZGl0aW9uIHRvIG1lIGFuZCBpcwo+IGRlZmluaXRlbHkgd2VsY29tZSB0byBm
b2xrcyB3YW50aW5nIHRvIGtub3cgaWYgdGhleSdyZSB1c2luZyBQQ0lELgoKSSBkb24ndCBmb3Jl
c2VlIGFkZGl0aW9ucyBoZXJlLiBSZS1hcnJhbmdpbmcgdGhpcyBjYW4gYmUgZG9uZSBpZiBhbmQK
d2hlbiBzdWNoIGFuIGFkZGl0aW9uIGJlY29tZXMgbmVjZXNzYXJ5LgoKPiBSZXZpZXdlZC1ieTog
RG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgoKVGhhbmtzLCBKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
