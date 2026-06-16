Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FAECD98DA
	for <xen-devel@archiver.kernel.org>; Tue, 16 Jun 2026 07:14:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1338709.1599748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNzj-0000FJ-1I; Tue, 16 Jun 2026 07:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338709.1599748; Tue, 16 Jun 2026 07:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNzi-0000FC-UQ; Tue, 16 Jun 2026 07:13:58 +0000
Received: by outflank-mailman (input) for mailman id 1338709;
 Tue, 16 Jun 2026 07:13:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZNzh-0000Dk-8o
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:13:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZNzg-008Udk-0d
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:13:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30f7ac-5cb7-0a2a0a5109dd-0a2a4506b370-26
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:13:55 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30f7b3-7371-0a2a45060019-d155dd2acd2c-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:13:55 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-45eee266c6cso3720334f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 00:13:55 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3abd0sm60697795e9.1.2026.06.16.00.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 00:13:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781594035; x=1782198835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWaOqXusk5UH7sy1tR/gB25isu2gr52oSgtgNWgDo/A=;
        b=bQSdJvrNrKISQcHHGz9Q6EwDThxOEpVYPMbu9Gx2OZ04pKmtP5tnxG9rY7yKbOAfzl
         V2fGt9TLAPKn5jxPdmak+aUKQCRKFVv7L374xATa5zTFh2Cf6keeCNsmlpi0zklCPxqw
         yBiJa9VttXhs6iBjocklozSO82vYBozgKs0vJ052ELJ5wtKqdhXEFQN4GjAzVnAGtgin
         bDu+p4ywDBS8DzJU0oqdBxYwDzwIFKE0hYVgVqBlM4RqzvzXtJktc9U1l4eFyygI1I+0
         4EXz9choMsWKGADOEzOOvWeQPIgJq7kpjB7v6vodkwc2BGHx3lbmY22uMlFCkrnf1/ng
         LgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594035; x=1782198835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWaOqXusk5UH7sy1tR/gB25isu2gr52oSgtgNWgDo/A=;
        b=hdPU+GwP5sxKfEwlNw3lfgTs7+NhFiZ7jj8B8e7aClIbg0GjFbEeAOb5DhBtZqcDsi
         QyOmpKQrIfWyjaG2DHWxrbFE3e3WzfULXkOrO0D/4dOg5BC8SMxVXORAMG5AZKD6Ed5w
         HQfyYHDb3/1mTV5EOaSfFEngHWf5w/2oTBzt6k8RcuMtELOs2hktV0MA0f9tKkKHSWKs
         5xqGyBom9fZSf6mYLGgeLActmBR/TvXARRCJXxARIARAYEd8OvajOfB/xbssUSA/XVqT
         x+udy6cddaWc3zS6kp7XVos6e3V+rocBj8GvRovFSx/JoHGGcJfjP2J7FlbJZxOaeSe+
         NHsw==
X-Forwarded-Encrypted: i=1; AFNElJ+Iq1b23McjMTl1Z59AlYYtFXKNpFo1EVYtEnw41M0qD/iBPKHsUIH+BS7zyyM6H3T+l7ASzD5yRbw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA+fC0qPjtTNFTe48CW3VlnkTIMMqjYRqW0z7c348fT5cm0M3o
	kXcfJGeA4atXHeTHgOYFrfOYcaojgKEyH4lQD/My5LItuBqtF5m18Dve
X-Gm-Gg: Acq92OH0nWGrIhV55WVTSfXE+NVHcp2YAeBxInfDA2q5HNTEmAXIo3iKfqlYw6tHfuQ
	EsY1ZMzu1g2U/5x4188jEvjmf83yHyKXUMwG7kFlNu4H/NbvMH87q8qJ7Fu6685VVs5fy6i4axL
	+cxpEmOmCEQ6+mDV0ImTnoOtW1+47rdzph8YvM2W0A5kgp1CLZId3q7utBYKzkNdt6mHX/J1v2K
	u86kQ4lKhFdTugBkcX4lqbYIH1IlPK1a2eLqDek+keY+yWfnGkcDW9orzJxRN09NX1BtcySrTAy
	xn8Akz/OwuuI5ArJAm1UtEgCigI9cxx8Uwt/qFUd99ISPFElqlj6ec/rh0JgmFbXBqXKBHc8yCO
	bmaha3b6WCZ6Gigc84A3xVPuzPoeHdqxIBre4PKSMgVQsQcwujCA9gsIQ8b0ixbgNnf6TQ1aw2F
	tpjfsLu90rxbyX5AJJmq+NYA/gvqizcLul9gjN6wAmwxYo+PF3cqACOenTCBF2QKVdtpXqIDtQ4
	+nVXj7dliRqrgh8
X-Received: by 2002:a05:600c:34c9:b0:492:1e50:978d with SMTP id 5b1f17b1804b1-492200838bemr192849145e9.16.1781594035260;
        Tue, 16 Jun 2026 00:13:55 -0700 (PDT)
Message-ID: <0bba1000-531a-45b0-a442-59fbf4a288b3@gmail.com>
Date: Tue, 16 Jun 2026 09:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] gnttab: drop dead local variable from
 gnttab_map_frame_begin()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <d0702419-2cec-45fe-86b4-470cf4d55b5e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d0702419-2cec-45fe-86b4-470cf4d55b5e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1781594035-84158D75-3E976DC4/10/73395122804
X-purgate-type: spam
X-purgate-size: 542



On 6/16/26 9:02 AM, Jan Beulich wrote:
> As Michal had indicated in review, status is now a variable that is set
> but never read. I made the resulting change locally, but then committed a
> stale version of the patch (also omitting Michal's R-b).
> 
> Amends: eff88c4d3543 ("gnttab: simplify (really: drop) gnttab_set_frame_gfn()")
> Reported-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


