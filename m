Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24427C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 09:57:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C31F123877
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 09:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C31F123877
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67865.121310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Lr4-0002vI-Fi; Fri, 15 Jan 2021 09:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67865.121310; Fri, 15 Jan 2021 09:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Lr4-0002vB-Ch; Fri, 15 Jan 2021 09:57:18 +0000
Received: by outflank-mailman (input) for mailman id 67865;
 Fri, 15 Jan 2021 09:57:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Lr3-0002v6-AV
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 09:57:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eeaff0d5-c17e-4265-9b8e-eeed4c03a8cc;
 Fri, 15 Jan 2021 09:57:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 942CBACF5;
 Fri, 15 Jan 2021 09:57:14 +0000 (UTC)
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
X-Inumbo-ID: eeaff0d5-c17e-4265-9b8e-eeed4c03a8cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610704634; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JV/7bcL/neSKnUBKp3f8KILWDQf7Q6+rbGW/zNehXEo=;
	b=mnJpMK3LQHoHCRbKd1X0+cP2hL3URUUO40x720V1V2VjQhyYqbr73ffSYR0+Kf7YEfSG+1
	kkEKA8gXYFxPGpGcBu0HQ3EA43tnbTmTJZuY9KhF7JB7TcvucwoCQS0A3Mod9BK2CIXUPu
	cylrs5TJ5NKjBWnwJ1w705NTS/SDqaU=
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
 <24576.27654.137226.608671@mariner.uk.xensource.com>
 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
 Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <867ee616-d808-0107-cbf4-82b7d296d0e6@suse.com>
Date: Fri, 15 Jan 2021 10:57:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.01.2021 20:02, Andrew Cooper wrote:
> Bugs:
> 
> 1) HPET/PIT issue on newer Intel systems.  This has had literally tens
> of reports across the devel and users mailing lists, and prevents Xen
> from booting at all on the past two generations of Intel laptop.  I've
> finally got a repro and posted a fix to the list, but still in progress.
> 
> 2) "scheduler broken" bugs.  We've had 4 or 5 reports of Xen not
> working, and very little investigation on whats going on.  Suspicion is
> that there might be two bugs, one with smt=0 on recent AMD hardware, and
> one more general "some workloads cause negative credit" and might or
> might not be specific to credit2 (debugging feedback differs - also
> might be 3 underlying issue).
> 
> All of these have had repeated bug reports.  I'd classify them as
> blockers, given the impact they're having on people.

3) Fallout from MSR handling behavioral change.

Jan

