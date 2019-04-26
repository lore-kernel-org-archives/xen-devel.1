Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA71C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6750120693
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6750120693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3uj-00086J-Pb; Fri, 26 Apr 2019 16:41:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3ui-00085j-Rd
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:28 +0000
X-Inumbo-ID: 221a9250-6842-11e9-8fdb-bf422ca13659
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 221a9250-6842-11e9-8fdb-bf422ca13659;
 Fri, 26 Apr 2019 16:41:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,398,1549929600"; d="scan'208";a="84519685"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Apr 2019 17:39:52 +0100
Message-ID: <20190426164002.22381-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 05/15] arch replumbing:
 ts-debian-di-install: Remove unidiomatic { }
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
Message-ID: <20190426163952.W2EtYiTxDm9sXOaff7KfvN8dPtN8Y7fmnFbg1AfmeF0@z>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1kZWJpYW4tZGktaW5zdGFsbCB8IDQgKystLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS90cy1kZWJpYW4tZGktaW5zdGFsbCBiL3RzLWRlYmlhbi1kaS1pbnN0YWxsCmluZGV4IDM2
MWExNzEwLi41Y2IzZDM1ZCAxMDA3NTUKLS0tIGEvdHMtZGViaWFuLWRpLWluc3RhbGwKKysrIGIv
dHMtZGViaWFuLWRpLWluc3RhbGwKQEAgLTE1MiwxMCArMTUyLDEwIEBAIHN1YiBzZXR1cF9uZXRi
b290KCQkJCkKIAlkaWUgaWYgJHJ7ICIkZ2hvLT57R3Vlc3R9X25ldGJvb3Rfa2VybmVsIiB9CiAJ
fHwgICAgICRyeyAiJGdoby0+e0d1ZXN0fV9uZXRib290X3JhbWRpc2siIH07CiAKLQlteSAkZGlf
cGF0aCA9ICRje1RmdHBQYXRofS4nLycuJGdoby0+e1RmdHB9e0RpQmFzZX0uJy8nLiR7YXJjaH0u
Jy8nLgorCW15ICRkaV9wYXRoID0gJGN7VGZ0cFBhdGh9LicvJy4kZ2hvLT57VGZ0cH17RGlCYXNl
fS4nLycuJGFyY2guJy8nLgogCSAgICBkZWJpYW5fZ3Vlc3RfZGlfdmVyc2lvbigkZ2hvKS4nLScu
JGdoby0+e1N1aXRlfTsKIAotICAgICAgICBpZiAoJHthcmNofSA9fiBtL2FtZDY0fGkzODYvKSB7
CisgICAgICAgIGlmICgkYXJjaCA9fiBtL2FtZDY0fGkzODYvKSB7CiAJICAgICRrZXJuZWwgPSAi
JGRpX3BhdGgvdm1saW51ei14ZW4iOwogCSAgICAkcmFtZGlzayA9ICIkZGlfcGF0aC9pbml0cmQu
Z3oteGVuIjsKICAgICAgICAgfSBlbHNlIHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
