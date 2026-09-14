Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962C6C88E65
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 10:46:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420739.1646976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64CA-0005f0-Pw; Mon, 14 Sep 2026 10:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420739.1646976; Mon, 14 Sep 2026 10:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x64CA-0005et-N8; Mon, 14 Sep 2026 10:45:54 +0000
Received: by outflank-mailman (input) for mailman id 1420739;
 Mon, 14 Sep 2026 10:45:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x64C9-0005en-MO
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 10:45:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x64C8-009VsU-VX
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:45:52 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa7d052-8faa-0a2a0a5109dd-0a2a4505d122-42
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:45:52 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6aa7d060-4cb1-0a2a45050019-4a7de14cb5be-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:45:52 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485b1d2874aso1486356f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 03:45:52 -0700 (PDT)
Received: from [192.168.1.109] ([85.107.101.239])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb34e4b5sm25755895f8f.22.2026.09.14.03.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 03:45:51 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789382752; x=1789987552; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JynjUxuKg39+UQ6kN2RPzfnI+Q+Me2MxlG+FxFUg+Jk=;
        b=Z6vM5uUVMQDsDNkRIOS8B0eC6YmUeXV3TZu8VQ/XLA6MPo/zoiuXYPfZa8cmvW8sU/
         /9BDr50rjfAnBwZQCZUDdZ2Jo7IjlKt2lrpGXWqS3RkQu36nNPiu6EvmTnWa80ddAf2H
         HVoPrx6aJUSRn255iy5Btox663sAyrDE8mOyb+p2xz29cKQZ2RwP6vgmaAOxJjfC3GPv
         o76JlfSpVAWJmdXqSM0O8jexfHpSVKDO0NgqA/ZFrSjWtWNxuiWSSMksMOyRblu289Uj
         LX1sN9CK69rSYXq2BPLdHS6ljAOavDexNKlzaw3nTeM0V0OXE/1c0gY5/sQAARhXUJbr
         9mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382752; x=1789987552;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JynjUxuKg39+UQ6kN2RPzfnI+Q+Me2MxlG+FxFUg+Jk=;
        b=DJQpW6X0tUK+aAZwjfILMUjnyP5/hOcmPMXqXIAVNAYOmlZGYiOja8XKVYZ9uL3rt9
         tgfL3AMt4xys6UPqIhprNbsmDi/1Ia70Ccsb1onszOZxysD8H8PwEKSlUjhf8tW5wcFo
         PREYdzxWWaSMSxUMgo/bi4QJHMQ9jHVgbh/1iXhAm6G6oAfkW4VU1KtMtjQV51sNDrGT
         MGmTYp5Rpdm1VAEXlkUXzC+0kZASN0XVOmgoPe7sdDH+fRAJe36ruC2k0Gf9YVhS34LO
         ERFuG61e2m6MgysCIuDF13i/eoZZkq+MkRvpOLhwKOkoLMGryxDcneCgAVXlcs1cX7mG
         ZQfg==
X-Forwarded-Encrypted: i=1; AKwUvBwNpBJnNOkeJosfgHtIoUbHO1CmodtEB4U2rXI1BT5bYg5lsf90yTG/dY9lppXJ0zgWpWQuQ41TSs4=@lists.xenproject.org
X-Gm-Message-State: AFuF++mCZIMoiH54WgjSt7tgB+laqtMHhquZfgM6Buck5J3IZ/LryL2n
	UvnUaGh5FgrJaWC7bVTnak5Z3wyK5Vpoa8qNSZxsefpbwV95IeZrsPf17IkWwA==
X-Gm-Gg: AYBFou2v/Mz1jGoC85TGv1WV3KWdoUFQZoq5XROzj0cWe0XF62rMpfmyA/JRZm2ZEK7
	xNtoSCRLa20WNn+Wwrr6mZBDs7GUbVMkoY7/TCWrgqVBKeNytwZDKEDh9/dp3iyMJSoCA0sq1Qn
	N01tPXHJQSW/f2Hq/wsik/VdLPlGPiGwBQzbILUjSaEo9y70q8muzNWYIW+6e1RpDM4KYWnvAcj
	NCXQ1KP56hEJ8ujouDj9HshVsUQeaGpy7/ix8E23ieBOYPN6CRyIlyKpgUsUwwwXGgo1HfTeUfG
	WFWiSaZbiK/E/Gt6JnovDRBh/yp0p0ls64KyNJVIhnt3QraDZL10dvnEK1pDmF5+za38bpchuWb
	kM5ahj6kNPEEWNH7LWYGblSDxa64NEqmg1wDPrQ0cDzjR7j5nfo5Y0+iv1h6Mn6+D9gtuGCs/9x
	N4oi/plZmzt73yd0LXMwCotwbkmIW+yi81kWlPdulSw/NYMVLLea/faKw7u2lxFW56RJLnwkmpP
	OBkbXs=
X-Received: by 2002:a05:6000:186c:b0:486:f45a:57a7 with SMTP id ffacd0b85a97d-48702b0902amr4128597f8f.16.1789382752155;
        Mon, 14 Sep 2026 03:45:52 -0700 (PDT)
Message-ID: <c1d9c2c7-aed3-470a-afaa-4d114a6081d4@gmail.com>
Date: Mon, 14 Sep 2026 13:45:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] xen/sched: rtds: make admission control cpupool-wide
 toggleable
To: Jan Beulich <jbeulich@suse.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com, roger@xenproject.org,
 dfaggioli@suse.com, anthony.perard@vates.tech, julien@xen.org,
 sstabellini@kernel.org, gwd@xenproject.org, enr0n@ubuntu.com,
 michal.orzel@amd.com, xen-devel@lists.xenproject.org
References: <20260826045720.5779-1-frn1furkan10@gmail.com>
 <20260826045720.5779-5-frn1furkan10@gmail.com>
 <deeae7d9-b37e-4d60-95fe-a87b7ef59859@suse.com>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <deeae7d9-b37e-4d60-95fe-a87b7ef59859@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1789382752-73EB92A1-8C393110/0/0
X-purgate-type: clean
X-purgate-size: 1611


On 8/26/26 09:14, Jan Beulich wrote:
> On 26.08.2026 06:57, Furkan Caliskan wrote:
>> @@ -1691,6 +1709,33 @@ rt_dom_cntl(
>>      return rc;
>>  }
>>  
>> +#ifdef CONFIG_SYSCTL
>> +static int cf_check
>> +rt_sys_cntl(const struct scheduler *ops,
>> +             struct xen_sysctl_scheduler_op *sc)
>> +{
>> +    struct xen_sysctl_rtds_schedule *params = &sc->u.sched_rtds;
>> +    struct rt_private *prv = rt_priv(ops);
>> +    unsigned long flags;
>> +
>> +    switch ( sc->cmd )
>> +    {
>> +    case XEN_SYSCTL_SCHEDOP_putinfo:
>> +        spin_lock_irqsave(&prv->lock, flags);
>> +        prv->admission_control_enabled = params->admission_control_enabled;
>> +        spin_unlock_irqrestore(&prv->lock, flags);
>> +        break;
>> +    case XEN_SYSCTL_SCHEDOP_getinfo:
>> +        spin_lock_irqsave(&prv->lock, flags);
>> +        params->admission_control_enabled = prv->admission_control_enabled;
>> +        spin_unlock_irqrestore(&prv->lock, flags);
>> +        break;
>> +    }
> 
> Blank line please between non-fall-through case blocks.
> 
>> --- a/xen/include/public/sysctl.h
>> +++ b/xen/include/public/sysctl.h
>> @@ -814,6 +814,10 @@ struct xen_sysctl_credit2_schedule {
>>      uint32_t ratelimit_us;
>>  };
>>  
>> +struct xen_sysctl_rtds_schedule {
>> +    bool admission_control_enabled;
>> +};
> 
> In the public headers only fixed-width types may be used. The width of
> bool is ABI-dependent (no matter that it's exceedingly unlikely to ever
> be other than the same size as char).
> 
> Jan

Thanks, I'll fix these in v2.

Furkan


