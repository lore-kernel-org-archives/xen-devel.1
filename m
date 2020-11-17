Return-Path: <SRS0=l9VS=EX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0392BC2D0E4
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 09:07:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A912417E
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2020 09:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90A912417E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.28815.57937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kewxp-0001eq-DE; Tue, 17 Nov 2020 09:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28815.57937; Tue, 17 Nov 2020 09:07:49 +0000
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
	id 1kewxp-0001ej-AG; Tue, 17 Nov 2020 09:07:49 +0000
Received: by outflank-mailman (input) for mailman id 28815;
 Tue, 17 Nov 2020 09:07:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUfM=EX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kewxo-0001ee-0q
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:07:48 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d986aa7b-a812-4d46-9f81-d2aa4e0d25ff;
 Tue, 17 Nov 2020 09:07:46 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AH97c0u014536
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 10:07:39 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 5ACA42E9CA8; Tue, 17 Nov 2020 10:07:33 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=EUfM=EX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kewxo-0001ee-0q
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 09:07:48 +0000
X-Inumbo-ID: d986aa7b-a812-4d46-9f81-d2aa4e0d25ff
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d986aa7b-a812-4d46-9f81-d2aa4e0d25ff;
	Tue, 17 Nov 2020 09:07:46 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AH97c0u014536
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 17 Nov 2020 10:07:39 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 5ACA42E9CA8; Tue, 17 Nov 2020 10:07:33 +0100 (MET)
Date: Tue, 17 Nov 2020 10:07:33 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: netbsd PVH dom0: xen clock event stops
Message-ID: <20201117090733.GC1405@antioche.eu.org>
References: <20201115174938.GA3562@antioche.eu.org>
 <20201115182416.GA30231@Air-de-Roger>
 <20201116182211.GS840@antioche.eu.org>
 <20201117085448.2haekgpbcspwmqja@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201117085448.2haekgpbcspwmqja@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Tue, 17 Nov 2020 10:07:39 +0100 (MET)

On Tue, Nov 17, 2020 at 10:02:04AM +0100, Roger Pau Monné wrote:
> Great! So all interrupts are working as expected now?

No, I'm back at the problem where the PERC raid controller times out on
commands. I'm cleaing up my sources and will try to get more data
about this problem.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

