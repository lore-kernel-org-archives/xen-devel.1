From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/2] makefile: add support for *_defconfig
 targets
Date: Thu, 16 May 2019 13:37:46 +0000
Message-ID: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xJ8a=TQ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hRGZz-0007ro-1g
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:37:51 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

RWFzZSB1cCBYRU4gY29uZmlndXJhdGlvbiBmb3Igbm9uLXN0YW5kYXJkIGJ1aWxkcywgbGlrZQph
cm12OCB0aW55IGNvbmZpZy4KClNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xv
ZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KLS0tCiBDaGFuZ2VzIGZyb20gdjI6CiAtIHJlbW92ZSAl
X2RlZmNvbmZpZyBydWxlIGluIGZhdm9yIG9mIGxpc3Qgb2YgcmVhbCAqX2RlZmNvbmZpZyBmaWxl
cwoKIE1ha2VmaWxlICAgICB8IDQgKysrKwogeGVuL01ha2VmaWxlIHwgMiArLQogMiBmaWxlcyBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9NYWtl
ZmlsZSBiL01ha2VmaWxlCmluZGV4IDgyOWFjNjM3NDEuLmVmMWVhNDRlZjEgMTAwNjQ0Ci0tLSBh
L01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC01NCw2ICs1NCwxMCBAQCBidWlsZDogJChUQVJH
U19CVUlMRCkKIGJ1aWxkLXhlbjoKIAkkKE1BS0UpIC1DIHhlbiBidWlsZAogCisuUEhPTlk6ICVf
ZGVmY29uZmlnCislX2RlZmNvbmZpZzoKKwkkKE1BS0UpIC1DIHhlbiAkQAorCiAuUEhPTlk6IGJ1
aWxkLXRvb2xzCiBidWlsZC10b29sczogYnVpbGQtdG9vbHMtcHVibGljLWhlYWRlcnMKIAkkKE1B
S0UpIC1DIHRvb2xzIGJ1aWxkCmRpZmYgLS1naXQgYS94ZW4vTWFrZWZpbGUgYi94ZW4vTWFrZWZp
bGUKaW5kZXggMWZkOGFkNTExNi4uYzgwOTE0YzMxZCAxMDA2NDQKLS0tIGEveGVuL01ha2VmaWxl
CisrKyBiL3hlbi9NYWtlZmlsZQpAQCAtMjY0LDcgKzI2NCw3IEBAICQoZm9yZWFjaCBiYXNlLGFy
Y2gveDg2L21tL2d1ZXN0X3dhbGtfJSBcCiAKIGtjb25maWcgOj0gc2lsZW50b2xkY29uZmlnIG9s
ZGNvbmZpZyBjb25maWcgbWVudWNvbmZpZyBkZWZjb25maWcgXAogCW5jb25maWcgeGNvbmZpZyBn
Y29uZmlnIHNhdmVkZWZjb25maWcgbGlzdG5ld2NvbmZpZyBvbGRkZWZjb25maWcgXAotCXJhbmRj
b25maWcKKwlyYW5kY29uZmlnICQobm90ZGlyICQod2lsZGNhcmQgYXJjaC8kKFNSQ0FSQ0gpL2Nv
bmZpZ3MvKl9kZWZjb25maWcpKQogLlBIT05ZOiAkKGtjb25maWcpCiAkKGtjb25maWcpOgogCSQo
TUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcgQVJDSD0k
KEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVENDKSIgSE9TVENYWD0iJChI
T1NUQ1hYKSIgJEAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
