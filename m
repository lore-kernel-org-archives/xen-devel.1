From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 2/7] docs/parse-support-md: Adjust some
 (commented-out) debugging
Date: Mon, 3 Dec 2018 12:16:27 +0000
Message-ID: <20181203121632.4654-3-ian.jackson@eu.citrix.com>
References: <20181203121632.4654-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pdlu=om=citrix.com=prvs=8685b8843=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gTn9Y-0006v9-KL
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 12:16:44 +0000
In-Reply-To: <20181203121632.4654-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogZG9jcy9wYXJzZS1zdXBwb3J0LW1kIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvcGFyc2Utc3VwcG9y
dC1tZCBiL2RvY3MvcGFyc2Utc3VwcG9ydC1tZAppbmRleCA2NjcyNTIzNmYyLi5iYmU0ZDA0NWUx
IDEwMDc1NQotLS0gYS9kb2NzL3BhcnNlLXN1cHBvcnQtbWQKKysrIGIvZG9jcy9wYXJzZS1zdXBw
b3J0LW1kCkBAIC0xMTgsOCArMTE4LDggQEAgc3ViIHJpX0hlYWRlciB7CiBzdWIgcmlfUGFyYSB7
CiAgICAgcmV0dXJuIHVubGVzcyBAaW5zZWN0aW9uczsKICAgICBteSAkaW5zZWN0aW9uID0gJGlu
c2VjdGlvbnNbJCNpbnNlY3Rpb25zXTsKLSMgICAgcHJpbnQgU1RERVJSICJyaV9QYXJhICR2ZXJz
aW9uX2luZGV4ICRoYWRfZmVhdHVyZSAiLgotIyAgICAgICAgJGluc2VjdGlvbi0+e0hhc0NhdmVh
dH0uIiAkaW5zZWN0aW9uLT57S2V5fVxuIjsKKyMgICAgcHJpbnQgREVCVUcgInJpX1BhcmEgIiwK
KyMgICAgICAgIER1bXBlcigkdmVyc2lvbl9pbmRleCwgJGhhZF9mZWF0dXJlLCAkaW5zZWN0aW9u
KTsKIAogICAgIGlmICgkaGFkX2ZlYXR1cmUpIHsKICAgICAgICAgbXkgJHNlY3Rub2RlID0gZmlu
ZF9jdXJyZW50X3NlY3Rub2RlKCk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
