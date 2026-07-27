Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EC5C53219
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 08:44:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371469.1618973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woGw9-0002nf-7P; Mon, 27 Jul 2026 08:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371469.1618973; Mon, 27 Jul 2026 08:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woGw9-0002nX-4Q; Mon, 27 Jul 2026 08:43:49 +0000
Received: by outflank-mailman (input) for mailman id 1371469;
 Mon, 27 Jul 2026 08:43:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <regressions@leemhuis.info>) id 1woGw6-0002nP-SR
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 08:43:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woGw5-007KKS-Rq
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:43:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <regressions@leemhuis.info>)
 id 6a671a3f-2eae-0a2a0a5409dd-0a2a4508e9cc-6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 10:43:44 +0200
Received: from [188.68.61.103] (helo=relay.yourmailgateway.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <regressions@leemhuis.info>)
 id 6a671a40-f659-0a2a45080019-bc443d67c9b5-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 10:43:44 +0200
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4h7sXz5wWlz85yT;
 Mon, 27 Jul 2026 10:42:27 +0200 (CEST)
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4h7sXz5CtLz85yB;
 Mon, 27 Jul 2026 10:42:27 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h7sXy24Yzz8sch;
 Mon, 27 Jul 2026 10:42:26 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id 851D35FBA6;
 Mon, 27 Jul 2026 10:42:25 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=key2 header.d=leemhuis.info header.i="@leemhuis.info" header.h="Date:From:To:Cc:Subject"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785141747;
	bh=dg2PdX38sKrE/AgiN98q4bIDUpM5WsUPGpi34yki+0w=;
	h=Date:From:To:Cc:Subject:From;
	b=fWHg+giyCHnqiclmqOW/FRjJRYDY/7x6tQEUjJ1iy/f/uF1vK7f34hyYdBjWdzb1j
	 5Tc+5V4m4CVP+AtoIQWkLSkzjvRgnDS4Unr5wpPq1ggsJLfdFjLG8GOoOoYAFKlxcH
	 wH1dfD4KC/q8Pikf+CB9PtvuygoFutPZsKNyIxfh1zy+mlajPYfsNLHxySnuDJ0n1o
	 lkeHdlmfj37+Ymv2UN8vWan+WLzTDQIIaOp2oxqnsXkuCiEItqER7P514q3ZZ28gnS
	 Gmkim0v3caz6OlMwFqTwOAwqXNaATXnIYbobJEzaC3B3wYNCrF5yX3FkLoIXcRArEb
	 FLxNuQwmpl4Ug==
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f7fe5959-f0c6-430c-8404-927d7944c836@leemhuis.info>
Date: Mon, 27 Jul 2026 10:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 yannick.martin+kernelorg@okazoo.eu
Subject: [regression] Bug 221745 - PV DomU ballooning driver init issue
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178514174583.976006.15917720183139081453@mxe9fb.netcup.net>
X-NC-CID: fBr7XczVS2ya6Qqy17DIK86+ueCERFBW/JVA7MLO2EUsYNBv5Og=
X-purgate-ID: tlsNG-c1860d/1785141824-D755C87B-2B978668/0/0
X-purgate-type: clean
X-purgate-size: 1619

Hi Roger! FYI, it seems your change 0949c646d64697 ("Partial revert
"x86/xen: fix balloon target initialization for PVH dom0"") [v7.0-rc1]
caued a regression. For details see
https://bugzilla.kernel.org/show_bug.cgi?id=221745

To quote the initial comment:

> Since commit db8c4b1 (Partial revert "x86/xen: fix balloon target initialization for PVH dom0"), xen ballooning fails to init correctly on domU (on amd64 arch) with the following configuration:
> 
> -- xl.cfg
> ...
> memory      = '2048'
> maxmem      = '4096'
> ...
> --
> 
> -- domU balloon dmesg (init fails)
> [    0.908337] xen:balloon: Initialising balloon driver
> [    0.940721] Extra pages underflow current target
> --

db8c4b1 is the backport of the commit to 6.12.y; the reporter (CCed) in
a later comment to the bug tracker confirmed that the problem happens
with 7.2.0-rc3, too, and also stated:

> The dmesg by itself is not relevant except:
> [    1.105207] xen:balloon: Initialising balloon driver
> [    1.222758] ------------[ cut here ]------------
> [    1.222790] Extra pages underflow current target
> [    1.222792] WARNING: at 0xffffffff8252a424, CPU#1: swapper/0/1
> 
> init exits on ERANGE handling:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/xen/balloon.c?h=v7.2-rc4#n772
> 
> because of ERANGE:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/xen/balloon.c?h=v7.2-rc4#n714
> 
> kernel thread xen-balloon does not exist on VM with kernel newer than 6.12.75 (on 6.12 branch) where the patch was merged.

Ciao, Thorsten

