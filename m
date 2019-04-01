From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 1/4] pygrub: fix message in grub parser
Date: Mon, 1 Apr 2019 11:32:35 +0100
Message-ID: <20190401103238.15649-2-wei.liu2@citrix.com>
References: <20190401103238.15649-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZqZs=SD=citrix.com=prvs=987e11b64=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hAuFL-0008JQ-1M
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 10:32:55 +0000
In-Reply-To: <20190401103238.15649-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, m.a.young@durham.ac.uk
List-Id: xen-devel@lists.xenproject.org

VGhlIGNvZGUgc3VnZ2VzdHMgMCBpcyBhbGxvd2VkLiBaZXJvIGlzIG5vdCBhIHBvc2l0aXZlIG51
bWJlci4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpC
YWNrcG9ydCBjYW5kYWRpYXRlLgotLS0KIHRvb2xzL3B5Z3J1Yi9zcmMvR3J1YkNvbmYucHkgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS90b29scy9weWdydWIvc3JjL0dydWJDb25mLnB5IGIvdG9vbHMvcHlncnViL3NyYy9H
cnViQ29uZi5weQppbmRleCBmOGQzNzk5ZGMwLi4wMjA0ZDQxMGFjIDEwMDY0NAotLS0gYS90b29s
cy9weWdydWIvc3JjL0dydWJDb25mLnB5CisrKyBiL3Rvb2xzL3B5Z3J1Yi9zcmMvR3J1YkNvbmYu
cHkKQEAgLTIzNiw3ICsyMzYsNyBAQCBjbGFzcyBfR3J1YkNvbmZpZ0ZpbGUob2JqZWN0KToKICAg
ICAgICAgICAgIHNlbGYuX2RlZmF1bHQgPSB2YWwKIAogICAgICAgICBpZiBzZWxmLl9kZWZhdWx0
IDwgMDoKLSAgICAgICAgICAgIHJhaXNlIFZhbHVlRXJyb3IoImRlZmF1bHQgbXVzdCBiZSBwb3Np
dGl2ZSBudW1iZXIiKQorICAgICAgICAgICAgcmFpc2UgVmFsdWVFcnJvcigiZGVmYXVsdCBtdXN0
IGJlIG5vbi1uZWdhdGl2ZSBudW1iZXIiKQogICAgIGRlZmF1bHQgPSBwcm9wZXJ0eShfZ2V0X2Rl
ZmF1bHQsIF9zZXRfZGVmYXVsdCkKIAogICAgIGRlZiBzZXRfc3BsYXNoKHNlbGYsIHZhbCk6Ci0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
