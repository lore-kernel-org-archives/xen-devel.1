Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B020CC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A06120854
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A06120854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAA-0006Bf-Vu; Wed, 10 Apr 2019 14:25:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEA9-0006BA-Na
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:17 +0000
X-Inumbo-ID: 76082131-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 76082131-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227654"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:09 +0100
Message-ID: <20190410142408.22848-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 03/62] ts-xen-build-prep: only install
 w3c-dtd-xhtml for suites <stretch
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
Cc: Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142309.a83-MFUGufYKxCM3Ikuy5-c1wggQftT2n8TuAB39v9g@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClRoYXQgcGFja2FnZSBpcyBub3Qg
aW5jbHVkZWQgaW4gc3RyZXRjaC4KClRoYXQgcGFja2FnZSB3YXMgaW5zdGFsbGVkIGJlY2F1c2Ug
dGhlIGxpYnZpcnQgYnVpbGQgbmVlZGVkIGl0LgpIb3dldmVyIGxpYnZpcnQgYnVpbGRzIGZpbmUg
d2l0aG91dCBpdCBpbiBzdHJldGNoLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgotLS0KIHRzLXhlbi1idWlsZC1wcmVwIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdHMteGVuLWJ1aWxk
LXByZXAgYi90cy14ZW4tYnVpbGQtcHJlcAppbmRleCAyM2JiYmViOS4uYTE1YWIzZGYgMTAwNzU1
Ci0tLSBhL3RzLXhlbi1idWlsZC1wcmVwCisrKyBiL3RzLXhlbi1idWlsZC1wcmVwCkBAIC0yMDYs
MTEgKzIwNiwxMyBAQCBzdWIgcHJlcCAoKSB7CiAgICAgICAgICAgICAgICAgICAgICAgbGliZ2xp
YjIuMC1kZXYgbGlibHptYS1kZXYgcGtnLWNvbmZpZwogICAgICAgICAgICAgICAgICAgICAgIGF1
dG9jb25mIGF1dG9tYWtlIGxpYnRvb2wgeHNsdHByb2MKICAgICAgICAgICAgICAgICAgICAgICBs
aWJ4bWwyLXV0aWxzIGxpYnhtbDItZGV2Ci0gICAgICAgICAgICAgICAgICAgICAgbGliZGV2bWFw
cGVyLWRldiB3M2MtZHRkLXhodG1sIGxpYnhtbC14cGF0aC1wZXJsCi0gICAgICAgICAgICAgICAg
ICAgICAgbGliZWxmLWRldgorICAgICAgICAgICAgICAgICAgICAgIGxpYmRldm1hcHBlci1kZXYg
bGlieG1sLXhwYXRoLXBlcmwgbGliZWxmLWRldgogICAgICAgICAgICAgICAgICAgICAgIGNjYWNo
ZSBuYXNtIGNoZWNrcG9saWN5IGVidGFibGVzCiAgICAgICAgICAgICAgICAgICAgICAgbGliZ251
dGxzMjgtZGV2KTsKIAorICAgIGlmICgkaG8tPntTdWl0ZX0gPX4gbS9zcXVlZXplfHdoZWV6eXxq
ZXNzaWUvKSB7CisJcHVzaChAcGFja2FnZXMsICJ3M2MtZHRkLXhodG1sIik7CisgICAgfQogICAg
IGlmICgkaG8tPntTdWl0ZX0gIX4gbS9zcXVlZXplfHdoZWV6eS8pIHsKIAlwdXNoKEBwYWNrYWdl
cywgcXcob2NhbWwtbm94IG9jYW1sLWZpbmRsaWIpKTsKICAgICB9Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
