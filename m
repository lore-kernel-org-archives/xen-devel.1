From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 8/9] drm/xen-front: Implement GEM operations
Date: Fri, 23 Feb 2018 10:26:56 -0500
Message-ID: <2f2c6fea-c0cb-e244-41f3-269db07986fc@oracle.com>
References: <1519200222-20623-1-git-send-email-andr2000@gmail.com>
 <1519200222-20623-9-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q2tv=fr=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1epFF0-00035H-Ih
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2018 15:26:30 +0000
In-Reply-To: <1519200222-20623-9-git-send-email-andr2000@gmail.com>
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
K3N0YXRpYyBzdHJ1Y3QgeGVuX2dlbV9vYmplY3QgKmdlbV9jcmVhdGUoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgc2l6ZV90IHNpemUpCj4gK3sKPiArCXN0cnVjdCB4ZW5fZHJtX2Zyb250X2RybV9p
bmZvICpkcm1faW5mbyA9IGRldi0+ZGV2X3ByaXZhdGU7Cj4gKwlzdHJ1Y3QgeGVuX2dlbV9vYmpl
Y3QgKnhlbl9vYmo7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCXNpemUgPSByb3VuZF91cChzaXplLCBQ
QUdFX1NJWkUpOwo+ICsJeGVuX29iaiA9IGdlbV9jcmVhdGVfb2JqKGRldiwgc2l6ZSk7Cj4gKwlp
ZiAoSVNfRVJSX09SX05VTEwoeGVuX29iaikpCj4gKwkJcmV0dXJuIHhlbl9vYmo7Cj4gKwo+ICsJ
aWYgKGRybV9pbmZvLT5jZmctPmJlX2FsbG9jKSB7Cj4gKwkJLyoKPiArCQkgKiBiYWNrZW5kIHdp
bGwgYWxsb2NhdGUgc3BhY2UgZm9yIHRoaXMgYnVmZmVyLCBzbwo+ICsJCSAqIG9ubHkgYWxsb2Nh
dGUgYXJyYXkgb2YgcG9pbnRlcnMgdG8gcGFnZXMKPiArCQkgKi8KPiArCQl4ZW5fb2JqLT5iZV9h
bGxvYyA9IHRydWU7CgpJZiBiZV9hbGxvYyBpcyBhIGZsYWcgKHdoaWNoIEkgYW0gbm90IHN1cmUg
YWJvdXQpIC0tLSBzaG91bGQgaXQgYmUgc2V0CnRvIHRydWUgKmFmdGVyKiB5b3UndmUgc3VjY2Vz
c2Z1bGx5IGFsbG9jYXRlZCB5b3VyIHRoaW5ncz8KCj4gKwkJcmV0ID0gZ2VtX2FsbG9jX3BhZ2Vz
X2FycmF5KHhlbl9vYmosIHNpemUpOwo+ICsJCWlmIChyZXQgPCAwKSB7Cj4gKwkJCWdlbV9mcmVl
X3BhZ2VzX2FycmF5KHhlbl9vYmopOwo+ICsJCQlnb3RvIGZhaWw7Cj4gKwkJfQo+ICsKPiArCQly
ZXQgPSBhbGxvY194ZW5iYWxsb29uZWRfcGFnZXMoeGVuX29iai0+bnVtX3BhZ2VzLAo+ICsJCQkJ
eGVuX29iai0+cGFnZXMpOwoKV2h5IGFyZSB5b3UgYWxsb2NhdGluZyBiYWxsb29uIHBhZ2VzPwoK
LWJvcmlzCgo+ICsJCWlmIChyZXQgPCAwKSB7Cj4gKwkJCURSTV9FUlJPUigiQ2Fubm90IGFsbG9j
YXRlICV6dSBiYWxsb29uZWQgcGFnZXM6ICVkXG4iLAo+ICsJCQkJCXhlbl9vYmotPm51bV9wYWdl
cywgcmV0KTsKPiArCQkJZ290byBmYWlsOwo+ICsJCX0KPiArCj4gKwkJcmV0dXJuIHhlbl9vYmo7
Cj4gKwl9Cj4gKwkvKgo+ICsJICogbmVlZCB0byBhbGxvY2F0ZSBiYWNraW5nIHBhZ2VzIG5vdywg
c28gd2UgY2FuIHNoYXJlIHRob3NlCj4gKwkgKiB3aXRoIHRoZSBiYWNrZW5kCj4gKwkgKi8KPiAr
CXhlbl9vYmotPm51bV9wYWdlcyA9IERJVl9ST1VORF9VUChzaXplLCBQQUdFX1NJWkUpOwo+ICsJ
eGVuX29iai0+cGFnZXMgPSBkcm1fZ2VtX2dldF9wYWdlcygmeGVuX29iai0+YmFzZSk7Cj4gKwlp
ZiAoSVNfRVJSX09SX05VTEwoeGVuX29iai0+cGFnZXMpKSB7Cj4gKwkJcmV0ID0gUFRSX0VSUih4
ZW5fb2JqLT5wYWdlcyk7Cj4gKwkJeGVuX29iai0+cGFnZXMgPSBOVUxMOwo+ICsJCWdvdG8gZmFp
bDsKPiArCX0KPiArCj4gKwlyZXR1cm4geGVuX29iajsKPiArCj4gK2ZhaWw6Cj4gKwlEUk1fRVJS
T1IoIkZhaWxlZCB0byBhbGxvY2F0ZSBidWZmZXIgd2l0aCBzaXplICV6dVxuIiwgc2l6ZSk7Cj4g
KwlyZXR1cm4gRVJSX1BUUihyZXQpOwo+ICt9Cj4gKwo+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
