From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 6/6] x86/vmx: Drop VMX signal for full real-mode
Date: Mon, 28 May 2018 15:27:58 +0100
Message-ID: <1527517678-1779-7-git-send-email-andrew.cooper3@citrix.com>
References: <1527517678-1779-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527517678-1779-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGh2bWxvYWRlciBjb2RlIHdoaWNoIHVzZWQgdGhpcyBzaWduYWwgd2FzIGRlbGV0ZWQgMTAg
eWVhcnMgYWdvIChjL3MKNTBiMTJkZjgzICJ4ODYgdm14OiBSZW1vdmUgdm14YXNzaXN0IikuICBG
dXJ0aGVybW9yZSwgdGhlIHZhbHVlIGdldHMgZGlzY2FyZGVkCmFueXdheSBiZWNhdXNlIHRoZSBI
Vk0gZG9tYWluIGJ1aWxkZXIgdW5jb25kaXRpb25hbGx5IHNldHMgJXJheCB0byAwIGluIHRoZQpz
YW1lIGFjdGlvbiBpdCB1c2VzIHRvIHNldCAlcmlwIHRvIHRoZSBhcHByb3ByaWF0ZSBlbnRyeXBv
aW50LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBKdW4gTmFr
YWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpD
QzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3Zt
eC92bXguYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92
bXguYwppbmRleCA4MDQ5MjY0Li40MzE4YjE1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZteC92bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwpAQCAtNDYyLDEwICs0
NjIsNiBAQCBzdGF0aWMgaW50IHZteF92Y3B1X2luaXRpYWxpc2Uoc3RydWN0IHZjcHUgKnYpCiAK
ICAgICB2bXhfaW5zdGFsbF92bGFwaWNfbWFwcGluZyh2KTsKIAotICAgIC8qICVlYXggPT0gMSBz
aWduYWxzIGZ1bGwgcmVhbC1tb2RlIHN1cHBvcnQgdG8gdGhlIGd1ZXN0IGxvYWRlci4gKi8KLSAg
ICBpZiAoIHYtPnZjcHVfaWQgPT0gMCApCi0gICAgICAgIHYtPmFyY2gudXNlcl9yZWdzLnJheCA9
IDE7Ci0KICAgICByZXR1cm4gMDsKIH0KIAotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
