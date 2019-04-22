Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA877C282CE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C58F9214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C58F9214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8n-0004VE-Ae; Mon, 22 Apr 2019 16:50:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8m-0004T7-74
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:00 +0000
X-Inumbo-ID: aa743eac-651e-11e9-a8ce-1bd14de404b9
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id aa743eac-651e-11e9-a8ce-1bd14de404b9;
 Mon, 22 Apr 2019 16:49:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 519B015AB;
 Mon, 22 Apr 2019 09:49:59 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41F2E3F557;
 Mon, 22 Apr 2019 09:49:58 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:23 +0100
Message-Id: <20190422164937.21350-7-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 06/20] xen/arm: Remove parameter cpuid from
 start_xen
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422164923.BBnCzUKClJ2eghC_vfNzUSRKK3GwLdHf8vpcBnsH9ac@z>

VGhlIHBhcmFtZXRlciBjcHVpZCBpcyBub3QgdXNlZCBieSBzdGFydF94ZW4uIFNvIHJlbW92ZSBp
dC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0t
LQogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDEgLQogeGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUyB8IDEgLQogeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICB8IDMgKy0tCiAzIGZpbGVzIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCmluZGV4IGI3
MWQ3ZmIxMWQuLjlmNDBmYWNlOTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFk
LlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwpAQCAtNDQ4LDcgKzQ0OCw2IEBAIGxh
dW5jaDoKICAgICAgICAgdGVxICAgcjEyLCAjMAogICAgICAgICBtb3ZlcSByMCwgcjEwICAgICAg
ICAgICAgICAgIC8qIE1hcnNoYWwgYXJnczogLSBwaHlzX29mZnNldCAqLwogICAgICAgICBtb3Zl
cSByMSwgcjggICAgICAgICAgICAgICAgIC8qICAgICAgICAgICAgICAgLSBEVEIgYWRkcmVzcyAq
LwotICAgICAgICBtb3ZlcSByMiwgcjcgICAgICAgICAgICAgICAgIC8qICAgICAgICAgICAgICAg
LSBDUFUgSUQgKi8KICAgICAgICAgYmVxICAgc3RhcnRfeGVuICAgICAgICAgICAgICAvKiBhbmQg
ZGlzYXBwZWFyIGludG8gdGhlIGxhbmQgb2YgQyAqLwogICAgICAgICBiICAgICBzdGFydF9zZWNv
bmRhcnkgICAgICAgIC8qICh0byB0aGUgYXBwcm9wcmlhdGUgZW50cnkgcG9pbnQpICovCiAKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TCmluZGV4IGIyNjEyNmRlNTMuLmNiMzBkNmYyMmUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L2FybS9hcm02NC9oZWFkLlMKKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwpAQCAtNTg2
LDcgKzU4Niw2IEBAIGxhdW5jaDoKIAogICAgICAgICBtb3YgICB4MCwgeDIwICAgICAgICAgICAg
ICAgIC8qIE1hcnNoYWwgYXJnczogLSBwaHlzX29mZnNldCAqLwogICAgICAgICBtb3YgICB4MSwg
eDIxICAgICAgICAgICAgICAgIC8qICAgICAgICAgICAgICAgLSBGRFQgKi8KLSAgICAgICAgbW92
ICAgeDIsIHgyNCAgICAgICAgICAgICAgICAvKiAgICAgICAgICAgICAgIC0gQ1BVIElEICovCiAg
ICAgICAgIGIgICAgIHN0YXJ0X3hlbiAgICAgICAgICAgICAgLyogYW5kIGRpc2FwcGVhciBpbnRv
IHRoZSBsYW5kIG9mIEMgKi8KIDE6CiAgICAgICAgIGIgICAgIHN0YXJ0X3NlY29uZGFyeSAgICAg
ICAgLyogKHRvIHRoZSBhcHByb3ByaWF0ZSBlbnRyeSBwb2ludCkgKi8KZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKaW5kZXggY2NiMGYxODFl
YS4uNmRmYmJhMjkyNyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKKysrIGIveGVu
L2FyY2gvYXJtL3NldHVwLmMKQEAgLTcyOCw4ICs3MjgsNyBAQCBzaXplX3QgX19yZWFkX21vc3Rs
eSBkY2FjaGVfbGluZV9ieXRlczsKIAogLyogQyBlbnRyeSBwb2ludCBmb3IgYm9vdCBDUFUgKi8K
IHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQsCi0g
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmZHRfcGFkZHIsCi0gICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBjcHVpZCkKKyAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGZkdF9wYWRkcikKIHsKICAgICBzaXplX3QgZmR0X3NpemU7CiAgICAgaW50
IGNwdXMsIGk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
