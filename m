Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F67C282CE
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 17:58:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319462063F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 17:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 319462063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCT6k-0000hF-Cd; Fri, 05 Apr 2019 17:58:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8q43=SH=citrix.com=prvs=991ec766c=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hCT6i-0000gk-PW
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 17:58:28 +0000
X-Inumbo-ID: 68b611c0-57cc-11e9-87db-27c1fe9a8105
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68b611c0-57cc-11e9-87db-27c1fe9a8105;
 Fri, 05 Apr 2019 17:58:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,313,1549929600"; d="scan'208";a="82881078"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 5 Apr 2019 18:58:08 +0100
Message-ID: <20190405175811.7446-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] Some cleanup of device_add_domain_config
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405175808.-yX-8fKr-q6bBsSYGRVFvmgYHrngyvrlKO2bXsfzpkA@z>

RG9jdW1lbnRhdGlvbiBvZiBkZXZpY2VfYWRkX2RvbWFpbl9jb25maWcgYW5kIGNvbnN0aWZ5IGBz
cmMnLgoKQW50aG9ueSBQRVJBUkQgKDMpOgogIGxpYnhsOiBDb25zdGlmeSBsaWJ4bF9kZXZpY2Vf
Kl9jb21wYXJlIGZ1bmN0aW9ucwogIGxpYnhsOiBDb25zdGlmeSBzcmMgb2YgZGV2aWNlX2NvbXBh
cmVfZm5fdAogIGxpYnhsOiBEb2N1bWVudCBkZXZpY2VfYWRkX2RvbWFpbl9jb25maWcKCiB0b29s
cy9saWJ4bC9saWJ4bF9kZXZpY2UuYyAgIHwgIDYgKysrLS0tCiB0b29scy9saWJ4bC9saWJ4bF9k
aXNrLmMgICAgIHwgIDQgKystLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8IDE5ICsr
KysrKysrKysrKysrKystLS0KIHRvb2xzL2xpYnhsL2xpYnhsX25pYy5jICAgICAgfCAgNCArKy0t
CiB0b29scy9saWJ4bC9saWJ4bF9wY2kuYyAgICAgIHwgIDQgKystLQogdG9vbHMvbGlieGwvbGli
eGxfdXNiLmMgICAgICB8ICA4ICsrKystLS0tCiB0b29scy9saWJ4bC9saWJ4bF92ZGlzcGwuYyAg
IHwgIDQgKystLQogdG9vbHMvbGlieGwvbGlieGxfdnNuZC5jICAgICB8ICA0ICsrLS0KIHRvb2xz
L2xpYnhsL2xpYnhsX3Z0cG0uYyAgICAgfCAgNCArKy0tCiA5IGZpbGVzIGNoYW5nZWQsIDM1IGlu
c2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
