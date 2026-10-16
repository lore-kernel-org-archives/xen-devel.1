Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D48CCA490
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:57:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452318.1667153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkJP-0000Wz-I5; Fri, 16 Oct 2026 15:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452318.1667153; Fri, 16 Oct 2026 15:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkJP-0000Ws-FC; Fri, 16 Oct 2026 15:57:39 +0000
Received: by outflank-mailman (input) for mailman id 1452318;
 Fri, 16 Oct 2026 15:57:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xHkJO-0000VD-Ee
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:57:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkJN-001vQR-Rg
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:57:37 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad24967-2eae-0a2a0a5409dd-0a2a4503ba5a-16
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:57:37 +0200
Received: from [209.85.128.175] (helo=mail-yw1-f175.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad24970-fae8-0a2a45030019-d15580afd0df-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:57:37 +0200
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-87ab6e5f91eso820897b3.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:57:37 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1792166256; cv=none;
        d=google.com; s=arc-20260327;
        b=diIS3SUhi4mhq24t4WKL6GnlvsVdf0GCL/8nNyYTRGKbwpsL5ndnjRYCww2AxQHk89
         SP9FbZ5LYs4rRmnqIz8VTqbmAjD5e/aOxmJ5DbRbQYNz0VbvcHVwfluQA+T4dUbRrnO1
         VUPh4PgAt5p6j9BmowZT22TaI9gAidHmxlw9wOdUU18bZPaDEviNEY3mDWy+HZYBMgps
         yamRU515AMTEpBbdVg8BEeBFGjnKvYpr39yzBiHPjl5WNITHsAhwcLp5Wrc7wmdQPFPQ
         feZXtKM3Vo/Vk1XPm0jSMMkoPhhF+laoPE9Nz8s71Fqk1ZeXZ7mPGdD6gdKubUglpBAC
         kC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ijQiaZDakXdT2nqzYp4RwRt0IgGN4obLqR6a+at83Q0=;
        fh=5FhWxt4HllagTQZ/zQPCRP0iyCbcSP4W4pm4yT977FY=;
        b=VOWdmU+AALEE1KcUntKAoP4PIiQsQci3kJ2oPGl5JaHVC3uod796tWK8ALo1s7yiNP
         OaQmV8bqCFFkiqebOgFhghtpyn03Ao1WM3mvqRHtq2+rfMUqx4F6kbZ7iTWGUvgy9QP8
         maHMzYk993V1eFjvjxRdWAnqewxlB7aawWITs4riWyRzPiWRctXgnPqLM1NnWB9Df2yf
         JMKEmpHF5zpTSsuMbaEPKOy4mqEHVYOqdhDg3JvyHrSpAksj9my+BBc3mZmX1wlcvApN
         +1//I2ViPwPYu2kGoWUtiwA4EB+8wEdc7yEvFKsLnZEdrdbnH8qBUrlAw9EyT6E53Ft4
         J67A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792166256; x=1792771056; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijQiaZDakXdT2nqzYp4RwRt0IgGN4obLqR6a+at83Q0=;
        b=gU19vlHYwxQeCutmQczqH0Ob+K74ZDwkZvyP9Hmnblg2LLeVJwPtZW+fFVIYtuMNTW
         6yRy5CL8x4fiUhK5oF7RIZwkNdRe1K2isvbaJUwc4x+Om47fg/CPvsKyjxJ+bUW5HSOZ
         nDAAP5KMS4SgcmVlqmNDjtQMw0p67LxjLACXURV/qtEhdLNGp982WTpnKaUAlafRiCsX
         C4ke6bmtFjTvik2ZoWvC9R/2qibu35aH05R8C5ydMbV1ymx68oU0n5gJxH0cNnT/NStX
         Lizwh8HlkH6NWfXqhqCxMjPEuXFvbXdbl+BHcQAB8djQo0bmgdbpZ+qZ8jle8YxzCEA5
         GZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166256; x=1792771056;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ijQiaZDakXdT2nqzYp4RwRt0IgGN4obLqR6a+at83Q0=;
        b=VIkrG1eIfIUXC2ouYdjAI4/Hi3b4kU9nKPjHkoTlaZ92qGPRcnI7vXFdfTHbiE0vZ6
         QPVmVM0k0T9Q3Zk3IUu/GPsqwwe4kK7uRqfeWkv4oBd6j95MFg5P/Ua4oIZdLJFwKeMY
         g3n3VxrzF6AHAihpvtUQ7+krU7JROO4yJesd0MVfQYgJmH2Nz90zE8M/SuwnnvbjS6ss
         Wch2aMiEu/J6+UFODwzKZrcII2nLh+pTxG3vE4Hw/RNr7tdk6RnQ+9OgnwYgq1TW5DTJ
         zDI46W2GQg4ZnForW0CRchp7b8Fc73cOB8dPHSAFUGobBdyBHBI6CZColFy/2TfZApdZ
         2U8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzc9Zm7K5o3Yvqkha24R7KVLVZfEFJaQtIlXntR+V5g9ytam1Y4gIHDSCpYcqIFSxIgiuXW5kgcDbQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL7IWQ12EugAdR4L0ZjVomshvEdq8gdi0kusd2+Uw2yeFXit2VR
	+xgoso7wzhMPmcEWh+wHk51a9TXKDX0YyQHSACYSbpAJ8eyYTeenNMhsV5dYCznq55evzhPGp/+
	BLykulJ65UXde96God1cEGCy1jnVurLaqN9CJaJjevg==
X-Gm-Gg: AYBFou2wZFrUuSrx+H/4TjvSCl9ATFkH3h0GA4GqND59zMRRjnAR6vxs45wyiI74zlX
	mnAuO3Mlo1wx/oZlc5oQh4sn48Wkye31of5M885Y3dHVL9R2CfL+rPG/4O5Ap3uXLH4voCJr7VJ
	zNLDAzEfgeosx//VGodE8ZodvVjPpH9P+mCmGZFZSG+sFtoC8p6QEXEbdC4KFjsHu7cc4YjloXi
	PIQWWBsP1oP6WZVysEV/8qcwDypuqC+GmslW2jG2R6e2Kp2D0c73G7rSz/B5Mwj6ynpiaZkgWiz
	qRsViypLrs8E2eUd74WPSZy+t+o5edbcxQBrWmOmGzAIy3nJS5+cHM9fZQb4dh3eLhTHF3+TjXB
	pYvj4p5wUSH7ef9VomZS62yLwGH4Uw3bw7tDhdhQ=
X-Received: by 2002:a05:690c:4:b0:8b0:e238:2719 with SMTP id
 00721157ae682-8b0f2173795mr1870627b3.31.1792166256124; Fri, 16 Oct 2026
 08:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com> <20261016142031.1204281-10-mark.caveayland@nutanix.com>
In-Reply-To: <20261016142031.1204281-10-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 16:57:23 +0100
X-Gm-Features: AclHuK8uTdNG5Nsg_B8uIt7lUn78Aqvgarp82YPLfA_9V-E9zJtGNCs06m_Br8g
Message-ID: <CAFEAcA_=JJcOq-DtkuMOurB2cD9tfzfn4t5LR1JZnXNBJpP11g@mail.gmail.com>
Subject: Re: [PATCH v2 09/27] kvm/i8259.c: introduce TYPE_KVM_I8259 device
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1792166257-6F4C74E9-CF0FCC74/0/0
X-purgate-type: clean
X-purgate-size: 485

On Fri, 16 Oct 2026 at 15:23, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This device represents a single KVM 8259 PIC and its associated class and
> ensures that we can safely embed the device within a container device.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/i386/kvm/i8259.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

