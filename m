From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 5/9] drm/xen-front: Implement handling of
 shared display buffers
Date: Thu, 22 Feb 2018 19:25:18 -0500
Message-ID: <11ce6c96-1739-435c-4b6f-c9f5d02a2905@oracle.com>
References: <1519200222-20623-1-git-send-email-andr2000@gmail.com>
 <1519200222-20623-6-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q2tv=fr=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1ep1Ab-0002L3-63
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 00:25:01 +0000
In-Reply-To: <1519200222-20623-6-git-send-email-andr2000@gmail.com>
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

T24gMDIvMjEvMjAxOCAwMzowMyBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
IAo+ICBzdGF0aWMgaW50IF9faW5pdCB4ZW5fZHJ2X2luaXQodm9pZCkKPiAgewo+ICsJLyogQXQg
dGhlIG1vbWVudCB3ZSBvbmx5IHN1cHBvcnQgY2FzZSB3aXRoIFhFTl9QQUdFX1NJWkUgPT0gUEFH
RV9TSVpFICovCj4gKwlCVUlMRF9CVUdfT04oWEVOX1BBR0VfU0laRSAhPSBQQUdFX1NJWkUpOwoK
CldoeSBCVUlMRF9CVUdfT04/IFRoaXMgc2hvdWxkIHNpbXBseSBub3QgbG9hZCBpZiBwYWdlIHNp
emVzIGFyZSBkaWZmZXJlbnQuCgogCgoKCj4gKwlyZXQgPSBnbnR0YWJfbWFwX3JlZnMobWFwX29w
cywgTlVMTCwgYnVmLT5wYWdlcywgYnVmLT5udW1fcGFnZXMpOwo+ICsJQlVHX09OKHJldCk7CgoK
V2Ugc2hvdWxkIHRyeSBub3QgdG8gQlVHKigpLiBUaGVyZSBhcmUgYSBmZXcgaW4gdGhpcyBwYXRj
aCAoYW5kIHBvc3NpYmx5Cm90aGVycykgdGhhdCBJIHRoaW5rIGNhbiBiZSBhdm9pZGVkLgoKCgoK
Cj4gKwo+ICtzdGF0aWMgaW50IGFsbG9jX3N0b3JhZ2Uoc3RydWN0IHhlbl9kcm1fZnJvbnRfc2hi
dWYgKmJ1ZikKPiArewo+ICsJaWYgKGJ1Zi0+c2d0KSB7Cj4gKwkJYnVmLT5wYWdlcyA9IGt2bWFs
bG9jX2FycmF5KGJ1Zi0+bnVtX3BhZ2VzLAo+ICsJCQkJc2l6ZW9mKHN0cnVjdCBwYWdlICopLCBH
RlBfS0VSTkVMKTsKPiArCQlpZiAoIWJ1Zi0+cGFnZXMpCj4gKwkJCXJldHVybiAtRU5PTUVNOwo+
ICsKPiArCQlpZiAoZHJtX3ByaW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXMoYnVmLT5zZ3QsIGJ1
Zi0+cGFnZXMsCj4gKwkJCQlOVUxMLCBidWYtPm51bV9wYWdlcykgPCAwKQo+ICsJCQlyZXR1cm4g
LUVJTlZBTDsKPiArCX0KPiArCj4gKwlidWYtPmdyZWZzID0ga2NhbGxvYyhidWYtPm51bV9ncmVm
cywgc2l6ZW9mKCpidWYtPmdyZWZzKSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIWJ1Zi0+Z3JlZnMp
Cj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsJYnVmLT5kaXJlY3RvcnkgPSBrY2FsbG9jKGdl
dF9udW1fcGFnZXNfZGlyKGJ1ZiksIFBBR0VfU0laRSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIWJ1
Zi0+ZGlyZWN0b3J5KQo+ICsJCXJldHVybiAtRU5PTUVNOwoKWW91IG5lZWQgdG8gY2xlYW4gdXAg
b24gZXJyb3JzLgoKLWJvcmlzCgo+ICsKPiArCXJldHVybiAwOwo+ICt9CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
