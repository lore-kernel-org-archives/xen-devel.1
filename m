From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/pv: Fix construction of 32bit dom0's
Date: Wed, 13 Feb 2019 18:07:58 +0000
Message-ID: <20190213180758.hwh76y5iq6xsm2dd@zion.uk.xensource.com>
References: <1549485670-9273-1-git-send-email-andrew.cooper3@citrix.com>
 <5C5C2B900200007800214A08@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5C5C2B900200007800214A08@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDcsIDIwMTkgYXQgMDU6NTg6NTZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA2LjAyLjE5IGF0IDIxOjQxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBTbGlnaHRseSBSRkM6Cj4gPiAKPiA+IDEpIEkndmUgbm90IHdvcmtlZCBv
dXQgZXhhY3RseSB3aGF0IHRoZQo+ID4gCj4gPiAgICAgIHYtPnZjcHVfaW5mbyA9ICh2b2lkICop
JmQtPnNoYXJlZF9pbmZvLT5jb21wYXQudmNwdV9pbmZvWzBdOwo+ID4gCj4gPiAgICBsaW5lIGlz
IHN1cHBvc2VkIHRvIGJlIGRvaW5nIGFuZCB3aGV0aGVyIGl0IGlzIG5lZWRlZCwgYnV0IGl0IGRv
ZXNuJ3QKPiA+ICAgIGFwcGVhciB0byBtYXR0ZXIuICBJdCBpcyBwZXJoYXBzIGFub3RoZXIgcmVk
dW5kYW50IG9wZW5jb2RpbmcuCj4gCj4gQWZhaWN0IHRoaXMgaXMganVzdCB0byBiZSBpbmRlcGVu
ZGVudCBvZiB0aGUgZmFjdCB0aGF0IHRoZSB2Y3B1X2luZm8KPiBhcnJheSBpcyBmaXJzdCBpbiBz
dHJ1Y3Qgc2hhcmVkX2luZm8uIEknZCBiZSBmaW5lIHdpdGggaXQgZ2V0dGluZyByZXBsYWNlZAo+
IGJ5IGEgcmVzcGVjdGl2ZSBCVUlMRF9CVUdfT04oKSwgYnV0IEknZCBsaWtlIHRvIGFzayB0aGF0
IGl0IG5vdCBiZQo+IGRyb3BwZWQgd2l0aG91dCByZXBsYWNlbWVudC4KCldoYXQgZG8geW91IG1l
YW4gYnkgImJlIGluZGVwZW5kZW50IG9mIiBoZXJlPyBQZXJoYXBzIHlvdSBtZWFudCAiYmUgc3Vy
ZQpvZiI/IEJ1dCBJIHN0aWxsIGZhaWwgdG8gdW5kZXJzdGFuZCBob3cgd291bGQgYW4gYXNzaWdu
bWVudCBtYWtlcyBzdXJlCmEgbWVtYmVyIGlzIGZpcnN0IGluIGEgc3RydWN0LgoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
