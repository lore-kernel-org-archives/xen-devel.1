From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 5/9] drm/xen-front: Implement handling of
 shared display buffers
Date: Fri, 23 Feb 2018 16:45:23 +0200
Message-ID: <bc441999-ec06-794e-99cb-20091c87ede2__28647.9545910426$1519397051$gmane$org@gmail.com>
References: <1519200222-20623-1-git-send-email-andr2000@gmail.com>
 <1519200222-20623-6-git-send-email-andr2000@gmail.com>
 <11ce6c96-1739-435c-4b6f-c9f5d02a2905@oracle.com>
 <dea8aaa3-70e8-4532-1f5a-2e0f8f57abed@gmail.com>
 <36003bb4-6fc9-f8f9-2817-103bf0f543e9@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=vqf1=fr=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1epEbI-0007N8-Il
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 14:45:28 +0000
Received: by mail-lf0-x242.google.com with SMTP id y19so12707976lfd.4
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2018 06:45:27 -0800 (PST)
In-Reply-To: <36003bb4-6fc9-f8f9-2817-103bf0f543e9@oracle.com>
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

T24gMDIvMjMvMjAxOCAwNDozNiBQTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDAyLzIz
LzIwMTggMDI6NTMgQU0sIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOgo+PiBPbiAwMi8y
My8yMDE4IDAyOjI1IEFNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+PiBPbiAwMi8yMS8yMDE4
IDAzOjAzIEFNLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToKPj4+PiAgICAgIHN0YXRp
YyBpbnQgX19pbml0IHhlbl9kcnZfaW5pdCh2b2lkKQo+Pj4+ICAgIHsKPj4+PiArICAgIC8qIEF0
IHRoZSBtb21lbnQgd2Ugb25seSBzdXBwb3J0IGNhc2Ugd2l0aCBYRU5fUEFHRV9TSVpFID09Cj4+
Pj4gUEFHRV9TSVpFICovCj4+Pj4gKyAgICBCVUlMRF9CVUdfT04oWEVOX1BBR0VfU0laRSAhPSBQ
QUdFX1NJWkUpOwo+Pj4gV2h5IEJVSUxEX0JVR19PTj8gVGhpcyBzaG91bGQgc2ltcGx5IG5vdCBs
b2FkIGlmIHBhZ2Ugc2l6ZXMgYXJlCj4+PiBkaWZmZXJlbnQuCj4+Pgo+Pj4gICAgCj4+IFRoaXMg
aXMgYSBjb21waWxlIHRpbWUgY2hlY2ssIHNvIGlmIGtlcm5lbC9YZW4gaXMgY29uZmlndXJlZAo+
PiB0byB1c2UgcGFnZSBzaXplIGNvbWJpbmF0aW9uIHdoaWNoIGlzIG5vdCBzdXBwb3J0ZWQgYnkg
dGhlCj4+IGRyaXZlciBpdCB3aWxsIGZhaWwgZHVyaW5nIGNvbXBpbGF0aW9uLiBUaGlzIHNlZW1z
IGNvcnJlY3QgdG8gbWUsCj4+IGJlY2F1c2UgeW91IHNob3VsZG4ndCBldmVuIHRyeSB0byBsb2Fk
IHRoZSBkcml2ZXIgd2hpY2gKPj4gY2Fubm90IGhhbmRsZSBkaWZmZXJlbnQgcGFnZSBzaXplcyB0
byBub3QgbWFrZSBhbnkgaGFybS4KPgo+IFRoaXMgd2lsbCBwcmV2ZW50IHdob2xlIGtlcm5lbCBm
cm9tIGJ1aWxkaW5nLiBTbywgZm9yIGV4YW1wbGUsCj4gcmFuZGNvbmZpZyBidWlsZHMgd2lsbCBm
YWlsLgo+Cm1ha2VzIGEgbG90IG9mIHNlbnNlLCB0aGFuayB5b3UKd2lsbCByZXdvcmsgc28gSSBy
ZWplY3QgdG8gbG9hZCBpZiB0aGUgcmVxdWlyZW1lbnQgaXMgbm90IG1ldAo+Pj4KPj4+Cj4+Pj4g
KyAgICByZXQgPSBnbnR0YWJfbWFwX3JlZnMobWFwX29wcywgTlVMTCwgYnVmLT5wYWdlcywgYnVm
LT5udW1fcGFnZXMpOwo+Pj4+ICsgICAgQlVHX09OKHJldCk7Cj4+PiBXZSBzaG91bGQgdHJ5IG5v
dCB0byBCVUcqKCkuIFRoZXJlIGFyZSBhIGZldyBpbiB0aGlzIHBhdGNoIChhbmQgcG9zc2libHkK
Pj4+IG90aGVycykgdGhhdCBJIHRoaW5rIGNhbiBiZSBhdm9pZGVkLgo+Pj4KPj4gSSB3aWxsIHJl
d29yayBCVUdfKiBmb3IgbWFwL3VubWFwIGNvZGUgdG8gaGFuZGxlIGVycm9ycywKPj4gYnV0IHdp
bGwgc3RpbGwgbGVhdmUKPj4gICAgICAvKiBlaXRoZXIgcGFnZXMgb3Igc2d0LCBub3QgYm90aCAq
Lwo+PiAgICAgIEJVR19PTihjZmctPnBhZ2VzICYmIGNmZy0+c2d0KTsKPj4gd2hpY2ggaXMgYSBy
ZWFsIGRyaXZlciBidWcgYW5kIG11c3Qgbm90IGhhcHBlbgo+IFdoeSBub3QgcmV0dXJuIGFuIGVy
cm9yPwo+Cj4gSW4gZmFjdCwgQUZBSUNTIHlvdSBvbmx5IGNhbGwgaXQgaW4gcGF0Y2ggOSB3aGVy
ZSBib3RoIG9mIHRoZXNlIGNhbiBiZQo+IHRlc3RlZCwgaW4gd2hpY2ggY2FzZSBzb21ldGhpbmcg
bGlrZSAtRUlOVkFMIHdvdWxkIGxvb2sgcmVhc29uYWJsZS4Kb2ssIHdpbGwgcmVtb3ZlIEJVR19P
TiBhcyB3ZWxsCj4gLWJvcmlzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
