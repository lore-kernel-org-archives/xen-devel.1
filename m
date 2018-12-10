From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 6/7] drm/xen: Don't set the dpms hook
Date: Mon, 10 Dec 2018 11:03:58 +0100
Message-ID: <20181210100359.22507-7-daniel.vetter__34442.2157890678$1544436197$gmane$org@ffwll.ch>
References: <20181210100359.22507-1-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181210100359.22507-1-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, xen-devel@lists.xen.org, DRI Development <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-Id: xen-devel@lists.xenproject.org

RG9lc24ndCBkbyBhbnl0aGluZyBmb3IgYXRvbWljLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVuLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9jb25uLmMgfCAx
IC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2Nvbm4uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVu
X2RybV9mcm9udF9jb25uLmMKaW5kZXggYzkxYWU1MzJmYTU1Li41NGFmMjY2OWIxYjMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9jb25uLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2Nvbm4uYwpAQCAtODksNyArODksNiBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIGNvbm5lY3Rvcl9o
ZWxwZXJfZnVuY3MgPSB7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3Jf
ZnVuY3MgY29ubmVjdG9yX2Z1bmNzID0gewotCS5kcG1zID0gZHJtX2hlbHBlcl9jb25uZWN0b3Jf
ZHBtcywKIAkuZmlsbF9tb2RlcyA9IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9t
b2RlcywKIAkuZGVzdHJveSA9IGRybV9jb25uZWN0b3JfY2xlYW51cCwKIAkucmVzZXQgPSBkcm1f
YXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQsCi0tIAoyLjIwLjAucmMxCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
