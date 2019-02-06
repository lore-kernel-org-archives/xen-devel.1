From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: Ping: libfsimage path/file name changes
Date: Wed, 6 Feb 2019 16:13:21 +0000
Message-ID: <23643.1953.175052.36966@mariner.uk.xensource.com>
References: <5C4EB5550200007800211924@prv1-mh.provo.novell.com>
 <5C5AFD7402000078002145AF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t+/Z=QN=citrix.com=prvs=933e35509=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1grPpK-0001P5-KE
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 16:13:30 +0000
In-Reply-To: <5C5AFD7402000078002145AF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SmFuIEJldWxpY2ggd3JpdGVzICgiUGluZzogbGliZnNpbWFnZSBwYXRoL2ZpbGUgbmFtZSBjaGFu
Z2VzIik6Cj4gT24gMjguMDEuMTkgYXQgMDg6NTUsIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6
Cj4gPiBiYWNrIGluIE9jdG9iZXIgeW91J3ZlIGFkZGVkIHF1aXRlIGEgbnVtYmVyIG9mICJ4ZW4i
IHByZWZpeGVzIHRvCj4gPiB2YXJpb3VzIHBpZWNlcyB0aGVyZS4gTm93IHRoYXQgSSd2ZSBmaW5h
bGx5IGhhZCB0aW1lIHRvIGNvbm5lY3QgdGhpcwo+ID4gY2hhbmdlIG9mIHlvdXJzIHdpdGggUFYg
ZG9tYWluIGNyZWF0aW9uIGZhaWx1cmVzIHRoYXQgSSd2ZSBzaW5jZQo+ID4gYmVlbiBvYnNlcnZp
bmcgKG5vdCBhIGJ1ZyBpbiBhbnkgd2F5LCBtZXJlbHkgcmVzdWx0aW5nIGZyb20gdGhlCj4gPiBm
YWN0IHRoYXQgSSdtIHJ1bm5pbmcgZXZlcnl0aGluZyBzdHJhaWdodCBmcm9tIHRoZSBidWlsZCB0
cmVlKSBJCj4gPiBzdGFydGVkIHdvbmRlcmluZyB3aGV0aGVyIHRoZSBlbnZpcm9ubWVudCB2YXJp
YWJsZSBpbnNwZWN0ZWQKPiA+IGJ5IGNvbW1vbi9mc2ltYWdlX3BsdWdpbi5jOmxvYWRfcGx1Z2lu
cygpIHNob3VsZG4ndCB0aGVuIGFsc28KPiA+IGdhaW4gYSAiWEVOIiBwcmVmaXguCj4gCj4gSSB0
aGluayB0aGlzIHdhbnRzIGEgcmVzb2x1dGlvbiBvbmUgd2F5IG9yIHRoZSBvdGhlciBmb3IgNC4x
MiwgaS5lLgo+IGVpdGhlciB3ZSBzdGljayB0byB3aGF0IGlzIHRoZXJlIGFsc28gYWZ0ZXIgNC4x
Miwgb3Igd2UgZG8gdGhlCj4gYWRkaXRpb25hbCBjaGFuZ2UgZm9yIHRoZSBzYW1lIHJlbGVhc2Ug
YXMgd2hlcmUgYWxsIHlvdXIgb3RoZXIKPiBjaGFuZ2VzIGhhdmUgYmVlbiBtYWRlLgoKWWVzLCBJ
TU8gaXQgc2hvdWxkLiAgSSB3aWxsIHNlbmQgYSBwYXRjaC4KCkFsc28gSSBoYXZlIGhhZCByZXBv
cnRzIG9mIHRyb3VibGUgd2l0aCBweWdydWIgaW4gdGhlIERlYmlhbiBYZW4KcGFja2FnZXMsIHdo
aWNoIEkgbmVlZCB0byBpbnZlc3RpZ2F0ZSBhbmQgdGhpcyBtYXkgZ2VuZXJhdGUgYSBmdXJ0aGVy
CnBhdGNoIG9yIHR3by4KCkp1ZXJnZW4sIHdvdWxkIHRoYXQgYmUgT0sgd2l0aCB5b3UgaW4gcHJp
bmNpcGxlID8gIChJIHdpbGwgYXNrIGFnYWluCmZvciBhIGZvcm1hbCByZWxlYXNlIGFjayBvbiBj
b25jcmV0ZSBwYXRjaChlcykuKQoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
