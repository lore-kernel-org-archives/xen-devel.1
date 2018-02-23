From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 5/9] drm/xen-front: Implement handling of
 shared display buffers
Date: Fri, 23 Feb 2018 09:36:16 -0500
Message-ID: <36003bb4-6fc9-f8f9-2817-103bf0f543e9@oracle.com>
References: <1519200222-20623-1-git-send-email-andr2000@gmail.com>
 <1519200222-20623-6-git-send-email-andr2000@gmail.com>
 <11ce6c96-1739-435c-4b6f-c9f5d02a2905@oracle.com>
 <dea8aaa3-70e8-4532-1f5a-2e0f8f57abed@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q2tv=fr=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1epERz-0006CN-7J
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 14:35:51 +0000
In-Reply-To: <dea8aaa3-70e8-4532-1f5a-2e0f8f57abed@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel.vetter@intel.com, seanpaul@chromium.org, gustavo@padovan.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjMvMjAxOCAwMjo1MyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
T24gMDIvMjMvMjAxOCAwMjoyNSBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwMi8y
MS8yMDE4IDAzOjAzIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+ICAgICBz
dGF0aWMgaW50IF9faW5pdCB4ZW5fZHJ2X2luaXQodm9pZCkKPj4+ICAgewo+Pj4gKyAgICAvKiBB
dCB0aGUgbW9tZW50IHdlIG9ubHkgc3VwcG9ydCBjYXNlIHdpdGggWEVOX1BBR0VfU0laRSA9PQo+
Pj4gUEFHRV9TSVpFICovCj4+PiArICAgIEJVSUxEX0JVR19PTihYRU5fUEFHRV9TSVpFICE9IFBB
R0VfU0laRSk7Cj4+Cj4+IFdoeSBCVUlMRF9CVUdfT04/IFRoaXMgc2hvdWxkIHNpbXBseSBub3Qg
bG9hZCBpZiBwYWdlIHNpemVzIGFyZQo+PiBkaWZmZXJlbnQuCj4+Cj4+ICAgCj4gVGhpcyBpcyBh
IGNvbXBpbGUgdGltZSBjaGVjaywgc28gaWYga2VybmVsL1hlbiBpcyBjb25maWd1cmVkCj4gdG8g
dXNlIHBhZ2Ugc2l6ZSBjb21iaW5hdGlvbiB3aGljaCBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZQo+
IGRyaXZlciBpdCB3aWxsIGZhaWwgZHVyaW5nIGNvbXBpbGF0aW9uLiBUaGlzIHNlZW1zIGNvcnJl
Y3QgdG8gbWUsCj4gYmVjYXVzZSB5b3Ugc2hvdWxkbid0IGV2ZW4gdHJ5IHRvIGxvYWQgdGhlIGRy
aXZlciB3aGljaAo+IGNhbm5vdCBoYW5kbGUgZGlmZmVyZW50IHBhZ2Ugc2l6ZXMgdG8gbm90IG1h
a2UgYW55IGhhcm0uCgoKVGhpcyB3aWxsIHByZXZlbnQgd2hvbGUga2VybmVsIGZyb20gYnVpbGRp
bmcuIFNvLCBmb3IgZXhhbXBsZSwKcmFuZGNvbmZpZyBidWlsZHMgd2lsbCBmYWlsLgoKCj4+Cj4+
Cj4+Cj4+PiArICAgIHJldCA9IGdudHRhYl9tYXBfcmVmcyhtYXBfb3BzLCBOVUxMLCBidWYtPnBh
Z2VzLCBidWYtPm51bV9wYWdlcyk7Cj4+PiArICAgIEJVR19PTihyZXQpOwo+Pgo+PiBXZSBzaG91
bGQgdHJ5IG5vdCB0byBCVUcqKCkuIFRoZXJlIGFyZSBhIGZldyBpbiB0aGlzIHBhdGNoIChhbmQg
cG9zc2libHkKPj4gb3RoZXJzKSB0aGF0IEkgdGhpbmsgY2FuIGJlIGF2b2lkZWQuCj4+Cj4gSSB3
aWxsIHJld29yayBCVUdfKiBmb3IgbWFwL3VubWFwIGNvZGUgdG8gaGFuZGxlIGVycm9ycywKPiBi
dXQgd2lsbCBzdGlsbCBsZWF2ZQo+ICAgICAvKiBlaXRoZXIgcGFnZXMgb3Igc2d0LCBub3QgYm90
aCAqLwo+ICAgICBCVUdfT04oY2ZnLT5wYWdlcyAmJiBjZmctPnNndCk7Cj4gd2hpY2ggaXMgYSBy
ZWFsIGRyaXZlciBidWcgYW5kIG11c3Qgbm90IGhhcHBlbgoKV2h5IG5vdCByZXR1cm4gYW4gZXJy
b3I/CgpJbiBmYWN0LCBBRkFJQ1MgeW91IG9ubHkgY2FsbCBpdCBpbiBwYXRjaCA5IHdoZXJlIGJv
dGggb2YgdGhlc2UgY2FuIGJlCnRlc3RlZCwgaW4gd2hpY2ggY2FzZSBzb21ldGhpbmcgbGlrZSAt
RUlOVkFMIHdvdWxkIGxvb2sgcmVhc29uYWJsZS4KCi1ib3JpcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
