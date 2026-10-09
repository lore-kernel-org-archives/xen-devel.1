Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2699CA601E
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 12:34:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444345.1661238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF9nw-0003fi-4i; Fri, 09 Oct 2026 12:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444345.1661238; Fri, 09 Oct 2026 12:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF9nw-0003fb-24; Fri, 09 Oct 2026 12:34:28 +0000
Received: by outflank-mailman (input) for mailman id 1444345;
 Fri, 09 Oct 2026 12:34:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xF9nv-0003fV-98
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 12:34:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xF9nu-00FzXn-CD
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 14:34:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac8df47-2eae-0a2a0a5409dd-0a2a4505b19a-42
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 14:34:26 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac8df51-4cb1-0a2a45050019-d155dd2de115-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 14:34:25 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48b9d8055dfso4925564f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 05:34:25 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9acdb6dsm3548456f8f.48.2026.10.09.05.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 05:34:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791549265; x=1792154065; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFSCxbIvOEEeQKIu0h8lYBgS09CRD0JpdNANfgF+YRw=;
        b=Mc6dm6ppLnjeuUrahdKapP6VnvO+opUPbtipsyS8xLcDZJ0a5NBUgZgQSDWNOCPj/n
         VUDuLql4jpajIf3bxoR+3wuLwV/CE5slJpRV7rI//hApqyEf8ChC9m0hi/6VZHpm3+r4
         7ucEXhWj+unBssxo8aYZ+DP8UTLrQNHsbHpL/IRO98pqb7Jepa49Dc1PPJ2KANjVd2h4
         usmuv0zvVocHciJyx39Cvca1g0FdsS2yWkYmocHNH+UMPIJ5iWZ7PhSIu0y8y3YXQLeI
         owDNGEWgZBZdTYqTPMldxkmLEBwyCbgLgicDyBDxBJksM9dOjGZZaYom80M8jOWtTLjW
         Hgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791549265; x=1792154065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFSCxbIvOEEeQKIu0h8lYBgS09CRD0JpdNANfgF+YRw=;
        b=NniSWfqqyprG7LFG2ueLJF6NJs+cFrL+mmg/I7rQfowkpmJMQ47xRGZNUlrLFix7UQ
         M1yW1R7VOd3MOiCDpM0jvhXQ47YBX4FcvM5ax3gjxTf+P3j+rGLQ9Ct+m+rTqb9KCRwj
         26lG+wwwmiWOJ9d/726U1HNDIZHnbNo7ZA3DzhXfSniSf2Z1kiJ91hGB40qX0uR2J20p
         z1NOTA41Mnryy2PSc2J91aGNpz7tUAocBI+6RQW2FPj7Dt9OPlP/0EEGJdGFs+VrLoMX
         zRSEaMgZuwD+9kAbvUTzHuAb5TeWBg7NVJricblLbouW9Q+3SbxxFpiOcMZU/l9D6QZE
         Virw==
X-Forwarded-Encrypted: i=1; AKwUvBzUPcwVFr6ngIkRp5EH+fXuT+8NM3AqNHzoct+TD7YT3rX2bWrmKZkjgFjiMnHvgRRvtmukCiaK/XQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKyPvV//XyhK5tTRDY4lEgS0h8XmGzGr0gpPm0TUeJBLasZ1rvi
	YDw4lJIy8oycdyfexHTLegGmGlsrGRhkg2SfEV2ue8wjnPBI1WDVWFN/
X-Gm-Gg: AYBFou06v/0Whyaqvt2xqPHLLRI9yTpYq8DvtnH2YuyDHvtsQXTirbs2Qbm6IFOeeHM
	00IpRHqRftKuMadBKTcoRCcWuU9ZNCen3A3I5IDNIWnH+sJiolbiqhxXTW742F6yCbBKGQBXmVK
	3weFapEdpQZ3OO9YOwBL7weRD1H41VT7fhRThdNH7RzWtaOtCXEMGo2h0b+VOTGfhccxq0o9Yns
	w2xOq25Ebel46PmNYZqq1d1pywRvy1vbsR2K2bTB9PfpBPsWryOrpUceG0BkenjjR9gnJn7XJA1
	JtMJGVaRr1UGiGut0I9FaQhqPuTVWmURQkYm0pi7RFAYtOoa0uT2l4ZlmkcNklQYEd55gkknYEj
	wN/SjSTXifhSATbQfBXi9ppYff5aZnk2XjqNEd6Q1f4gK/SZZri203oDSpSt8r5WcM2KfP21SD8
	XKPAbHp6N0OoEgPcD1Z/L5B/Fkn/CsPaYmkehqrWCdiqIvkw/UlP27RHjYiIoFgX7FTXCU1rLMP
	p0=
X-Received: by 2002:a5d:6410:0:b0:48b:4c8:7b07 with SMTP id ffacd0b85a97d-48dbacf33camr2008893f8f.52.1791549265200;
        Fri, 09 Oct 2026 05:34:25 -0700 (PDT)
Message-ID: <cbdea9d7-e410-4228-acfa-3600e02bb956@gmail.com>
Date: Fri, 9 Oct 2026 15:34:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/22] xen/arm: vIOMMU: Modify the partial device tree
 for dom0less
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <9e31544f751d8a9708e1e6385da1b3ac6a438153.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <9e31544f751d8a9708e1e6385da1b3ac6a438153.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791549265-F44A42A1-97160712/0/0
X-purgate-type: clean
X-purgate-size: 3254



On 10/7/26 03:07, Milan Djokic wrote:

Hello Milan

> From: Rahul Singh <rahul.singh@arm.com>
> 
> To configure IOMMU in guest for passthrough devices, user will need to
> copy the unmodified "iommus" property from host device tree to partial
> device tree. To enable the dom0 linux kernel to configure the IOMMU
> correctly replace the phandle in partial device tree with virtual
> IOMMU phandle when "iommus" property is set.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/common/device-tree/dom0less-build.c | 40 ++++++++++++++++++++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index fcbeb8adbd..7280bcf72b 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -331,7 +331,44 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
>       return ( propoff != -FDT_ERR_NOTFOUND ) ? propoff : 0;
>   }
>   
> -static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
> +static void __init modify_pfdt_node(void *pfdt, int nodeoff)
> +{
> +    int proplen, i, rc;
> +    const fdt32_t *prop;
> +    fdt32_t *prop_c;
> +
> +    prop = fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
> +    if ( !prop )
> +        return;
> +
> +    prop_c = xzalloc_bytes(proplen);
> +    if ( !prop_c )
> +        return;
> +
> +    for ( i = 0; i < proplen / 8; ++i )
> +    {
> +        prop_c[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
> +        prop_c[i * 2 + 1] = prop[i * 2 + 1];
> +    }
> +
> +    rc = fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
> +    if ( rc )
> +    {
> +        dprintk(XENLOG_ERR, "Can't set the iommus property in partial FDT");
> +        return;
> +    }
> +
> +    return;
> +}
> +#else
> +    static inline void __init modify_pfdt_node(void *pfdt, int nodeoff)
> +    {
> +        return;
> +    }
> +#endif
> +
> +static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
>                                    int nodeoff,
>                                    uint32_t address_cells, uint32_t size_cells,
>                                    bool scan_passthrough_prop)
> @@ -357,6 +394,7 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>       node_next = fdt_first_subnode(pfdt, nodeoff);
>       while ( node_next > 0 )
>       {
> +        modify_pfdt_node(pfdt, node_next);

I might miss something, but ^^^ returns void, so allocation or vSID 
assigment failures (viommu_allocate_vsid() is added by next commit 
#20/22) are ignored. So the guest might be created with the host phandle 
and SID in its device tree or with a half-updated device tree. The IOMMU 
may (will?) not work and nobody is told. Should not we return the error 
here?

Also looks like the each rewritten node also leaks prop_c.



>           rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
>                               scan_passthrough_prop);
>           if ( rc )


