From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools: only call git when necessary in OVMF
 Makefile
Date: Tue, 15 Jan 2019 11:13:10 +0000
Message-ID: <20190115111310.GD1271@perard.uk.xensource.com>
References: <20190115110940.29403-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GDKA=PX=citrix.com=prvs=911f1f4f8=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gjMfj-00070R-Bg
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 11:14:19 +0000
Content-Disposition: inline
In-Reply-To: <20190115110940.29403-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMTE6MDk6NDBBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBVc2VycyBtYXkgY2hvb3NlIHRvIGV4cG9ydCBhIHNuYXBzaG90IG9mIE9WTUYgYW5kIGJ1aWxk
IGl0Cj4gd2l0aCB4ZW4uZ2l0IHN1cHBsaWVkIG92bWYtbWFrZWZpbGUuIEluIHRoYXQgY2FzZSB3
ZSBkb24ndAo+IG5lZWQgdG8gY2FsbCBgZ2l0IHN1Ym1vZHVsZWAuCj4gCj4gRml4ZXMgYjE2Mjgx
ODcwZS4KPiAKPiBSZXBvcnRlZC1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgo+IFNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cgo+IC0tLQo+ICB0b29s
cy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUv
b3ZtZi1tYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZpbGUKPiBpbmRleCAzZGUy
ZmMwMzAwLi41NWY5OTkyMTQ1IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFr
ZWZpbGUKPiArKysgYi90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlCj4gQEAgLTE2LDcgKzE2
LDcgQEAgYWxsOiBidWlsZAo+ICAKPiAgLlBIT05ZOiBidWlsZAo+ICBidWlsZDoKPiAtCSQoR0lU
KSBzdWJtb2R1bGUgdXBkYXRlIC0taW5pdCAtLXJlY3Vyc2l2ZQo+ICsJaWYgdGVzdCAtZSAuZ2l0
IDsgdGhlbiAkKEdJVCkgc3VibW9kdWxlIHVwZGF0ZSAtLWluaXQgLS1yZWN1cnNpdmUgOyBmaQo+
ICAJT3ZtZlBrZy9idWlsZC5zaCAtYSBYNjQgLWIgJChUQVJHRVQpIC1uIDQKPiAgCWNwIEJ1aWxk
L092bWZYNjQvJChUQVJHRVQpX0dDQyovRlYvT1ZNRi5mZCBvdm1mLmJpbgo+ICAKPiAtLSAKPiAy
LjExLjAKPiAKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
