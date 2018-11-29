From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: PCI BAR sizing quirks
Date: Thu, 29 Nov 2018 18:35:23 +0100
Message-ID: <20181129173523.37x7ptl4qdqj2dlt@mac>
References: <5BFFE9C30200007800201371@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MKqZ=OI=citrix.com=prvs=864cd69c8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gSQEr-0000a8-5Z
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 17:36:33 +0000
Content-Disposition: inline
In-Reply-To: <5BFFE9C30200007800201371@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjksIDIwMTggYXQgMDY6Mjk6MzlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUm9nZXIsCj4gCj4gaW4gdGhlIGNvbnRleHQgb2Ygc29tZSBvdGhlciBidWcgcmVwb3J0
IGhlcmUgSSd2ZSBiZWVuIHBvaW50ZWQKPiBhdCBMaW51eCBjb21taXQgNmFmN2U0Zjc3MjU5ZWU5
NDYxMDMzODczNzJjYjE1OWYyZTk5YTZkNC4KPiBJIHRoaW5rIHdlIHdpbGwgbmVlZCB0byBpbXBs
ZW1lbnQgc29tZXRoaW5nIHNpbWlsYXIgZm9yIGFueQo+IGRldmljZXMgdGhhdCBtYXkgYmUgcHJl
c2VudCBvbiB4ODYgc3lzdGVtcywgYnV0IGRvbid0IGhhdmUKPiBzdGFuZGFyZCBjb21wbGlhbnQg
YmVoYXZpb3Igb2YgcmVnaXN0ZXJzIGluIHdoYXQgbm9ybWFsbHkgaXMgdGhlCj4gQkFSIHJhbmdl
IGluIGNvbmZpZyBzcGFjZSwgZm9yIHlvdXIgUFZIIEJBUiBoYW5kbGluZyB0byBub3QKPiBjYXVz
ZSBib290IGZhaWx1cmVzLgoKVGhhbmtzIGZvciB0aGUgaGVhZHMgdXAuIEkndmUganVzdCBzZW5k
IGEgcGF0Y2ggdGhhdCBhdHRlbXB0cyB0bwp3b3JrYXJvdW5kIHRoaXMgZXJyYXRhOgoKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTExL21z
ZzAzNDM4Lmh0bWwKClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
