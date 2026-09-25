Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6158C98325
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 15:34:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434103.1654249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA7w2-0006SR-9m; Fri, 25 Sep 2026 15:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434103.1654249; Fri, 25 Sep 2026 15:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA7w2-0006SK-76; Fri, 25 Sep 2026 15:34:02 +0000
Received: by outflank-mailman (input) for mailman id 1434103;
 Fri, 25 Sep 2026 15:34:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xA7w0-0006SE-RF
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 15:34:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA7vz-009I28-TG
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 17:33:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab6945f-2eae-0a2a0a5409dd-0a2a4506e79e-20
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 17:33:59 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab69467-195a-0a2a45060019-4a7de14cd7ae-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 17:33:59 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f635552aso792727f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 08:33:59 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a30bcdbsm8084341f8f.2.2026.09.25.08.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 08:33:58 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790350439; x=1790955239; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rC0/FChRcP6WDbGZE0Y4ocaflYft5ulQPnAvFiX7l2Q=;
        b=n0yRXN0totprKiLdM0xhEoyqJqvDKThjQn4arlMymQOfaiXeBs17ilrbJ6/99ddZXT
         BYjqvegLmykn08ZN95LLxSa/8tSJVTUbsfg0dk8SgGj3DKMbVLE4dBaDoH1ZdkkU3jKr
         2DwK0mJvyUAwYW225TDPQ58+s2R7/SGa73DNHXFYtdy3qZR+KrR1/oNFqkFFVPnDaeM2
         kvF8H/WNjGcBOdmNrlITpDWrCapyMWUU6c25QvuAd8lpsd41jNYw6moz3S6nNjWvGtpr
         iy8y2uK9UvFyBYowGnUTaA6BBgOjdQxAAZbtY8an4HP28DZhcznutHA/k/sE1PT1yQDc
         /iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350439; x=1790955239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rC0/FChRcP6WDbGZE0Y4ocaflYft5ulQPnAvFiX7l2Q=;
        b=YIAiSqSO+aZDANYmgFdWdRvbks9OiW2+qnG7qDqY291GCi1cg+pN4x9cCibDFK6GD8
         90NtMvsJZbcjU8AQfoiXTYIY1Kbq5j9YRdOgfsM/HA4zf1PylB03j8tGhu9nbrku5hXk
         PRqlvoNbSX9afgYBtmB31mRPB0IfChnE+gul8CUFa3+OkzWxjsy2AMVOvXokrdj7IDfW
         iVJ8gGz045qgZk7D2RB3oo5UfngMNQG6gzJ/RbMQ+k7i5p2Qpv1DUngOQFmxnJjOXD0R
         D/41gZs8pPpir0UsGFRQR3azl2zeDLLdMkDd/EgJdcUgASsPMh0oa0uzSkxdgeUAkGYO
         kKrQ==
X-Gm-Message-State: AFuF++kkGjjLY/gJS3tkBKnltB9UnrZacKwBazX0pYu/tH5SGOyvn6i1
	izyvQm3qqQpEB0sp9ZhMG1amf3I0fkAr45d4T8oAjys2b/yQ9wvPNss4
X-Gm-Gg: AYBFou09OTHecU2JfEmKaNLSaXuDDEYih3Keat0IxC76kLukmCL+ukPMCqqvwdOJCVW
	2a0+T4VI96SU/QwbuCQwtPOReu/YEmgnJvjcU4IDt5Ph84/OXganFqIfTl/c91znXyamMhUAZGE
	8jMlzy03PxGAqf1gmxg9EGoF239PPIL8HCohPbvkAsnPqV1qlju16o974rPAYJRsYneSnSSdsT6
	pRZftagr7noK87lvDzeS5NNLJzid/qGl5LrTY/fFvmHXS9Dr5Ap1Uj97YcoNKAaOATLC3HAwFrL
	DYkExxJ0AW1XDKwHj1Q5F3CBUL8Vu51wqN+HPLr5T5nbwX5LEeNl6DwK0U8Jkt2iJYJJ3F3XVgL
	7RDOnjnZ92KzSNZLhNzjOYx/p1OjwRUs7HJAE1zf5xN1a+DvDVogEZTkvqHL1ibvCmE5ZRxhx0s
	9+5FfyjYq8bFnqnTaxlrlofASbwV3AzqHxUAw3yTkNHYHJbFkNzN+Zj/xmtSsqJVv2ENfPsOJmX
	vTCqAM0iqjWU+zt0lcouKHN1XZyORvRy5qIbRuZAZUwXW/ibw==
X-Received: by 2002:a5d:5d08:0:b0:487:35c:6e6b with SMTP id ffacd0b85a97d-48872a5c2d7mr11484312f8f.12.1790350439174;
        Fri, 25 Sep 2026 08:33:59 -0700 (PDT)
Message-ID: <8ca6e469-862f-4373-8dc0-0d3b01f89c8a@gmail.com>
Date: Fri, 25 Sep 2026 17:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 36/39] xen/riscv: wake up a descheduled vCPU on a guest
 external interrupt
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <ed5a8b4d8137d9ce2f291956d19fbeaf61cce7a9.1787838835.git.oleksii.kurochko@gmail.com>
 <1790259947.8631fc262581453bbf619ec5b2062170.1a0d3cee79600072c4@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1790259947.8631fc262581453bbf619ec5b2062170.1a0d3cee79600072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1790350439-1ECC577B-829624E6/10/73395122804
X-purgate-type: spam
X-purgate-size: 3713



On 9/24/26 4:25 PM, Baptiste Le Duc wrote:
>> While a vCPU is running, MSIs written to its h/w IMSIC guest interrupt
>> file are delivered straight to VS-mode. Once the vCPU is descheduled
>> nobody observes that file anymore, so a guest blocked on such an
>> interrupt would stay blocked until some unrelated event happens to
>> schedule it again.
>>
>> Let Xen observe the file in that window: on deschedule set the vCPU's
>> bit in HGEIE, which turns an interrupt pending in its VS-file into an
>> HS-level SGEI, and clear the bit again on schedule-in. HGEIP only
>> reports a file number, so to get from it back to a vCPU keep an
>> owners[] map per pCPU, filled by vgein_{assign,release} alongside the
>> VGEIN bitmap, and kick the vCPU it points at.
> Nit: I would reword the last sentence to make it more clear:
> 
>      HGEIP only reports an interrupt file number, so to find the vCPU to
>      kick, keep a per-pCPU owners[] array indexed by file number and
>      updated in vgein_assign()/vgein_release() together with the VGEIN
>      bitmap.
> 

LGTM: I will apply your suggestion.

>>   
>> +/*
>> + * Start to observe the interrupt file from HS-mode, the same way
>> + * imsic_ctxt_switch_from() does it for a vCPU which is switched out.
>> + *
>> + * The counterpart, clearing the bit of the interrupt file which is left
>> + * behind, is done by imsic_vsfile_local_read_clear(), which already runs on
>> + * the pCPU owning that file.
>> + */
>> +static void cf_check imsic_local_hgeie_set(void *data)
>> +{
>> +    const struct imsic_vsfile_data *idata = data;
>> +
>> +    csr_set(CSR_HGEIE, BIT(idata->hgei, UL));
>> +}
>> +
> Sorry I'm a bit lost here, are you doing that for vCPUs migration?
> Because in your commit message you only mentioned scheduled-out case
> which needs to have Xen observing the descheduled vCPU to re-scheduled
> it, but no other case that would need to have interrupt file observed is
> explained
> 

Yes, this is for migration. A vCPU can be migrated while it isn't
running: e.g. a blocked vCPU whose affinity is changed (it is moved by
sched_unit_migrate_finish() and stays blocked on the new pCPU), or the
vCPUs of a domain moved to another cpupool.

Before the migration, imsic_ctxt_switch_from() armed the HGEIE bit of
the vCPU's interrupt file on the old pCPU. That file is released as part
of the migration (and imsic_vsfile_local_read_clear() clears its HGEIE
bit), so afterwards nothing observes the vCPU's interrupts anymore: the
vCPU isn't switched in on the new pCPU, so imsic_ctxt_switch_from() 
never arms HGEIE for the new file. A blocked vCPU waiting for an MSI 
could then stay blocked until some unrelated event wakes it up, possibly 
never.

Hence imsic_local_hgeie_set() arms HGEIE for the new interrupt file on
the new pCPU. As HGEIP reflects the current state of the file, this also
covers an interrupt which was already pending in the old file and got
carried over: it raises an SGEI as soon as the bit is set.

For a vCPU which is about to run, this isn't needed, as 
imsic_ctxt_switch_to() clears the bit anyway.

I'll describe this case in the commit message:
```
The same applies to a vCPU which is migrated to another pCPU while it
isn't running. Its old interrupt file is released during the migration,
and the vCPU isn't switched in on the new pCPU until something wakes it
up, so nothing would observe the new interrupt file. Hence arm HGEIE for
the new interrupt file on the new pCPU in imsic_migrate_vcpu(), and
clear the bit of the old one in imsic_vsfile_local_read_clear(), which
already runs on the pCPU owning it.
```

Thanks!

~ Oleksii


