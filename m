From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 2/5] PDU::ipmi: Better username/password
 configuration
Date: Mon, 2 Jul 2018 17:25:44 +0100
Message-ID: <1530548747-28975-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1530548747-28975-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kxf3=js=citrix.com=prvs=714649dcc=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fa1eI-0000Ne-Rk
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 16:25:58 +0000
In-Reply-To: <1530548747-28975-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBjYW4gbm93IGNvbWUgZnJvbSBob3N0IHByb3BlcnRpZXMsIG9yIGZhaWxpbmcgdGhhdCB3
ZSB1c2UKQURNSU4vQURNSU4gd2hpY2ggc2VlbXMgY29tbW9uLgoKTm8gZnVuY3Rpb25hbCBjaGFu
Z2Ugd2l0aCB3b3JraW5nIGV4aXN0aW5nIGNvbmZpZ3MuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFj
a3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L1BEVS9pcG1pLnBt
IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL09z
c3Rlc3QvUERVL2lwbWkucG0gYi9Pc3N0ZXN0L1BEVS9pcG1pLnBtCmluZGV4IDBjYmM1YjkuLmRi
ZjIxMWYgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvUERVL2lwbWkucG0KKysrIGIvT3NzdGVzdC9QRFUv
aXBtaS5wbQpAQCAtMzYsNiArMzYsOCBAQCBCRUdJTiB7CiAKIHN1YiBuZXcgewogICAgIG15ICgk
Y2xhc3MsICRobywgJG1ldGhuYW1lLCAkbWdtdCwgJHVzZXIsICRwYXNzLCBAb3B0cykgPSBAXzsK
KyAgICAkdXNlciB8fD0gZ2V0X2hvc3RfcHJvcGVydHkoJGhvLCAnSXBtaVVzZXInKSB8fCAnQURN
SU4nOworICAgICRwYXNzIHx8PSBnZXRfaG9zdF9wcm9wZXJ0eSgkaG8sICdJcG1pUGFzc3dvcmQn
KSB8fCAnQURNSU4nOwogICAgIHJldHVybiBibGVzcyB7IEhvc3QgPT4gJGhvLAogCQkgICBNZ210
ID0+ICRtZ210LAogCQkgICBVc2VyID0+ICR1c2VyLAotLSAKMi4xLjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
