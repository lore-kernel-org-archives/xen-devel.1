From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 6/7] drm/xen: Don't set the dpms hook
Date: Mon, 10 Dec 2018 12:12:05 +0200
Message-ID: <ea26da4d-6940-1f47-1e96-cccf1b4d4f4e__26251.5249233276$1544436650$gmane$org@gmail.com>
References: <20181210100359.22507-1-daniel.vetter@ffwll.ch>
 <20181210100359.22507-7-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181210100359.22507-7-daniel.vetter@ffwll.ch>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, xen-devel@lists.xen.org, DRI Development <dri-devel@lists.freedesktop.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMTggMTI6MDMgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gRG9lc24ndCBkbyBh
bnl0aGluZyBmb3IgYXRvbWljLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVr
c2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbi5v
cmcKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9jb25uLmMgfCAx
IC0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2Nvbm4uYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZW4veGVuX2RybV9mcm9udF9jb25uLmMKPiBpbmRleCBjOTFhZTUzMmZhNTUuLjU0YWYyNjY5YjFi
MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfY29ubi5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2Nvbm4uYwo+IEBAIC04
OSw3ICs4OSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVu
Y3MgY29ubmVjdG9yX2hlbHBlcl9mdW5jcyA9IHsKPiAgIH07Cj4gICAKPiAgIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBjb25uZWN0b3JfZnVuY3MgPSB7Cj4gLQkuZHBt
cyA9IGRybV9oZWxwZXJfY29ubmVjdG9yX2RwbXMsCj4gICAJLmZpbGxfbW9kZXMgPSBkcm1faGVs
cGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMsCj4gICAJLmRlc3Ryb3kgPSBkcm1fY29u
bmVjdG9yX2NsZWFudXAsCj4gICAJLnJlc2V0ID0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9y
X3Jlc2V0LAoKUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KClRoYW5rIHlvdSwKCk9sZWtzYW5kcgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
