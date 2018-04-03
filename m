From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/1] drm/xen-zcopy: Add Xen zero-copy helper
 DRM driver
Date: Tue, 3 Apr 2018 11:47:34 +0200
Message-ID: <20180403094734.GT3881__39623.7621935599$1522748823$gmane$org@phenom.ffwll.local>
References: <20180329131931.29957-1-andr2000@gmail.com>
 <20180329131931.29957-2-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5ycj=gy=ffwll.ch=daniel@srs-us1.protection.inumbo.net>)
 id 1f3IXT-00071i-GS
 for xen-devel@lists.xenproject.org; Tue, 03 Apr 2018 09:47:39 +0000
Received: by mail-wm0-x242.google.com with SMTP id f125so33704931wme.4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Apr 2018 02:47:37 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20180329131931.29957-2-andr2000@gmail.com>
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

T24gVGh1LCBNYXIgMjksIDIwMTggYXQgMDQ6MTk6MzFQTSArMDMwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+ICtzdGF0aWMgaW50IHRvX3JlZnNfZ3JhbnRfZm9y
ZWlnbl9hY2Nlc3Moc3RydWN0IHhlbl9nZW1fb2JqZWN0ICp4ZW5fb2JqKQo+ICt7Cj4gKwlncmFu
dF9yZWZfdCBwcml2X2dyZWZfaGVhZDsKPiArCWludCByZXQsIGosIGN1cl9yZWYsIG51bV9wYWdl
czsKPiArCXN0cnVjdCBzZ19wYWdlX2l0ZXIgc2dfaXRlcjsKPiArCj4gKwlyZXQgPSBnbnR0YWJf
YWxsb2NfZ3JhbnRfcmVmZXJlbmNlcyh4ZW5fb2JqLT5udW1fcGFnZXMsCj4gKwkJCSZwcml2X2dy
ZWZfaGVhZCk7Cj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCURSTV9FUlJPUigiQ2Fubm90IGFsbG9j
YXRlIGdyYW50IHJlZmVyZW5jZXNcbiIpOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9Cj4gKwo+ICsJ
aiA9IDA7Cj4gKwludW1fcGFnZXMgPSB4ZW5fb2JqLT5udW1fcGFnZXM7Cj4gKwlmb3JfZWFjaF9z
Z19wYWdlKHhlbl9vYmotPnNndC0+c2dsLCAmc2dfaXRlciwgeGVuX29iai0+c2d0LT5uZW50cywg
MCkgewo+ICsJCXN0cnVjdCBwYWdlICpwYWdlOwo+ICsKPiArCQlwYWdlID0gc2dfcGFnZV9pdGVy
X3BhZ2UoJnNnX2l0ZXIpOwoKUXVpY2sgZHJpdmUtYnk6IFlvdSBjYW4ndCBhc3N1bWUgdGhhdCBh
biBzZ3QgaXMgc3RydWN0IHBhZ2UgYmFja2VkLgoKQW5kIHlvdSBwcm9iYWJseSB3YW50IHRvIGNo
ZWNrIHRoaXMgYXQgaW1wb3J0L2F0dGFjaCB0aW1lLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
