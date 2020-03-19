Return-Path: <SRS0=5+kv=5E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DE9C4332D
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2020 07:15:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E71E20409
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2020 07:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E71E20409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEpO4-0002W0-Ad; Thu, 19 Mar 2020 07:14:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dEF6=5E=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jEpO2-0002Vq-Fn
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 07:14:38 +0000
X-Inumbo-ID: 4a7cc0e4-69b1-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a7cc0e4-69b1-11ea-bec1-bc764e2007e4;
 Thu, 19 Mar 2020 07:14:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 01FE1ABDC;
 Thu, 19 Mar 2020 07:14:35 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Thu, 19 Mar 2020 08:14:28 +0100
Message-Id: <20200319071428.12115-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/events: avoid NULL pointer dereference in
 evtchn_from_irq()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaGF2ZSBiZWVuIHJlcG9ydHMgb2YgcmFjZXMgaW4gZXZ0Y2huX2Zyb21faXJxKCkgd2hl
cmUgdGhlIGluZm8KcG9pbnRlciBoYXMgYmVlbiBOVUxMLgoKQXZvaWQgdGhhdCBjYXNlIGJ5IHRl
c3RpbmcgaW5mbyBiZWZvcmUgZGVyZWZlcmVuY2luZyBpdC4KCkluIG9yZGVyIHRvIGF2b2lkIGFj
Y2Vzc2luZyBhIGp1c3QgZnJlZWQgaW5mbyBzdHJ1Y3R1cmUgZG8gdGhlIGtmcmVlKCkKdmlhIGtm
cmVlX3JjdSgpLgoKQ2M6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52
aXNpYmxldGhpbmdzbGFiLmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKUmVwb3J0ZWQt
Ynk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdz
bGFiLmNvbT4KU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgot
LS0KIGRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jICAgICB8IDEwICsrKysrKysrLS0K
IGRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfaW50ZXJuYWwuaCB8ICAzICsrKwogMiBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50
c19iYXNlLmMKaW5kZXggNDk5ZWZmN2QzZjY1Li44Mzg3NjJmZTNkNmUgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jCisrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9l
dmVudHNfYmFzZS5jCkBAIC0yNDcsMTAgKzI0NywxNiBAQCBzdGF0aWMgdm9pZCB4ZW5faXJxX2lu
Zm9fY2xlYW51cChzdHJ1Y3QgaXJxX2luZm8gKmluZm8pCiAgKi8KIHVuc2lnbmVkIGludCBldnRj
aG5fZnJvbV9pcnEodW5zaWduZWQgaXJxKQogeworCXN0cnVjdCBpcnFfaW5mbyAqaW5mbzsKKwog
CWlmIChXQVJOKGlycSA+PSBucl9pcnFzLCAiSW52YWxpZCBpcnEgJWQhXG4iLCBpcnEpKQogCQly
ZXR1cm4gMDsKIAotCXJldHVybiBpbmZvX2Zvcl9pcnEoaXJxKS0+ZXZ0Y2huOworCWluZm8gPSBp
bmZvX2Zvcl9pcnEoaXJxKTsKKwlpZiAoaW5mbyA9PSBOVUxMKQorCQlyZXR1cm4gMDsKKworCXJl
dHVybiBpbmZvLT5ldnRjaG47CiB9CiAKIHVuc2lnbmVkIGlycV9mcm9tX2V2dGNobih1bnNpZ25l
ZCBpbnQgZXZ0Y2huKQpAQCAtNDM2LDcgKzQ0Miw3IEBAIHN0YXRpYyB2b2lkIHhlbl9mcmVlX2ly
cSh1bnNpZ25lZCBpcnEpCiAKIAlXQVJOX09OKGluZm8tPnJlZmNudCA+IDApOwogCi0Ja2ZyZWUo
aW5mbyk7CisJa2ZyZWVfcmN1KGluZm8sIHJjdSk7CiAKIAkvKiBMZWdhY3kgSVJRIGRlc2NyaXB0
b3JzIGFyZSBtYW5hZ2VkIGJ5IHRoZSBhcmNoLiAqLwogCWlmIChpcnEgPCBucl9sZWdhY3lfaXJx
cygpKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19pbnRlcm5hbC5oIGIv
ZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19pbnRlcm5hbC5oCmluZGV4IDgyOTM4Y2ZmNmM3YS4u
YzQyMTA1NTg0M2M4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2ludGVy
bmFsLmgKKysrIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19pbnRlcm5hbC5oCkBAIC03LDYg
KzcsOCBAQAogI2lmbmRlZiBfX0VWRU5UU19JTlRFUk5BTF9IX18KICNkZWZpbmUgX19FVkVOVFNf
SU5URVJOQUxfSF9fCiAKKyNpbmNsdWRlIDxsaW51eC9yY3VwZGF0ZS5oPgorCiAvKiBJbnRlcnJ1
cHQgdHlwZXMuICovCiBlbnVtIHhlbl9pcnFfdHlwZSB7CiAJSVJRVF9VTkJPVU5EID0gMCwKQEAg
LTMwLDYgKzMyLDcgQEAgZW51bSB4ZW5faXJxX3R5cGUgewogICovCiBzdHJ1Y3QgaXJxX2luZm8g
ewogCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKKwlzdHJ1Y3QgcmN1X2hlYWQgcmN1OwogCWludCBy
ZWZjbnQ7CiAJZW51bSB4ZW5faXJxX3R5cGUgdHlwZTsJLyogdHlwZSAqLwogCXVuc2lnbmVkIGly
cTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
