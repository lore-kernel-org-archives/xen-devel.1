Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A9B606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 16:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APUPzylW
Received: from list by lists.xenproject.org with outflank-mailman.1492894.1693142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTM8J-0006EQ-V3; Tue, 17 Nov 2026 16:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492894.1693142; Tue, 17 Nov 2026 16:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTM8J-0006EJ-SI; Tue, 17 Nov 2026 16:34:11 +0000
Received: by outflank-mailman (input) for mailman id 1492894;
 Tue, 17 Nov 2026 16:34:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xTM8I-0006Dj-GX
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 16:34:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTM8H-00Ct9M-TG
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 17:34:09 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6afc81e0-2eae-0a2a0a5409dd-0a2a4504d9e0-44
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 17:34:09 +0100
Received: from [209.85.208.181] (helo=mail-lj1-f181.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6afc8201-b57f-0a2a45040019-d155d0b5e5c1-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 17:34:09 +0100
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-3adfe77d336so713721fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 08:34:09 -0800 (PST)
Received: from [192.168.0.114] ([91.123.151.27])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ae2b4b1f68sm39877221fa.0.2026.11.17.08.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 08:34:08 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933249; x=1795538049; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4Mfy5RdLzTmhxN9VcE97uJlnIaWhvHDR3ofzo8USlE=;
        b=APUPzylW+k8kT7aT3kh2ihw6DtPocOl4LVm8KS0281/o2nP6dcc1b7p7MWnpqiLtId
         TaVvJjjG92BZSac97g4uSajTxH3udWsQocsiks4OlVgZDmXTLJTJdO7SbqALLhJZS6o3
         PzmIBeQfM/nctAlyXnjzStr8NEX8sVZsXqx5s5qHNUDtqVG9d86heKieJeyYrxU6Swvx
         JUGdpW5TnfE9ckz2xHFH8TmDhadiw2taLHPl6eMKqB66UJCoEOtfsypK+3O3lR17rJ09
         ftXLa+7NXv5fhFYtTP5/KJaXD1L607Lsaadws1J55umxVruJ/hZtnxSipZrd0y4sKFo8
         MFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933249; x=1795538049;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4Mfy5RdLzTmhxN9VcE97uJlnIaWhvHDR3ofzo8USlE=;
        b=08LiMmegnHEGc2DOooSWWM31caH7IUHELmY/v24KS6AkwyYxKeW3NkPcYaclwUJvVt
         yvtmY0YAFE22tiARzp8t1vll338L5VTJYvpCGtEQOvKoyZ/QU4O/hbkD0d9sH/uiiwRy
         sS49WIePXvPhHNeX95fpPeNxZ5wR63wDl2OJMEk619v+CGDUxWOPXwh7G4RpM/abed1v
         V7Gs94xJUmQufsKXSB0wmcpcnqV1WqOAvhh5amzHaIhDG3iVAKHCs82B5C+88A6I9QRP
         6Z7rsPmkVRSb+XBGPsmhXRQtRtMMWGicwKGN70t91KkP7Xnmoxhen1BlIqoBByg0G6j1
         vX/g==
X-Forwarded-Encrypted: i=1; AL+hErEY+U+i0mzo69CTU1A3Ft+eqzgtu1SI1wweGdBv+//RnGsNbM5VSTUvzyCphTnNq6CslM74/xAH2eg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/MjGykAalFshqtO49TT38/BjqwATBvloDoKkis198tCXpZwMDX
	JM6X4CjciT5OZaL2ySGHzOhcAoA3S2+w0aqZj3nmy4GKaRbKqwHsVFQu
X-Gm-Gg: AYBFou1e/ev+NBWFCt4JbU+W8A2bg/9nnnwcVAIpv28ZJIn+3e8IOwVQwiAtZAMURHN
	1slq652WOwz8vxg92WFjpUjqNb30M1YHhsUoaExE44MdYm2u9zchvNKs/6wEVnNbnvH8ZHTN2Ut
	lKFDyJv95LUflzVir9wfYaiiNgrjblpFV4fMeurq2ptgbUZSLdmcdKa3o9t6ys8Vzhz8GJ1cEFa
	qhLQEUomwMyPLuZ6vVLxicxhvZrBIR5Xz46CskDLm/iAhNrYFwRd9WulK3CFGCqJn3BTjbPlQXB
	561VWg626ZEdYif/+E/D5Pk9lPBbrp2pu96Etl9GPw5n2HmtQNUj6ni6lQsFyrBtjdlHhQZd18s
	U1f2NVAvM+sBEEAgseMhBSAy2srDVjcr3KNlbjlEx1WBjGhsfpS+AxU4sumrlY2KrygmmVmXvk4
	QTlvQAuz7yd/zs1P3uj0gmc+7/CSjX+X9um0d08wbjccviml4mtRNJWB9mY2wZkoA5izz1JjwlA
	MKFVQ6VzA7Pf6+xcZXEftzIc7o+Kge5HP0q/jGtj7taThqRXS3f7YaijYgmxgUNzYvt3bpj9Pmo
	EszgXvAEYBFsZTWs6nU1uLOR6I46FbI=
X-Received: by 2002:a05:651c:1b0f:b0:3ac:e26b:d9cc with SMTP id 38308e7fff4ca-3ae2b4f84b8mr49851341fa.23.1794933248950;
        Tue, 17 Nov 2026 08:34:08 -0800 (PST)
Message-ID: <57aa4eef-5af7-4ae8-9be3-84671ded2d12@gmail.com>
Date: Tue, 17 Nov 2026 18:34:06 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] pci/rcar: Rename PCI host rcar4 to rcar
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1794817300.git.mykyta_poturai@epam.com>
 <350d08bb0f494f96c02cedc4fa5e40673d512236.1794817300.git.mykyta_poturai@epam.com>
Content-Language: ru
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <350d08bb0f494f96c02cedc4fa5e40673d512236.1794817300.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1794933249-C08D9B50-77C72539/0/0
X-purgate-type: clean
X-purgate-size: 1838
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



16.11.2026 10:40, Mykyta Poturai пишет:

Hello Mykyta

> Gen5 mostly reuses the same DesignWare integration and register layout
> as Gen4, so one driver covers both. Drop the generation number from the
> file and symbol names.

NIT: But rcar4_pcie_osid_*, rcar4_pcie_bdf_msk_set, struct 
rcar4_pcie_priv, etc keep the generation number. Yes, the reason (the 
registers exist only on Gen4) is mentioned in cover letter, but this 
will not be committed to git history. I would add a sentence in the 
patch description.


> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   MAINTAINERS                                   |  2 +-
>   xen/arch/arm/pci/Makefile                     |  2 +-
>   .../pci/{pci-host-rcar4.c => pci-host-rcar.c} | 32 +++++++++----------
>   .../pci/{pci-host-rcar4.h => pci-host-rcar.h} |  6 ++--
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c      |  2 +-
>   5 files changed, 22 insertions(+), 22 deletions(-)
>   rename xen/arch/arm/pci/{pci-host-rcar4.c => pci-host-rcar.c} (88%)
>   rename xen/arch/arm/pci/{pci-host-rcar4.h => pci-host-rcar.h} (88%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b804434d52..68b47adf81 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -504,7 +504,7 @@ T:	git https://xenbits.xenproject.org/git-http/qemu-xen.git
>   RCAR PCI
>   M:	Mykyta Poturai <mykyta_poturai@epam.com>
>   S:	Supported
> -F:	xen/arch/arm/pci/pci-host-rcar4.c
> +F:	xen/arch/arm/pci/pci-host-rcar.c

Remark: pci-host-rcar.h is not covered by the RCAR PCI entry. Yes, this 
is pre-existing and not caused by the rename, I thought the line was 
edited anyway, so it would be a cheap addition.

I did not find any issues with current patch.

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

>   
...

[snip]

