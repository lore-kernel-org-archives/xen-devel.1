Return-Path: <SRS0=UfNL=D5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E7AC4363A
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 17:09:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44E2624630
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 17:09:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.b="py3IxVqK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44E2624630
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10599.28288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVe5Y-0002Te-T4; Thu, 22 Oct 2020 17:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10599.28288; Thu, 22 Oct 2020 17:09:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVe5Y-0002TW-Oo; Thu, 22 Oct 2020 17:09:20 +0000
Received: by outflank-mailman (input) for mailman id 10599;
 Thu, 22 Oct 2020 17:09:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1kVe5X-0002Sc-OG
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:19 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7c8abf9-876c-4136-9dc3-beec4f6f91f0;
 Thu, 22 Oct 2020 17:09:19 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5W-0005tp-Ra
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:18 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1kVe5W-0005YD-Qs
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:18 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1kVdiH-00059e-L8; Thu, 22 Oct 2020 17:45:17 +0100
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A04T=D5=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
	id 1kVe5X-0002Sc-OG
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:19 +0000
X-Inumbo-ID: f7c8abf9-876c-4136-9dc3-beec4f6f91f0
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f7c8abf9-876c-4136-9dc3-beec4f6f91f0;
	Thu, 22 Oct 2020 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=4+xtJRn0orKXngPYVez9yveephWwMruvVYUsWR0keuQ=; b=py3IxVqKXg9Kv+dUjFAFRkctIc
	Wj6kWqyNdx0kCaXJ91JJgEPYIHeuk7JabmNx6RglGaFJYHoiDKSzzxJ+jeO5hP1rG3OAc6bnDnvdi
	iIHPAejtEEFoyaCgonCIJ5mppPTsAyyfw11YQ0lFBA/B6PY13LfXAE5fmzLbt/DHxIMU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5W-0005tp-Ra
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:18 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVe5W-0005YD-Qs
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 17:09:18 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <ijackson@chiark.greenend.org.uk>)
	id 1kVdiH-00059e-L8; Thu, 22 Oct 2020 17:45:17 +0100
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 16/16] starvation: Do not count more than half a flight as starved
Date: Thu, 22 Oct 2020 17:45:06 +0100
Message-Id: <20201022164506.1552-17-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201022164506.1552-1-iwj@xenproject.org>
References: <20201022164506.1552-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This seems like a sensible rule.

This also prevents the following bizarre behaviour: when a flight has
a handful of jobs that cannot be run at all (eg because it's a
commissioning flight for only hosts of a particular arch), those jobs
can complete quite quickly.  Even with a high X value because only a
smallish portion of the flight has finished, this can lead to a modest
threshhold value.  This combines particularly badly with commissioning
flights, where the duraation estimates are often nonsense.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 ts-hosts-allocate-Executive | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index b216186a..459b9215 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -863,7 +863,7 @@ sub starving ($$) {
 	"D=%d W=%d X=%.3f t_D=%s t_me=%s t_lim=%.3f X'=%.4f (fi.s=%s)",
 	$d, $w, $X, $total_d, $projected_me, $lim, $Xcmp,
 	$fi->{started} - $now;
-    my $bad = $projected_me > $lim;
+    my $bad = $projected_me > $lim && $d >= $w;
     return ($bad, $m);
 }
 
-- 
2.20.1


