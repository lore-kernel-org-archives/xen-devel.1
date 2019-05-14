From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 1/2] makefile: add support for *_defconfig
 targets
Date: Tue, 14 May 2019 18:45:56 +0000
Message-ID: <20190514184552.25100-1-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d43k=TO=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hQcR8-0006IX-2h
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 18:46:02 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrii Anisov <Andrii_Anisov@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
List-Id: xen-devel@lists.xenproject.org

RWFzZSB1cCBYRU4gY29uZmlndXJhdGlvbiBmb3Igbm9uLXN0YW5kYXJkIGJ1aWxkcywgbGlrZQph
cm12OCB0aW55IGNvbmZpZy4KClNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xv
ZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KLS0tCiBNYWtlZmlsZSAgICAgfCA0ICsrKysKIHhlbi9N
YWtlZmlsZSB8IDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggODI5YWM2Mzc0MS4uZWYxZWE0NGVmMSAx
MDA2NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTU0LDYgKzU0LDEwIEBAIGJ1
aWxkOiAkKFRBUkdTX0JVSUxEKQogYnVpbGQteGVuOgogCSQoTUFLRSkgLUMgeGVuIGJ1aWxkCiAK
Ky5QSE9OWTogJV9kZWZjb25maWcKKyVfZGVmY29uZmlnOgorCSQoTUFLRSkgLUMgeGVuICRACisK
IC5QSE9OWTogYnVpbGQtdG9vbHMKIGJ1aWxkLXRvb2xzOiBidWlsZC10b29scy1wdWJsaWMtaGVh
ZGVycwogCSQoTUFLRSkgLUMgdG9vbHMgYnVpbGQKZGlmZiAtLWdpdCBhL3hlbi9NYWtlZmlsZSBi
L3hlbi9NYWtlZmlsZQppbmRleCAxZmQ4YWQ1MTE2Li4zYzdlNDIzMTMyIDEwMDY0NAotLS0gYS94
ZW4vTWFrZWZpbGUKKysrIGIveGVuL01ha2VmaWxlCkBAIC0yNjksNiArMjY5LDkgQEAga2NvbmZp
ZyA6PSBzaWxlbnRvbGRjb25maWcgb2xkY29uZmlnIGNvbmZpZyBtZW51Y29uZmlnIGRlZmNvbmZp
ZyBcCiAkKGtjb25maWcpOgogCSQoTUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01h
a2VmaWxlLmtjb25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQo
SE9TVENDKSIgSE9TVENYWD0iJChIT1NUQ1hYKSIgJEAKIAorJV9kZWZjb25maWc6CisJJChNQUtF
KSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJD
SCkgU1JDQVJDSD0kKFNSQ0FSQ0gpIEhPU1RDQz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RD
WFgpIiAkQAorCiBpbmNsdWRlL2NvbmZpZy8lLmNvbmY6IGluY2x1ZGUvY29uZmlnL2F1dG8uY29u
Zi5jbWQgJChLQ09ORklHX0NPTkZJRykKIAkkKE1BS0UpIC1mICQoQkFTRURJUikvdG9vbHMva2Nv
bmZpZy9NYWtlZmlsZS5rY29uZmlnIEFSQ0g9JChBUkNIKSBTUkNBUkNIPSQoU1JDQVJDSCkgSE9T
VENDPSIkKEhPU1RDQykiIEhPU1RDWFg9IiQoSE9TVENYWCkiIHNpbGVudG9sZGNvbmZpZwogCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
