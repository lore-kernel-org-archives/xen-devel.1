From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] libxl: start pvqemu when 9pfs is requested
Date: Tue, 14 Aug 2018 15:13:09 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808141506480.15066@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pgrk=k5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fphYu-0005Xj-IW
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 22:13:12 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: ian.jackson@eu.citrix.com, sstabellini@kernel.org, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

UFYgOXBmcyByZXF1aXJlcyB0aGUgUFYgYmFja2VuZCBpbiBRRU1VLiBNYWtlIHN1cmUgdGhhdCBs
aWJ4bCBrbm93cyBpdC4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFu
b3NAeGlsaW54LmNvbT4KLS0tCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKaW5kZXggZmRkN2ZhMy4uNzBlOGIxNiAxMDA2NDQKLS0t
IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCkBA
IC0yNTk4LDcgKzI1OTgsNyBAQCBpbnQgbGlieGxfX25lZWRfeGVucHZfcWVtdShsaWJ4bF9fZ2Mg
KmdjLCBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZykKICAgICAgICAgZ290byBvdXQ7CiAg
ICAgfQogCi0gICAgaWYgKGRfY29uZmlnLT5udW1fdmZicyA+IDApIHsKKyAgICBpZiAoZF9jb25m
aWctPm51bV92ZmJzID4gMCB8fCBkX2NvbmZpZy0+bnVtX3A5cyA+IDApIHsKICAgICAgICAgcmV0
ID0gMTsKICAgICAgICAgZ290byBvdXQ7CiAgICAgfQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
