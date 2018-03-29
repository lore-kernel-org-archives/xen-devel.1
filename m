From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] drm/xen-front: display_mode_valid() can be
 static
Date: Thu, 29 Mar 2018 15:39:36 +0800
Message-ID: <20180329073936.GA84198__49306.0822519057$1522309184$gmane$org@lkp-sb04>
References: <1522219661-26827-3-git-send-email-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dud5=gt=intel.com=fengguang.wu@srs-us1.protection.inumbo.net>)
 id 1f1SAm-00081h-Fs
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 07:40:36 +0000
Content-Disposition: inline
In-Reply-To: <1522219661-26827-3-git-send-email-andr2000@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Cc: jgross@suse.com, airlied@linux.ie, gustavo@padovan.org, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, andr2000@gmail.com, seanpaul@chromium.org, kbuild-all@01.org, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

CkZpeGVzOiBkN2Y0MDRjOGI0YjYgKCJkcm0veGVuLWZyb250OiBBZGQgc3VwcG9ydCBmb3IgWGVu
IFBWIGRpc3BsYXkgZnJvbnRlbmQiKQpTaWduZWQtb2ZmLWJ5OiBGZW5nZ3VhbmcgV3UgPGZlbmdn
dWFuZy53dUBpbnRlbC5jb20+Ci0tLQogeGVuX2RybV9mcm9udF9rbXMuYyB8ICAgIDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZW4veGVuX2RybV9mcm9udF9rbXMuYwppbmRleCA1NDUwNDlkLi5iZDY3NmJlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jCkBAIC0yNzMsNyArMjczLDcgQEAgc3Rh
dGljIHZvaWQgZGlzcGxheV91cGRhdGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpw
aXBlLAogCWRybV9kZXZfZXhpdChpZHgpOwogfQogCi1lbnVtIGRybV9tb2RlX3N0YXR1cyBkaXNw
bGF5X21vZGVfdmFsaWQoc3RydWN0IGRybV9jcnRjICpjcnRjLAorc3RhdGljIGVudW0gZHJtX21v
ZGVfc3RhdHVzIGRpc3BsYXlfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJCWNv
bnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQogewogCXN0cnVjdCB4ZW5fZHJtX2Zy
b250X2RybV9waXBlbGluZSAqcGlwZWxpbmUgPQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
