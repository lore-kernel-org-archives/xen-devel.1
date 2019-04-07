Return-Path: <SRS0=0ivi=SJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F480C10F0E
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 16:15:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFC8C21900
	for <xen-devel@archiver.kernel.org>; Sun,  7 Apr 2019 16:15:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rs1BgOHs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFC8C21900
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDARr-0003tn-Lw; Sun, 07 Apr 2019 16:15:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FXpj=SJ=kernel.org=pr-tracker-bot@srs-us1.protection.inumbo.net>)
 id 1hDARp-0003ti-VT
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2019 16:15:10 +0000
X-Inumbo-ID: 4fe49011-5950-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4fe49011-5950-11e9-92d7-bc764e045a96;
 Sun, 07 Apr 2019 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554653708;
 bh=BvX0inf1Wv/FzVLyYreQ5OOCveLayEJrXQSUg+hQ1Is=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Rs1BgOHsXVTCoyIoPwrLWvHeG2q8p4KTaZcYyLJKYMUnD7C3iq8x7bSC35YKT/s5i
 8H6/ZsNC9j4NXmZ4jG44nytwCoyqq8IEPn8u0878nlp8en4xH3piGxxNhHjQ0qdP25
 2ITXdTs8lmj0l0AQ3BI3XYVBoSHHlnqYvU3db0Po=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190407145048.12116-1-jgross@suse.com>
References: <20190407145048.12116-1-jgross@suse.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190407145048.12116-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git
 for-linus-5.1b-rc4-tag
X-PR-Tracked-Commit-Id: 42d8644bd77dd2d747e004e367cb0c895a606f39
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b04689147085f5c8f47835d1c7e48203cba80d3
Message-Id: <155465370810.27442.14367897372448080375.pr-tracker-bot@kernel.org>
Date: Sun, 07 Apr 2019 16:15:08 +0000
To: Juergen Gross <jgross@suse.com>
Subject: Re: [Xen-devel] [GIT PULL] xen: fixes for 5.1-rc4
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

VGhlIHB1bGwgcmVxdWVzdCB5b3Ugc2VudCBvbiBTdW4sICA3IEFwciAyMDE5IDE2OjUwOjQ4ICsw
MjAwOgoKPiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGVu
L3RpcC5naXQgZm9yLWxpbnVzLTUuMWItcmM0LXRhZwoKaGFzIGJlZW4gbWVyZ2VkIGludG8gdG9y
dmFsZHMvbGludXguZ2l0OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvM2IwNDY4
OTE0NzA4NWY1YzhmNDc4MzVkMWM3ZTQ4MjAzY2JhODBkMwoKVGhhbmsgeW91IQoKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy53aWtpLmtlcm5lbC5vcmcvdXNlcmRv
Yy9wcnRyYWNrZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
