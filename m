From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/3] Some cleanup of device_add_domain_config
Date: Fri, 5 Apr 2019 18:58:08 +0100
Message-ID: <20190405175811.7446-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8q43=SH=citrix.com=prvs=991ec766c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hCT6i-0000gk-PW
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 17:58:28 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RG9jdW1lbnRhdGlvbiBvZiBkZXZpY2VfYWRkX2RvbWFpbl9jb25maWcgYW5kIGNvbnN0aWZ5IGBz
cmMnLgoKQW50aG9ueSBQRVJBUkQgKDMpOgogIGxpYnhsOiBDb25zdGlmeSBsaWJ4bF9kZXZpY2Vf
Kl9jb21wYXJlIGZ1bmN0aW9ucwogIGxpYnhsOiBDb25zdGlmeSBzcmMgb2YgZGV2aWNlX2NvbXBh
cmVfZm5fdAogIGxpYnhsOiBEb2N1bWVudCBkZXZpY2VfYWRkX2RvbWFpbl9jb25maWcKCiB0b29s
cy9saWJ4bC9saWJ4bF9kZXZpY2UuYyAgIHwgIDYgKysrLS0tCiB0b29scy9saWJ4bC9saWJ4bF9k
aXNrLmMgICAgIHwgIDQgKystLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8IDE5ICsr
KysrKysrKysrKysrKystLS0KIHRvb2xzL2xpYnhsL2xpYnhsX25pYy5jICAgICAgfCAgNCArKy0t
CiB0b29scy9saWJ4bC9saWJ4bF9wY2kuYyAgICAgIHwgIDQgKystLQogdG9vbHMvbGlieGwvbGli
eGxfdXNiLmMgICAgICB8ICA4ICsrKystLS0tCiB0b29scy9saWJ4bC9saWJ4bF92ZGlzcGwuYyAg
IHwgIDQgKystLQogdG9vbHMvbGlieGwvbGlieGxfdnNuZC5jICAgICB8ICA0ICsrLS0KIHRvb2xz
L2xpYnhsL2xpYnhsX3Z0cG0uYyAgICAgfCAgNCArKy0tCiA5IGZpbGVzIGNoYW5nZWQsIDM1IGlu
c2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
