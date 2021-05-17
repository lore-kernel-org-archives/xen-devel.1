Return-Path: <SRS0=GMNG=KM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CE7C433B4
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 09:38:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B809B611CA
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 09:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B809B611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128138.240615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liZhH-0007lu-4Z; Mon, 17 May 2021 09:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128138.240615; Mon, 17 May 2021 09:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liZhH-0007ln-1h; Mon, 17 May 2021 09:37:59 +0000
Received: by outflank-mailman (input) for mailman id 128138;
 Mon, 17 May 2021 09:37:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liZhG-0007lR-40
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 09:37:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49b7c9ea-3462-4fcf-b705-60f99bbd78f1;
 Mon, 17 May 2021 09:37:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9039B179;
 Mon, 17 May 2021 09:37:56 +0000 (UTC)
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
X-Inumbo-ID: 49b7c9ea-3462-4fcf-b705-60f99bbd78f1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621244276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cupozExXSDEk2x6F4/kVlSk0FfTDS14py9FNXF+6+qY=;
	b=JwPk3ZUf5cV6QirZEXyDbEucNXJPmCQDyoElMNdcFu5z8Aq6Nw9ANdW+BcIM7Gcxwhd1gM
	Mg5wzs7HCj2rydCJjGCg8uqIrlO4+/RNtE0jHTkJnEm33rsgspndz0VghOgyRLswAo5zsB
	dk5oXo7kbT5z2Sq1YNHkOwDPDFb4f+w=
Subject: Re: [PATCH] include/public: add RING_RESPONSE_PROD_OVERFLOW macro
To: Juergen Gross <jgross@suse.com>
References: <20210512164800.26236-1-jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26985871-d70d-2184-c27e-fe161127de5f@suse.com>
Date: Mon, 17 May 2021 11:38:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210512164800.26236-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.05.2021 18:48, Juergen Gross wrote:
> Add a new RING_RESPONSE_PROD_OVERFLOW() macro for being able to
> detect an ill-behaved backend tampering with the response producer
> index.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/include/public/io/ring.h
> +++ b/xen/include/public/io/ring.h
> @@ -259,6 +259,10 @@ typedef struct __name##_back_ring __name##_back_ring_t
>  #define RING_REQUEST_PROD_OVERFLOW(_r, _prod)                           \
>      (((_prod) - (_r)->rsp_prod_pvt) > RING_SIZE(_r))
>  
> +/* Ill-behaved backend determination: Can there be this many responses? */
> +#define RING_RESPONSE_PROD_OVERFLOW(_r, _prod)                          \
> +    (((_prod) - (_r)->rsp_cons) > RING_SIZE(_r))
> +
>  #define RING_PUSH_REQUESTS(_r) do {                                     \
>      xen_wmb(); /* back sees requests /before/ updated producer index */ \
>      (_r)->sring->req_prod = (_r)->req_prod_pvt;                         \
> 


