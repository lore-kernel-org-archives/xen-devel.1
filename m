Return-Path: <SRS0=yIb1=E5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C840EC2D0E4
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 17:40:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67C8D2072C
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2020 17:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67C8D2072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.34917.66192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFoS-0005QB-2G; Mon, 23 Nov 2020 17:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34917.66192; Mon, 23 Nov 2020 17:39:40 +0000
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
	id 1khFoR-0005Q4-VM; Mon, 23 Nov 2020 17:39:39 +0000
Received: by outflank-mailman (input) for mailman id 34917;
 Mon, 23 Nov 2020 17:39:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzqB=E5=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1khFoQ-0005Pz-Pv
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:39:38 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c572b9d5-6aa0-4e8c-b6d4-b7a3602bc39a;
 Mon, 23 Nov 2020 17:39:37 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ANHdUO4021625
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Mon, 23 Nov 2020 18:39:31 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id A28602E9CAC; Mon, 23 Nov 2020 18:39:25 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MzqB=E5=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1khFoQ-0005Pz-Pv
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:39:38 +0000
X-Inumbo-ID: c572b9d5-6aa0-4e8c-b6d4-b7a3602bc39a
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c572b9d5-6aa0-4e8c-b6d4-b7a3602bc39a;
	Mon, 23 Nov 2020 17:39:37 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ANHdUO4021625
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2020 18:39:31 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id A28602E9CAC; Mon, 23 Nov 2020 18:39:25 +0100 (MET)
Date: Mon, 23 Nov 2020 18:39:25 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201123173925.GG4662@antioche.eu.org>
References: <20201120085249.GA1508@antioche.eu.org>
 <97f371a9-00fe-33fe-8923-c247f44f9af6@suse.com>
 <20201120092754.GH1508@antioche.eu.org>
 <20904a6a-ac64-755d-d228-4c49faf66fb5@suse.com>
 <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 23 Nov 2020 18:39:32 +0100 (MET)

On Mon, Nov 23, 2020 at 06:06:10PM +0100, Roger Pau Monné wrote:
> OK, I'm afraid this is likely too verbose and messes with the timings.
> 
> I've been looking (again) into the code, and I found something weird
> that I think could be related to the issue you are seeing, but haven't
> managed to try to boot the NetBSD kernel provided in order to assert
> whether it solves the issue or not (or even whether I'm able to
> repro it). Would you mind giving the patch below a try?

With this, I get the same hang but XEN outputs don't wake up the interrupt
any more. The NetBSD counter shows only one interrupt for ioapic2 pin 2,
while I would have about 8 at the time of the hang.

So, now it looks like interrupts are blocked forever. At
http://www-soc.lip6.fr/~bouyer/xen-log5.txt
you'll find the output of the 'i' key.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

