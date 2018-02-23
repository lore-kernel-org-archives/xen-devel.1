From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2] VT-d: use two 32-bit writes to update
 DMAR fault address registers
Date: Fri, 23 Feb 2018 02:39:03 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191014ACF@SHSMSX101.ccr.corp.intel.com>
References: <20171011030345.14408-1-haozhong.zhang@intel.com>
 <59DE1C290200007800184DFD@prv-mh.provo.novell.com>
 <20180222094403.44nivrhg7uwzj2lq@MacBook-Pro-de-Roger.local>
 <5A8EA06102000078001AA492@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A8EA06102000078001AA492@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "Zhang,
 Haozhong" <haozhong.zhang@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+IFNlbnQ6IFRo
dXJzZGF5LCBGZWJydWFyeSAyMiwgMjAxOCA1OjUwIFBNCj4gCj4gPj4+IE9uIDIyLjAyLjE4IGF0
IDEwOjQ0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gT24gV2VkLCBPY3QgMTEs
IDIwMTcgYXQgMDU6Mjc6MDVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9u
IDExLjEwLjE3IGF0IDA1OjAzLCA8aGFvemhvbmcuemhhbmdAaW50ZWwuY29tPiB3cm90ZToKPiA+
PiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gPj4gPiArKysg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ID4+ID4gQEAgLTExMDUsNyAr
MTEwNSwxMyBAQCBzdGF0aWMgdm9pZCBkbWFfbXNpX3NldF9hZmZpbml0eShzdHJ1Y3QKPiBpcnFf
ZGVzYwo+ID4+ID4gKmRlc2MsIGNvbnN0IGNwdW1hc2tfdCAqbWFzaykKPiA+PiA+Cj4gPj4gPiAg
ICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb21tdS0+cmVnaXN0ZXJfbG9jaywgZmxhZ3MpOwo+ID4+
ID4gICAgICBkbWFyX3dyaXRlbChpb21tdS0+cmVnLCBETUFSX0ZFREFUQV9SRUcsIG1zZy5kYXRh
KTsKPiA+PiA+IC0gICAgZG1hcl93cml0ZXEoaW9tbXUtPnJlZywgRE1BUl9GRUFERFJfUkVHLCBt
c2cuYWRkcmVzcyk7Cj4gPj4gPiArICAgIGRtYXJfd3JpdGVsKGlvbW11LT5yZWcsIERNQVJfRkVB
RERSX1JFRywgbXNnLmFkZHJlc3NfbG8pOwo+ID4+ID4gKyAgICAvKgo+ID4+ID4gKyAgICAgKiBX
aGVuIHgyQVBJQyBpcyBub3QgZW5hYmxlZCwgRE1BUl9GRVVBRERSX1JFRyBpcyByZXNlcnZlZAo+
IGFuZAo+ID4+ID4gKyAgICAgKiBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gdXBkYXRlIGl0Lgo+ID4+
ID4gKyAgICAgKi8KPiA+PiA+ICsgICAgaWYgKHgyYXBpY19lbmFibGVkKQo+ID4+Cj4gPj4gSSdt
IHByZXR0eSBzdXJlIGl0IHdhcyBwb2ludGVkIG91dCBiZWZvcmUgdGhhdCB0aGUgc3R5bGUgaGVy
ZSBpcwo+ID4+IHdyb25nIChtaXNzaW5nIHNwYWNlcykuIFRoYXQncyBlYXN5IHRvIGZpeCB3aGls
ZSBjb21taXR0aW5nLCBidXQKPiA+PiBhbnl3YXkuCj4gPgo+ID4gSXQgc2VlbXMgbGlrZSB0aGlz
IHdhcyBub3QgYXBwbGllZC4gQ2FuIHNvbWVvbmUgZml4IHRoZSBzdHlsZSBhbmQKPiA+IGFwcGx5
IGl0Pwo+IAo+IEkgd291bGQgaGF2ZSBmaXhlZCB0aGUgc3R5bGUgaXNzdWUsIGJ1dCBJIGhhdmUg
bm8gVlQtZCBtYWludGFpbmVyCj4gYWNrIG9uIHJlY29yZC4gSXQgaXMgdGhlIHBhdGNoIHN1Ym1p
dHRlciB0byBnbyBodW50IGZvciBhY2tzLgo+IAoKSSBkaWRuJ3QgcmVhbGl6ZSBubyBhY2sgZnJv
bSBtZS4gQW55d2F5LCBoZXJlIGl0IGlzOgoKQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRp
YW5AaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
