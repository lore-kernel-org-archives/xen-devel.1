From: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v3 2/4] x86emul: Support vpclmulqdq
Date: Thu, 14 Dec 2017 21:49:20 +0800
Message-ID: <20171214134920.GB10966@yangzhon-Virtual>
References: <1510310196-6485-1-git-send-email-yang.zhong@intel.com>
 <1510310196-6485-3-git-send-email-yang.zhong@intel.com>
 <5A1C43040200007800192713@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5A1C43040200007800192713@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: yang.zhong@intel.com, andrew.cooper3@citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMjcsIDIwMTcgYXQgMDg6NTM6MjRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjExLjE3IGF0IDExOjM2LCA8eWFuZy56aG9uZ0BpbnRlbC5jb20+IHdy
b3RlOgo+ID4gQEAgLTc2NzIsNyArNzY3MywxMiBAQCB4ODZfZW11bGF0ZSgKPiA+ICAgICAgICAg
IGhvc3RfYW5kX3ZjcHVfbXVzdF9oYXZlKHBjbG11bHFkcSk7Cj4gPiAgICAgICAgICBpZiAoIHZl
eC5vcGN4ID09IHZleF9ub25lICkKPiA+ICAgICAgICAgICAgICBnb3RvIHNpbWRfMGYzYV9jb21t
b247Cj4gPiAtICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYodmV4LmwsIEVYQ19VRCk7Cj4g
PiArICAgICAgICBpZiAoICF2ZXgubCApCj4gPiArICAgICAgICB7Cj4gPiArICAgICAgICAgICAg
Z2VuZXJhdGVfZXhjZXB0aW9uX2lmKHZleC5sLCBFWENfVUQpOwo+IAo+IFdoYXQncyB0aGUgcG9p
bnQgb2YgdGhpcz8KCiAgSmFuLCB0aGFua3MgZm9yIHlvdXIgaGVscCEKICBnZW5lcmF0ZV9leGNl
cHRpb25faWYodmV4LmwsIEVYQ19VRCkgaW4gaGVyZSBpcyBub3QgYW55IHVzZWZ1bCwKICBpIHdp
bGwgcmVtb3ZlIGl0LCB0aGFua3MhCgo+IAo+ID4gKyAgICAgICAgICAgIGdvdG8gc2ltZF8wZl9p
bW04X2F2eDsKPiA+ICsgICAgICAgIH0KPiA+ICsgICAgICAgIGhvc3RfYW5kX3ZjcHVfbXVzdF9o
YXZlKHZwY2xtdWxxZHEpOwo+IAo+IFdoeSBub3Qgc2ltcGx5Cj4gCj4gICAgICAgICBpZiAoIHZl
eC5sICkKPiAgICAgICAgICAgICBob3N0X2FuZF92Y3B1X211c3RfaGF2ZSh2cGNsbXVscWRxKTsK
PiAKICBUaGUgbmV3IHBhdGNoIHdpbGwgbGlrZSBiZWxvdzoKCiAgICAgIGhvc3RfYW5kX3ZjcHVf
bXVzdF9oYXZlKHBjbG11bHFkcSk7CiAgICAgIGlmICggdmV4Lm9wY3ggPT0gdmV4X25vbmUgKQog
ICAgICAgICAgZ290byBzaW1kXzBmM2FfY29tbW9uOworICAgICBpZiAoICF2ZXgubCApCisgICAg
ICAgICBnb3RvIHNpbWRfMGZfaW1tOF9hdng7CisgICAgIGhvc3RfYW5kX3ZjcHVfbXVzdF9oYXZl
KHZwY2xtdWxxZHEpOwogICAgICBnb3RvIHNpbWRfMGZfaW1tOF95bW07CgogICAgICBzaW1kXzBm
X2ltbThfeW1tIHdpbGwgYmUgbmV3IGNyZWF0ZWQsIHdoaWNoIGxpa2Ugc2ltZF9vZl95bW0gZGlk
IGluIHRoZSBjb2RlLgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
