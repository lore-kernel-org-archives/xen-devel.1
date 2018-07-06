From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] armhf, xsm: Drop XSM tests on 32-bit ARM
Date: Fri, 6 Jul 2018 12:07:45 +0100
Message-ID: <1530875265-19873-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4trt=jw=citrix.com=prvs=718f97a87=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fbOax-0007r5-Rs
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 11:08:11 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@linaro.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgYXJlIGF0IHRoZSBsaW1pdCBvZiBBUk0gY2FwYWNpdHksIHdoaWNoIGhhcyBub3Qga2VwdCBw
YWNlIHdpdGggWDg2CmV4cGFuc2lvbi4gIE5ldyBoYXJkd2FyZSBpcyBvbiB0aGUgd2F5IGJ1dCBp
dCBpcyBub3QgaGVyZSB5ZXQuCgpEcm9wcGluZyB0aGUgWFNNIHRlc3RzIGRyb3BzIG9uZSB0ZXN0
LCBidXQgYWxzbyBvbmUgYnVpbGQsIHdoaWNoIHNhdmVzCmNvbnNpZGVyYWJsZSBlZmZvcnQuICBC
dWlsZHMgYXJlIGN1cnJlbnRseSB0aGUgYm90dGxlbmVjaywgYmVjYXVzZSB3ZQphdm9pZCBidWls
ZGluZyBvbiB0aGUgdW5yZWxpYWJsZSBBcm5kYWxlIGJvYXJkcy4KCkNDOiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFu
LkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBtZmktY29tbW9uIHwgNyArKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
bWZpLWNvbW1vbiBiL21maS1jb21tb24KaW5kZXggYTczYjEzOC4uMDFhYjVkMSAxMDA2NDQKLS0t
IGEvbWZpLWNvbW1vbgorKysgYi9tZmktY29tbW9uCkBAIC02NCw3ICs2NCwxMiBAQCB4c21fdmFy
aWFudHMgKCkgewogICAgIHhlbi00LjMtdGVzdGluZykgZWNobyAiZmFsc2UiOzsKICAgICB4ZW4t
NC40LXRlc3RpbmcpIGVjaG8gImZhbHNlIjs7CiAgICAgeGVuLTQuNS10ZXN0aW5nKSBlY2hvICJm
YWxzZSI7OwotICAgICopIGVjaG8gImZhbHNlIHRydWUiOworICAgICopCisgICAgICBjYXNlICIk
YXJjaCIgaW4KKyAgICAgICAgYXJtaGYpIGVjaG8gJ2ZhbHNlJyA7OworICAgICAgICAqKQorICAg
ICAgICAgIGVjaG8gImZhbHNlIHRydWUiOzsKKyAgICAgIGVzYWMKICAgICBlc2FjCiB9CiAKLS0g
CjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
