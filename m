From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 3/4] x86/vvmx: INVVPID instructions should be
 handled at by L1
Date: Thu, 25 Oct 2018 16:38:53 +0100
Message-ID: <1540481933-20666-1-git-send-email-andrew.cooper3@citrix.com>
References: <1540481802-20037-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1540481802-20037-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+CkNDOiBKYW4g
QmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgpDQzogSnVuIE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPgpDQzogS2V2aW4g
VGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMK
aW5kZXggOTM5MDcwNS4uZDFjOGE0MSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgv
dnZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwpAQCAtMjM0OCw2ICsyMzQ4
LDcgQEAgaW50IG52bXhfbjJfdm1leGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJl
Z3MsCiAgICAgY2FzZSBFWElUX1JFQVNPTl9WTVhPRkY6CiAgICAgY2FzZSBFWElUX1JFQVNPTl9W
TVhPTjoKICAgICBjYXNlIEVYSVRfUkVBU09OX0lOVkVQVDoKKyAgICBjYXNlIEVYSVRfUkVBU09O
X0lOVlZQSUQ6CiAgICAgY2FzZSBFWElUX1JFQVNPTl9YU0VUQlY6CiAgICAgICAgIC8qIGluamVj
dCB0byBMMSAqLwogICAgICAgICBudmNwdS0+bnZfdm1leGl0X3BlbmRpbmcgPSAxOwotLSAKMi4x
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
