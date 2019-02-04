From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 2/4] configure: Don't add Xen's libs to LDFLAGS
Date: Mon, 4 Feb 2019 11:28:01 +0000
Message-ID: <20190204112803.11645-3-anthony.perard@citrix.com>
References: <20190204112803.11645-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rRnF=QL=citrix.com=prvs=9310878b0=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gqcQL-00049H-1D
 for xen-devel@lists.xenproject.org; Mon, 04 Feb 2019 11:28:25 +0000
In-Reply-To: <20190204112803.11645-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBYZW4gaXMgZGV0ZWN0ZWQgdmlhIHBrZy1jb25maWcsIGl0IGlzbid0IG5lY2Vzc2FyeSB0
byBtb2RpZnkKTERGTEFHUyBhcyBtb2RpZnlpbmcgbGlic19zb2Z0bW11IGlzIGVub3VnaC4KClJl
cG9ydGVkLWJ5OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+ClNpZ25l
ZC1vZmYtYnk6IE1pY2hhZWwgVG9rYXJldiA8bWp0QHRscy5tc2sucnU+ClNpZ25lZC1vZmYtYnk6
IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpSZXZpZXdlZC1ieTog
UGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogTWlj
aGFlbCBUb2thcmV2IDxtanRAdGxzLm1zay5ydT4KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBjb25maWd1cmUgfCAxIC0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIvY29uZmln
dXJlCmluZGV4IGNhMTk4NjEyNWQuLjNkODk4NzBkOTkgMTAwNzU1Ci0tLSBhL2NvbmZpZ3VyZQor
KysgYi9jb25maWd1cmUKQEAgLTIzNTksNyArMjM1OSw2IEBAIGlmIHRlc3QgIiR4ZW4iICE9ICJu
byIgOyB0aGVuCiAgICAgZmkKICAgICBRRU1VX0NGTEFHUz0iJFFFTVVfQ0ZMQUdTICQoJHBrZ19j
b25maWcgLS1jZmxhZ3MgJHhlbl9wYykiCiAgICAgbGlic19zb2Z0bW11PSIkKCRwa2dfY29uZmln
IC0tbGlicyAkeGVuX3BjKSAkbGlic19zb2Z0bW11IgotICAgIExERkxBR1M9IiQoJHBrZ19jb25m
aWcgLS1saWJzICR4ZW5fcGMpICRMREZMQUdTIgogICBlbHNlCiAKICAgICB4ZW5fbGlicz0iLWx4
ZW5zdG9yZSAtbHhlbmN0cmwgLWx4ZW5ndWVzdCIKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
