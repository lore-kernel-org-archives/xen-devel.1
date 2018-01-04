From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC v1 22/74] x86/boot: Map more than the first
	16MB
Date: Thu, 4 Jan 2018 13:05:33 +0000
Message-ID: <20180104130625.28605-23-wei.liu2@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=/p+y=d7=citrix.com=prvs=535dfbe76=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eX5fZ-0002jC-4d
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 13:34:53 +0000
In-Reply-To: <20180104130625.28605-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRPRE86IFJl
cGxhY2Ugc29tZWhvdyAoYm9vdHN0cmFwX21hcCgpID8pCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ib290
L3g4Nl82NC5TIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUyBiL3hlbi9h
cmNoL3g4Ni9ib290L3g4Nl82NC5TCmluZGV4IGNmNDdlMDE5ZjUuLjQyNjM2Y2YzMzQgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290
L3g4Nl82NC5TCkBAIC0xMTQsMTEgKzExNCwxMCBAQCBHTE9CQUwoX19wYWdlX3RhYmxlc19zdGFy
dCkKIEdMT0JBTChsMl9pZGVudG1hcCkKICAgICAgICAgLnF1YWQgc3ltX29mZnMobDFfaWRlbnRt
YXApICsgX19QQUdFX0hZUEVSVklTT1IKICAgICAgICAgaWR4ID0gMQotICAgICAgICAucmVwdCA3
CisgICAgICAgIC5yZXB0IDQgKiBMMl9QQUdFVEFCTEVfRU5UUklFUyAtIDEKICAgICAgICAgLnF1
YWQgKGlkeCA8PCBMMl9QQUdFVEFCTEVfU0hJRlQpIHwgUEFHRV9IWVBFUlZJU09SIHwgX1BBR0Vf
UFNFCiAgICAgICAgIGlkeCA9IGlkeCArIDEKICAgICAgICAgLmVuZHIKLSAgICAgICAgLmZpbGwg
NCAqIEwyX1BBR0VUQUJMRV9FTlRSSUVTIC0gOCwgOCwgMAogICAgICAgICAuc2l6ZSBsMl9pZGVu
dG1hcCwgLiAtIGwyX2lkZW50bWFwCiAKIC8qCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
