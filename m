From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v2 7/8] x86/vvmx: correctly report vvmcs size
Date: Tue, 6 Nov 2018 12:07:58 +0000
Message-ID: <20181106120759.8789-8-sergey.dyasli@citrix.com>
References: <20181106120759.8789-1-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181106120759.8789-1-sergey.dyasli@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHNpemUgb2YgWGVuJ3MgdmlydHVhbCB2bWNzIHJlZ2lvbiBpcyA0MDk2IGJ5dGVzIChzZWUg
Y29tbWVudCBhYm91dApWaXJ0dWFsIFZNQ1MgbGF5b3V0IGluIGluY2x1ZGUvYXNtLXg4Ni9odm0v
dm14L3Z2bXguaCkuIENvcnJlY3RseSByZXBvcnQKaXQgdG8gdGhlIGd1ZXN0IGluIGNhc2Ugd2hl
biBWTUNTIHNoYWRvd2luZyBpcyBub3QgYXZhaWxhYmxlIGluc3RlYWQgb2YKcHJvdmlkaW5nIEgv
VyB2YWx1ZSAod2hpY2ggaXMgdXN1YWxseSBzbWFsbGVyKS4KClNpZ25lZC1vZmYtYnk6IFNlcmdl
eSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KLS0tCnYyOgotIHNsaWdodCBjb21t
aXQgbWVzc2FnZSBjaGFuZ2UKLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgfCA4ICsr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCmlu
ZGV4IDJmNTM3MGNlZWQuLjM3ZDNjZGQ4NTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
dm14L3Z2bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKQEAgLTIxMDEsNiAr
MjEwMSwxNCBAQCBpbnQgbnZteF9tc3JfcmVhZF9pbnRlcmNlcHQodW5zaWduZWQgaW50IG1zciwg
dTY0ICptc3JfY29udGVudCkKICAgICAgICAgZGF0YSA9IChob3N0X2RhdGEgJiAofjB1bCA8PCAz
MikpIHwKICAgICAgICAgICAgICAgICh2bWNzLT52bWNzX3JldmlzaW9uX2lkICYgMHg3ZmZmZmZm
Zik7CiAgICAgICAgIHVubWFwX2RvbWFpbl9wYWdlKHZtY3MpOworCisgICAgICAgIGlmICggIWNw
dV9oYXNfdm14X3ZtY3Nfc2hhZG93aW5nICkKKyAgICAgICAgeworICAgICAgICAgICAgLyogUmVw
b3J0IHZtY3NfcmVnaW9uX3NpemUgYXMgNDA5NiAqLworICAgICAgICAgICAgZGF0YSAmPSB+Vk1Y
X0JBU0lDX1ZNQ1NfU0laRV9NQVNLOworICAgICAgICAgICAgZGF0YSB8PSAxVUxMIDw8IDQ0Owor
ICAgICAgICB9CisKICAgICAgICAgYnJlYWs7CiAgICAgfQogICAgIGNhc2UgTVNSX0lBMzJfVk1Y
X1BJTkJBU0VEX0NUTFM6Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
