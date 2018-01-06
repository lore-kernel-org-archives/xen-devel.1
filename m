From: Anthony Liguori <aliguori@amzn.com>
Subject: [PATCH 14/22] vixen: forward
	VCPUOP_register_runstate_memory_area to outer Xen
Date: Sat, 6 Jan 2018 14:54:29 -0800
Message-ID: <1515279277-16301-15-git-send-email-aliguori@amzn.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fck6=eb=amzn.com=prvs=537d23ce5=aliguori@srs-us1.protection.inumbo.net>)
 id 1eXxNV-0006Tg-1X
 for xen-devel@lists.xenproject.org; Sat, 06 Jan 2018 22:55:49 +0000
In-Reply-To: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Jan=20H=2E=20Sch=C3=B6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW50aG9ueSBMaWd1b3JpIDxhbGlndW9yaUBhbWF6b24uY29tPgoKVGhpcyBhbGxvd3Mg
Zm9yIHByb3BlciBhY2NvdW50aW5nIG9mIHN0ZWFsIHRpbWUgd2l0aGluIHRoZSBndWVzdC4KClNp
Z25lZC1vZmYtYnk6IEFudGhvbnkgTGlndW9yaSA8YWxpZ3VvcmlAYW1hem9uLmNvbT4KLS0tCiB4
ZW4vY29tbW9uL2RvbWFpbi5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21h
aW4uYwppbmRleCBlZGUzNzdjLi43ODBmOGZmIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2RvbWFp
bi5jCisrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKQEAgLTE0MTQsNiArMTQxNCwxMiBAQCBsb25n
IGRvX3ZjcHVfb3AoaW50IGNtZCwgdW5zaWduZWQgaW50IHZjcHVpZCwgWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSh2b2lkKSBhcmcpCiAgICAgICAgIGlmICggIWd1ZXN0X2hhbmRsZV9va2F5KGFyZWEu
YWRkci5oLCAxKSApCiAgICAgICAgICAgICBicmVhazsKIAorICAgICAgICBpZiAoIGlzX3ZpeGVu
KCkgKSB7CisgICAgICAgICAgICByYyA9IEhZUEVSVklTT1JfdmNwdV9vcChWQ1BVT1BfcmVnaXN0
ZXJfcnVuc3RhdGVfbWVtb3J5X2FyZWEsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2Y3B1aWQsICZhcmVhKTsKKyAgICAgICAgICAgIGJyZWFrOworICAgICAgICB9CisKICAg
ICAgICAgcmMgPSAwOwogICAgICAgICBydW5zdGF0ZV9ndWVzdCh2KSA9IGFyZWEuYWRkci5oOwog
Ci0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
