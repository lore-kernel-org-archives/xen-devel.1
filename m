From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 18/25] argo: limit the max number of rings that
 a domain may register.
Date: Fri, 30 Nov 2018 17:32:57 -0800
Message-ID: <1543627984-21394-19-git-send-email-christopher.w.clark@gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w5dn=ok=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gSuAX-00074a-G7
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:34:05 +0000
Received: by mail-io1-xd41.google.com with SMTP id n9so6064775ioh.7
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:34:04 -0800 (PST)
In-Reply-To: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, James McKenzie <voreekf@madingley.org>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

VmVyeSBiYXNpYyBpbXBsZW1lbnRhdGlvbjogYSBmaXhlZCBsaW1pdCBvZiAxMjguCgpTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMu
Y29tPgotLS0KIHhlbi9jb21tb24vYXJnby5jIHwgMTcgKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9hcmdv
LmMgYi94ZW4vY29tbW9uL2FyZ28uYwppbmRleCBjYTQ4MDMyLi5jYzkwOGY0IDEwMDY0NAotLS0g
YS94ZW4vY29tbW9uL2FyZ28uYworKysgYi94ZW4vY29tbW9uL2FyZ28uYwpAQCAtMjYsNiArMjYs
OCBAQAogI2luY2x1ZGUgPHhlbi90aW1lLmg+CiAjaW5jbHVkZSA8eHNtL3hzbS5oPgogCisjZGVm
aW5lIEFSR09fTUFYX1JJTkdTX1BFUl9ET01BSU4gICAgICAgMTI4VQorCiBERUZJTkVfWEVOX0dV
RVNUX0hBTkRMRShhcmdvX3Bmbl90KTsKIERFRklORV9YRU5fR1VFU1RfSEFORExFKGFyZ29fYWRk
cl90KTsKIERFRklORV9YRU5fR1VFU1RfSEFORExFKGFyZ29fc2VuZF9hZGRyX3QpOwpAQCAtMTAx
LDYgKzEwMyw4IEBAIHN0cnVjdCBhcmdvX2RvbWFpbgogICAgIHN0cnVjdCBobGlzdF9oZWFkIHJp
bmdfaGFzaFtBUkdPX0hUQUJMRV9TSVpFXTsKICAgICAvKiBpZCBjb29raWUsIHdyaXR0ZW4gb25s
eSBhdCBpbml0LCBzbyByZWFkYWJsZSB3aXRoIFIoTDEpICovCiAgICAgdWludDY0X3QgZG9tYWlu
X2Nvb2tpZTsKKyAgICAvKiBjb3VudGVyIG9mIHJpbmdzIHJlZ2lzdGVyZWQgYnkgdGhpcyBkb21h
aW4sIHByb3RlY3RlZCBieSBMMiAqLworICAgIHVpbnQzMl90IHJpbmdfY291bnQ7CiB9OwogCiAv
KgpAQCAtMTE2MSw3ICsxMTY1LDEwIEBAIGFyZ29fdW5yZWdpc3Rlcl9yaW5nKHN0cnVjdCBkb21h
aW4gKmQsCiAKICAgICAgICAgcmluZ19pbmZvID0gYXJnb19yaW5nX2ZpbmRfaW5mbyhkLCAmcmlu
Zy5pZCk7CiAgICAgICAgIGlmICggcmluZ19pbmZvICkKKyAgICAgICAgewogICAgICAgICAgICAg
YXJnb19yaW5nX3JlbW92ZV9pbmZvKGQsIHJpbmdfaW5mbyk7CisgICAgICAgICAgICBkLT5hcmdv
LT5yaW5nX2NvdW50LS07CisgICAgICAgIH0KIAogICAgICAgICB3cml0ZV91bmxvY2soJmQtPmFy
Z28tPmxvY2spOwogCkBAIC0xMjk4LDYgKzEzMDUsMTIgQEAgYXJnb19yZWdpc3Rlcl9yaW5nKHN0
cnVjdCBkb21haW4gKmQsCiAgICAgICAgIHdyaXRlX2xvY2soJmQtPmFyZ28tPmxvY2spOwogCiAg
ICAgICAgIGRvIHsKKyAgICAgICAgICAgIGlmICggZC0+YXJnby0+cmluZ19jb3VudCA+PSBBUkdP
X01BWF9SSU5HU19QRVJfRE9NQUlOICkKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICBy
ZXQgPSAtRU5PU1BDOworICAgICAgICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAgfQorCiAg
ICAgICAgICAgICByaW5nX2luZm8gPSBhcmdvX3JpbmdfZmluZF9pbmZvKGQsICZyaW5nLmlkKTsK
IAogICAgICAgICAgICAgaWYgKCAhcmluZ19pbmZvICkKQEAgLTEzNTcsNyArMTM3MCwxMCBAQCBh
cmdvX3JlZ2lzdGVyX3Jpbmcoc3RydWN0IGRvbWFpbiAqZCwKICAgICAgICAgICAgICAgICByZXQg
PSB1cGRhdGVfdHhfcHRyID8gYXJnb191cGRhdGVfdHhfcHRyKHJpbmdfaW5mbywgcmluZy50eF9w
dHIpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IGFyZ29fcmluZ19tYXBf
cGFnZShyaW5nX2luZm8sIDAsIE5VTEwpOwogICAgICAgICAgICAgaWYgKCAhcmV0ICkKKyAgICAg
ICAgICAgIHsKICAgICAgICAgICAgICAgICByaW5nX2luZm8tPmxlbiA9IHJpbmcubGVuOworICAg
ICAgICAgICAgICAgIGQtPmFyZ28tPnJpbmdfY291bnQrKzsKKyAgICAgICAgICAgIH0KIAogICAg
ICAgICB9IHdoaWxlICggMCApOwogCkBAIC0xNjk4LDYgKzE3MTQsNyBAQCBhcmdvX2luaXQoc3Ry
dWN0IGRvbWFpbiAqZCkKICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAKICAgICByd2xvY2tfaW5p
dCgmYXJnby0+bG9jayk7CisgICAgYXJnby0+cmluZ19jb3VudCA9IDA7CiAKICAgICBmb3IgKCBp
ID0gMDsgaSA8IEFSR09fSFRBQkxFX1NJWkU7ICsraSApCiAgICAgICAgIElOSVRfSExJU1RfSEVB
RCgmYXJnby0+cmluZ19oYXNoW2ldKTsKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
