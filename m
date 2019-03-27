From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v2 2/2] xen-block: always report 'sectors' in
 terms of 512-byte units
Date: Wed, 27 Mar 2019 17:32:06 +0000
Message-ID: <20190327173206.9065-3-paul.durrant__22987.5949722313$1553708001$gmane$org@citrix.com>
References: <20190327173206.9065-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Og4D=R6=citrix.com=prvs=982dfca03=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h9CPN-00049O-El
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 17:32:13 +0000
In-Reply-To: <20190327173206.9065-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>, Paul Durrant <paul.durrant@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Max Reitz <mreitz@redhat.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIG1haWwgdGhyZWFkIGF0IFsxXSBjbGFyaWZpZXMgdGhhdCB0aGUgWGVuIGJsa2lmIHByb3Rv
Y29sIHJlcXVpcmVzIHRoYXQKJ3NlY3RvcnMnIHZhbHVlIHJlcG9ydGVkIGluIHhlbnN0b3JlIGlz
IHN0cmljdGx5IGluIHRlcm1zIG9mIDUxMi1ieXRlCnVuaXRzIGFuZCBpcyBub3QgZGVwZW5kZW50
IG9uIHRoZSBsb2dpY2FsIHNlY3RvciBzaXplIHJlcG9ydGVkIGluCidzZWN0b3Itc2l6ZScuCgpb
MV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8y
MDE5LTAzL21zZzAxNjAwLmh0bWwKClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgpDYzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+CkNjOiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPgpDYzogTWF4IFJlaXR6IDxtcmVp
dHpAcmVkaGF0LmNvbT4KLS0tCiBody9ibG9jay94ZW4tYmxvY2suYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2h3L2Js
b2NrL3hlbi1ibG9jay5jIGIvaHcvYmxvY2sveGVuLWJsb2NrLmMKaW5kZXggYTg0ODg0OWY0OC4u
NTdlOWRhN2UxYyAxMDA2NDQKLS0tIGEvaHcvYmxvY2sveGVuLWJsb2NrLmMKKysrIGIvaHcvYmxv
Y2sveGVuLWJsb2NrLmMKQEAgLTE0OSw3ICsxNDksNyBAQCBzdGF0aWMgdm9pZCB4ZW5fYmxvY2tf
c2V0X3NpemUoWGVuQmxvY2tEZXZpY2UgKmJsb2NrZGV2KQogICAgIGNvbnN0IGNoYXIgKnR5cGUg
PSBvYmplY3RfZ2V0X3R5cGVuYW1lKE9CSkVDVChibG9ja2RldikpOwogICAgIFhlbkJsb2NrVmRl
diAqdmRldiA9ICZibG9ja2Rldi0+cHJvcHMudmRldjsKICAgICBCbG9ja0NvbmYgKmNvbmYgPSAm
YmxvY2tkZXYtPnByb3BzLmNvbmY7Ci0gICAgaW50NjRfdCBzZWN0b3JzID0gYmxrX2dldGxlbmd0
aChjb25mLT5ibGspIC8gY29uZi0+bG9naWNhbF9ibG9ja19zaXplOworICAgIGludDY0X3Qgc2Vj
dG9ycyA9IGJsa19nZXRsZW5ndGgoY29uZi0+YmxrKSAvIFhFTl9CTEtJRl9TRUNUT1JfU0laRTsK
ICAgICBYZW5EZXZpY2UgKnhlbmRldiA9IFhFTl9ERVZJQ0UoYmxvY2tkZXYpOwogCiAgICAgdHJh
Y2VfeGVuX2Jsb2NrX3NpemUodHlwZSwgdmRldi0+ZGlzaywgdmRldi0+cGFydGl0aW9uLCBzZWN0
b3JzKTsKLS0gCjIuMjAuMS4yLmdiMjFlYmI2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
