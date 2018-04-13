From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/microcode: Do not upload microcode
 if CPUs are offline
Date: Fri, 13 Apr 2018 09:57:25 -0600
Message-ID: <5AD0D36502000078001BB2B4@prv1-mh.provo.novell.com>
References: <1522393141-90344-1-git-send-email-chao.gao@intel.com>
 <1522393141-90344-2-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1522393141-90344-2-git-send-email-chao.gao@intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>, xen-devel@lists.xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAzLjE4IGF0IDA4OjU5LCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBU
aGlzIHBhdGNoIGlzIHRvIGJhY2twb3J0IHRoZSBwYXRjaCBiZWxvdyBmcm9tIGxpbnV4IGtlcm5l
bC4KPiAKPiAgICAgY29tbWl0IDMwZWMyNmRhOTk2N2QwZDc4NWFiYzI0MDczMTI5YTM0YzMyMTE3
NzcKPiAgICAgQXV0aG9yOiBBc2hvayBSYWogPGFzaG9rLnJhakBpbnRlbC5jb20+Cj4gICAgIERh
dGU6ICAgV2VkIEZlYiAyOCAxMToyODo0MyAyMDE4ICswMTAwCj4gCj4gICAgICAgICB4ODYvbWlj
cm9jb2RlOiBEbyBub3QgdXBsb2FkIG1pY3JvY29kZSBpZiBDUFVzIGFyZSBvZmZsaW5lCj4gCj4g
ICAgICAgICBBdm9pZCBsb2FkaW5nIG1pY3JvY29kZSBpZiBhbnkgb2YgdGhlIENQVXMgYXJlIG9m
ZmxpbmUsIGFuZCBpc3N1ZSBhCj4gICAgICAgICB3YXJuaW5nLiBIYXZpbmcgZGlmZmVyZW50IG1p
Y3JvY29kZSByZXZpc2lvbnMgb24gdGhlIHN5c3RlbSBhdCBhbnkgdGltZQo+ICAgICAgICAgaXMg
b3V0cmlnaHQgZGFuZ2Vyb3VzLgoKSSdtIGFmcmFpZCBJIGRvbid0IGZ1bGx5IGFncmVlIC0gbm90
IGFwcGx5aW5nIGFuIHVjb2RlIHVwZGF0ZSB0byB0aGUgb25saW5lCkNQVXMgYmVjYXVzZSBzb21l
IGFyZSBvZmZsaW5lIGlzbid0IGFueSBiZXR0ZXIuIFBsdXMgKHdoaWxlIHVwZGF0aW5nKQp0aGVy
ZSdzIGFsd2F5cyBnb2luZyB0byBiZSBzb21lIGRpc2NyZXBhbmN5IGJldHdlZW4gdWNvZGUgdmVy
c2lvbnMuCkFzIGxvbmcgYXMgd2UgYXBwbHkgdXBkYXRlcyB3aGlsZSBicmluZ2luZyBhIENQVSBv
bmxpbmUsIEkgdGhpbmsgd2UncmUgZmluZS4KCkFsc28gcGxlYXNlIGNvbnNpZGVyIHZhbGlkIGNh
c2VzIHlvdSBtYWtlIG5vdCB3b3JrIGFueW1vcmUsIGxpa2Ugc29tZW9uZQpoYXZpbmcgYnJvdWdo
dCBvZmZsaW5lIGFsbCBzaWJsaW5nIGh5cGVydGhyZWFkcywgd2l0aCBlYWNoIGNvcmUgc3RpbGwg
aGF2aW5nCm9uZSB0aHJlYWQgYWN0aXZlLiBJbiB0aGF0IGNhc2UgYW4gdWNvZGUgdXBkYXRlIHdp
bGwgaW1wbGljaXRseSB1cGRhdGUgYWxsCm9mZmxpbmUgdGhyZWFkcyBhcyB3ZWxsLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
