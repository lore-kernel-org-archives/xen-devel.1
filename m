From: Pu Wen <puwen@hygon.cn>
Subject: [PATCH 08/15] x86/iommu: Add Hygon Dhyana support
Date: Thu, 20 Dec 2018 21:14:49 +0800
Message-ID: <46e3e90d049a85c9bb1ac979225a7abf0d9d1719.1545284932.git.puwen@hygon.cn>
References: <cover.1545284932.git.puwen@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VrHp=O5=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gZyAX-0002Ds-T6
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 13:15:17 +0000
In-Reply-To: <cover.1545284932.git.puwen@hygon.cn>
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
OGRjMzkyNC4uMDA0MjE1OSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaApAQCAtNzMsNiArNzMsNyBAQCBzdGF0
aWMgaW5saW5lIGludCBpb21tdV9oYXJkd2FyZV9zZXR1cCh2b2lkKQogICAgIHsKICAgICBjYXNl
IFg4Nl9WRU5ET1JfSU5URUw6CiAgICAgICAgIHJldHVybiBpbnRlbF92dGRfc2V0dXAoKTsKKyAg
ICBjYXNlIFg4Nl9WRU5ET1JfSFlHT046CiAgICAgY2FzZSBYODZfVkVORE9SX0FNRDoKICAgICAg
ICAgcmV0dXJuIGFtZF9pb3ZfZGV0ZWN0KCk7CiAgICAgfQotLSAKMi43LjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
