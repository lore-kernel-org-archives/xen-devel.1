From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 11/15] cross builds: ts-kernel-build:
 Support cross target armhf
Date: Fri, 26 Apr 2019 17:39:58 +0100
Message-ID: <20190426164002.22381-12-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3us-0008GY-NE
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:38 +0000
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkND
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDQzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLS0KIHRzLWtlcm5lbC1idWlsZCB8IDE5ICsr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdHMta2VybmVsLWJ1aWxkIGIvdHMta2VybmVsLWJ1aWxk
CmluZGV4IDcyY2E5OGExLi4yOWM2YzQzZCAxMDA3NTUKLS0tIGEvdHMta2VybmVsLWJ1aWxkCisr
KyBiL3RzLWtlcm5lbC1idWlsZApAQCAtMjEsNiArMjEsNyBAQCBCRUdJTiB7IHVuc2hpZnQgQElO
QywgcXcoLik7IH0KIHVzZSBPc3N0ZXN0OwogdXNlIE9zc3Rlc3Q6OlRlc3RTdXBwb3J0OwogdXNl
IE9zc3Rlc3Q6OkJ1aWxkU3VwcG9ydDsKK3VzZSBDYXJwOwogCiB0c3JlYWRjb25maWcoKTsKIApA
QCAtNDgsOSArNDksMjQgQEAgbXkgJHBhcm1zID0gJGFyY2hwYXJtcy0+eyAkcnthcmNofSB9Owog
CiBzdWIgZW5hYmxlX3hlbl9jb25maWcgKCk7CiAKK291ciAkYXJjaF9lbnZ2YXJzID0gJyc7CisK
IHN1YiBjbWQgKCQkKSB7CiAgICAgbXkgKCR0aW1lb3V0LCAkc2NyaXB0KSA9IEBfOwotICAgIHRh
cmdldF9jbWRfYnVpbGQoJGhvLCAkdGltZW91dCwgJGJ1aWxkZGlyLCAkc2NyaXB0KTsKKyAgICB0
YXJnZXRfY21kX2J1aWxkKCRobywgJHRpbWVvdXQsICRidWlsZGRpciwgJGFyY2hfZW52dmFycy4k
c2NyaXB0KTsKK30KKworc3ViIGNoZWNrYXJjaCAoKSB7CisgICAgcmV0dXJuIGlmICRye2FyY2h9
IGVxICRoby0+e0FyY2h9OworICAgIG15ICRjYyA9ICdnY2MnOworICAgIGlmICgkcnthcmNofSBl
cSAnYXJtaGYnKSB7CisJdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhvLCAiY3Jvc3NidWlsZC1l
c3NlbnRpYWwtJHJ7YXJjaH0iKTsKKwkkYXJjaF9lbnZ2YXJzID0gPDxFTkQ7CisgICAgZXhwb3J0
IEFSQ0g9YXJtIEhPU1RDQz0kY2MgQ1JPU1NfQ09NUElMRT1hcm0tbGludXgtZ251ZWFiaWhmLQor
RU5ECisgICAgfSBlbHNlIHsKKwljb25mZXNzICJ1bmtub3duIGNyb3NzIHRhcmdldCAoZ251ICdo
b3N0JykgJHJ7YXJjaH0iOworICAgIH0KIH0KIAogc3ViIGNoZWNrb3V0ICgpIHsKQEAgLTQ1MCw2
ICs0NjYsNyBAQCBzdWIgZndpbnN0YWxsICgpIHsKIEVORAogfQogCitjaGVja2FyY2goKTsKIGNo
ZWNrb3V0KCk7CiBjb25maWcoKTsKIGJ1aWxkKCk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
