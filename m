From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 6/9] Revert "x86/boot: Map more than the first
	16MB"
Date: Thu, 18 Jan 2018 18:16:49 +0000
Message-ID: <20180118181652.26397-7-wei.liu2@citrix.com>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w6dq=en=citrix.com=prvs=5494ca295=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ecEoN-0005wH-8A
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2018 18:21:15 +0000
In-Reply-To: <20180118181652.26397-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyByZXZlcnRzIGNvbW1pdCA3ZDZmOTU4ZDlkMThjNTQwMTdmNWVmNmUyOTlhMDgwMzdmMDM1
NzQ3LgoKTm93IHdlIGhhdmUgUFZIIGluZm8gcmVsb2NhdGlvbiBzdXBwb3J0LCB0aGlzIGNoYW5n
ZSBpcyBubyBsb25nZXIKbmVlZGVkLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4
Ni9ib290L3g4Nl82NC5TIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUyBi
L3hlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TCmluZGV4IDQyNjM2Y2YzMzQuLmNmNDdlMDE5ZjUg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TCisrKyBiL3hlbi9hcmNoL3g4
Ni9ib290L3g4Nl82NC5TCkBAIC0xMTQsMTAgKzExNCwxMSBAQCBHTE9CQUwoX19wYWdlX3RhYmxl
c19zdGFydCkKIEdMT0JBTChsMl9pZGVudG1hcCkKICAgICAgICAgLnF1YWQgc3ltX29mZnMobDFf
aWRlbnRtYXApICsgX19QQUdFX0hZUEVSVklTT1IKICAgICAgICAgaWR4ID0gMQotICAgICAgICAu
cmVwdCA0ICogTDJfUEFHRVRBQkxFX0VOVFJJRVMgLSAxCisgICAgICAgIC5yZXB0IDcKICAgICAg
ICAgLnF1YWQgKGlkeCA8PCBMMl9QQUdFVEFCTEVfU0hJRlQpIHwgUEFHRV9IWVBFUlZJU09SIHwg
X1BBR0VfUFNFCiAgICAgICAgIGlkeCA9IGlkeCArIDEKICAgICAgICAgLmVuZHIKKyAgICAgICAg
LmZpbGwgNCAqIEwyX1BBR0VUQUJMRV9FTlRSSUVTIC0gOCwgOCwgMAogICAgICAgICAuc2l6ZSBs
Ml9pZGVudG1hcCwgLiAtIGwyX2lkZW50bWFwCiAKIC8qCi0tIAoyLjExLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
