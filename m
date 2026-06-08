Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4492FCD6E79
	for <xen-devel@archiver.kernel.org>; Mon,  8 Jun 2026 20:04:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1332062.1594703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgDA-0006Rb-V2; Mon, 08 Jun 2026 20:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332062.1594703; Mon, 08 Jun 2026 20:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWgDA-0006RU-S8; Mon, 08 Jun 2026 20:04:40 +0000
Received: by outflank-mailman (input) for mailman id 1332062;
 Mon, 08 Jun 2026 20:04:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wWgD9-0006RO-7l
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 20:04:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWgD8-003RGI-Ks
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 22:04:38 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a272038-2eae-0a2a0a5409dd-0a2a4508964c-32
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:04:38 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a272055-63b5-0a2a45080019-888fbc3352ba-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 22:04:38 +0200
Received: by mx.zohomail.com with SMTPS id 178094906622989.31840955224857;
 Mon, 8 Jun 2026 13:04:26 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780949069; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Tgk41q1x5SAThD7mN67mck4ga4aE+lXcQ9HaC7/v8VrykNW8yJp84b2HFwtl2VJYT0D84RHGhcir9/3VXhE6CHFzn/N+lSAJPV7d/hzlyqHIVPKohppUobBEJh0PlyYaM88kosPfyu1JY2ovBFN6UcCEjbx/cLxARJQvODoUjZk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780949069; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5O0tXT06sdRZVNwdfqnS1GOksabn+q+/lGD7fGsWqSI=; 
	b=lhXI1ITZ+CiLhKWA1wRCodbhHCvbIQIBcfyMQWHqsttcqsXMlEVKYaPgId0a/iwfD1PKdhWwUP242daN/U6UDL7zKCx98KFifBGKY+qFMTyVPmFmVEGOnblrw4fvjclnl6VXflpjqWLM8YPo3rL+2kBElH49mbLO4z7EEUyj8HE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780949069;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5O0tXT06sdRZVNwdfqnS1GOksabn+q+/lGD7fGsWqSI=;
	b=iGCKaqL3vyWX60q1TkeI/T0wXWx3DqJ40mlJ+lxcUjeckRBvVSXp4eb+p0qP1lgX
	6kdhg3mXMN5E8YgIP+8wDQxOSYCloPyWSb+oY4X0Va0IAQc93jNH3Hc8KdiAhhu/j1w
	jK6hM+5CO1ECS39HYmlRIpdWUHNeRw0gWlK6VaK0=
Message-ID: <89b68e2f-ae8c-47de-a53d-cbf3a1001dca@apertussolutions.com>
Date: Mon, 8 Jun 2026 16:04:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] argo: fixup argo_dprintk()
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
 sstabellini@kernel.org, christopher.w.clark@gmail.com
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-5-dmukhin@ford.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20260526215823.1452619-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-c1860d/1780949078-B7B7CDB1-230A1FC5/0/0
X-purgate-type: clean
X-purgate-size: 1096



On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Current argo_dprintk() implementation is a wrapper around raw printk().
> 
> Rewire it through gprintk() to allow for better debugging context
> (such as domain ID).
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v2:
> - new patch
> ---
>   xen/common/argo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/argo.c b/xen/common/argo.c
> index ffa1f43437ab..3c38a51d09a2 100644
> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -322,7 +322,7 @@ static DEFINE_RWLOCK(L1_global_argo_rwlock); /* L1 */
>   #define argo_dprintk(fmt, args...)                      \
>       do {                                                \
>           if ( ARGO_DEBUG )                               \
> -            printk(XENLOG_DEBUG "argo: " fmt, ##args);  \
> +            gprintk(XENLOG_DEBUG, "argo: " fmt, ##args);\
>       } while ( 0 )
>   
>   /*

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

