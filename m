Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967B1CD8CA4
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 20:10:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1332072.1594713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgIq-0001jL-Kz; Mon, 08 Jun 2026 20:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332072.1594713; Mon, 08 Jun 2026 20:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgIq-0001jE-HR; Mon, 08 Jun 2026 20:10:32 +0000
Received: by outflank-mailman (input) for mailman id 1332072;
 Mon, 08 Jun 2026 20:10:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wWgIp-0001j6-9l
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 20:10:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWgIo-00DuLB-Mv
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 22:10:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2721ae-e002-0a2a0a5209dd-0a2a4501ae18-18
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:10:30 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2721b4-c1f2-0a2a45010019-888fbc3352cb-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:10:29 +0200
Received: by mx.zohomail.com with SMTPS id 1780949417670124.47952518789407;
 Mon, 8 Jun 2026 13:10:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1780949419; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h1AND7Ipg6X2AcxohHsw0HQ1rvbOdMVr9uruVSzQTIzlcM+3fVHWIEuK3iw8RMNbbnHNT3bqMIAUbC6SDwhEUxn6UlTYOq1kpw7HjviVI1t6yr7VHqzq2mC1BOj/PbIy7yydn5NUnu06oSaxg3BsqLnR4EZgusfqUt5JaJa2duA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780949419; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yE1FsJxJLRLOFfknqD9j5IwP4RjeqKaC1BrzJQDPey4=; 
	b=C7sEW9EbC97xXrMcko9CG/WsumdVBgdehf0BJ8g3pvdOgto1K5S9f83uFAud/d+/S+JJUly1kcJErA9jnu21tz4PXQHrOEHYE5+/cW6iMOcxeNAYqApY/8i4jeHLkUugnQ5hy9rUryyTMMp0i3xeg7wDALNeCUeSC6GAeCh0Rvg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780949419;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yE1FsJxJLRLOFfknqD9j5IwP4RjeqKaC1BrzJQDPey4=;
	b=VrvmoxgzklNt+w2fcHd4hYAnUxGHOAtQp1uyEoAjJqVfeHC0gJF4c+93l8+2aJGI
	lbajENv4WTCLCPWRUrBV3am5fLJ6JSFbevLpAlIyRPj9mXdU2T1D6vvgRWlECCgbG7M
	gbwLkMxMsnE6D4T+o3R9Hhv2xbjhjWJwkXio0gUA=
Message-ID: <c067e641-ab05-4dd9-b7e1-b7ea952de809@apertussolutions.com>
Date: Mon, 8 Jun 2026 16:10:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] argo: introduce CONFIG_ARGO_DEBUG
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, christopher.w.clark@gmail.com
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-6-dmukhin@ford.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20260526215823.1452619-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-d62444/1780949430-B454DFF4-40BF0971/0/0
X-purgate-type: clean
X-purgate-size: 1861



On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add Kconfig knob to enable traces for Argo debugging.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - new patch
> ---
>   xen/common/Kconfig | 7 +++++++
>   xen/common/argo.c  | 3 +--
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 5ff71480eebe..adcdc51dd21b 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -491,6 +491,13 @@ config ARGO
>   
>   	  If unsure, say N.
>   
> +config ARGO_DEBUG
> +	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO
> +	help
> +	  Enables extra debug traces for Argo debugging.
> +
> +	  If unsure, say N.
> +
>   source "common/sched/Kconfig"
>   
>   config CRYPTO
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index 3c38a51d09a2..b9b362064e7e 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -318,10 +318,9 @@ static DEFINE_RWLOCK(L1_global_argo_rwlock); /* L1 */
>       ((LOCKING_Read_L1 && spin_is_locked(&(d)->argo->send_L2_lock)) || \
>        LOCKING_Write_L1)
>   
> -#define ARGO_DEBUG 0
>   #define argo_dprintk(fmt, args...)                      \
>       do {                                                \
> -        if ( ARGO_DEBUG )                               \
> +        if ( IS_ENABLED(CONFIG_ARGO_DEBUG) )            \
>               gprintk(XENLOG_DEBUG, "argo: " fmt, ##args);\
>       } while ( 0 )
>   

Is a Kconfig really desired here? This such a trivial knob and one that 
is really only intended for tuning by the developers. Exposing it as a 
Kconfig option means you intend for this to be tuned by distro builders 
and wanting to see it exercised by the CI RandConfig.

V/r,
Daniel P. Smith

