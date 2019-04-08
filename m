Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE65BC282CE
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 04:45:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A4C620883
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 04:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A4C620883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDM9g-0001pQ-76; Mon, 08 Apr 2019 04:45:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SmQj=SK=zhaoxin.com=fionali-oc@srs-us1.protection.inumbo.net>)
 id 1hDKE1-0000i2-GQ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 02:41:33 +0000
X-Inumbo-ID: cdc2f632-59a7-11e9-b55b-dfed27b88b9f
Received: from ZXSHCAS1.zhaoxin.com (unknown [203.148.12.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdc2f632-59a7-11e9-b55b-dfed27b88b9f;
 Mon, 08 Apr 2019 02:41:28 +0000 (UTC)
Received: from zxbjmbx1.zhaoxin.com (10.29.252.163) by ZXSHCAS1.zhaoxin.com
 (10.28.252.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Mon, 8 Apr
 2019 10:41:20 +0800
Received: from localhost.localdomain (10.29.8.62) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Mon, 8 Apr
 2019 10:41:20 +0800
From: FionaLi-oc <fionali-oc@zhaoxin.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 8 Apr 2019 10:40:46 +0800
Message-ID: <1554691246-7249-1-git-send-email-fionali-oc@zhaoxin.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.29.8.62]
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 zxbjmbx1.zhaoxin.com (10.29.252.163)
X-Mailman-Approved-At: Mon, 08 Apr 2019 04:45:11 +0000
Subject: [Xen-devel] [PATCH] cpupool: fix ASSERT( c != old_pool )
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
Cc: jgross@suse.com, cobechen@zhaoxin.com, FionaLi-oc <fionali-oc@zhaoxin.com>,
 dfaggioli@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408024046.NqD-YINyioMk0Jq2jIXWMJM82Vht82iHTZ28TgJhm8w@z>

QXNzaWduaW5nIGNwdSB0byBjcHVwb29sIG5lZWRuJ3QgdG8gc3dpdGNoIGNwdSBzY2hlZHVsZXIg
d2hlbgpzeXN0ZW0gc3RhdGUgaXMgcmVzdW1lLCBvdGhlcndpc2UgaXQgd2lsbCBjYXVzZSBBU1NF
UlQgaW4Kc2NoZWR1bGVfY3B1X3N3aXRjaCgpLgoKU2lnbmVkLW9mZi1ieTogRmlvbmFMaS1vYyA8
ZmlvbmFsaS1vY0B6aGFveGluLmNvbT4KLS0tCiB4ZW4vY29tbW9uL2NwdXBvb2wuYyB8IDEwICsr
KysrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9jcHVwb29sLmMgYi94ZW4vY29tbW9uL2NwdXBvb2wu
YwppbmRleCBlODliYjY3Li5hY2M0YTUyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2NwdXBvb2wu
YworKysgYi94ZW4vY29tbW9uL2NwdXBvb2wuYwpAQCAtMjY4LDkgKzI2OCwxMyBAQCBzdGF0aWMg
aW50IGNwdXBvb2xfYXNzaWduX2NwdV9sb2NrZWQoc3RydWN0IGNwdXBvb2wgKmMsIHVuc2lnbmVk
IGludCBjcHUpCiAKICAgICBpZiAoIChjcHVwb29sX21vdmluZ19jcHUgPT0gY3B1KSAmJiAoYyAh
PSBjcHVwb29sX2NwdV9tb3ZpbmcpICkKICAgICAgICAgcmV0dXJuIC1FQUREUk5PVEFWQUlMOwot
ICAgIHJldCA9IHNjaGVkdWxlX2NwdV9zd2l0Y2goY3B1LCBjKTsKLSAgICBpZiAoIHJldCApCi0g
ICAgICAgIHJldHVybiByZXQ7CisKKyAgICBpZiggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9y
ZXN1bWUgKQorICAgIHsKKyAgICAgICAgcmV0ID0gc2NoZWR1bGVfY3B1X3N3aXRjaChjcHUsIGMp
OworICAgICAgICBpZiAoIHJldCApCisgICAgICAgICAgICByZXR1cm4gcmV0OworICAgIH0KIAog
ICAgIGNwdW1hc2tfY2xlYXJfY3B1KGNwdSwgJmNwdXBvb2xfZnJlZV9jcHVzKTsKICAgICBpZiAo
Y3B1cG9vbF9tb3ZpbmdfY3B1ID09IGNwdSkKLS0gCjEuOC4zLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
