From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 01/31] OvmfPkg/ResetSystemLib: Add missing
 dependency on PciLib
Date: Mon, 8 Apr 2019 15:23:38 +0100
Message-ID: <20190408142408.30419-2-anthony.perard@citrix.com>
References: <20190408142408.30419-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RaUp=SK=citrix.com=prvs=994f31c19=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDVC3-0000vB-2M
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 14:24:15 +0000
In-Reply-To: <20190408142408.30419-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: edk2-devel@lists.01.org
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
List-Id: xen-devel@lists.xenproject.org

YW5kIHJlbW92ZSBleHRyYSBpbmNsdWRlcyBvZiBPdm1mUGxhdGZvcm1zLmguCgpDb250cmlidXRl
ZC11bmRlcjogVGlhbm9Db3JlIENvbnRyaWJ1dGlvbiBBZ3JlZW1lbnQgMS4xClNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KCk5vdGVz
OgogICAgdjI6CiAgICAtIGFsc28gYWRkIFBjaUxpYi5oIGluY2x1ZGUgdG8gdGhlIC5jCiAgICAt
IGFuZCByZW1vdmUgZXh0cmEgaW5jbHVkZSBvZiBPdm1mUGxhdGZvcm1zLmgKCiBPdm1mUGtnL0xp
YnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuaW5mIHwgMSArCiBPdm1mUGtnL0xp
YnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuYyAgIHwgMyArLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL092
bWZQa2cvTGlicmFyeS9SZXNldFN5c3RlbUxpYi9SZXNldFN5c3RlbUxpYi5pbmYgYi9Pdm1mUGtn
L0xpYnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuaW5mCmluZGV4IDM5Y2E4MDU3
MzAuLmViZDcyMmU2NmIgMTAwNjQ0Ci0tLSBhL092bWZQa2cvTGlicmFyeS9SZXNldFN5c3RlbUxp
Yi9SZXNldFN5c3RlbUxpYi5pbmYKKysrIGIvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGli
L1Jlc2V0U3lzdGVtTGliLmluZgpAQCAtMzYsNCArMzYsNSBAQCBbUGFja2FnZXNdCiBbTGlicmFy
eUNsYXNzZXNdCiAgIERlYnVnTGliCiAgIElvTGliCisgIFBjaUxpYgogICBUaW1lckxpYgpkaWZm
IC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1Jlc2V0U3lzdGVtTGliL1Jlc2V0U3lzdGVtTGliLmMg
Yi9Pdm1mUGtnL0xpYnJhcnkvUmVzZXRTeXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuYwppbmRleCBj
Yzc1ZDA0NmE4Li45MzQ4NTAyODM2IDEwMDY0NAotLS0gYS9Pdm1mUGtnL0xpYnJhcnkvUmVzZXRT
eXN0ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuYworKysgYi9Pdm1mUGtnL0xpYnJhcnkvUmVzZXRTeXN0
ZW1MaWIvUmVzZXRTeXN0ZW1MaWIuYwpAQCAtMTcsMTEgKzE3LDEwIEBACiAjaW5jbHVkZSA8TGli
cmFyeS9CYXNlTGliLmg+CiAjaW5jbHVkZSA8TGlicmFyeS9EZWJ1Z0xpYi5oPgogI2luY2x1ZGUg
PExpYnJhcnkvSW9MaWIuaD4KKyNpbmNsdWRlIDxMaWJyYXJ5L1BjaUxpYi5oPgogI2luY2x1ZGUg
PExpYnJhcnkvVGltZXJMaWIuaD4KICNpbmNsdWRlIDxPdm1mUGxhdGZvcm1zLmg+CiAKLSNpbmNs
dWRlIDxPdm1mUGxhdGZvcm1zLmg+Ci0KIFZPSUQKIEFjcGlQbUNvbnRyb2wgKAogICBVSU5UTiBT
dXNwZW5kVHlwZQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
