From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 4/5] x86/hvm: Handle x2apic MSRs via the
 new guest_{rd, wr}msr() infrastructure
Date: Mon, 10 Sep 2018 16:45:10 +0200
Message-ID: <20180910144510.3jszudlfmragp3k2@mac.bytemobile.com>
References: <1520449116-15443-1-git-send-email-andrew.cooper3@citrix.com>
 <1520449116-15443-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1520449116-15443-5-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDcsIDIwMTggYXQgMDY6NTg6MzVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBEaXNwYXRjaCBmcm9tIHRoZSBndWVzdF97cmQsd3J9bXNyKCkgZnVuY3Rpb25zLiAg
VGhlIHJlYWQgc2lkZSBzaG91bGQgYmUgc2FmZQo+IG91dHNpZGUgb2YgY3VycmVudCBjb250ZXh0
LCBidXQgdGhlIHdyaXRlIHNpZGUgaXMgZGVmaW5pdGVseSBub3QuICBBcyB0aGUKPiB0b29sc3Rh
Y2sgaGFzIG5vIGxlZ2l0aW1hdGUgcmVhc29uIHRvIGFjY2VzcyB0aGUgQVBJQyByZWdpc3RlcnMg
dmlhIHRoaXMKPiBpbnRlcmZhY2UgKG5vdCBsZWFzdCBiZWNhdXNlIHdoZXRoZXIgdGhleSBhcmUg
YWNjZXNzaWJsZSBhdCBhbGwgZGVwZW5kcyBvbgo+IGd1ZXN0IHNldHRpbmdzKSwgdW5pbGF0ZXJh
bGx5IHJlamVjdCBhY2Nlc3MgYXR0ZW1wdHMgb3V0c2lkZSBvZiBjdXJyZW50Cj4gY29udGV4dC4K
PiAKPiBSZW5hbWUgdG8gZ3Vlc3Rfe3JkLHdyfW1zcl94MmFwaWMoKSBmb3IgY29uc2lzdGVuY3ks
IGFuZCBhbHRlciB0aGUgZnVuY3Rpb25zCj4gdG8gdXNlIFg4NkVNVUxfRVhDRVBUSU9OIHJhdGhl
ciB0aGFuIFg4NkVNVUxfVU5IQU5ETEVBQkxFLiAgVGhlIHByZXZpb3VzCj4gY2FsbGVycyB0dXJu
ZWQgVU5IQU5ETEVBQkxFIGludG8gRVhDRVBUSU9OLCBidXQgdXNpbmcgVU5IQU5ETEVBQkxFIHdp
bGwgbm93Cj4gaW50ZXJmZXJlIHdpdGggdGhlIGZhbGxiYWNrIHRvIGxlZ2FjeSBNU1IgaGFuZGxp
bmcuCj4gCj4gV2hpbGUgYWx0ZXJpbmcgZ3Vlc3RfcmRtc3JfeDJhcGljKCkgbWFrZSBhIGNvdXBs
ZSBvZiBtaW5vciBpbXByb3ZlbWVudHMuCj4gUmVmb3JtYXQgdGhlIGluaXRpYWxpc2VyIGZvciBy
ZWFkYWJsZVtdIHNvIGl0IGluZGVudHMgaW4gYSBtb3JlIG5hdHVyYWwgd2F5LAo+IGFuZCBhbHRl
ciBoaWdoIHRvIGJlIGEgNjRiaXQgaW50ZWdlciB0byBhdm9pZCBzaGlmdGluZyAwIGJ5IDMyIGlu
IHRoZSBjb21tb24KPiBwYXRoLgo+IAo+IE9ic2VydmFudCBwZW9wbGUgbWlnaHQgbm90aWNlIHRo
YXQgd2Ugbm93IGRvbid0IGxldCBQViBndWVzdHMgcmVhZCB0aGUgeDJhcGljCj4gTVNScy4gIFRo
ZXkgc2hvdWxkIG5ldmVyIGhhdmUgYmVlbiBhYmxlIHRvIGluIHRoZSBmaXJzdCBwbGFjZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
