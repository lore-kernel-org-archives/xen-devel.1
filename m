From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH v2 08/14] x86/iommu: Add Hygon Dhyana support
Date: Thu, 21 Feb 2019 17:52:28 +0800
Message-ID: <76d99cb5bf0a9ed7c62208f92451e9d6f388c43b.1550647742.git.puwen@hygon.cn>
References: <cover.1550647742.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hIO5=Q4=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gwl46-0002Bq-PP
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 09:54:50 +0000
In-Reply-To: <cover.1550647742.git.puwen@hygon.cn>
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
IFdlbiA8cHV3ZW5AaHlnb24uY24+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9hc20teDg2L2lvbW11LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11LmgKaW5kZXgg
OGRjMzkyNC4uNjk5YThmNyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaApAQCAtNzQsNiArNzQsNyBAQCBzdGF0
aWMgaW5saW5lIGludCBpb21tdV9oYXJkd2FyZV9zZXR1cCh2b2lkKQogICAgIGNhc2UgWDg2X1ZF
TkRPUl9JTlRFTDoKICAgICAgICAgcmV0dXJuIGludGVsX3Z0ZF9zZXR1cCgpOwogICAgIGNhc2Ug
WDg2X1ZFTkRPUl9BTUQ6CisgICAgY2FzZSBYODZfVkVORE9SX0hZR09OOgogICAgICAgICByZXR1
cm4gYW1kX2lvdl9kZXRlY3QoKTsKICAgICB9CiAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
