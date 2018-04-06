From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 1/1] drm/xen-zcopy: Add Xen zero-copy helper
 DRM driver
Date: Fri, 6 Apr 2018 14:25:08 +0300
Message-ID: <1ef9290a-7564-007d-81c6-cf7db74252f3__21134.4959251166$1523013840$gmane$org@gmail.com>
References: <20180329131931.29957-1-andr2000@gmail.com>
 <20180329131931.29957-2-andr2000@gmail.com>
 <20180403094734.GT3881@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=s0kp=g3=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1f4PUX-0004UB-O6
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 11:25:13 +0000
Received: by mail-lf0-x243.google.com with SMTP id q9-v6so51558lfk.9
 for <xen-devel@lists.xenproject.org>; Fri, 06 Apr 2018 04:25:12 -0700 (PDT)
In-Reply-To: <20180403094734.GT3881@phenom.ffwll.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel.vetter@intel.com, seanpaul@chromium.org, gustavo@padovan.org, jgross@suse.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDMvMjAxOCAxMjo0NyBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUaHUsIE1h
ciAyOSwgMjAxOCBhdCAwNDoxOTozMVBNICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToKPj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPgo+PiArc3RhdGljIGludCB0b19yZWZzX2dyYW50X2ZvcmVpZ25fYWNj
ZXNzKHN0cnVjdCB4ZW5fZ2VtX29iamVjdCAqeGVuX29iaikKPj4gK3sKPj4gKwlncmFudF9yZWZf
dCBwcml2X2dyZWZfaGVhZDsKPj4gKwlpbnQgcmV0LCBqLCBjdXJfcmVmLCBudW1fcGFnZXM7Cj4+
ICsJc3RydWN0IHNnX3BhZ2VfaXRlciBzZ19pdGVyOwo+PiArCj4+ICsJcmV0ID0gZ250dGFiX2Fs
bG9jX2dyYW50X3JlZmVyZW5jZXMoeGVuX29iai0+bnVtX3BhZ2VzLAo+PiArCQkJJnByaXZfZ3Jl
Zl9oZWFkKTsKPj4gKwlpZiAocmV0IDwgMCkgewo+PiArCQlEUk1fRVJST1IoIkNhbm5vdCBhbGxv
Y2F0ZSBncmFudCByZWZlcmVuY2VzXG4iKTsKPj4gKwkJcmV0dXJuIHJldDsKPj4gKwl9Cj4+ICsK
Pj4gKwlqID0gMDsKPj4gKwludW1fcGFnZXMgPSB4ZW5fb2JqLT5udW1fcGFnZXM7Cj4+ICsJZm9y
X2VhY2hfc2dfcGFnZSh4ZW5fb2JqLT5zZ3QtPnNnbCwgJnNnX2l0ZXIsIHhlbl9vYmotPnNndC0+
bmVudHMsIDApIHsKPj4gKwkJc3RydWN0IHBhZ2UgKnBhZ2U7Cj4+ICsKPj4gKwkJcGFnZSA9IHNn
X3BhZ2VfaXRlcl9wYWdlKCZzZ19pdGVyKTsKPiBRdWljayBkcml2ZS1ieTogWW91IGNhbid0IGFz
c3VtZSB0aGF0IGFuIHNndCBpcyBzdHJ1Y3QgcGFnZSBiYWNrZWQuCkRvIHlvdSBtZWFuIHRoYXQg
c29tZW9uZSBjb3VsZCBnaXZlIG1lIHNndCB3aGljaCBuZXZlcgpzZWVuIHNnX2Fzc2lnbl9wYWdl
IGZvciBpdHMgZW50cmllcz8KV2hhdCBhcmUgdGhlIG90aGVyIHVzZS1jYXNlcyBmb3IgdGhhdCB0
byBoYXBwZW4/Cj4gQW5kIHlvdSBwcm9iYWJseSB3YW50IHRvIGNoZWNrIHRoaXMgYXQgaW1wb3J0
L2F0dGFjaCB0aW1lLgpUaGUgY2hlY2sgeW91IG1lYW4gaXMgdG8gbWFrZSBzdXJlIHRoYXQgd2hl
biBJIGNhbGwKcGFnZSA9IHNnX3BhZ2VfaXRlcl9wYWdlKCZzZ19pdGVyKTsKSSBoYXZlIHRvIG1h
a2Ugc3VyZSB0aGF0IEkgZ2V0IGEgdmFsaWQgcGFnZT8KPiAtRGFuaWVsClRoYW5rIHlvdSwKT2xl
a3NhbmRyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
