From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/4] x86/vvmx: Correct the INVALID_PADDR checks
 for VMPTRLD/VMCLEAR
Date: Thu, 15 Nov 2018 13:52:48 +0000
Message-ID: <1542289970-32709-3-git-send-email-andrew.cooper3@citrix.com>
References: <1542289970-32709-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542289970-32709-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHJlZmVyZW5jZWQgYWRkcmVzc2VzIGFsc28gbmVlZCBjaGVja2luZyBhZ2FpbnN0IE1BWFBI
WVNBRERSLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+CkNDOiBTZXJnZXkgRHlhc2xpIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+
CkNDOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNDOiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2
L2h2bS92bXgvdnZteC5jCmluZGV4IGMyOTY2NjAuLjVkYWFiODIgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3Z2bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMK
QEAgLTE2NzIsNyArMTY3Miw3IEBAIHN0YXRpYyBpbnQgbnZteF9oYW5kbGVfdm1wdHJsZChzdHJ1
Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKICAgICBpZiAoIHJjICE9IFg4NkVNVUxfT0tBWSApCiAg
ICAgICAgIHJldHVybiByYzsKIAotICAgIGlmICggZ3BhICYgMHhmZmYgKQorICAgIGlmICggKGdw
YSAmIH5QQUdFX01BU0spIHx8ICFnZm5fdmFsaWQodi0+ZG9tYWluLCBnYWRkcl90b19nZm4oZ3Bh
KSkgKQogICAgIHsKICAgICAgICAgdm1mYWlsKHJlZ3MsIFZNWF9JTlNOX1ZNUFRSTERfSU5WQUxJ
RF9QSFlBRERSKTsKICAgICAgICAgZ290byBvdXQ7CkBAIC0xNzgwLDcgKzE3ODAsNyBAQCBzdGF0
aWMgaW50IG52bXhfaGFuZGxlX3ZtY2xlYXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAg
ICAgICAgIGdvdG8gb3V0OwogICAgIH0KIAotICAgIGlmICggZ3BhICYgMHhmZmYgKQorICAgIGlm
ICggKGdwYSAmIH5QQUdFX01BU0spIHx8ICFnZm5fdmFsaWQodi0+ZG9tYWluLCBnYWRkcl90b19n
Zm4oZ3BhKSkgKQogICAgIHsKICAgICAgICAgdm1mYWlsKHJlZ3MsIFZNWF9JTlNOX1ZNQ0xFQVJf
SU5WQUxJRF9QSFlBRERSKTsKICAgICAgICAgZ290byBvdXQ7Ci0tIAoyLjEuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
