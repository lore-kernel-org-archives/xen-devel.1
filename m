Return-Path: <SRS0=IlRI=X5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5791EC4360C
	for <xen-devel@archiver.kernel.org>; Fri,  4 Oct 2019 18:25:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ADAD215EA
	for <xen-devel@archiver.kernel.org>; Fri,  4 Oct 2019 18:25:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Daas7tnC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ADAD215EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGSGU-0004IP-Uo; Fri, 04 Oct 2019 18:25:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lq2G=X5=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1iGSGT-0004IK-L1
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 18:25:17 +0000
X-Inumbo-ID: 5065cc5e-e6d4-11e9-8c93-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5065cc5e-e6d4-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570213516;
 bh=hCJV6Cb9k1a8OM+r+Tfan49CvsXCBba1CExk57vZePQ=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Daas7tnC03wHKKLBfYuMzjQrox/zIgjqmFzy8fq2OzEsTFzoYO+ABgnLR1T+KQbeB
 2l1cI0L/CZk24VIdjmIkWorsPHj+ykN5SDQUfYPueFthXtfhI5zsI3uoA6+RDLdeIl
 GakbnvZPF9XGmqnO7c+XSdLQYd7DnGvs56jooeOk=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191004050520.7270-1-jgross@suse.com>
References: <20191004050520.7270-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191004050520.7270-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.4-rc2-tag
X-PR-Tracked-Commit-Id: a8fabb38525c51a094607768bac3ba46b3f4a9d5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 50dfd03d9579cde9150679e90f8f244c626b7a09
Message-Id: <157021351644.30669.7701403465634234565.pr-tracker-bot@kernel.org>
Date: Fri, 04 Oct 2019 18:25:16 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: fixes and cleanups for 5.4-rc2
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
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 torvalds@linux-foundation.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBGcmksICA0IE9jdCAyMDE5IDA3OjA1OjIwICsw
MjAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNC1yYzItdGFnCgpoYXMgYmVlbiBtZXJnZWQgaW50byB0b3J2
YWxkcy9saW51eC5naXQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvdG9ydmFsZHMvYy81MGRmZDAz
ZDk1NzljZGU5MTUwNjc5ZTkwZjhmMjQ0YzYyNmI3YTA5CgpUaGFuayB5b3UhCgotLSAKRGVldC1k
b290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLndpa2kua2VybmVsLm9yZy91c2VyZG9j
L3BydHJhY2tlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
