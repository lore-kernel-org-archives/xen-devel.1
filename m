From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] ts-xen-build: Force reliance on ipxe
 tarball
Date: Mon, 5 Nov 2018 18:35:54 +0000
Message-ID: <20181105183554.28889-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ylya=nq=citrix.com=prvs=8406b12ba=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gJjjQ-0003XM-QF
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 18:36:12 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

eGVuLmdpdC90b29scy9maXJtd2FyZS9ldGhlcmJvb3QvTWFrZWZpbGUgdHJpZXMgdG8gZ2V0IGEg
dGFyYmFsbCBmcm9tCnhlbi1leHRmaWxlcyBmaXJzdCBhbmQgaWYgdGhhdCBmYWlscywgdHJpZXMg
Y2xvbmluZyBmcm9tIGlweGUub3JnLgoKaXB4ZS5vcmcgaXMgc29tZXRpbWVzIGRvd24gKG9yIGhh
bGYtZG93bikgYW5kIHdoZW4gdGhhdCBoYXBwZW5zCndpdGhvdXQgYSB0YXJiYWxsIHRoZSBidWls
ZCBicmVha3MgYW5kIGlzIGhhcmQgdG8gZml4LgoKV2Ugd291bGQgbGlrZSwgdGhlcmVmb3JlLCB0
byBlbnN1cmUgdGhhdCB0aGUgdGFyYmFsbCBpcyBhbHdheXMgbWFkZQpiZWZvcmUgdGhlIGNvbW1p
dCB3aGljaCByZWZlcnMgdG8gaXQgaXMgaW4geGVuLmdpdCNtYXN0ZXIuCgpvc3N0ZXN0IGhhcyBu
byBrbm93bGVkZ2Ugb2YgaXB4ZSBhcyBhIHNlcGFyYXRlIHRoaW5nIGFuZCBqdXN0IGxldHMKeGVu
LmdpdCBoYXZlIHdoYXRldmVyIHZlcnNpb24gaXMgaW4gQ29uZmlnLm1rLiAgU28gb3NzdGVzdCBu
ZXZlciBuZWVkcwp0byBzcGVjaWZ5IHBhcnRpY3VsYXIgaXB4ZSB2ZXJzaW9uIGJ5IGhhc2gsIG9y
IHRoZSBsaWtlLgoKU28gc2ltcGx5IG1ha2Ugb3NzdGVzdCByZWx5IG9uIHRoZSB0YXJiYWxsIGV4
aXN0aW5nLCBieSBoYXZpbmcgaXQKc3BlY2lmeSBhIGNvbXBsZXRlbHkgaW52YWxpZCBVUkwgZm9y
IHRoZSBnaXQgY2xvbmUuICBUaGlzIHdpbGwgZGV0ZWN0CmF0dGVtcHRzIHRvIHVwZGF0ZSBJUFhF
X0dJVF9UQUcgd2l0aG91dCBtYWtpbmcgYSBjb3JyZXNwb25kaW5nCnRhcmJhbGwuCgpDQzogUGF1
bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Ci0tLQogdHMteGVuLWJ1aWxkIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS90cy14ZW4tYnVpbGQgYi90cy14ZW4tYnVpbGQKaW5k
ZXggNDhiZjA2MmYuLjZkZGZjNTMzIDEwMDc1NQotLS0gYS90cy14ZW4tYnVpbGQKKysrIGIvdHMt
eGVuLWJ1aWxkCkBAIC05NSw2ICs5NSw3IEBAIHN1YiBjaGVja291dCAoKSB7CiAJZWNobyA+Pi5j
b25maWcgZGVidWc9JGRlYnVnX2J1aWxkCiAJZWNobyA+Pi5jb25maWcgR0lUX0hUVFA9eQogCWVj
aG8gPj4uY29uZmlnIExJQkxFQUZESVJfeDg2XzY0PWxpYgorCWVjaG8gPj4uY29uZmlnIElQWEVf
R0lUX1VSTD1maWxlOi8vLy9vc3N0ZXN0L0lQWEUtR0lULUZPUkJJRERFTgogCWVjaG8gPj4uY29u
ZmlnIEtFUk5FTFM9JycKIEVORAogICAgICAgICAgICAgICAgKCR7ZW5hYmxlX2xpdmVwYXRjaH0g
PyA8PEVORCA6ICcnKS4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
