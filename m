From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 07/16] x86: put XEN_DOMCTL_{set,
 get}_address_size under CONFIG_PV
Date: Wed, 31 Oct 2018 09:33:25 +0000
Message-ID: <20181031093325.se44yqhnijn3svfp@zion.uk.xensource.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <d87454cedf90ee1bd7ff0e0d05f3b4a910b93ddd.1539959287.git-series.wei.liu2@citrix.com>
 <5BD718F702000078001F5D92@prv1-mh.provo.novell.com>
 <20181030205002.3m7x7ybp5ojaiph6@zion.uk.xensource.com>
 <5BD96F2102000078001F6A1F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qv1o=nl=citrix.com=prvs=835e3026f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHmsW-0004G3-90
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 09:33:32 +0000
Content-Disposition: inline
In-Reply-To: <5BD96F2102000078001F6A1F@prv1-mh.provo.novell.com>
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

T24gV2VkLCBPY3QgMzEsIDIwMTggYXQgMDM6MDA6MTdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMwLjEwLjE4IGF0IDIxOjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBNb24sIE9jdCAyOSwgMjAxOCBhdCAwODoyODowN0FNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMTkuMTAuMTggYXQgMTY6MjgsIDx3ZWkubGl1MkBjaXRy
aXguY29tPiB3cm90ZToKPiA+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+ID4+ID4g
KysrIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4gPj4gPiBAQCAtNjA4LDYgKzYwOCw3IEBAIGxv
bmcgYXJjaF9kb19kb21jdGwoCj4gPj4gPiAgICAgICAgICAgICAgY29weWJhY2sgPSB0cnVlOwo+
ID4+ID4gICAgICAgICAgYnJlYWs7Cj4gPj4gPiAgCj4gPj4gPiArI2lmZGVmIENPTkZJR19QVgo+
ID4+ID4gICAgICBjYXNlIFhFTl9ET01DVExfc2V0X2FkZHJlc3Nfc2l6ZToKPiA+PiA+ICAgICAg
ICAgIGlmICggKChkb21jdGwtPnUuYWRkcmVzc19zaXplLnNpemUgPT0gNjQpICYmICFkLT5hcmNo
LmlzXzMyYml0X3B2KSB8fAo+ID4+ID4gICAgICAgICAgICAgICAoKGRvbWN0bC0+dS5hZGRyZXNz
X3NpemUuc2l6ZSA9PSAzMikgJiYgZC0+YXJjaC5pc18zMmJpdF9wdikgKQo+ID4+ID4gQEAgLTYy
Myw2ICs2MjQsNyBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAo+ID4+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gPj4gPiBC
SVRTX1BFUl9MT05HOwo+ID4+ID4gICAgICAgICAgY29weWJhY2sgPSB0cnVlOwo+ID4+ID4gICAg
ICAgICAgYnJlYWs7Cj4gPj4gPiArI2VuZGlmCj4gPj4gCj4gPj4gLi4uIGFkZCBzdWNoIGEgY2hl
Y2sgc28gdGhhdCBzaW1pbGFyIGJlaGF2aW9yIHdpbGwgcmVzdWx0IHdpdGggUFYKPiA+PiBlbmFi
bGVkIGFuZCBkaXNhYmxlZCAoZXJyb3IgY29kZXMgbWF5IGRpZmZlciwgYnV0IHN1Y2Nlc3MgdnMK
PiA+PiBlcnJvciBvdWdodCB0byBtYXRjaCkuCj4gPiAKPiA+IEkgZG9uJ3QgZm9sbG93LiBEbyB5
b3UgbWVhbiBhZGRpbmcgaXNfcHZfZG9tYWluIGNoZWNrIHNvbWV3aGVyZT8KPiAKPiBZZXMuIE90
aGVyd2lzZSBiZWhhdmlvciBkaWZmZXJzIGJldHdlZW4gYSBQViBhbmQgYSAhUFYgaHlwZXJ2aXNv
ci4KCkknbSBzdGlsbCBhdCBhIGxvc3MgdG8gZmlndXJlIG91dCB3aGF0ICJzaW1pbGFyIGJlaGF2
aW9yIiB5b3Ugd2FudC4gV2hlbgp5b3Ugc2F5IGJlaGF2aW91ciBkaWZmZXJzLCBkbyB5b3UgbWVh
biB0aGUgbGFjayBvZiBjb3B5YmFjayBpbiBteSBwYXRjaD8KV2h5IHdvdWxkIHRoYXQgYmUgcmVs
ZXZhbnQgdG8gYSBFTk9TWVMgaHlwZXJjYWxsPwoKV2VpLgoKPiAKPiBKYW4KPiAKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
