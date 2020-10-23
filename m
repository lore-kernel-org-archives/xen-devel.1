Return-Path: <SRS0=ydFR=D6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8559DC388F9
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 09:59:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBD582168B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2020 09:59:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dVM8a96g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBD582168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10816.28859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVtr7-0006ko-F2; Fri, 23 Oct 2020 09:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10816.28859; Fri, 23 Oct 2020 09:59:29 +0000
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
	id 1kVtr7-0006kh-C2; Fri, 23 Oct 2020 09:59:29 +0000
Received: by outflank-mailman (input) for mailman id 10816;
 Fri, 23 Oct 2020 09:59:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVtr6-0006kc-FQ
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 09:59:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fd16667-e882-4ac7-99a0-5ca7349c6dfb;
 Fri, 23 Oct 2020 09:59:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0CE9AC82;
 Fri, 23 Oct 2020 09:59:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVtr6-0006kc-FQ
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 09:59:28 +0000
X-Inumbo-ID: 7fd16667-e882-4ac7-99a0-5ca7349c6dfb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7fd16667-e882-4ac7-99a0-5ca7349c6dfb;
	Fri, 23 Oct 2020 09:59:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603447166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FK+KHeA73qDtchEwvOhQniPfB5Wh9g8p8YISf7Hd9fA=;
	b=dVM8a96gvIPqUZvj+6tWbw3k4Ol0WiJLvueXC9HCjAHXPWWVyLupPPd6Z8PABXmlg4Snm5
	QVf7ggCxYcVbiDmMsXDTPn4bZ7OzKExlwKgN+ZGMrqqpQn7NQBtNc7rPJRyULz8OdYxhUE
	YhvOja0ZSe0kfWoPdh7HyclWRoU+n50=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B0CE9AC82;
	Fri, 23 Oct 2020 09:59:26 +0000 (UTC)
Subject: Re: [PATCH v2 10/14] kernel-doc: public/vcpu.h
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, ian.jackson@eu.citrix.com, julien@xen.org,
 wl@xen.org, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s>
 <20201021000011.15351-10-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <06711c5b-1ddd-a2dc-ccbe-17098c63bba8@suse.com>
Date: Fri, 23 Oct 2020 11:59:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201021000011.15351-10-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.10.2020 02:00, Stefano Stabellini wrote:
> @@ -140,38 +173,74 @@ struct vcpu_register_runstate_memory_area {
>  typedef struct vcpu_register_runstate_memory_area vcpu_register_runstate_memory_area_t;
>  DEFINE_XEN_GUEST_HANDLE(vcpu_register_runstate_memory_area_t);
>  
> -/*
> - * Set or stop a VCPU's periodic timer. Every VCPU has one periodic timer
> - * which can be set via these commands. Periods smaller than one millisecond
> - * may not be supported.
> +/**
> + * DOC: VCPUOP_set_periodic_timer
> + *
> + * Set a VCPU's periodic timer. Every VCPU has one periodic timer which
> + * can be set via this command. Periods smaller than one millisecond may
> + * not be supported.
> + *
> + * @arg == vcpu_set_periodic_timer_t
> + */
> +#define VCPUOP_set_periodic_timer    6
> +/**
> + * DOC: VCPUOP_stop_periodic_timer
> + *
> + * Stop a VCPU's periodic timer.
> + *
> + * @arg == NULL
> + */
> +#define VCPUOP_stop_periodic_timer   7
> +/**
> + * struct vcpu_set_periodic_timer
>   */
> -#define VCPUOP_set_periodic_timer    6 /* arg == vcpu_set_periodic_timer_t */
> -#define VCPUOP_stop_periodic_timer   7 /* arg == NULL */
>  struct vcpu_set_periodic_timer {
>      uint64_t period_ns;
>  };
>  typedef struct vcpu_set_periodic_timer vcpu_set_periodic_timer_t;
>  DEFINE_XEN_GUEST_HANDLE(vcpu_set_periodic_timer_t);
>  
> -/*
> - * Set or stop a VCPU's single-shot timer. Every VCPU has one single-shot
> - * timer which can be set via these commands.
> +/**
> + * DOC: VCPUOP_set_singleshot_timer
> + *
> + * Set a VCPU's single-shot timer. Every VCPU has one single-shot timer
> + * which can be set via this command.
> + *
> + * @arg == vcpu_set_singleshot_timer_t
> + */
> +#define VCPUOP_set_singleshot_timer  8
> +/**
> + * DOC: VCPUOP_stop_singleshot_timer
> + *
> + * Stop a VCPU's single-shot timer.
> + *
> + * arg == NULL

Judging from earlier (and later instances) - @arg?

Jan


