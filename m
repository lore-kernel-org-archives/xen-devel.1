Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34C3C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 18:20:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401353.1637061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzehx-0000X0-Jp; Thu, 27 Aug 2026 18:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401353.1637061; Thu, 27 Aug 2026 18:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzehx-0000Wt-Gt; Thu, 27 Aug 2026 18:20:13 +0000
Received: by outflank-mailman (input) for mailman id 1401353;
 Thu, 27 Aug 2026 18:20:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wzehv-0000Wg-Fn
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 18:20:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzehu-000vJ4-KV
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 20:20:10 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a907fb5-2eae-0a2a0a5409dd-0a2a4503a502-26
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 20:20:09 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a907fd7-fae8-0a2a45030019-888fbc335297-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 20:20:09 +0200
Received: by mx.zohomail.com with SMTPS id 1787854798994423.41335892118434;
 Thu, 27 Aug 2026 11:19:58 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1787854801; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VvYifZm+ID/J48pulKqSqReUyxvCUZZRgFyBY7yFAu5jZq37X97q+3TpzF91mIRwsf26Qo45XU37V5bKTOivTlJ+prLEUv5SJhj2BwwcGhj+RqHWFc6SFIT+SRAzTuMy0LYO+uMvsbvWcu3LQrzh4TGpjeomM4JZy2dx+AIZ+8U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787854801; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vC6jIOYZEU+PKqVSGepJRBncJi7aE2sf/+9ksMpfg5s=; 
	b=m5mMfGR/rVpDfj3y2o48I6ZmM0l/HVlY//6K6XRZRcx5TDe6QtOUzx0ym/9i/lSLU2aFnu+dr3KzIX9GbPOvvsXma1qbaIfLt1ffDgogesBkXsBy3gg5khVFa8iR2A5yuGZYDtyZvEDF1YogROhHW/C5xysl4NMDLrJPci2Xt0A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787854801;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vC6jIOYZEU+PKqVSGepJRBncJi7aE2sf/+9ksMpfg5s=;
	b=rQY2Amq4jXQDEumCCk0qdHSLCNsvBfweiGaE3Jgp2o8+U79su863iKUh1/Oi3XqT
	5ioxvLyTpzfXDbqJPkwqDHXXV+n8U51yBi+xisCo865MGT15WVyGBDDY58E0pDMAc8S
	JMtw6WSBOnu4XdOb9Q1ropbv1ANDnH+nrXdk5pas=
Message-ID: <bb37bbde-40b2-47ce-8273-682805fa4a3a@apertussolutions.com>
Date: Thu, 27 Aug 2026 14:19:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] XSM: make xsm_default_action() const-correct
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
 <8df4fd76-2f19-436c-937f-e1cce371bbc5@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <8df4fd76-2f19-436c-937f-e1cce371bbc5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-33051d/1787854809-768FA4E9-9266A4BA/0/0
X-purgate-type: clean
X-purgate-size: 797

On 8/17/26 4:51 AM, Jan Beulich wrote:
> To be able to properly use const on dummy hook function parameters, add
> const to both domain pointers.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v2: Split off from Argo patch.
> 
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -76,7 +76,7 @@ void __xsm_action_mismatch_detected(void
>   #endif /* CONFIG_XSM */
>   
>   static always_inline int xsm_default_action(
> -    xsm_default_t action, struct domain *src, struct domain *target)
> +    xsm_default_t action, const struct domain *src, const struct domain *target)
>   {
>       switch ( action ) {
>       case XSM_HOOK:
> 

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

