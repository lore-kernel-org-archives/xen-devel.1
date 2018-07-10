From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Tue, 10 Jul 2018 14:32:01 +0200
Message-ID: <20180710123201.GB26572@olila.local.net-space.pl>
References: <20180628153809.50172-1-roger.pau@citrix.com>
 <5B35C51C02000078001350BF@prv1-mh.provo.novell.com>
 <20180703160227.GF4670@olila.local.net-space.pl>
 <5B3C7E0602000078001D0DDC@prv1-mh.provo.novell.com>
 <20180704104900.GI4670@olila.local.net-space.pl>
 <20180705074757.s4ztvfm56crljopt@mac.bytemobile.com>
 <20180706134839.GJ26572@olila.local.net-space.pl>
 <20180709164516.3n5ht4qq5kjhp3mh@mac.bytemobile.com>
 <20180710110052.GY26572@olila.local.net-space.pl>
 <5B449CC702000078001D2A03@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gey3=j2=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fcroY-0006DI-EJ
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 12:32:18 +0000
Content-Disposition: inline
In-Reply-To: <5B449CC702000078001D2A03@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTAsIDIwMTggYXQgMDU6NDc6MTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA3LjE4IGF0IDEzOjAwLCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+
IHdyb3RlOgo+ID4gT24gTW9uLCBKdWwgMDksIDIwMTggYXQgMDY6NDU6MTZQTSArMDIwMCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKClsuLi5dCgo+ID4+IFNvcnJ5IGZvciBhc2tpbmcgc28gbWFu
eSBxdWVzdGlvbnMsIGJ1dCBJIHdvdWxkIGxpa2UgdG8gdHJ5IHRvIGF2b2lkCj4gPj4gdGhlIERF
RklORUQgY29uZGl0aW9uYWwgaW4gdGhlIGxpbmtlciBzY3JpcHQgaWYgcG9zc2libGUuCj4gPgo+
ID4gSWYgeW91IHdpc2ggdG8gZG8gdGhhdCB0aGVuIHB1dCBkdW1teSBlZmkgc3ltYm9sIGludG8K
PiA+IHhlbi9hcmNoL3g4Ni9lZmkvc3R1Yi5jLgo+Cj4gSSB0aGluayBJJ3ZlIGNsZWFybHkgb2Jq
ZWN0ZWQgdG8gdGhhdCBiZWZvcmUgLSBJIHNpbXBseSBzZWUgbm8gbmVlZCBmb3IKPiB3YXN0aW5n
IHRoZSBzcGFjZSBpbiBhbiBFRkktaW5jYXBhYmxlIGJpbmFyeS4KClllcywgSSByZW1lbWJlciB0
aGF0LiBUaG91Z2ggSSBkbyBub3QgaGF2ZSBiZXR0ZXIgaWRlYSBpZgp3ZSB3aXNoIHRvIGRyb3Ag
REVGSU5FRCgpIGZyb20geGVuLmxkcy5TLgoKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
