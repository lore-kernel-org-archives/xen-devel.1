From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC 16/55] x86/mm: switch to new APIs in
 map_pages_to_xen
Date: Fri, 8 Feb 2019 17:58:45 +0000
Message-ID: <20190208175845.shsyzl6qeo7ojqoy@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-17-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XU3R=QP=citrix.com=prvs=935dcd14c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gsAQT-0005Og-M3
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 17:58:57 +0000
Content-Disposition: inline
In-Reply-To: <20190207164456.9260-17-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDcsIDIwMTkgYXQgMDQ6NDQ6MTdQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBQYWdlIHRhYmxlcyBhbGxvY2F0ZWQgaW4gdGhhdCBmdW5jdGlvbiBzaG91bGQgYmUgbWFwcGVk
IGFuZCB1bm1hcHBlZAo+IG5vdy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvbW0uYyB8IDMxICsrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCj4gCgpHaXRsYWIgQ0kgaGFzIGRpc2NvdmVyZWQgLi4uCgo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gaW5kZXggMzU2
ZDU2MWEwNi4uYzRjYjZmYmI2MCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gQEAgLTUwNTgsNiArNTA1OCw3IEBAIGludCBtYXBfcGFn
ZXNfdG9feGVuKAo+ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmx1c2hfZmxhZ3MgPQo+ICAg
ICAgICAgICAgICAgICAgRkxVU0hfVExCIHwgRkxVU0hfT1JERVIoMiAqIFBBR0VUQUJMRV9PUkRF
Uik7Cj4gICAgICAgICAgICAgIGwyX3BnZW50cnlfdCAqbDJ0Owo+ICsgICAgICAgICAgICBtZm5f
dCBtZm47Cgp0aGlzIGFuZCAuLi4KCj4gICAgICAgICAgcGwyZSA9IHZpcnRfdG9feGVuX2wyZSh2
aXJ0KTsKPiBAQCAtNTE3MSw2ICs1MTc3LDcgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCj4gICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmx1c2hfZmxhZ3MgPQo+ICAgICAgICAgICAgICAg
ICAgICAgIEZMVVNIX1RMQiB8IEZMVVNIX09SREVSKFBBR0VUQUJMRV9PUkRFUik7Cj4gICAgICAg
ICAgICAgICAgICBsMV9wZ2VudHJ5X3QgKmwxdDsKPiArICAgICAgICAgICAgICAgIG1mbl90IG1m
bjsKCi4uLiB0aGlzIHNoYWRvd2VkIHRoZSBtZm4gdmFyaWFibGUgZnJvbSBvdXRlciBzY29wZS4g
SSBoYXZlIGZpeGVkIHRoZXNlCnR3byBpc3N1ZXMgaW4gbXkgbG9jYWwgYnJhbmNoIGJ5IHR1cm5p
bmcgdGhlbSBpbnRvIGwydF9tZm4gYW5kIGwxdF9tZm4KcmVzcGVjdGl2ZWx5LgoKSW50ZXJlc3Rp
bmdseSBteSBsb2NhbCBidWlsZCBlbnZpcm9ubWVudCBkaWRuJ3QgY29tcGxhaW4gYW5kIFhlbiB3
b3JrZWQKZmluZSAocHJlc3VtYWJseSBkdWUgdG8gdGhpcyBwYXJ0aWN1bGFyIHBhdGggd2FzIG5l
dmVyIGhpdCkuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
