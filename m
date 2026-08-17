Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E619C5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 09:23:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392768.1631762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtZ0-0005rX-ST; Mon, 17 Aug 2026 09:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392768.1631762; Mon, 17 Aug 2026 09:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvtZ0-0005rQ-PP; Mon, 17 Aug 2026 09:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1392768;
 Mon, 17 Aug 2026 09:23:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wvtZ0-0005r1-3l
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:23:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvtYz-00GSv4-GJ
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 11:23:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a82d2f9-e002-0a2a0a5209dd-0a2a4506972e-38
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 11:23:25 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a82d30d-195a-0a2a45060019-d155dd32ad16-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 11:23:25 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47fe377a217so2092098f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 02:23:25 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b783basm2381022f8f.30.2026.08.17.02.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 02:23:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786958605; x=1787563405; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BrctE81Qr1yl9EY7Q6HBkiNpNb0gAbctXwpRnjLcBk=;
        b=lh9fN8upDDynTS3JLLDcKxyQeRyE0o+bAI+3RdMMJEQggxm01vVr2HYRG4nFYt3qd/
         NQqoqlucmjTFxAmuxkjdMN7rUe1DjHUj1jcpcK/3tUSMIIEt4F4cetiZyOgMZoYdETE3
         YTzIRvhheVZ9fY9v8i4XEyCzxhFnScVjBdXnrQjcC6AjIgPERW6FzXc+exLpxzbpIr04
         pwsIlRxKie1MsGYbwdlOMlzappX99Z7Bm/lzJBHc4AJ1/ywmXNt6+25hyRXqX+KU3kUf
         lmzU/Wqj5P5apNXyjRIRItsb00Lcxd0VsTxUWBboeFzc0di8Dskc1AG/7bZn/M+lHAaU
         bUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786958605; x=1787563405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BrctE81Qr1yl9EY7Q6HBkiNpNb0gAbctXwpRnjLcBk=;
        b=oK6BHOcLjETB0vC3pn/M49+e0rhDMMlNBZ9zX/mZa+vQ1oM4bhEnjYkKafrMv1xIYs
         J/UDT/DXiWsPXkFEP7MdGN/IbBLqd9uTaulOJW9LitF/S5GT7xMAGIuW1wOHQTcmZPMv
         VmixWeN2GAb6+3aBYQYYw4Uu7dqloI0ZgJWqrj9BgjyXqFT5FxHo0WgPJ0X5VtkwPONQ
         YOeFDX8Jlpovv0pUff9ycSC5CtsaQ+kafzC2s1X9vCLBpgzWGquOyh6fSC4jRftmi/Z/
         U+ltY1qvjB+pgz582nDEJaRlBzrSvkbKcXQXTbSIj16heb3WqtLQREvJzfv7RrVonLuJ
         RDuQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRGl7eUaSxmW5YjwN1z0ttqroIPv5GFOap/FA8yKM+QKF6pF2ughX0KI1FKExOM0xYjH7G3a8vRqk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVsIY1KU9HP1WjiDq1rAgiAnO0yIPGUItEWXOw0QyPiLbOHKIG
	K2JeH9AsfxmT6ew5xjq8aFZMHIeA3r8wbQxvI9zPTb9OiTjj+BsATT7N
X-Gm-Gg: AR+sD13sA8a6XoSuO0Afy8r3f/+aGSG0Th+5dEMeNl0OiOSFiGagQDEeNySpnW/AA2Z
	mWBuKfKSoQIRAQs+SxaFBP+peyrSk0hZOX55hxhcKE1HVBLTE7wqAb9pUkCv0+26rG0bhPnDpXY
	xvqEe4duSwxeT8vMWppf4OHsRqX3un+0mDl5zfiD7v6eTAGxW63JIlsDcV5N70ImvMVQLV9Snpp
	QY7Fc9itpbsq8f/AB5zsrWI5LarGeLtcgVUZJUsMiJZlM5dUA3hIM/BSBTp5fAsT09LFCmBExTW
	GFicEGrMWu3Ul4Y1n474cDVFRzkuYy8NBt8ceY6JGeqqIpe6ypn6Fz4PHn+IcQLaFgfIqFg4K75
	TrM63GpAWtZBvSc6CsTNo/YFx9vvDEP2ChTKv+zKikIZvPgDP+XDZg73zngnQgpcS/edj3RqS4V
	MfBdcIHZB8wBE4DBxAFWaoA+DL9xvSQwQrWDskubj9n8eU9DScWk8wbjDTsOQ3IgQfD054IcbdZ
	T88kMS4gayoyuX7BIeCcwCOkR1zwHfYCVyJRVNoPD0=
X-Received: by 2002:a05:6000:250a:b0:47f:7e8f:d62d with SMTP id ffacd0b85a97d-48160732f09mr32714993f8f.10.1786958604721;
        Mon, 17 Aug 2026 02:23:24 -0700 (PDT)
Message-ID: <9936c0d7-7daf-4fba-9bf9-40074fc31f7c@gmail.com>
Date: Mon, 17 Aug 2026 11:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/17] xen/riscv: add IMSIC state save/restore
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
 <698b5cf4-b383-452b-b6b8-fd5c09e41f51@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <698b5cf4-b383-452b-b6b8-fd5c09e41f51@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1786958605-FD40B77B-71B958DE/10/73395122804
X-purgate-type: spam
X-purgate-size: 1765



On 8/12/26 3:57 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> @@ -418,6 +419,28 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>>       return res;
>>   }
>>   
>> +void imsic_state_save(struct vcpu *v)
>> +{
>> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
>> +    unsigned long flags;
>> +
>> +    /*
>> +     * SW interrupt file always has ->vsfile_pcpu = NR_CPUS so nothing specific
>> +     * should be done in this case.
>> +     */
>> +    if ( !vcpu_guest_file_id(v) )
>> +        return;
> 
> How does the ->vsfile_pcpu sentinel value matter here, when you're checking
> ->guest_file_id?

Comment is incorrect. I will fix it.

> 
> And anyway, there being dependencies like this one on the other big series
> makes it rather hard to review things.
> 
>> +    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>> +    imsic_state->vsfile_pcpu = cpuid_to_hartid(v->processor);
> 
> As discussed for another patch in this series, this will need to change then
> as well.

I will update that properly.

> 
>> +    write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>> +}
>> +
>> +void imsic_state_restore(struct vcpu *v)
>> +{
>> +    /* Nothing to do */
>> +}
> 
> "save" and "restore" have meaning other than what you intend here, aiui. Once
> again without call sites it remains unclear when exactly these functions would
> be called. Which makes it close to impossible to suggest better names.

I will add some extra context and/or re-shuffle patches to make it more 
clearer. Anyway as you explained me in another thread a name is really 
incorrect. I will use imsic_ctxt_switch_{to,from}() instead.

Thanks.

~ Oleksii

