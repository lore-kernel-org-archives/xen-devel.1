From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: [PATCH v2 1/2] dmar: iommu mem leak fix
Date: Mon, 20 Aug 2018 03:42:41 -0700 (PDT)
Message-ID: <9b6a4488-c69a-48fa-88c1-131894b70b36@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-Devel <xen-devel@lists.xen.org>
Cc: kevin.tian@intel.com, andrew.cooper3@citrix.com, srinivas.eeda@oracle.com, JBeulich@suse.com, shane.wang@intel.com, boris.ostrovsky@oracle.com, gang.wei@intel.com
List-Id: xen-devel@lists.xenproject.org

UmVsZWFzZSBtZW1vcnkgYWxsb2NhdGVkIGZvciBkcmhkIGlvbW11IGluIGVycm9yIHBhdGguCgot
djI6IGZpeHVwIHdyb25nIHBhcmFtZXRlciBoaWRlbiBkdWUgdG8gbXkgcmVtb3ZpbmcgLVdlcnJv
cgoKU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5kdWFuQG9yYWNsZS5j
b20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYyB8ICAgIDEgKwogMSBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3Z0ZC9kbWFyLmMKaW5kZXggNDZkZWNkNC4uOGM1ZmE4MCAxMDA2NDQKLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvZG1hci5jCkBAIC0xMDAsNiArMTAwLDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGRp
c2FibGVfYWxsX2RtYXJfdW5pdHModm9pZCkKICAgICB7CiAgICAgICAgIGxpc3RfZGVsKCZkcmhk
LT5saXN0KTsKICAgICAgICAgc2NvcGVfZGV2aWNlc19mcmVlKCZkcmhkLT5zY29wZSk7CisgICAg
ICAgIGlvbW11X2ZyZWUoZHJoZCk7CiAgICAgICAgIHhmcmVlKGRyaGQpOwogICAgIH0KICAgICBs
aXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUgKCBybXJyLCBfcm1yciwgJmFjcGlfcm1ycl91bml0cywg
bGlzdCApCi0tIAoxLjcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
