From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC 06/55] x86/mm: map_pages_to_xen should
 have one exit path
Date: Tue, 9 Apr 2019 13:22:09 +0100
Message-ID: <20190409122209.GO1986@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-7-wei.liu2@citrix.com>
 <1552943654.6788.95.camel@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDplx-00089R-8z
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:22:41 +0000
Content-Disposition: inline
In-Reply-To: <1552943654.6788.95.camel@amazon.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Nuernberger, Stefan" <snu@amazon.de>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMDk6MTQ6MTRQTSArMDAwMCwgTnVlcm5iZXJnZXIsIFN0
ZWZhbiB3cm90ZToKPiBPbiBUaHUsIDIwMTktMDItMDcgYXQgMTY6NDQgKzAwMDAsIFdlaSBMaXUg
d3JvdGU6Cj4gPiBXZSB3aWxsIHNvb24gcmV3cml0ZSB0aGUgZnVuY3Rpb24gdG8gaGFuZGxlIGR5
bmFtaWNhbGx5IG1hcHBpbmcgYW5kCj4gPiB1bm1hcHBpbmcgb2YgcGFnZSB0YWJsZXMuCj4gPiAK
PiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiDCoHhlbi9hcmNoL3g4Ni9tbS5jIHwg
MzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgMjcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiA+IGluZGV4IDQxNDdhNzFj
NWQuLjNhYjIyMmM4ZWEgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ID4gKysr
IGIveGVuL2FyY2gveDg2L21tLmMKPiA+IEBAIC00ODg3LDkgKzQ4ODcsMTEgQEAgaW50IG1hcF9w
YWdlc190b194ZW4oCj4gPiDCoMKgwqDCoMKgdW5zaWduZWQgaW50IGZsYWdzKQo+ID4gwqB7Cj4g
PiDCoMKgwqDCoMKgYm9vbCBsb2NraW5nID0gc3lzdGVtX3N0YXRlID4gU1lTX1NUQVRFX2Jvb3Q7
Cj4gPiArwqDCoMKgwqBsM19wZ2VudHJ5X3QgKnBsM2UsIG9sM2U7Cj4gCj4gQWZ0ZXIgbGltaXRp
bmcgdGhlIHNjb3BlIG9mIG90aGVyIHZhcmlhYmxlcyBpbiB0aGUgcHJldmlvdXMgcGF0Y2hlcywK
PiB5b3Ugbm93IHdpZGVuIHRoZSBzY29wZSBmb3IgdGhpcyBvbmUuIElzIHRoaXMgc28geW91IGNh
biBoYW5kbGUgdW5tYXAKPiBpbiBhIGNvbW1vbiBleGl0L2Vycm9yIHBhdGggbGF0ZXI/CgpZZXMu
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
