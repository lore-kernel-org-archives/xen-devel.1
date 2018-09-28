From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 1/2] x86: make sure module array is large enough
 in pvh-boot.c
Date: Fri, 28 Sep 2018 09:24:36 +0100
Message-ID: <20180928082437.15140-2-wei.liu2@citrix.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5o4o-00081a-6I
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 08:24:42 +0000
In-Reply-To: <20180928082437.15140-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHJlbG9jYXRpb24gY29kZSBpbiBfX3N0YXJ0X3hlbiByZXF1aXJlcyBvbmUgZXh0cmEgZWxl
bWVudCBpbiB0aGUKbW9kdWxlIGFycmF5LiBCeSB0aGUgbG9va3Mgb2YgaXQgdGhlIHRlbXBvcmFy
eSBhcnJheSBpcyBhbHJlYWR5IGxhcmdlCmVub3VnaC4gQWRkIGEgQlVHX09OIHRvIGNhdGNoIGFu
eSBpc3N1ZSBpbiB0aGUgZnV0dXJlLgoKV2hpbGUgYXQgaXQsIHR1cm4gYW5vdGhlciBBU1NFUlQg
dG8gQlVHX09OIGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9wdmgtYm9vdC5jIHwgOSArKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvcHZoLWJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9w
dmgtYm9vdC5jCmluZGV4IDBlOWU1YmZkZjYuLjJlMTAzMTA1ZmEgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC9wdmgtYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9wdmgtYm9v
dC5jCkBAIC00Miw3ICs0MiwxNCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY29udmVydF9wdmhfaW5m
byh2b2lkKQogICAgIG1vZHVsZV90ICptb2Q7CiAgICAgdW5zaWduZWQgaW50IGk7CiAKLSAgICBB
U1NFUlQocHZoX2luZm8tPm1hZ2ljID09IFhFTl9IVk1fU1RBUlRfTUFHSUNfVkFMVUUpOworICAg
IEJVR19PTihwdmhfaW5mby0+bWFnaWMgIT0gWEVOX0hWTV9TVEFSVF9NQUdJQ19WQUxVRSk7CisK
KyAgICAvKgorICAgICAqIFRlbXBvcmFyeSBtb2R1bGUgYXJyYXkgbmVlZHMgdG8gYmUgYXQgbGVh
c3Qgb25lIGVsZW1lbnQgYmlnZ2VyIHRoYW4KKyAgICAgKiByZXF1aXJlZC4gVGhlIGV4dHJhIGVs
ZW1lbnQgaXMgdXNlZCB0byBhaWQgcmVsb2NhdGlvbi4gU2VlCisgICAgICogYXJjaC94ODYvc2V0
dXAuYzpfX3N0YXJ0X3hlbigpLgorICAgICAqLworICAgIEJVR19PTihBUlJBWV9TSVpFKHB2aF9t
YmlfbW9kcykgPD0gcHZoX2luZm8tPm5yX21vZHVsZXMpOwogCiAgICAgLyoKICAgICAgKiBUdXJu
IGh2bV9zdGFydF9pbmZvIGludG8gbWJpLiBMdWNraWx5IGFsbCBtb2R1bGVzIGFyZSBwbGFjZWQg
dW5kZXIgNEdCCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
