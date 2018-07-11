From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 4/4] PDU: ipmi: Pass further options to
 ipmitool
Date: Wed, 11 Jul 2018 15:54:07 +0100
Message-ID: <1531320847-10243-4-git-send-email-ian.jackson@eu.citrix.com>
References: <1531320847-10243-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ygtr=j3=citrix.com=prvs=723fa8a25=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fdGVR-0002dq-9N
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 14:54:13 +0000
In-Reply-To: <1531320847-10243-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBpcyB1c2VmdWwsIGZvciBleGFtcGxlLCBmb3IgcGFzc2luZyBgLUkgbGFucGx1cycuCgpT
aWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0t
CiBPc3N0ZXN0L1BEVS9pcG1pLnBtIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvUERVL2lwbWkucG0gYi9Pc3N0ZXN0L1BEVS9pcG1p
LnBtCmluZGV4IGI2NjIxZGIuLmQ0MTFkOTcgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvUERVL2lwbWku
cG0KKysrIGIvT3NzdGVzdC9QRFUvaXBtaS5wbQpAQCAtNTAsNiArNTAsOCBAQCBzdWIgcGR1X3Bv
d2VyX3N0YXRlIHsKICAgICBteSAkb25vZmY9ICRvbiA/ICJvbiIgOiAib2ZmIjsKIAogICAgIG15
IEBjbWQgPSAocXcoaXBtaXRvb2wgLUgpLCAkbW8tPntNZ210fSwKKyAgICAgICAgICAgICAgICct
VScsJG1vLT57VXNlcn0sICctUCcsJG1vLT57UGFzc30sCisgICAgICAgICAgICAgICBAeyAkbW8t
PntPcHRzfSB9KTsKIAogICAgIG15ICRjbWRfbG9nZ2VkOwogCi0tIAoyLjEuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
