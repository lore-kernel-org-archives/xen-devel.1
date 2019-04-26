From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 03/15] arch replumbing: ts-host-install:
 Move $kern_arch_info setting
Date: Fri, 26 Apr 2019 17:39:50 +0100
Message-ID: <20190426164002.22381-4-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3ue-00083v-7O
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:24 +0000
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gZG8gdGhpcyBhZnRlciBzZWxlY3Rob3N0LgoKTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0LWluc3RhbGwgfCAyMCArKysrKysrKysrKysrLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdHMtaG9zdC1pbnN0YWxsIGIvdHMtaG9zdC1pbnN0YWxsCmluZGV4IDQ1ZjA0
NzY0Li4zYzE0ZjE3MSAxMDA3NTUKLS0tIGEvdHMtaG9zdC1pbnN0YWxsCisrKyBiL3RzLWhvc3Qt
aW5zdGFsbApAQCAtMzEsNyArMzEsNyBAQCBteSAkZGViY29uZl9wcmlvcml0eTsKIG15ICRwb3dl
cm9uX3Rlc3Rfb25seTsKIAogb3VyICV4b3B0czsKLW91ciAka2Vybl9hcmNoX2luZm87CitvdXIg
JGJ1aWxkOwogCiB3aGlsZSAoQEFSR1YgYW5kICRBUkdWWzBdID1+IG0vXi0vKSB7CiAgICAgJF89
IHNoaWZ0IEBBUkdWOwpAQCAtNDMsMTIgKzQzLDcgQEAgd2hpbGUgKEBBUkdWIGFuZCAkQVJHVlsw
XSA9fiBtL14tLykgewogICAgIH0gZWxzaWYgIChtL14tLXJlc2N1ZSQvKSB7CiAJJHhvcHRze1Jl
c2N1ZU1vZGV9PSAxOwogICAgIH0gZWxzaWYgIChtL14tLWJ1aWxkJC8pIHsKLQlpZiAoJHJ7YXJj
aH0gZXEgJ2kzODYnKSB7Ci0JICAgICRrZXJuX2FyY2hfaW5mbyA9IHsKLSAgICAgICAgICAgICAg
ICBLZXJuZWxfRGViaWFuID0+ICdhbWQ2NCcsCi0gICAgICAgICAgICAgICAgVXNlcmxhbmRfc2V0
YXJjaCA9PiAnaTM4NicsCi0gICAgICAgICAgICB9OwotCX0KKwkkYnVpbGQgPSAxOwogICAgIH0g
ZWxzZSB7CiAJZGllICIkXyAkISI7CiAgICAgfQpAQCAtNjMsNiArNTgsMTcgQEAgZXhpdCAwIGlm
ICRoby0+e1NoYXJlZFJlYWR5fTsKIG91ciAldGltZW91dD0gcXcoUmVhZFByZXNlZWQgIDM1MAog
ICAgICAgICAgICAgICAgICBTc2hkICAgICAgICAyNDAwKTsKIAorb3VyICRrZXJuX2FyY2hfaW5m
bzsKKworaWYgKCRidWlsZCkgeworICAgIGlmICgkcnthcmNofSBlcSAnaTM4NicpIHsKKwkka2Vy
bl9hcmNoX2luZm8gPSB7CisJICAgIEtlcm5lbF9EZWJpYW4gPT4gJ2FtZDY0JywKKwkgICAgVXNl
cmxhbmRfc2V0YXJjaCA9PiAnaTM4NicsCisJfTsKKyAgICB9Cit9CisKIHN1YiBpbnN0YWxsICgp
IHsKICAgICBteSAoJHBzX3VybCwkcHNfZmlsZSk9IHByZXNlZWRfY3JlYXRlCiAgICAgICAgICgk
aG8sICcnLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
