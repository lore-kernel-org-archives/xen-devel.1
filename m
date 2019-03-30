From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v4 09/15] x86/iommu: Add Hygon Dhyana support
Date: Sat, 30 Mar 2019 18:44:00 +0800
Message-ID: <d910bd2ba1b850ad2c0c537786b432726c760a02.1553935727.git.puwen@hygon.cn>
References: <cover.1553935727.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FjNl=SB=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hABW0-0004yP-31
 for xen-devel@lists.xenproject.org; Sat, 30 Mar 2019 10:47:08 +0000
In-Reply-To: <cover.1553935727.git.puwen@hygon.cn>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Pu Wen <puwen@hygon.cn>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIElPTU1VIGFyY2hpdGVjdHVyZSBmb3IgdGhlIEh5Z29uIERoeWFuYSBDUFUgaXMgc2ltaWxh
ciB0byB0aGUgQU1ECmZhbWlseSAxN2ggb25lLiBTbyBhZGQgSHlnb24gRGh5YW5hIHN1cHBvcnQg
dG8gaXQgYnkgc2hhcmluZyB0aGUgY29kZQpwYXRoIG9mIEFNRC4KClNpZ25lZC1vZmYtYnk6IFB1
IFdlbiA8cHV3ZW5AaHlnb24uY24+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oIHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2lv
bW11LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11LmgKaW5kZXggOGRjMzkyNC4uNjk5YThm
NyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oCisrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvaW9tbXUuaApAQCAtNzQsNiArNzQsNyBAQCBzdGF0aWMgaW5saW5lIGludCBp
b21tdV9oYXJkd2FyZV9zZXR1cCh2b2lkKQogICAgIGNhc2UgWDg2X1ZFTkRPUl9JTlRFTDoKICAg
ICAgICAgcmV0dXJuIGludGVsX3Z0ZF9zZXR1cCgpOwogICAgIGNhc2UgWDg2X1ZFTkRPUl9BTUQ6
CisgICAgY2FzZSBYODZfVkVORE9SX0hZR09OOgogICAgICAgICByZXR1cm4gYW1kX2lvdl9kZXRl
Y3QoKTsKICAgICB9CiAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
