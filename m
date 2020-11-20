Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3BCC63777
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 08:53:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB26322253
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 08:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB26322253
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31757.62404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2AD-0006bP-RW; Fri, 20 Nov 2020 08:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31757.62404; Fri, 20 Nov 2020 08:53:05 +0000
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
	id 1kg2AD-0006bI-Ne; Fri, 20 Nov 2020 08:53:05 +0000
Received: by outflank-mailman (input) for mailman id 31757;
 Fri, 20 Nov 2020 08:53:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GrQD=E2=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kg2AC-0006bC-EJ
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:53:04 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d767c42-fd55-44c6-bd1a-6a07adcf4f25;
 Fri, 20 Nov 2020 08:53:03 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AK8qs0H019108
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 09:52:55 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id C0BEC2E9CA8; Fri, 20 Nov 2020 09:52:49 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GrQD=E2=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kg2AC-0006bC-EJ
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 08:53:04 +0000
X-Inumbo-ID: 7d767c42-fd55-44c6-bd1a-6a07adcf4f25
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7d767c42-fd55-44c6-bd1a-6a07adcf4f25;
	Fri, 20 Nov 2020 08:53:03 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AK8qs0H019108
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2020 09:52:55 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id C0BEC2E9CA8; Fri, 20 Nov 2020 09:52:49 +0100 (MET)
Date: Fri, 20 Nov 2020 09:52:49 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201120085249.GA1508@antioche.eu.org>
References: <20201118100025.ic7r3kfsbdnr6muz@Air-de-Roger>
 <20201118121403.GC3126@antioche.eu.org>
 <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
 <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
 <20201119141915.igyb7djkw47rf2dt@Air-de-Roger>
 <20201119155718.GB4104@antioche.eu.org>
 <20201119165734.GA4903@antioche.eu.org>
 <20201119175733.GA6067@antioche.eu.org>
 <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
 <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 20 Nov 2020 09:52:56 +0100 (MET)

On Fri, Nov 20, 2020 at 09:28:55AM +0100, Roger Pau Monné wrote:
> > i.e. at that point we're waiting for Dom0 to signal it's done handling
> > the IRQ. There is, however, a timer associated with this. Yet that's
> > actually to prevent the system getting stuck, i.e. the "in-flight"
> > state ought to clear 1ms later (when that timer expires), and hence
> > ought to be pretty unlikely to catch when non-zero _and_ something's
> > actually stuck.
> 
> I somehow assumed the interrupt was in-flight because the printing to
> the Xen console caused one to be injected, and thus dom0 didn't had
> time to Ack it yet.

What does Xen consider to be an ACK from the dom0 ?
AFAIK we have EOI only for LAPIC interrupts.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

