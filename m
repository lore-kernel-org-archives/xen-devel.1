From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: [PATCH 1/2] dmar: iommu mem leak fix
Date: Sun, 19 Aug 2018 20:32:11 -0700 (PDT)
Message-ID: <b54e1bda-f2ec-46f1-b54a-06483282e0d6@default>
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
Cc: Andrew Cooper3 <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, JBeulich <JBeulich@suse.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>
List-Id: xen-devel@lists.xenproject.org

UmVsZWFzZSBtZW1vcnkgYWxsb2NhdGVkIGZvciBkcmhkIGlvbW11IGluIGVycm9yIHBhdGguCgpT
aWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4K
LS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jIHwgICAgMSArCiAxIGZpbGVz
IGNoYW5nZWQsIDEgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2RtYXIuYwppbmRleCA0NmRlY2Q0Li44YzVmYTgwIDEwMDY0NAotLS0gYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3Z0ZC9kbWFyLmMKQEAgLTEwMCw2ICsxMDAsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZGlzYWJs
ZV9hbGxfZG1hcl91bml0cyh2b2lkKQogICAgIHsKICAgICAgICAgbGlzdF9kZWwoJmRyaGQtPmxp
c3QpOwogICAgICAgICBzY29wZV9kZXZpY2VzX2ZyZWUoJmRyaGQtPnNjb3BlKTsKKyAgICAgICAg
aW9tbXVfZnJlZShkcmhkLT5pb21tdSk7CiAgICAgICAgIHhmcmVlKGRyaGQpOwogICAgIH0KICAg
ICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUgKCBybXJyLCBfcm1yciwgJmFjcGlfcm1ycl91bml0
cywgbGlzdCApCi0tIAoxLjcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
