Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CDDC5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 07:44:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388804.1629784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3dS-0008E8-6i; Wed, 12 Aug 2026 07:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388804.1629784; Wed, 12 Aug 2026 07:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu3dS-0008E1-47; Wed, 12 Aug 2026 07:44:26 +0000
Received: by outflank-mailman (input) for mailman id 1388804;
 Wed, 12 Aug 2026 07:44:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wu3dR-0008Dv-Et
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 07:44:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu3dQ-00DL5A-R6
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 09:44:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7c2451-bab6-0a2a0a5309dd-0a2a45078eee-18
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:44:24 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7c2458-b4ea-0a2a45070019-d155802aecba-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:44:24 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4954dff6536so4883135e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 00:44:24 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d709dfsm5027638f8f.35.2026.08.12.00.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 00:44:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786520664; x=1787125464; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lm/f+ccEM3XgjBsvgUdE+M8tHbe5ngMBnR2I6CsCIeE=;
        b=UUS7FTk34DPzwwyVqiLPDNoWNsaYDfudSb7kx7ZcxzbKCDzpq7W8I7r8oBKkFXvaEv
         8MWY6v0QtAEGkhXmiVuLrdAWCPEKmYXGHITAQFZfYJ/2ckdoU77mL2iXEqzgQRdf/Vo9
         /fP9+Q2kzFzxFYbBLMSfbhdld0mVuke/Qgo7Ojasy6f325sqWmsAUXt0DgzSsH+tZcDP
         k3yBUYJoWlVH/mGSZW+2fWTxeK8LSyckbqDHiwMQkDr41pj0Y6xSr7E3e+cV1pLL3m/X
         V/SjuCFdS57rN8IlCxmT9RPJBQWdH325WBK0xXpqzUC20fU6vHS4GqAZSKs8DBJm0orv
         Jm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786520664; x=1787125464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lm/f+ccEM3XgjBsvgUdE+M8tHbe5ngMBnR2I6CsCIeE=;
        b=PbBCmw6iCQHwE9S6QcU3MMh8FqZfuqMegT/6aWeXiE+gHTtEImqYkBi8dvVdOmUK4U
         VqgdW3vuNRxqIAQ35dbntwJL+fcVSEUoBACc1HBUAPyRudNO3I1/Qcs5puiPcKyzdsm1
         rR8RFZwkIHdChS6hAcpyALcC65gJCvEJcJxalV4HTqica7+eaHUGVy9wy6rsmvnJOda0
         L2oZ5dFCYuFkArz6lUuNk8Vk2FKRCzh3WgGpbW0kOTiWWkyS5ixvzznah15KP13jkMCq
         HGebTO19V2NdUduyvknrvWcH7y6b6Ip2bWXMQJzTj8zW5XYSoPVEcKQ3BNaOguuIEGYR
         ZBiw==
X-Forwarded-Encrypted: i=1; AHgh+Rorcx/iZU7fwh5xVJ5STeU2be1rMN/a5l1HKhRTuMrOw/3BhqQxsHfXArFI51LM0q26rrMN/3fDbfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuuyiTt0So8xwvGY0Mh2bdVQ6mx6uwrmJDEB+NiNOUm+T2DBIH
	GlpsudsnDJeeTMFP+ci6PAHisNjaHuiIgX12T1QUBRFIsXOdPF3NjASH
X-Gm-Gg: AR+sD122HTIm3iaCYCaNxuJnT6VqqZwFZrRlxx3kgixkDRxysciDv01Lp2RtN5CX2G5
	+6iRWTCVrHQNFjIzROT5RE0ysKK4sVMh+QbAtZzSRTc3lctBu6ybQpXGt6+LkmpuzDwaanFp3GD
	JTRwCDJMjvSfV+hrpihU7sKFTW1Wj5e4AzW1OMVknmfYHXY1jkMu3Loy1giADi91ECAxxpbfvJT
	NoIjDdZm54glAKHL0RAMrLk0n5wCJiXAWU8/7ZxU2refqoEro7usOJfNhmXWtKrrItdfDj3qVu6
	rZ2HKWzeKZiLjzSHpxmHSZ9Nv1MFqPiNWhE14cqx0fpy9+eyfuOogVUPyiSpADkuuq2v+KlnB2f
	GdQeNTorMt5u6TZ8g03taaLYhZO6V/QBIVIK2xYX9HqRBHD4b3iZk5hjTo7bNh5xl2OBY0TJkOT
	PXfSWu62dtKY2j+HqNqrlovmsdFgA7UyLc56kVzsD0x/y5A5YOs3tKhhCZjHrU6hR5ycQwPvO0L
	5DOrRT/0rlRhnavrSFf0dBQxDygqbAdgHjSyR4A2OE=
X-Received: by 2002:a05:6000:2405:b0:480:d9:ee6d with SMTP id ffacd0b85a97d-48152c62f17mr3427743f8f.19.1786520663929;
        Wed, 12 Aug 2026 00:44:23 -0700 (PDT)
Message-ID: <befa85b4-818d-44f9-af43-0c14f0549154@gmail.com>
Date: Wed, 12 Aug 2026 09:44:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/common: add keyhandler to show Xen command line
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org
References: <20260811210956.3806559-2-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260811210956.3806559-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1786520664-36EDEAE4-47C38C69/10/73395122804
X-purgate-type: spam
X-purgate-size: 2705



On 8/11/26 11:09 PM, dmukhin@ford.com wrote:
> Currently there's no way to print Xen command line on the emergency
> console for debugging purposes when 'xl' is not unavailable.

It looks like 'not' should be dropped. 'unavailable' covers 'not' itself.

> 
> Add new keyhander 'X' to do command line printout.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - print built-in command line too
> - change handler to print command line only
> 
> Changes since v2:
> - account for CONFIG_CMDLINE_OVERRIDE case
> 
> v3: https://lore.kernel.org/xen-devel/20260810230359.671587-3-dmukhin@ford.com/
> CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2751523722
> ---
>   xen/common/kernel.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index d1bef9ac2b2b..8a43e4421002 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <xen/init.h>
> +#include <xen/keyhandler.h>
>   #include <xen/lib.h>
>   #include <xen/errno.h>
>   #include <xen/param.h>
> @@ -505,6 +506,37 @@ static int __init cf_check param_init(void)
>   __initcall(param_init);
>   #endif
>   
> +static void cf_check show_cmdline(unsigned char key)
> +{
> +    const char *builtin_cmdline = CONFIG_CMDLINE;
> +    const char *cmdline;
> +
> +    printk("'%c' pressed -> showing hypervisor command line\n", key);
> +
> +    if ( builtin_cmdline[0] )
> +        cmdline = builtin_cmdline;
> +    else
> +        cmdline = "<NULL>";
> +
> +    printk("Built-in command line: %s\n", cmdline);
> +
> +    if ( IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) )
> +        cmdline = "<NULL> (CONFIG_CMDLINE_OVERRIDE=y)";

Won't be better to use <ignored> instead of <NULL>? Also it reflects the 
comment (But if CONFIG_CMDLINE_OVERRIDE is set to y, @cmdline will be 
ignored.) above cmdline_parse() function better.

> +    else
> +        cmdline = saved_cmdline;

IIUC, saved_cmdline could be empty and I think we should take that into 
account too:

     if ( IS_ENABLED(CONFIG_CMDLINE_OVERRIDE) )
         cmdline = "<ignored> (CONFIG_CMDLINE_OVERRIDE=y)";
     else if ( saved_cmdline[0] )
         cmdline = saved_cmdline;
     else
         cmdline = "<NULL>";

> +
> +    printk("Command line: %s\n", cmdline);
> +}
> +
> +static int __init cf_check misc_init(void)
> +{
> +    register_keyhandler('X', show_cmdline,
> +                        "show hypervisor command line", 0);

Last argument is declared as bool so I think it will be better to use 
false here.

~ Oleksii

