Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80241C10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 11:38:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55D662077C
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 11:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55D662077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hItkq-0003FN-QU; Tue, 23 Apr 2019 11:38:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6DT4=SZ=citrix.com=prvs=009047f5f=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hItkp-0003FH-DA
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 11:38:27 +0000
X-Inumbo-ID: 4ec2caf5-65bc-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4ec2caf5-65bc-11e9-92d7-bc764e045a96;
 Tue, 23 Apr 2019 11:38:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,385,1549929600"; d="scan'208";a="84177968"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 23 Apr 2019 12:37:58 +0100
Message-ID: <1556019478-10835-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/mtrr: recalculate P2M type for domains with
 iocaps
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
Cc: andrew.cooper3@citrix.com, Igor Druzhinin <igor.druzhinin@citrix.com>,
 wei.liu2@citrix.com, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423113758.5rTyKheFaUXQS6bEt1KjJaZJFZH-IzLEgwrDlAVb0Mc@z>

VGhpcyBjaGFuZ2UgcmVmbGVjdHMgdGhlIGxvZ2ljIGluIGVwdGVfZ2V0X2VudHJ5X2VtdCgpIGFu
ZCBhbGxvd3MKY2hhbmdlcyBpbiBndWVzdCBNVFRScyB0byBiZSByZWZsZWN0ZWQgaW4gRVBUIGZv
ciBkb21haW5zIGhhdmluZwpkaXJlY3QgYWNjZXNzIHRvIGNlcnRhaW4gaGFyZHdhcmUgbWVtb3J5
IHJlZ2lvbnMgYnV0IHdpdGhvdXQgSU9NTVUKY29udGV4dCBhc3NpZ25lZCAoZS5nLiBYZW5HVCku
CgpTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNv
bT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL210cnIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9o
dm0vbXRyci5jIGIveGVuL2FyY2gveDg2L2h2bS9tdHJyLmMKaW5kZXggYjhmYTM0MC4uN2NjZDg1
YiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9tdHJyLmMKKysrIGIveGVuL2FyY2gveDg2
L2h2bS9tdHJyLmMKQEAgLTc4Myw3ICs3ODMsNyBAQCBIVk1fUkVHSVNURVJfU0FWRV9SRVNUT1JF
KE1UUlIsIGh2bV9zYXZlX210cnJfbXNyLCBodm1fbG9hZF9tdHJyX21zciwgMSwKIAogdm9pZCBt
ZW1vcnlfdHlwZV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKmQpCiB7Ci0gICAgaWYgKCBoYXNfaW9t
bXVfcHQoZCkgJiYgZC0+dmNwdSAmJiBkLT52Y3B1WzBdICkKKyAgICBpZiAoIChoYXNfaW9tbXVf
cHQoZCkgfHwgY2FjaGVfZmx1c2hfcGVybWl0dGVkKGQpKSAmJiBkLT52Y3B1ICYmIGQtPnZjcHVb
MF0gKQogICAgIHsKICAgICAgICAgcDJtX21lbW9yeV90eXBlX2NoYW5nZWQoZCk7CiAgICAgICAg
IGZsdXNoX2FsbChGTFVTSF9DQUNIRSk7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
