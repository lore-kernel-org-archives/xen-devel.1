From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Tue, 2 Apr 2019 16:49:52 +0100
Message-ID: <e7923b75-1fdc-09a8-4e07-c5fb047ce581@citrix.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
 <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
 <3584da10-e33c-b382-bbb3-c12b538de30a@hygon.cn>
 <5CA337400200007800223D81@prv1-mh.provo.novell.com>
 <6341db2c-2504-efb0-acae-f0b2b1b42c98@hygon.cn>
 <5CA383BB0200007800223F56@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QSF0=SE=citrix.com=prvs=9886cf734=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBM2q-0001yJ-Mg
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 16:13:52 +0000
In-Reply-To: <5CA383BB0200007800223F56@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Pu Wen <puwen@hygon.cn>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDQvMjAxOSAxNjo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDIuMDQuMTkg
YXQgMTM6NTgsIDxwdXdlbkBoeWdvbi5jbj4gd3JvdGU6Cj4+IE9uIDIwMTkvNC8yIDE4OjIwLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDAyLjA0LjE5IGF0IDA4OjQ2LCA8cHV3ZW5AaHlnb24u
Y24+IHdyb3RlOgo+Pj4+IE9uIDIwMTkvNC8xIDE2OjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+
Pj4gT24gMzAuMDMuMTkgYXQgMTE6NDIsIDxwdXdlbkBoeWdvbi5jbj4gd3JvdGU6Cj4+Pj4+PiBU
aGVyZSBpcyBubyBNU1JfSU5URUxfUExBVEZPUk1fSU5GTyBmb3IgQU1EIGFuZCBIeWdvbiBmYW1p
bGllcy4gU28gZGlyZWN0bHkKPj4+Pj4+IHJldHVybiBmYWxzZSBpbiB0aGUgZnVuY3Rpb24gcHJv
YmVfY3B1aWRfZmF1bHRpbmcoKSBpZiAhY3B1X2hhc19oeXBlcnZpc29yLgo+Pj4+PiBJIHRoaW5r
IGl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlmIHlvdSBoYWQgbWVudGlvbmVkIHRoZSByZWFsCj4+
Pj4+IHJlYXNvbiB3aHkgeW91IHdhbnQgdG8gYnlwYXNzIHRoZSBNU1IgYWNjZXNzZXMuIFRoaXMg
d2F5IGl0Cj4+Pj4+IHNvdW5kcyBhcyBpZiB0aGUgY2hhbmdlIHdhcyBvbmx5IGNvc21ldGljLCBh
bmQgaGVuY2UgY291bGQgYmUKPj4+Pj4gbGVmdCBvdXQuCj4+Pj4gT2theSwgaG93IGFib3V0IHRo
ZSBuZXcgZGVzY3JpcHRpb246Cj4+Pj4gVGhlcmUgaXMgbm8gTVNSX0lOVEVMX1BMQVRGT1JNX0lO
Rk8gZm9yIEFNRCBhbmQgSHlnb24gZmFtaWxpZXMuIFJlYWQKPj4+PiB0aGlzIE1TUiB3aWxsIHN0
b3AgdGhlIFhlbiBpbml0aWFsaXphdGlvbiBwcm9jZXNzCj4+PiAiLi4uIGZvciBzb21lIGVhcmx5
IEh5Z29uIHN0ZXBwaW5ncyIoPykuIEknbSB1bmF3YXJlIG9mIEFNRCBDUFVzCj4+IFllcyxmb3Ig
c29tZSBlYXJseSBIeWdvbiBzdGVwcGluZ3MuCj4+Cj4+PiBoYXZpbmcgdGhpcyBpc3N1ZSAtIGFy
ZSB5b3UgdGVsbGluZyB1cyBvdGhlcndpc2U/Cj4+IEkgdGVzdGVkIHdpdGggYW4gQU1EIENQVShG
YW1pbHkgMTdoLCBNb2RlbCAxLCBTdGVwcGluZyAxKSB0b2RheSwgYW5kCj4+IGl0IGFsc28gc3Rv
cHBlZCB3aGVuIHJlYWRpbmcgdGhlIE1TUl9JTlRFTF9QTEFURk9STV9JTkZPIGluc3RlYWQgb2YK
Pj4gcHJvZHVjaW5nICNHUCgwKS4KPiBJJ3ZlIHlldCB0byB0cnkgaXQgb3V0IG9uIG15IFJvbWUg
c3lzdGVtLCBidXQgSSBoYXZlIHRvIGFkbWl0IEkKPiBmaW5kIHRoaXMgaGFyZCB0byBiZWxpZXZl
LiBBbmRyZXcgLSB5b3UndmUgdHJpZWQgdG8gYm9vdCBYZW4gb24gYQo+IFJvbWUgYWxyZWFkeS4g
SWlyYyB5b3Ugc2FpZCBpdCBjcmFzaGVkLCBidXQgZGlkIGl0IHBlcmhhcHMgZ2V0IHRvCj4gKGFu
ZCBwYXN0KSB0aGlzIHBvaW50PwoKSSd2ZSBnb3QgRmFtMTAsIDE1LCAxNyAoYm90aCBOYXBsZXMg
YW5kIFJvbWUpIGFuZCBoYXZlbid0IGVuY291bnRlcmVkCmFueSBwcm9ibGVtcy4KCldoYXRldmVy
IGlzIGdvaW5nIG9uLCBpdCBzb3VuZHMgbGlrZSBhIG1pY3JvY29kZSBidWcuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
