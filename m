Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2333C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:38:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79809217D7
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 16:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79809217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGnZS-0005B1-0g; Wed, 17 Apr 2019 16:38:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fEre=ST=citrix.com=prvs=0036fbe7a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hGnZQ-0005Am-N6
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 16:38:00 +0000
X-Inumbo-ID: 293b37d4-612f-11e9-a0a2-f711f683e99a
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 293b37d4-612f-11e9-a0a2-f711f683e99a;
 Wed, 17 Apr 2019 16:37:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,362,1549929600"; d="scan'208";a="83816806"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 17 Apr 2019 17:37:50 +0100
Message-ID: <20190417163752.994-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190417163752.994-1-ian.jackson@eu.citrix.com>
References: <20190417163752.994-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 3/5] ts-debian-hvm-install: Use ---,
 and no longer duplicate $gconsole
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417163750.SJhuVAMPvCZkjAn5NiJ4ZC169flEE-TS-SwTxdFREiA@z>

SW4gT2N0b2JlciAyMDE0LCBkZWJpYW4taW5zdGFsbGVyIHdhcyB1cGRhdGVkIHRvIGhvbm91ciBg
LS0tJyBpbiB0aGUKd2F5IGl0IHByZXZpb3VzbHkgaG9ub3VyZWQgYC0tJzogIzc2MjAwNy4gIElm
IHdlIHVzZSB0aGF0IGluc3RlYWQsCndlIGRvbid0IG5lZWQgdG8gZHVwbGljYXRlICRnY29uc29s
ZSBhbnkgbW9yZS4KClRoaXMsIGVmZmVjdGl2ZWx5LCByZXZlcnRzCiAgZGIyNmY1ODI1YTIxMjY5
ZDkyMTg0MTdhOWNhNDBiYzVkNDc3NTVkMgogIHRzLWhvc3QtaW5zdGFsbDogaW5jbHVkZSBjb25z
b2xlIGJlZm9yZSAqYW5kKiBhZnRlciB0aGUgLS0gbWFya2VyLgoKSW4gcHJpbmNpcGxlIHRoaXMg
b3VnaHQgdG8gYmUgY2hhbmdlZCBvbmx5IGluICJyZWNlbnQgZW5vdWdoIiBEZWJpYW4Kc3VpdGVz
LCBidXQgY2VydGFpbmx5IGF0IGxlYXN0IGplc3NpZSBoYXMgdGhlIGZpeCBhbmQgamVzc2llIGlz
IHF1aXRlCmJyb2tlbiBub3csIHNvIGxldCdzIG5vdCBib3RoZXIgd2l0aCBtYWtpbmcgaXQgY29u
ZGl0aW9uYWwuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0
cml4LmNvbT4KLS0tCiB0cy1kZWJpYW4taHZtLWluc3RhbGwgfCA2ICsrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90cy1k
ZWJpYW4taHZtLWluc3RhbGwgYi90cy1kZWJpYW4taHZtLWluc3RhbGwKaW5kZXggZWQ4ODAzZWQu
LmEwMWNmYjJiIDEwMDc1NQotLS0gYS90cy1kZWJpYW4taHZtLWluc3RhbGwKKysrIGIvdHMtZGVi
aWFuLWh2bS1pbnN0YWxsCkBAIC0xMjQsNyArMTI0LDYgQEAgc3ViIGdjbWRsaW5lICg7JCkgewog
ICAgIG15IEBkaWNtZGxpbmUgPSAoKTsKICAgICBteSAkZ2NvbnNvbGUgPSAiY29uc29sZT10dHlT
MCwxMTUyMDBuOCI7CiAKLSAgICBwdXNoIEBkaWNtZGxpbmUsICRnY29uc29sZTsKICAgICBwdXNo
IEBkaWNtZGxpbmUsIGRpX2luc3RhbGxjbWRsaW5lX2NvcmUoJGdobywgJy9wcmVzZWVkLmNmZycs
CiAJCQkJCSAgICBQcmVzZWVkU2NoZW1lID0+ICdmaWxlJyk7CiAgICAgcHVzaCBAZGljbWRsaW5l
LCAkZXh0cmEgaWYgJGV4dHJhOwpAQCAtMTMyLDkgKzEzMSw4IEBAIHN1YiBnY21kbGluZSAoOyQp
IHsKICAgICBteSAkYXBwZW5kID0gdGFyZ2V0X3ZhcigkZ2hvLCdsaW51eF9ib290X2FwcGVuZCcp
OwogICAgIHB1c2ggQGRpY21kbGluZSwgJGFwcGVuZCBpZiAkYXBwZW5kOwogCi0gICAgcHVzaCBA
ZGljbWRsaW5lLCAiLS0iOwotICAgICMgU2VlIGh0dHBzOi8vYnVncy5kZWJpYW4ub3JnL2NnaS1i
aW4vYnVncmVwb3J0LmNnaT9idWc9NzYyMDA3IGZvcgotICAgICMgd2h5IGNvbnNvbGU9IGlzIHJl
cGVhdGVkLgorICAgIHB1c2ggQGRpY21kbGluZSwgIi0tLSI7CisKICAgICBwdXNoIEBkaWNtZGxp
bmUsICRnY29uc29sZTsKIAogICAgIHJldHVybiBqb2luKCIgIiwgQGRpY21kbGluZSk7Ci0tIAoy
LjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
