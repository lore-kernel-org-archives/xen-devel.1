From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/1] drm/xen-zcopy: Add Xen zero-copy helper
 DRM driver
Date: Mon, 9 Apr 2018 10:27:40 +0200
Message-ID: <20180409082740.GI31310__9917.60555557466$1523262398$gmane$org@phenom.ffwll.local>
References: <20180329131931.29957-1-andr2000@gmail.com>
 <20180329131931.29957-2-andr2000@gmail.com>
 <20180403094734.GT3881@phenom.ffwll.local>
 <1ef9290a-7564-007d-81c6-cf7db74252f3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=po5j=g6=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1f5S9R-0003bm-CN
 for xen-devel@lists.xenproject.org; Mon, 09 Apr 2018 08:27:45 +0000
Received: by mail-wm0-x242.google.com with SMTP id x82so14804088wmg.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Apr 2018 01:27:43 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1ef9290a-7564-007d-81c6-cf7db74252f3@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, airlied@linux.ie, gustavo@padovan.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, seanpaul@chromium.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMDYsIDIwMTggYXQgMDI6MjU6MDhQTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gT24gMDQvMDMvMjAxOCAxMjo0NyBQTSwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiA+IE9uIFRodSwgTWFyIDI5LCAyMDE4IGF0IDA0OjE5OjMxUE0gKzAzMDAsIE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+ID4gPiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gPiA+ICtzdGF0aWMgaW50
IHRvX3JlZnNfZ3JhbnRfZm9yZWlnbl9hY2Nlc3Moc3RydWN0IHhlbl9nZW1fb2JqZWN0ICp4ZW5f
b2JqKQo+ID4gPiArewo+ID4gPiArCWdyYW50X3JlZl90IHByaXZfZ3JlZl9oZWFkOwo+ID4gPiAr
CWludCByZXQsIGosIGN1cl9yZWYsIG51bV9wYWdlczsKPiA+ID4gKwlzdHJ1Y3Qgc2dfcGFnZV9p
dGVyIHNnX2l0ZXI7Cj4gPiA+ICsKPiA+ID4gKwlyZXQgPSBnbnR0YWJfYWxsb2NfZ3JhbnRfcmVm
ZXJlbmNlcyh4ZW5fb2JqLT5udW1fcGFnZXMsCj4gPiA+ICsJCQkmcHJpdl9ncmVmX2hlYWQpOwo+
ID4gPiArCWlmIChyZXQgPCAwKSB7Cj4gPiA+ICsJCURSTV9FUlJPUigiQ2Fubm90IGFsbG9jYXRl
IGdyYW50IHJlZmVyZW5jZXNcbiIpOwo+ID4gPiArCQlyZXR1cm4gcmV0Owo+ID4gPiArCX0KPiA+
ID4gKwo+ID4gPiArCWogPSAwOwo+ID4gPiArCW51bV9wYWdlcyA9IHhlbl9vYmotPm51bV9wYWdl
czsKPiA+ID4gKwlmb3JfZWFjaF9zZ19wYWdlKHhlbl9vYmotPnNndC0+c2dsLCAmc2dfaXRlciwg
eGVuX29iai0+c2d0LT5uZW50cywgMCkgewo+ID4gPiArCQlzdHJ1Y3QgcGFnZSAqcGFnZTsKPiA+
ID4gKwo+ID4gPiArCQlwYWdlID0gc2dfcGFnZV9pdGVyX3BhZ2UoJnNnX2l0ZXIpOwo+ID4gUXVp
Y2sgZHJpdmUtYnk6IFlvdSBjYW4ndCBhc3N1bWUgdGhhdCBhbiBzZ3QgaXMgc3RydWN0IHBhZ2Ug
YmFja2VkLgo+IERvIHlvdSBtZWFuIHRoYXQgc29tZW9uZSBjb3VsZCBnaXZlIG1lIHNndCB3aGlj
aCBuZXZlcgo+IHNlZW4gc2dfYXNzaWduX3BhZ2UgZm9yIGl0cyBlbnRyaWVzPwoKWWVzLgoKPiBX
aGF0IGFyZSB0aGUgb3RoZXIgdXNlLWNhc2VzIGZvciB0aGF0IHRvIGhhcHBlbj8KClNoYXJpbmcg
dnJhbSBvciBvdGhlciByZXNvdXJjZXMgd2hpY2ggYXJlIG5vdCBiYWNrZWQgYnkgYSBzdHJ1Y3Qg
cGFnZS4gU2VlCkNocmlzdGlhbiBLw7ZuaWcncyByZWNlbnQgd29yayB0byBhY2NvbXBsaXNoIGp1
c3QgdGhhdCBmb3IgYWRtZ3B1LgoKPiA+IEFuZCB5b3UgcHJvYmFibHkgd2FudCB0byBjaGVjayB0
aGlzIGF0IGltcG9ydC9hdHRhY2ggdGltZS4KPiBUaGUgY2hlY2sgeW91IG1lYW4gaXMgdG8gbWFr
ZSBzdXJlIHRoYXQgd2hlbiBJIGNhbGwKPiBwYWdlID0gc2dfcGFnZV9pdGVyX3BhZ2UoJnNnX2l0
ZXIpOwo+IEkgaGF2ZSB0byBtYWtlIHN1cmUgdGhhdCBJIGdldCBhIHZhbGlkIHBhZ2U/CgpZdXAu
Cgo+ID4gLURhbmllbAo+IFRoYW5rIHlvdSwKPiBPbGVrc2FuZHIKCkNoZWVycywgRGFuaWVsCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
