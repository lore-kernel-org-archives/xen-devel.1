From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] x86/amd: don't set pv_post_outb_hook when
 !CONFIG_PV
Date: Thu, 8 Nov 2018 14:58:09 +0000
Message-ID: <20181108145809.12232-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8d4c=nt=citrix.com=prvs=843a4775a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKllC-0002Wy-4X
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 14:58:18 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T2J2aW91c2x5IGl0IHdvbid0IGV4aXN0IHdoZW4gUFYgaXMgZGlzYWJsZWQuCgpTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KQmFzZWQgb24gUm9nZXIncyAi
YW1kL3B2aDogZW5hYmxlIEFDUEkgQzFFIGRpc2FibGUgcXVpcmsgb24gUFZIIERvbTAiLgoKVGhp
cyBpcyB0aGUgbGFzdCBwYXRjaCBuZWVkZWQgdG8gbWFrZSBDT05GSUdfUFYgd29yay4KLS0tCiB4
ZW4vYXJjaC94ODYvY3B1L2FtZC5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgYi94ZW4vYXJjaC94ODYv
Y3B1L2FtZC5jCmluZGV4IDg4OTVjMjU2ODIuLmUxZmM4OGJkY2YgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9jcHUvYW1kLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwpAQCAtNjMxLDcg
KzYzMSw5IEBAIHN0YXRpYyB2b2lkIGluaXRfYW1kKHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKIAlj
YXNlIDB4ZiAuLi4gMHgxNzoKIAkJZGlzYWJsZV9jMWUoTlVMTCk7CiAJCWlmIChhY3BpX3NtaV9j
bWQgJiYgKGFjcGlfZW5hYmxlX3ZhbHVlIHwgYWNwaV9kaXNhYmxlX3ZhbHVlKSkgeworI2lmZGVm
IENPTkZJR19QVgogCQkJcHZfcG9zdF9vdXRiX2hvb2sgPSBhbWRfY2hlY2tfZGlzYWJsZV9jMWU7
CisjZW5kaWYKIAkJCWFtZF9hY3BpX2MxZV9xdWlyayA9IHRydWU7CiAJCX0KIAkJYnJlYWs7Ci0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
