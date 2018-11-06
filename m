From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/emul: Assert the STI shadow when POPF sets
 the interrupt flag
Date: Tue, 6 Nov 2018 14:09:15 +0000
Message-ID: <1541513355-1365-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0
ZS5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYyBiL3hlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCmluZGV4IGU2OWRmZGQuLmU5MzUzMmQgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCkBAIC00MDYxLDYgKzQwNjEsMTIgQEAg
eDg2X2VtdWxhdGUoCiAgICAgICAgICAgICB9CiAgICAgICAgIH0KICAgICAgICAgZHN0LnZhbCAm
PSBFRkxBR1NfTU9ESUZJQUJMRTsKKworICAgICAgICAvKiBXaGVuIElGIHRyYW5zaXRpb25zIGZy
b20gMCB0byAxLCBhc3NlcnQgdGhlIFNUSSBzaGFkb3cuICovCisgICAgICAgIGlmICggIShfcmVn
cy5lZmxhZ3MgJiBYODZfRUZMQUdTX0lGKSAmJgorICAgICAgICAgICAgICgoZHN0LnZhbCAmIH5t
YXNrKSAmIFg4Nl9FRkxBR1NfSUYpICkKKyAgICAgICAgICAgIGN0eHQtPnJldGlyZS5zdGkgPSB0
cnVlOworCiAgICAgICAgIF9yZWdzLmVmbGFncyAmPSBtYXNrOwogICAgICAgICBfcmVncy5lZmxh
Z3MgfD0gKGRzdC52YWwgJiB+bWFzaykgfCBYODZfRUZMQUdTX01CUzsKICAgICAgICAgYnJlYWs7
Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
