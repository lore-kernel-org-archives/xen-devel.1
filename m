Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21D7C61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 18:25:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401368.1637079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzemz-0002Z0-Am; Thu, 27 Aug 2026 18:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401368.1637079; Thu, 27 Aug 2026 18:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzemz-0002Yt-7t; Thu, 27 Aug 2026 18:25:25 +0000
Received: by outflank-mailman (input) for mailman id 1401368;
 Thu, 27 Aug 2026 18:25:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wzemy-0002Yn-7Y
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 18:25:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzemx-00CDW3-Kb
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 20:25:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a9080f6-bab6-0a2a0a5309dd-0a2a4503af32-40
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 20:25:23 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a908111-fae8-0a2a45030019-888fbc3352ab-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 20:25:23 +0200
Received: by mx.zohomail.com with SMTPS id 1787855111753674.7447804924414;
 Thu, 27 Aug 2026 11:25:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1787855114; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FeEH5BGAGbriGuRyme9y7bGTMLgTHK6huIleSv7bK6x+F9I7QD3JiUBORz/Crp96OKOv9tuWUp1arXNSaacUktNJYN/bHrs+8wdW88eEoi6cJbVDnX8ccms94LVpYEwSXdYOWeMsyP+abcKChEPDikRCLSz+1SQRrqNGkeApWE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787855114; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eDsmXfUQvP2ggJTyhPVxuLJ/QReYaX6sZJA5lfs6QQg=; 
	b=iK1fG9xnHIhzYOxoBIqMYgdAcn6SyJmnV6U42Kn7zU1SS/TRoq0mNLhPeTJqNCkHyZTb4lgEQqysLUX1DEwK14N+4JkYR/ueQcPX7BqUKwaQBVv7MK5G3Xpewthek7Nl/vLCD/WeG+BK1eSWw0OrKIm6QSEfd4/NGZ+AiFzU/fY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787855114;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eDsmXfUQvP2ggJTyhPVxuLJ/QReYaX6sZJA5lfs6QQg=;
	b=Y1z5Wq9hUNZUhM+kO7k14Wk+5hH0HzoPf7kSdUqifhc+Xqx27LQFHxu4hhlwx35I
	xIPnOPEuPfpH1qf744pVr+EnxcBPggxPd957QoLUDBWkKUtL/AKZWc6q0s56fhRxf3e
	WeHuhrKNGaEYRH7byKo/vFqoPiKkHJzeQ2ks3P5g=
Message-ID: <cf9edc7a-3b7c-4309-9b1c-375236765a2a@apertussolutions.com>
Date: Thu, 27 Aug 2026 14:25:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] XSM: fold xsm_{,un}map_domain_pirq() hooks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
 <236a8612-d431-4972-92b3-4d62e8f10bb4@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <236a8612-d431-4972-92b3-4d62e8f10bb4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-33051d/1787855123-756834E9-771FC7BD/0/0
X-purgate-type: clean
X-purgate-size: 461

On 8/17/26 4:53 AM, Jan Beulich wrote:
> Like other resource management hooks they are different in just "add
> resource" vs "remove resource". Hence like in other cases a single hook
> can easily serve both purposes. Rename hook and functions to fit
> xsm_io{mem,port}_mapping().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Rename hook, functions, and new parameter.
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

