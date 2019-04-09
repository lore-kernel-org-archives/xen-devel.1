Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE99C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4AD920883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 11:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4AD920883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDoux-0000PK-Lt; Tue, 09 Apr 2019 11:27:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yc4=SL=citrix.com=prvs=99536ed25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hDouv-0000N8-VP
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 11:27:53 +0000
X-Inumbo-ID: 835ba94c-5aba-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 835ba94c-5aba-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 11:27:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83096426"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 9 Apr 2019 12:08:43 +0100
Message-ID: <20190409110844.14746-31-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190409110844.14746-1-anthony.perard@citrix.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 30/31] OvmfPkg: Move XenRealTimeClockLib from
 ArmVirtPkg
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409110843.dPwTpQKnAWSYlMMqHlZAYGMKxhkcm55rfAJRwF5t6Rc@z>

U28gaXQgY2FuIGJlIHVzZWQgZnJvbSB0aGUgT3ZtZlBrZyBieSB0aGUgZm9sbG93aW5nIHBhdGNo
LAoiT3ZtZlBrZy9YZW5Pdm1mOiB1c2UgUmVhbFRpbWVDbG9ja1J1bnRpbWVEeGUgZnJvbSBFbWJl
ZGRlZFBrZyIKCkNvbnRyaWJ1dGVkLXVuZGVyOiBUaWFub0NvcmUgQ29udHJpYnV0aW9uIEFncmVl
bWVudCAxLjEKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Ci0tLQogQXJtVmlydFBrZy9Bcm1WaXJ0WGVuLmRzYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQoge0FybVZpcnRQa2cgPT4g
T3ZtZlBrZ30vTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIu
aW5mIHwgMAoge0FybVZpcnRQa2cgPT4gT3ZtZlBrZ30vTGlicmFyeS9YZW5SZWFsVGltZUNsb2Nr
TGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuYyAgIHwgMAogMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0FybVZpcnRQa2cvQXJtVmlydFhl
bi5kc2MgYi9Bcm1WaXJ0UGtnL0FybVZpcnRYZW4uZHNjCmluZGV4IGEzNjg4YWUyY2IuLmQ1ZDhk
Nzk1NjEgMTAwNjQ0Ci0tLSBhL0FybVZpcnRQa2cvQXJtVmlydFhlbi5kc2MKKysrIGIvQXJtVmly
dFBrZy9Bcm1WaXJ0WGVuLmRzYwpAQCAtMzMsNyArMzMsNyBAQCBbRGVmaW5lc10KIAogW0xpYnJh
cnlDbGFzc2VzXQogICBTZXJpYWxQb3J0TGlifE92bWZQa2cvTGlicmFyeS9YZW5Db25zb2xlU2Vy
aWFsUG9ydExpYi9YZW5Db25zb2xlU2VyaWFsUG9ydExpYi5pbmYKLSAgUmVhbFRpbWVDbG9ja0xp
YnxBcm1WaXJ0UGtnL0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2Nr
TGliLmluZgorICBSZWFsVGltZUNsb2NrTGlifE92bWZQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNs
b2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuaW5mCiAgIFhlbkh5cGVyY2FsbExpYnxPdm1mUGtn
L0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliL1hlbkh5cGVyY2FsbExpYi5pbmYKIAogICBBcm1HZW5l
cmljVGltZXJDb3VudGVyTGlifEFybVZpcnRQa2cvTGlicmFyeS9YZW5Bcm1HZW5lcmljVGltZXJW
aXJ0Q291bnRlckxpYi9YZW5Bcm1HZW5lcmljVGltZXJWaXJ0Q291bnRlckxpYi5pbmYKZGlmZiAt
LWdpdCBhL0FybVZpcnRQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1l
Q2xvY2tMaWIuaW5mIGIvT3ZtZlBrZy9MaWJyYXJ5L1hlblJlYWxUaW1lQ2xvY2tMaWIvWGVuUmVh
bFRpbWVDbG9ja0xpYi5pbmYKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIEFybVZp
cnRQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuaW5m
CnJlbmFtZSB0byBPdm1mUGtnL0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGlt
ZUNsb2NrTGliLmluZgpkaWZmIC0tZ2l0IGEvQXJtVmlydFBrZy9MaWJyYXJ5L1hlblJlYWxUaW1l
Q2xvY2tMaWIvWGVuUmVhbFRpbWVDbG9ja0xpYi5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1hlblJlYWxU
aW1lQ2xvY2tMaWIvWGVuUmVhbFRpbWVDbG9ja0xpYi5jCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpy
ZW5hbWUgZnJvbSBBcm1WaXJ0UGtnL0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFs
VGltZUNsb2NrTGliLmMKcmVuYW1lIHRvIE92bWZQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2Nr
TGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuYwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
