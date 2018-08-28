From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 19/23] x86: PIT emulation is common to
 both PV and HVM
Date: Tue, 28 Aug 2018 14:19:54 +0100
Message-ID: <20180828131954.sszmpjeuhy4ulqpv@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <3c651e5f60a496e3e5661f60bd7e913dab2b05a0.1535285866.git-series.wei.liu2@citrix.com>
 <5B8535B302000078001E28EB@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fudv1-0007Yb-Pb
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 13:20:27 +0000
Content-Disposition: inline
In-Reply-To: <5B8535B302000078001E28EB@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDU6NDQ6NTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBNb3ZlIHRoZSBmaWxlIHRvIHg4NiBjb21tb24gY29kZSBhbmQgY2hhbmdlIGl0cyBu
YW1lIHRvIGVtdWwtaTgyNTQuYy4KPiA+IAo+ID4gUHV0IEhWTSBvbmx5IGNvZGUgdW5kZXIgQ09O
RklHX0hWTSBvciBpc19odm1fZG9tYWluLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiB2MjogbW92ZSB0aGUgd2hvbGUgZmls
ZS4KPiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSAgICAgfCAgIDEgKy0KPiA+ICB4
ZW4vYXJjaC94ODYvZW11bC1pODI1NC5jIHwgNjA5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0KPiA+ICB4ZW4vYXJjaC94ODYvaHZtL01ha2VmaWxlIHwgICAxICstCj4g
PiAgeGVuL2FyY2gveDg2L2h2bS9pODI1NC5jICB8IDU5NyArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDYxMCBpbnNlcnRpb25zKCsp
LCA1OTggZGVsZXRpb25zKC0pCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9l
bXVsLWk4MjU0LmMKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2h2bS9pODI1
NC5jCj4gCj4gT24gdGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgY2hhbmdlcyB0byB0aGUgZmlsZSBh
cmUgb25seSBDT05GSUdfSFZNCj4gYWRkaXRpb25zCgpObyBvbmx5IHRoYXQuIFRoZXJlIGFyZSBh
IGZldyBpc19odm1fZG9tYWluIGNhbGxzIGFzIHdlbGwuCgo+IEFja2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpEb2VzIHRoaXMgc3RpbGwgc3RhbmQ/Cgo+IEdlbmVyYXRp
bmcgdGhlIGRpZmYgd2l0aCByZW5hbWUgZGV0ZWN0aW9uIHdvdWxkIGhhdmUgZWFzZWQgcmV2aWV3
Cj4gdGhvdWdoLgoKSSBhbHJlYWR5IGhhZCBkaWZmLnJlbmFtZXM9dHJ1ZSBpbiBteSBjb25maWcu
IFVuZm9ydHVuYXRlbHkgaXQgZGlkbid0CnNlZW0gdG8gd29yay4gTm90IHN1cmUgd2h5LgoKV2Vp
LgoKPiBKYW4KPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
