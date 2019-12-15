Return-Path: <SRS0=QeIC=2F=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B0AC43603
	for <xen-devel@archiver.kernel.org>; Sun, 15 Dec 2019 20:50:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC1324679
	for <xen-devel@archiver.kernel.org>; Sun, 15 Dec 2019 20:50:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5fjacCz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AC1324679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igaqG-0006yW-3f; Sun, 15 Dec 2019 20:50:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MHOh=2F=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1igaqE-0006yN-Ni
 for xen-devel@lists.xenproject.org; Sun, 15 Dec 2019 20:50:14 +0000
X-Inumbo-ID: 7e028e64-1f7c-11ea-92f5-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e028e64-1f7c-11ea-92f5-12813bfff9fa;
 Sun, 15 Dec 2019 20:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576443013;
 bh=6Z8yQdJnOVQ2X3mpzz/zcvCviOftFYhSn6AXQxoO2L8=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=K5fjacCzDlc2uvqOVPWaHuSP1CTyZVtGN5MjVJ3+jwXQbXGnGwadNbBfs4N1IPNgu
 9MjoVVDkHFBe5Qb33dShzHvTccy7fTYH/f0gz9y12CN7HAUSqJe/IJkOs6nQrr5uil
 /6BDEkXcV2MilY0IjWcXa4EHll62qldPm1oRDOE4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191215060621.8328-1-jgross@suse.com>
References: <20191215060621.8328-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191215060621.8328-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.5b-rc2-tag
X-PR-Tracked-Commit-Id: c673ec61ade89bf2f417960f986bc25671762efb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b01d7cb41ff51b7779977de601a984406e2a5ba9
Message-Id: <157644301359.32474.2901429395998550786.pr-tracker-bot@kernel.org>
Date: Sun, 15 Dec 2019 20:50:13 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: branch for v5.5-rc2
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTdW4sIDE1IERlYyAyMDE5IDA3OjA2OjIxICsw
MTAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuNWItcmMyLXRhZwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9y
dmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvYjAxZDdj
YjQxZmY1MWI3Nzc5OTc3ZGU2MDFhOTg0NDA2ZTJhNWJhOQoKVGhhbmsgeW91IQoKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRv
Yy9wcnRyYWNrZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
