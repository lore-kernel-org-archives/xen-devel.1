From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 33/55] x86/smpboot: add emacs block
Date: Thu, 7 Feb 2019 16:44:34 +0000
Message-ID: <20190207164456.9260-34-wei.liu2@citrix.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sBy9=QO=citrix.com=prvs=93456468f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1grn0v-0000j3-7X
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 16:59:01 +0000
In-Reply-To: <20190207164456.9260-1-wei.liu2@citrix.com>
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvc21wYm9vdC5jIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gv
eDg2L3NtcGJvb3QuYwppbmRleCA3ZDEyMjZkN2JjLi40YTA5ODIyNzJkIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvc21wYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTEz
ODQsMyArMTM4NCwxMyBAQCB2b2lkIF9faW5pdCBzbXBfaW50cl9pbml0KHZvaWQpCiAgICAgc2V0
X2RpcmVjdF9hcGljX3ZlY3RvcihJTlZBTElEQVRFX1RMQl9WRUNUT1IsIGludmFsaWRhdGVfaW50
ZXJydXB0KTsKICAgICBzZXRfZGlyZWN0X2FwaWNfdmVjdG9yKENBTExfRlVOQ1RJT05fVkVDVE9S
LCBjYWxsX2Z1bmN0aW9uX2ludGVycnVwdCk7CiB9CisKKy8qCisgKiBMb2NhbCB2YXJpYWJsZXM6
CisgKiBtb2RlOiBDCisgKiBjLWZpbGUtc3R5bGU6ICJCU0QiCisgKiBjLWJhc2ljLW9mZnNldDog
NAorICogdGFiLXdpZHRoOiA0CisgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKKyAqIEVuZDoKKyAq
LwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
