From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 09/17] x86/amd: put setting pv_post_outb_hook
 under CONFIG_PV
Date: Thu, 4 Oct 2018 16:43:28 +0100
Message-ID: <f1fafccc6ba352431e3ba72e834fd37e37b9eb9e.1538667753.git-series.wei.liu2@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a7fh=mq=citrix.com=prvs=808c92aaa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g85mx-00050c-9t
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:43:43 +0000
In-Reply-To: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SXQgaXMgdXNlZCBieSBQViBjb2RlIG9ubHkuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgfCA0ICsrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
Y3B1L2FtZC5jIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwppbmRleCBjMzk0YzFjLi41ZTIxMTJl
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvY3B1L2FtZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9j
cHUvYW1kLmMKQEAgLTQ0MywxMiArNDQzLDE0IEBAIHN0YXRpYyB2b2lkIGRpc2FibGVfYzFlKHZv
aWQgKnVudXNlZCkKIAkJICAgICAgIHNtcF9wcm9jZXNzb3JfaWQoKSwgbXNyX2NvbnRlbnQpOwog
fQogCisjaWZkZWYgQ09ORklHX1BWCiBzdGF0aWMgdm9pZCBjaGVja19kaXNhYmxlX2MxZSh1bnNp
Z25lZCBpbnQgcG9ydCwgdTggdmFsdWUpCiB7CiAJLyogQzFFIGlzIHNvbWV0aW1lcyBlbmFibGVk
IGR1cmluZyBlbnRyeSB0byBBQ1BJIG1vZGUuICovCiAJaWYgKChwb3J0ID09IGFjcGlfc21pX2Nt
ZCkgJiYgKHZhbHVlID09IGFjcGlfZW5hYmxlX3ZhbHVlKSkKIAkJb25fZWFjaF9jcHUoZGlzYWJs
ZV9jMWUsIE5VTEwsIDEpOwogfQorI2VuZGlmCiAKIC8qCiAgKiBCSU9TIGlzIGV4cGVjdGVkIHRv
IGNsZWFyIE10cnJGaXhEcmFtTW9kRW4gYml0LiBBY2NvcmRpbmcgdG8gQU1EIEJLREcgOiAKQEAg
LTYyNyw4ICs2MjksMTAgQEAgc3RhdGljIHZvaWQgaW5pdF9hbWQoc3RydWN0IGNwdWluZm9feDg2
ICpjKQogCXsKIAljYXNlIDB4ZiAuLi4gMHgxNzoKIAkJZGlzYWJsZV9jMWUoTlVMTCk7CisjaWZk
ZWYgQ09ORklHX1BWCiAJCWlmIChhY3BpX3NtaV9jbWQgJiYgKGFjcGlfZW5hYmxlX3ZhbHVlIHwg
YWNwaV9kaXNhYmxlX3ZhbHVlKSkKIAkJCXB2X3Bvc3Rfb3V0Yl9ob29rID0gY2hlY2tfZGlzYWJs
ZV9jMWU7CisjZW5kaWYKIAkJYnJlYWs7CiAJfQogCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
