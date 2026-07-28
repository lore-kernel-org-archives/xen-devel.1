Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005BAC54F5F
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 15:54:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374956.1622318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok7u-0001Am-Up; Tue, 28 Jul 2026 15:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374956.1622318; Tue, 28 Jul 2026 15:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wok7u-0001Af-S3; Tue, 28 Jul 2026 15:53:54 +0000
Received: by outflank-mailman (input) for mailman id 1374956;
 Tue, 28 Jul 2026 15:53:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1wok7t-00019h-A6
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:53:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wok7s-005Bzn-Mr
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 17:53:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a68d072-bab6-0a2a0a5309dd-0a2a4506d82a-38
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:53:52 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6a68d090-195a-0a2a45060019-a237832fdf0e-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 17:53:52 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 512034EE013D;
 Tue, 28 Jul 2026 17:53:52 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1785254032;
	b=lWNQ8cczZlSXCybwKisiGioyiCI+u+CTWU/h6ienTzL6M7Nqp/cN5b6IJwFunifH+CTH
	 4cRQ98cWsCtG+50eMG/6IKWaREvKofTRzJ8FQbUslXbQqTg+HlAeJUb7/g430XAWtwLFN
	 R6bM/YwkNTY3bTkUXCv8y4m+5GazNyw88Ajx3NO4p0FcHPhaKRFFGi099UxzpiA7X/YY9
	 928vIhSr4syQ4Z9fBAMa8wR9og7QFCML92pqzdpsZ1fIqHOwuS73MdLf6WndyE1L3JQF9
	 DAmiewLPYbzRVCc5Dio6hCem+2rdjY40bicloUyJnz5FH7nfOpU5hYTeEdl1tdp2LJvEi
	 XsS/tJdSsdsYIGqSyGbfxu6XLRa8q3R1Bqpq1Cew58f6qpK5ImEUnVGNr+t/FwQCmt2+J
	 nMXMhaA2JYNEllGIXhheH1Hhi7pJaXpmSwjx/Tbpkx5JWkpuJ5fVmCtaJXFDOg+4gp4g2
	 9hbYgSv63NwTdew+F8LVsoMsKHNrifXyECTLeE/FvO1TnnwYWjfzK+fFCvCdp1Ctst7Yx
	 wQxRpw5XyhCzipFQulPaJjHUiXXciEgJAXd4N+ZINg4YNAonu4T4psJWAdsRNdwwPapV8
	 q4cxP1cLGYhARvd0DRvqQdh5t5livMLoj+eVC0nXAjzfmpZIpEaz+JOfKvyiKS8=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1785254032;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=5GX4ZyGRxb/Yyi6f5PXVS1SZmQcWwVXTaOpxtRPeAl0=;
	b=IdCXSUDJV7tV09sbTcaXHdYNInMh099QMUCtlg55aGMwnofWSkMvZYk/pZDOA/1oAW8s
	 8TixIo+CxQGSwicMwJhVFbxH1eWsmxohXveSXtVuD1/sl03VNv/kN5kTr1vkmPE6fI/9g
	 l7IRLVBR+ADeUrDmS64puW1ziPvrzqYvHqLWMOMXCwRoVOO5+UQ5vH1mW488aX/LfnlcL
	 6fk8qAga+rE0fl4zy6OmPRThc21l6ZaKK8pB55uthAG11mtam39K988SKBzxKAwBFjVyX
	 3BCy8y35EeKREkFShypU3GmTIEFcA5qr14TFpwVA4rLE2VxVlsTFNf3MAPJ0FkLleRXNp
	 +0w/zhqw7WwfU+R/gtbHr23Dye5R1GQVJCeQFmChQSKbRAHV/Jl8NaN8vLndGvKlC4SKW
	 MeiPNjXy3JxL73Xo/pLg4cgAfow73P/d7SRbDRWJNqE6XcbWdYuhvz1iCgKj4K9UDqowp
	 xKPDHTp/UnHcP25/IZiyzuoElNXyxjbIDKa22O0NjFLoGZJlxgmdQuPuJeTO1diZQyGtb
	 ndl1k+HES4j/hHRgi3MVQ4aRJGYmdhp5HHbUZmxjbR52SkzOUZEK0wANKJsEQxFflSc47
	 U3PU53M6zwBgabzdnz76KaQs4jHd3nD3P+myWrPeA17eZ5Mus9VBPr1scyLnrBA=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 28 Jul 2026 17:53:52 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 7/7] gnttab: unreachable code when GNTTAB_MAX_VERSION < 2
In-Reply-To: <5ca4d7a3-f109-4e16-8e82-7603874ea50d@suse.com>
References: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
 <436c0688-8b9a-4e56-9d4c-c81dcfbea56e@suse.com>
 <013f1cb3f76ed613be42d4f6157e3d0d@bugseng.com>
 <5ca4d7a3-f109-4e16-8e82-7603874ea50d@suse.com>
Message-ID: <c6d253390de5936a167bafa39602423a@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1785254032-F667277B-8B11A0D5/0/0
X-purgate-type: clean
X-purgate-size: 1471

On 2026-07-28 17:42, Jan Beulich wrote:
> On 28.07.2026 17:40, Nicola Vetrini wrote:
>> On 2026-07-28 15:53, Jan Beulich wrote:
>>> I'm surprised Eclair doesn't spot the large chunks of unreachable 
>>> code
>>> on
>>> Arm, i.e. violations of Misra C:2012 rule 2.1.
>>> 
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> This pretty certainly isn't dealing with everything. For example, 
>>> with
>>> another helper the gt_version field could likely also become
>>> conditional.
>>> With some more effort the nr_status_frames field similarly could 
>>> become
>>> conditional.
>>> 
>> [...]
>> 
>> Hard to judge only looking at the diff. Is this code unreachable in 
>> the
>> arm64-allcode analysis configuration as well?
> 
> Arm uniformly has
> 
> #define GNTTAB_MAX_VERSION 1
> 
> so all gnttab-v2 code is unreachable there, no matter what 
> configuration.
> 
> Jan

I see. Existing deviations may play a role here in excluding caution 
reports that would otherwise be generated, particularly

-config=MC3A2.R2.1,+reports={safe,"first_area(^.*has an 
invariantly.*$)"}

I see only one condition "GNTTAB_MAX_VERSION" is used directly, while 
the others are via "opt_gnttab_max_version" which is why I reasoned 
there might be cautions involved, instead of violations.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

