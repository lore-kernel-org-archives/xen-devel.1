From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 02/15] x86/cpu: Fix common cpuid faulting
 probing for AMD and Hygon
Date: Tue, 02 Apr 2019 09:46:03 -0600
Message-ID: <5CA383BB0200007800223F56@prv1-mh.provo.novell.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <96396a5ea9e1acc527705f71e9cd657b16585a75.1553935727.git.puwen@hygon.cn>
 <5CA1CE900200007800223782@prv1-mh.provo.novell.com>
 <3584da10-e33c-b382-bbb3-c12b538de30a@hygon.cn>
 <5CA337400200007800223D81@prv1-mh.provo.novell.com>
 <6341db2c-2504-efb0-acae-f0b2b1b42c98@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBLbz-0006UT-BL
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 15:46:07 +0000
In-Reply-To: <6341db2c-2504-efb0-acae-f0b2b1b42c98@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Pu Wen <puwen@hygon.cn>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA0LjE5IGF0IDEzOjU4LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvNC8yIDE4OjIwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDIuMDQuMTkgYXQgMDg6NDYs
IDxwdXdlbkBoeWdvbi5jbj4gd3JvdGU6Cj4+PiBPbiAyMDE5LzQvMSAxNjo0MSwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+Pj4gT24gMzAuMDMuMTkgYXQgMTE6NDIsIDxwdXdlbkBoeWdvbi5jbj4gd3Jv
dGU6Cj4+Pj4+IFRoZXJlIGlzIG5vIE1TUl9JTlRFTF9QTEFURk9STV9JTkZPIGZvciBBTUQgYW5k
IEh5Z29uIGZhbWlsaWVzLiBTbyBkaXJlY3RseQo+Pj4+PiByZXR1cm4gZmFsc2UgaW4gdGhlIGZ1
bmN0aW9uIHByb2JlX2NwdWlkX2ZhdWx0aW5nKCkgaWYgIWNwdV9oYXNfaHlwZXJ2aXNvci4KPj4+
Pgo+Pj4+IEkgdGhpbmsgaXQgd291bGQgaGF2ZSBiZWVuIG5pY2UgaWYgeW91IGhhZCBtZW50aW9u
ZWQgdGhlIHJlYWwKPj4+PiByZWFzb24gd2h5IHlvdSB3YW50IHRvIGJ5cGFzcyB0aGUgTVNSIGFj
Y2Vzc2VzLiBUaGlzIHdheSBpdAo+Pj4+IHNvdW5kcyBhcyBpZiB0aGUgY2hhbmdlIHdhcyBvbmx5
IGNvc21ldGljLCBhbmQgaGVuY2UgY291bGQgYmUKPj4+PiBsZWZ0IG91dC4KPj4+Cj4+PiBPa2F5
LCBob3cgYWJvdXQgdGhlIG5ldyBkZXNjcmlwdGlvbjoKPj4+IFRoZXJlIGlzIG5vIE1TUl9JTlRF
TF9QTEFURk9STV9JTkZPIGZvciBBTUQgYW5kIEh5Z29uIGZhbWlsaWVzLiBSZWFkCj4+PiB0aGlz
IE1TUiB3aWxsIHN0b3AgdGhlIFhlbiBpbml0aWFsaXphdGlvbiBwcm9jZXNzCj4+IAo+PiAiLi4u
IGZvciBzb21lIGVhcmx5IEh5Z29uIHN0ZXBwaW5ncyIoPykuIEknbSB1bmF3YXJlIG9mIEFNRCBD
UFVzCj4gCj4gWWVzLGZvciBzb21lIGVhcmx5IEh5Z29uIHN0ZXBwaW5ncy4KPiAKPj4gaGF2aW5n
IHRoaXMgaXNzdWUgLSBhcmUgeW91IHRlbGxpbmcgdXMgb3RoZXJ3aXNlPwo+IAo+IEkgdGVzdGVk
IHdpdGggYW4gQU1EIENQVShGYW1pbHkgMTdoLCBNb2RlbCAxLCBTdGVwcGluZyAxKSB0b2RheSwg
YW5kCj4gaXQgYWxzbyBzdG9wcGVkIHdoZW4gcmVhZGluZyB0aGUgTVNSX0lOVEVMX1BMQVRGT1JN
X0lORk8gaW5zdGVhZCBvZgo+IHByb2R1Y2luZyAjR1AoMCkuCgpJJ3ZlIHlldCB0byB0cnkgaXQg
b3V0IG9uIG15IFJvbWUgc3lzdGVtLCBidXQgSSBoYXZlIHRvIGFkbWl0IEkKZmluZCB0aGlzIGhh
cmQgdG8gYmVsaWV2ZS4gQW5kcmV3IC0geW91J3ZlIHRyaWVkIHRvIGJvb3QgWGVuIG9uIGEKUm9t
ZSBhbHJlYWR5LiBJaXJjIHlvdSBzYWlkIGl0IGNyYXNoZWQsIGJ1dCBkaWQgaXQgcGVyaGFwcyBn
ZXQgdG8KKGFuZCBwYXN0KSB0aGlzIHBvaW50PwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
