From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 5/9] drm/xen-front: Implement handling of
 shared display buffers
Date: Fri, 23 Feb 2018 09:53:50 +0200
Message-ID: <dea8aaa3-70e8-4532-1f5a-2e0f8f57abed__11614.7019471557$1519372371$gmane$org@gmail.com>
References: <1519200222-20623-1-git-send-email-andr2000@gmail.com>
 <1519200222-20623-6-git-send-email-andr2000@gmail.com>
 <11ce6c96-1739-435c-4b6f-c9f5d02a2905@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vqf1=fr=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1ep8B0-00073w-VM
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 07:53:55 +0000
Received: by mail-lf0-x243.google.com with SMTP id 70so11103123lfw.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2018 23:53:53 -0800 (PST)
In-Reply-To: <11ce6c96-1739-435c-4b6f-c9f5d02a2905@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel.vetter@intel.com, seanpaul@chromium.org, gustavo@padovan.org, jgross@suse.com, konrad.wilk@oracle.com
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMjMvMjAxOCAwMjoyNSBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDAyLzIx
LzIwMTggMDM6MDMgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiAgIAo+PiAg
IHN0YXRpYyBpbnQgX19pbml0IHhlbl9kcnZfaW5pdCh2b2lkKQo+PiAgIHsKPj4gKwkvKiBBdCB0
aGUgbW9tZW50IHdlIG9ubHkgc3VwcG9ydCBjYXNlIHdpdGggWEVOX1BBR0VfU0laRSA9PSBQQUdF
X1NJWkUgKi8KPj4gKwlCVUlMRF9CVUdfT04oWEVOX1BBR0VfU0laRSAhPSBQQUdFX1NJWkUpOwo+
Cj4gV2h5IEJVSUxEX0JVR19PTj8gVGhpcyBzaG91bGQgc2ltcGx5IG5vdCBsb2FkIGlmIHBhZ2Ug
c2l6ZXMgYXJlIGRpZmZlcmVudC4KPgo+ICAgClRoaXMgaXMgYSBjb21waWxlIHRpbWUgY2hlY2ss
IHNvIGlmIGtlcm5lbC9YZW4gaXMgY29uZmlndXJlZAp0byB1c2UgcGFnZSBzaXplIGNvbWJpbmF0
aW9uIHdoaWNoIGlzIG5vdCBzdXBwb3J0ZWQgYnkgdGhlCmRyaXZlciBpdCB3aWxsIGZhaWwgZHVy
aW5nIGNvbXBpbGF0aW9uLiBUaGlzIHNlZW1zIGNvcnJlY3QgdG8gbWUsCmJlY2F1c2UgeW91IHNo
b3VsZG4ndCBldmVuIHRyeSB0byBsb2FkIHRoZSBkcml2ZXIgd2hpY2gKY2Fubm90IGhhbmRsZSBk
aWZmZXJlbnQgcGFnZSBzaXplcyB0byBub3QgbWFrZSBhbnkgaGFybS4KPgo+Cj4KPj4gKwlyZXQg
PSBnbnR0YWJfbWFwX3JlZnMobWFwX29wcywgTlVMTCwgYnVmLT5wYWdlcywgYnVmLT5udW1fcGFn
ZXMpOwo+PiArCUJVR19PTihyZXQpOwo+Cj4gV2Ugc2hvdWxkIHRyeSBub3QgdG8gQlVHKigpLiBU
aGVyZSBhcmUgYSBmZXcgaW4gdGhpcyBwYXRjaCAoYW5kIHBvc3NpYmx5Cj4gb3RoZXJzKSB0aGF0
IEkgdGhpbmsgY2FuIGJlIGF2b2lkZWQuCj4KSSB3aWxsIHJld29yayBCVUdfKiBmb3IgbWFwL3Vu
bWFwIGNvZGUgdG8gaGFuZGxlIGVycm9ycywKYnV0IHdpbGwgc3RpbGwgbGVhdmUKIMKgwqDCoCAv
KiBlaXRoZXIgcGFnZXMgb3Igc2d0LCBub3QgYm90aCAqLwogwqDCoMKgIEJVR19PTihjZmctPnBh
Z2VzICYmIGNmZy0+c2d0KTsKd2hpY2ggaXMgYSByZWFsIGRyaXZlciBidWcgYW5kIG11c3Qgbm90
IGhhcHBlbgo+Cj4KPgo+PiArCj4+ICtzdGF0aWMgaW50IGFsbG9jX3N0b3JhZ2Uoc3RydWN0IHhl
bl9kcm1fZnJvbnRfc2hidWYgKmJ1ZikKPj4gK3sKPj4gKwlpZiAoYnVmLT5zZ3QpIHsKPj4gKwkJ
YnVmLT5wYWdlcyA9IGt2bWFsbG9jX2FycmF5KGJ1Zi0+bnVtX3BhZ2VzLAo+PiArCQkJCXNpemVv
ZihzdHJ1Y3QgcGFnZSAqKSwgR0ZQX0tFUk5FTCk7Cj4+ICsJCWlmICghYnVmLT5wYWdlcykKPj4g
KwkJCXJldHVybiAtRU5PTUVNOwo+PiArCj4+ICsJCWlmIChkcm1fcHJpbWVfc2dfdG9fcGFnZV9h
ZGRyX2FycmF5cyhidWYtPnNndCwgYnVmLT5wYWdlcywKPj4gKwkJCQlOVUxMLCBidWYtPm51bV9w
YWdlcykgPCAwKQo+PiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4+ICsJfQo+PiArCj4+ICsJYnVmLT5n
cmVmcyA9IGtjYWxsb2MoYnVmLT5udW1fZ3JlZnMsIHNpemVvZigqYnVmLT5ncmVmcyksIEdGUF9L
RVJORUwpOwo+PiArCWlmICghYnVmLT5ncmVmcykKPj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4+ICsK
Pj4gKwlidWYtPmRpcmVjdG9yeSA9IGtjYWxsb2MoZ2V0X251bV9wYWdlc19kaXIoYnVmKSwgUEFH
RV9TSVpFLCBHRlBfS0VSTkVMKTsKPj4gKwlpZiAoIWJ1Zi0+ZGlyZWN0b3J5KQo+PiArCQlyZXR1
cm4gLUVOT01FTTsKPiBZb3UgbmVlZCB0byBjbGVhbiB1cCBvbiBlcnJvcnMuCnRoaXMgaXMgY2Fs
bGVkIGluIHhlbl9kcm1fZnJvbnRfc2hidWZfYWxsb2MgYW5kIGlzIHByb3Blcmx5IGNsZWFuZWQK
b24gZmFpbHVyZSwgZS5nLjoKIMKgwqDCoCByZXQgPSBhbGxvY19zdG9yYWdlKGJ1Zik7CiDCoMKg
wqAgaWYgKHJldCkKIMKgwqDCoCDCoMKgwqAgZ290byBmYWlsOwpbLi4uXQpmYWlsOgogwqDCoMKg
IHhlbl9kcm1fZnJvbnRfc2hidWZfZnJlZShidWYpOwoKPiAtYm9yaXMKPgo+PiArCj4+ICsJcmV0
dXJuIDA7Cj4+ICt9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
