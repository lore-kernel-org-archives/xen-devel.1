Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D26CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:58:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452330.1667172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkK5-0001Zu-W9; Fri, 16 Oct 2026 15:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452330.1667172; Fri, 16 Oct 2026 15:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkK5-0001Zn-TG; Fri, 16 Oct 2026 15:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1452330;
 Fri, 16 Oct 2026 15:58:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xHkK4-0001Xp-Od
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:58:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkK4-003PZr-5e
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:58:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad24971-8faa-0a2a0a5109dd-0a2a4505af9c-36
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:58:20 +0200
Received: from [209.85.128.176] (helo=mail-yw1-f176.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad2499b-4cb1-0a2a45050019-d15580b0b164-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:58:20 +0200
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-8b0d63f60bcso588307b3.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:58:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792166298; cv=none;
        d=google.com; s=arc-20260327;
        b=pp8sSzuZQJQAj7c+JmwrK6KWjZ/s9veV1kyALZVpuOOlg5zl4GmBYqg+0wMl8UbAOs
         o+B/0tEjXdHfTstuHOEWzgNdU6bySuUSZAFZXIyyb69x7ygEseSVLTAT3QPAMO8ooDj1
         BtWqmt+zMmcUTL/uSsm9AnwUPq7obJyNdD8f9nlgjLQTuOsUImR0WYteRw3ifgWVKAnQ
         ien/kCuheUmldMTIK72QarPQLXPor2d5kfDU/rZ65N0mh4iXYHk5/wOJQ2Laa5GDa5MU
         O8LqE8QrRKTrQKcSuFqr6ifrG/ulIiPdcIchOXN3Re49c0+Nf+xjF1GcqRYrgsHJb7ti
         5ZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z8dvB27BD00MHKhAiviavhQ6hVBZ26dTM77I+eEYzp8=;
        fh=FquML8VdRvAxVnP7gHASgnHHpvAOP6RQkrDjv2njwCs=;
        b=UVG9KtJzKAdKMZYpC9wqXwTtCabJlwAIPDdOifGqukqMMNWh6cjQBWM8frvkFcAn+F
         3bBmYAHwP8cf5dy9uJrWgP5tLSepubBko/i1hLSYGUr259fX1lFRGNjT/g83amvHZpCX
         7Y78XIikIb41mo4WL8PL8rGcYQbH6LzWdDnWHLu+Wu1alU7JMzfRU02DqkEfB0+eEkhC
         5ruwgNKnGwhWNf8mENKmyxzEIMpZQS1YcMp3iVK1L5ubCVb8SyhiGXKLG/sW43y1iiNX
         ninW9lLWGF3mfc7k8JChQ7UgGby/TIB3fwnHOUlJFLgJEpJyfS26khCrvUHI7uXUImuV
         Mn0A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792166298; x=1792771098; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8dvB27BD00MHKhAiviavhQ6hVBZ26dTM77I+eEYzp8=;
        b=UZZ6U6AGkYuY0qiEIrt7QLhGfgxk69BLCAd9cGq7I6HRGr7S8MtJCCuT5QnjyeTfME
         TwOEfdI0GJ0BLXe+yxtIbxESVJzD/7+AsfgubvTbxNeFGTus+nneikmZ/nLh3G5Ip2OK
         XT71DrFh1NQRs824RtaKsZWmTWIf/EYw3KhrYjIE8bNr22dPuJfLTsDfGrHOgjDxh24b
         w01Q8NFRfPT8lKxxFNbcvpVhRHZmqAXB1Sb2Qh2k9/NZosGq5XMynwD5RNoVT1FYCMvH
         fyKT2h2KBna9H/wKT8Xgfj1QPgz+84/F09tRWusilL5Aqxpa91fpUK43ng4iCB4T2F+M
         Ujyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166298; x=1792771098;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z8dvB27BD00MHKhAiviavhQ6hVBZ26dTM77I+eEYzp8=;
        b=m/pTcIhByS4YF+vFVamXiBln0WfzCG9kLXjeT94TVoq4hLkG5JMpeE0gVNDHHVf3pz
         M0xsHrJf8jff1e9VIk3IgvqR/z75PbyXVYldwzUo0cvLDUSXSASwIZuzm/jsXAZ8UvJ/
         WFSNjoslcUK0or6BSigB6llvkxdPF2B8kpO8Pk669c1nofrnLfqdd3Pbj8Zxy2vJfbSd
         C/TMhkLqmrm/WZ3Uz6uBl4F8VHyHKmDDAvpNA+/YzaQr7O0Hsv48n01pfsbJzGT5LlC2
         sBHfJNo5gR8fUN86nCiHXJWlY5DfKlahiX/ZavCPJKKUCRYT+ge57Agr3dgsHhEe2Hzr
         HXvQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/iWe3z8BTziO2mAi8N+dDyOcJtSJOBevrmGlwaqyoXwr8aN3b+QnnnA07jX9ceymzb7YoNsjX+/E=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJhpaoQ3jhpF9ML0A2GFenjXHLOsOQ5+J8V1TWsYjWJiwYS/vBc
	Il0IaA+JcM2an6AErFGAWw7PlD+I/pt4KlLQAdIO+B0XbNycAsNWf7GMGU4mNAS5qZF/NDjdoAi
	IEYiiSVO4x4H6c1skoLMZYc4x30dZt9uwpWNlRTfr8g==
X-Gm-Gg: AYBFou3cXdAdwogyYB8jX+aiBBfNzIBDi7Uf5EAPzns6HDhvbhzYjpMJx+Vdy449B4C
	Qr3e0kGsSlbCnHoGE4W75RkctegKKpcP/B94GvTvCvIN+rzxDDmSWCaSbKOJwCdnWspBUQ0dD1t
	+tq0fYBuZj7JGxAbuBh77oBjkd/Q/hfNtJ5P8rG6bsFt4je3OYXqChtSDLfSZerq5O0PqSFLYXU
	SpcRhNI99IhC5w0yB9vwMUW/8dinX1s5iTA6enNX5rX9sIGPrUOGom+lL3IfGXLvDFXCZjfn7Mc
	NPE5EFRp5DgBm0/RDQ4ib3q1DHEKPJo0hFTYhf0gOhFSGOlKIqQcR6AQsIebBjkm8DHH1Jfaq4t
	dPXC1S36dcfPMYpP5F+ofrF4+8dkeHk3HFrIkKKI=
X-Received: by 2002:a05:690c:e15b:b0:8b0:e55b:9b71 with SMTP id
 00721157ae682-8b0f206613cmr1079727b3.8.1792166298506; Fri, 16 Oct 2026
 08:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com> <20261016142031.1204281-12-mark.caveayland@nutanix.com>
In-Reply-To: <20261016142031.1204281-12-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 16:58:06 +0100
X-Gm-Features: AclHuK-Imydk1NavRlI1lSdQw3bHdUyOwWkdd3gQpE-QQexO367vic2GyURlIMo
Message-ID: <CAFEAcA9OrP2_+gmXhERe1O2ZWH=oRtF__QrOD87CsyrggEN09w@mail.gmail.com>
Subject: Re: [PATCH v2 11/27] i8259_common.c: always use cs for
 I8259CommonState variables
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c201ff/1792166300-F62AB2A1-5C936CFE/0/0
X-purgate-type: clean
X-purgate-size: 546

On Fri, 16 Oct 2026 at 15:23, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> The use of consistent variable names makes it much easier to follow which
> fields are being accessed from I8259CommonState.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/isa/i8259_internal.h |  6 +--
>  hw/intc/i8259_common.c          | 74 ++++++++++++++++-----------------
>  2 files changed, 40 insertions(+), 40 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

