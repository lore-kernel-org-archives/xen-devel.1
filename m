Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52282C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 02:24:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428052.1650761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8qAj-0007gQ-FD; Tue, 22 Sep 2026 02:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428052.1650761; Tue, 22 Sep 2026 02:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8qAj-0007gJ-CC; Tue, 22 Sep 2026 02:23:53 +0000
Received: by outflank-mailman (input) for mailman id 1428052;
 Tue, 22 Sep 2026 02:23:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sashal@kernel.org>) id 1x8qAi-0007gD-Pb
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 02:23:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8qAh-00E8PL-L2
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 04:23:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sashal@kernel.org>)
 id 6ab1e65e-8faa-0a2a0a5109dd-0a2a450cdbee-26
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 04:23:51 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sashal@kernel.org>)
 id 6ab1e6b6-f479-0a2a450c0019-ac6904fecc0c-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 04:23:51 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 67CA8600CB;
 Tue, 22 Sep 2026 02:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6B21F000FF;
 Tue, 22 Sep 2026 02:23:48 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790043829;
	bh=aT3WSQsjijWvUk3bgetXyUamJ9XvWlHmx7vZ7os7un8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hKKB/1C3uOnDztTuRZBpSndHcV/CYFBsxhOq0o8XdkWY3qE1c7b98xtaVX+vAYANG
	 zcCzllxjA2umT2xCRjwRacv+3UDVqE09H2wtsS2wNf6U4j/2tBNyNHGlFY702LKojn
	 F90c7qQt3DUlbjupiinYJlyNser2hzkwVl48m9q3VOrKDqMb8R6dqU0rdtPBfXS3G3
	 ojMs1TJyIpAEH6JNn7XOkj55Np/Lo9yyGHNcKlLXkGJmtUOXd4MTXM153gguPjgHcE
	 VZn8auKZa1V58AYvMNL5q+RGqlrLSbzNo4KnouZj0TuNLC14b639ZGpy/a/CzIG1e1
	 M/yGCgcWPhMcw==
From: Sasha Levin <sashal@kernel.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	regressions <regressions@lists.linux.dev>,
	linux-acpi <linux-acpi@vger.kernel.org>,
	linux-pm <linux-pm@vger.kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Stable <stable@vger.kernel.org>,
	Support TRINITY <support@trinity-net.com>
Subject: Re: [REGRESSION] ACPI processor/cpuidle change in 6.18.52 breaks bare-metal Xen dom0 boot
Date: Mon, 21 Sep 2026 22:23:38 -0400
Message-ID: <2026-09-21-daily-reply-0001-re-acpi-cpuidle-xen-dom0-6-18@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <1909296988.289641012.1790015372050.JavaMail.zimbra@trinity-net.com>
References: <1909296988.289641012.1790015372050.JavaMail.zimbra@trinity-net.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1790043831-038D5A5B-E767F415/0/0
X-purgate-type: clean
X-purgate-size: 299

> I will try testing 6.18.52 with commit 0089ce1c056a ("ACPI: processor:
> Update cpuidle driver check in __acpi_processor_start()") applied,
> instead of using my lifecycle revert.

Queued for 6.18, thanks.

Please still post the result of that test once you have it.

-- 
Thanks,
Sasha

