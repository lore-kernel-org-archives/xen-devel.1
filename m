Return-Path: <SRS0=cl0r=IU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268F5C433E3
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 15:04:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83316619B1
	for <xen-devel@archiver.kernel.org>; Mon, 22 Mar 2021 15:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83316619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.100272.190970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOM5g-0002pV-UI; Mon, 22 Mar 2021 15:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100272.190970; Mon, 22 Mar 2021 15:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOM5g-0002pO-R8; Mon, 22 Mar 2021 15:03:36 +0000
Received: by outflank-mailman (input) for mailman id 100272;
 Mon, 22 Mar 2021 15:03:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UvDz=IU=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lOM5f-0002pJ-1a
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 15:03:35 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d2df914-acb7-4cbf-9885-cbb33211ccaf;
 Mon, 22 Mar 2021 15:03:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x16so17403688wrn.4
 for <xen-devel@lists.xenproject.org>; Mon, 22 Mar 2021 08:03:34 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id h20sm16581667wmm.19.2021.03.22.08.03.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 08:03:32 -0700 (PDT)
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
X-Inumbo-ID: 5d2df914-acb7-4cbf-9885-cbb33211ccaf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FyP9CipjvFpnfIqIEbRW3KkKZKHL4tdWtHw8eenVhOs=;
        b=ngsJbkSbB68/BK8rR8NN4PR8UYpk7qy0aweAHGnrs3lvNHF+79dWdjGn5dfdnzKv1q
         187iK4judF55K+6+yw7N3pPYUvpkWLd+iYyLk/ytKZUl3GM67n0/AW7MBb406TA+RU31
         wLT5Dqox1/LyC9NKW7I6QCYZgEzHiD8kqMRI+FPdypGgB4B6R1K1RnV9JefMwBhmbh7O
         e3sGwZmtXgnz+YznGhSoihqT60QPiDXBru1Bb9esXsS/V5j6v7VUv6KuEOtv5k0AP4OR
         cMV7aX0bL5Qn1TuJYPa6vYb3+4X0oyiEsX3Vb32luXEhu0VzgIrB4A/ccwNaPGH0tNXl
         FcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=FyP9CipjvFpnfIqIEbRW3KkKZKHL4tdWtHw8eenVhOs=;
        b=p6SP4Bz3va/wYFuRxRHZrzR59kZ/EFMhvHOFiYP/sTz6aEQ+7+VQF+izscNLD3iI6D
         H8Hc13HTicoDlc38j7g2j3udWWjcGKA24XxzIZhdj2Nyhdt6EYtXJDlOR1t+9X0hzKj7
         QC7/xRmUBbG/uZs1cWINO/GxMyQoj6v+WwBHGGSW7Ylkazfc8OQo8cDD4Y0B6+/ML5iL
         9Qfza40OGwWMKWGNP7HSrq8Am114sXAZndiJ/Qdso7qQMbsy+U4tGimfQ1xA8kkao9Ta
         auwycGRck+pObbkXOwhtwqt6tHCUXbVpOxvsdT5v35hs5WPbQz5CyDQgjMGwE74FT4sj
         8ATw==
X-Gm-Message-State: AOAM530g39vMir2eKmkOiZxw1NOhon4of/zjqZZ8i6vx8qD9DixvqgxD
	i4ZJjtZGfNZNqB3y04WrSes=
X-Google-Smtp-Source: ABdhPJwl+Akc0f4Vw6dmZAHeDuIS90Prg7ispLruT5TEXhAJEajQoiQ3XN64LU46pmJxRWSgR67SSQ==
X-Received: by 2002:adf:fd48:: with SMTP id h8mr18745163wrs.229.1616425413226;
        Mon, 22 Mar 2021 08:03:33 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org
References: <20210308143232.83388-1-anthony.perard@citrix.com>
Message-ID: <b15e2f65-7e4d-b129-d5e1-a69667c5ee5c@xen.org>
Date: Mon, 22 Mar 2021 15:03:31 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210308143232.83388-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/03/2021 14:32, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> Whenever a Xen block device is detach via xenstore, the image
> associated with it remained open by the backend QEMU and an error is
> logged:
>      qemu-system-i386: failed to destroy drive: Node xvdz-qcow2 is in use
> 
> This happened since object_unparent() doesn't immediately frees the
> object and thus keep a reference to the node we are trying to free.
> The reference is hold by the "drive" property and the call
> xen_block_drive_destroy() fails.
> 
> In order to fix that, we call drain_call_rcu() to run the callback
> setup by bus_remove_child() via object_unparent().
> 
> Fixes: 2d24a6466154 ("device-core: use RCU for list of children of a bus")
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> CCing people whom introduced/reviewed the change to use RCU to give
> them a chance to say if the change is fine.
> ---
>   hw/block/xen-block.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index a3b69e27096f..fe5f828e2d25 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -972,6 +972,15 @@ static void xen_block_device_destroy(XenBackendInstance *backend,
>   
>       object_unparent(OBJECT(xendev));
>   
> +    /*
> +     * Drall all pending RCU callbacks as object_unparent() frees `xendev'

s/Drall/Drain ?

> +     * in a RCU callback.
> +     * And due to the property "drive" still existing in `xendev', we
> +     * cann't destroy the XenBlockDrive associated with `xendev' with

s/cann't/can't

With those fixed...

Reviewed-by: Paul Durrant <paul@xen.org>

> +     * xen_block_drive_destroy() below.
> +     */
> +    drain_call_rcu();
> +
>       if (iothread) {
>           xen_block_iothread_destroy(iothread, errp);
>           if (*errp) {
> 


