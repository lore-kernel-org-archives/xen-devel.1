From: mjaggi@caviumnetworks.com
Subject: [PATCH resend 07/13] arm: Adding ACPI_IORT in arm
	Kconfig
Date: Tue, 13 Mar 2018 20:50:13 +0530
Message-ID: <c44b28142d6f626dd99bfd22aed879c2587f2aba.1520834718.git.mjaggi@caviumnetworks.com>
References: <cover.1520834718.git.mjaggi@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=f3c3=gd=cavium.com=manish.jaggi@srs-us1.protection.inumbo.net>)
 id 1evljx-0006br-4b
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 15:21:25 +0000
In-Reply-To: <cover.1520834718.git.mjaggi@caviumnetworks.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: manish.jaggi@linaro.org, julien.grall@arm.com, xen-devel@lists.xenproject.org, sameer.goel@linaro.org, jgross@suse.com, sstabellini@kernel.org
Cc: Manish Jaggi <mjaggi@caviumnetworks.com>, manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTWFuaXNoIEphZ2dpIDxtamFnZ2lAY2F2aXVtbmV0d29ya3MuY29tPgoKU2lnbmVkLW9m
Zi1ieTogTWFuaXNoIEphZ2dpIDxtYW5pc2guamFnZ2lAbGluYXJvLm9yZz4KLS0tCiB4ZW4vYXJj
aC9hcm0vS2NvbmZpZyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9LY29uZmlnIGIveGVuL2FyY2gvYXJtL0tjb25maWcK
aW5kZXggMjc4MmVlNjU4OS4uZDNmYmNiY2M2ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL0tj
b25maWcKKysrIGIveGVuL2FyY2gvYXJtL0tjb25maWcKQEAgLTU5LDYgKzU5LDEwIEBAIGNvbmZp
ZyBTQlNBX1ZVQVJUX0NPTlNPTEUKIAogZW5kbWVudQogCitjb25maWcgQUNQSV9JT1JUCisgICAg
ICAgIGRlcGVuZHMgb24gQUNQSQorICAgICAgICBkZWZfYm9vbCB5CisKIG1lbnUgIkFSTSBlcnJh
dGEgd29ya2Fyb3VuZCB2aWEgdGhlIGFsdGVybmF0aXZlIGZyYW1ld29yayIKIAlkZXBlbmRzIG9u
IEhBU19BTFRFUk5BVElWRQogCi0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
