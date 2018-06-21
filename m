From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/4] TestSupport: Honour $force option
 to package_install_cmd
Date: Thu, 21 Jun 2018 15:09:19 +0100
Message-ID: <1529590160-25104-4-git-send-email-ian.jackson@eu.citrix.com>
References: <1529590160-25104-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g66k=jh=citrix.com=prvs=70384805a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fW0HQ-0001eS-F0
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 14:09:44 +0000
In-Reply-To: <1529590160-25104-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpTaWduZWQtb2Zm
LWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0
L1Rlc3RTdXBwb3J0LnBtIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIv
T3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCAxMzVjZGEzLi4wYzU3ZGNjIDEwMDY0NAotLS0g
YS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCisrKyBiL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KQEAg
LTUyNSw4ICs1MjUsOCBAQCBzdWIgdGFyZ2V0X3B1dGZpbGVfcm9vdCAoJCQkJDskKSB7CiAgICAg
dHB1dGZpbGVleCgncm9vdCcsIEBfKTsKIH0KIAotc3ViIHBhY2thZ2VfaW5zdGFsbF9jbWQgKCQ7
JCkgewotICAgIG15ICgkaG8sICRub3JlYykgPSBAXzsKK3N1YiBwYWNrYWdlX2luc3RhbGxfY21k
ICgkOyQkKSB7CisgICAgbXkgKCRobywgJG5vcmVjLCAkZm9yY2UpID0gQF87CiAgICAgbXkgQGNt
ZDsKIAogICAgIGlmICgkaG8tPntPU30gZXEgImZyZWVic2QiKSB7CkBAIC01MzUsNiArNTM1LDcg
QEAgc3ViIHBhY2thZ2VfaW5zdGFsbF9jbWQgKCQ7JCkgewogICAgICAgICBwdXNoIEBjbWQsIHF3
KERFQklBTl9QUklPUklUWT1jcml0aWNhbCBVQ0ZfRk9SQ0VfQ09ORkZPTEQ9eQogICAgICAgICAg
ICAgICAgICAgICAgIHdpdGgtbG9jay1leCAtdyAvdmFyL2xvY2svb3NzdGVzdC1hcHQgYXB0LWdl
dCk7CiAgICAgICAgIHB1c2ggQGNtZCwgcXcoLS1uby1pbnN0YWxsLXJlY29tbWVuZHMpIGlmICRu
b3JlYzsKKyAgICAgICAgcHVzaCBAY21kLCBxdygtZikgaWYgJGZvcmNlOwogICAgICAgICBwdXNo
IEBjbWQsIHF3KC15IGluc3RhbGwpOwogICAgIH0KIAotLSAKMi4xLjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
