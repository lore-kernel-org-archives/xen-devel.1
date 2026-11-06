Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C6C606A32D
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RjFR4x1P
Received: from list by lists.xenproject.org with outflank-mailman.1476424.1682531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPGo9-0006BE-4A; Fri, 06 Nov 2026 10:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476424.1682531; Fri, 06 Nov 2026 10:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPGo9-0006B7-1M; Fri, 06 Nov 2026 10:04:29 +0000
Received: by outflank-mailman (input) for mailman id 1476424;
 Fri, 06 Nov 2026 10:04:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPGo8-00069v-1r
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 10:04:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPGo7-005q0u-BR
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 11:04:27 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeda629-2eae-0a2a0a5409dd-0a2a450bad74-10
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 11:04:27 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeda62b-b7e8-0a2a450b0019-d1558032e0a7-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 11:04:27 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so4512325e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 02:04:27 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56e58fcc6sm233062295e9.2.2026.11.06.02.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 02:04:26 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793959467; x=1794564267; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJ5sWiy+PAy0zmQRWdgFsDzyUh5xmBcT2U1yAwFWmnM=;
        b=RjFR4x1PUpLuSrjRzvphk/XG4YwyHUBJcmW2ncAFsElGCDBk+fz+xswF6q8qgTXXff
         kbojUM8Vhb25zEoEikyjtJdurQMkBhGkzj1ILzC+BytTCVT9Tt28R/X7MAe1OlpHGZrH
         ishmSBhhhHANgOIunvxibhWCriZvRad678Fo9M3J1LRiRkrGkrJ/LIOJPVJgWKa8/F2p
         HIWV+q2OHzpb1hZ89jUZYyVaLe6amneHC6vr4zEnY1FDhmXRhf5ccYvopkNnd9onTIYR
         Z+dq4Sxzz+6UGifRbiPGWIkxi5CUDr0PzyxsZyyAMVHC/HtBHxq9OgsJjTs4bFEa1azM
         Agyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959467; x=1794564267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJ5sWiy+PAy0zmQRWdgFsDzyUh5xmBcT2U1yAwFWmnM=;
        b=qGLBwQUp/Nh3iyAFRFh/xzNzpCVqJsx+oWRE2rzOR1owrDqr7MVK8nWpuKvEIIbFa+
         NVIGVcE8nwc8H1BndFH+2FCTOE05CwPfLWCYCm76F0Ofs1I+27OtkgKeSAj0XhcdlzKi
         viRYffnH81h+B9zD/J+5YABmCp3504jyr4ATwJD2V/7G6JxS+NjtC2zK4eRVbMxZ60DK
         jAmHFM7iSgmMZqpaVoZi989qLfdPrrUk3Kicqycx+MqOTf9lh0HgpmcKM/VxkT0wPJdu
         VFU77sTK63+/1/Qs7ETcPasRZxzPuiDVJ8JfV1HJGo14tfzTdlhIBYDbgVMs+/4pGav9
         MA1w==
X-Gm-Message-State: APuU4Z+w1+Uv0tdWkNOUN6XqJ/akYjIiX8brC6soDHHxsCJvxh8G59lB
	PPGaNMftuC+d2vHcdiHqVBvnHXWTXkDJhK0daNTBhNY+ZyW+Jpr5lpIi
X-Gm-Gg: AYBFou0sY8oLU1H/1IiUwFbFKJ6PL4UgyeFaxZvAeSNKkKQISvBwX9Io4L5Rg+nNM+9
	w+P1Cpeq5ER7XgcThe7mUKj3Jkh+uknLADPSgVHNvO4qA3JtXcdm7vubXVe7tX+GmUQCXoJuQRb
	ckNXXtWa57meMf2ubmoNTwCOwbmvzb5g7ftmFScnunmIEE8ok1wOeOP3yCNGY33REoea/8f7gCU
	9rkm2eeU2bqnWE53sGiWqF6qPr4IiKZ6lm69vkWRhIxIYbp+Tfk+hTDe9hm7IqbSV4HrJUsPDG2
	88DWwtcxCD45Ahu3PFreXggEK2XFrdrbbl07/SAmgEPzSGyzdss3m2WZnIxE1u+y0IqEbk0AozI
	ZKvil25aeSFpCKzXrx7Yn+km6e1wjs6OfFMo6P4DJj3eh3llV331wXc8AUz4vI1JCKESN/ZSInI
	zrTktEmLfNJ3r+PS7Y8NrsVTBvAfPh12NHQQBWneQA6wbksGSnram+AdIKbtm7MUKR1j7+sUK5b
	u0m2gqaqgO/4aGX2mH/CKySZs6pcArmV5ZtQmGsMOQ+TcRy++HTlJ5cGhRkjPilSw+Gne9iK6Dh
	zJssUG/Cy0VhEQHugCUM3+G+wGPoEGe0BmI47qFFmssZEALsMoFMOcEpBLsucjwSBxoKQo88o7k
	qZg==
X-Received: by 2002:a05:600c:5297:b0:4b4:262b:88a2 with SMTP id 5b1f17b1804b1-4b6dc30ae97mr29975395e9.1.1793959466660;
        Fri, 06 Nov 2026 02:04:26 -0800 (PST)
Message-ID: <8a546a01-9d3f-4d63-bb56-658d635fed33@gmail.com>
Date: Fri, 6 Nov 2026 11:04:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 33/39] xen/riscv: restore register state in the new
 IMSIC VS-file
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <9e77a699eb6c99fa8f444d5777da189fdd30679e.1790779209.git.oleksii.kurochko@gmail.com>
 <1793724321.8631fc262581453bbf619ec5b2062170.1a1a24d1057000403d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793724321.8631fc262581453bbf619ec5b2062170.1a1a24d1057000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1793959467-18ECE9EA-D6FA4D3F/10/73395122804
X-purgate-type: spam
X-purgate-size: 4211
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/26 5:45 PM, Baptiste Le Duc wrote:
>> Complete the migration of a vCPU's guest interrupt file: move the state
>> saved from the old IMSIC VS-file into the new one and make the vCPU use
>> the new VS-file.
>>
>> The interrupt producers have already been retargeted to the new
>> VS-file, so MSIs may land in it before the saved state is restored.
> 
> Could we send an extempore MSI to the hart of the new file once the
> interrupt producers have been retargeted, and spin until it is received?
> That would guarantee that no more MSIs land once we have received it.

I don't think it's needed. The barrier is there so that nothing gets
lost from the old file: once the extempore MSI sent to the hart of the
old file has arrived, every MSI the APLIC sent towards the old file
before the retargeting has landed there, so what's read out of the old
file is complete.

MSIs sent after the retargeting go to the new file, and they can keep
arriving at any time, including while the saved state is being
restored, so an extempore MSI to the hart of the new file wouldn't stop
them anyway: it would only tell that the MSIs sent before it have
arrived. That's why the saved eip/eie bits are ORed into the new file
rather than written to it, so that whatever lands there in the meantime
is kept, and why eidelivery is restored last, so that the new file
doesn't deliver anything until its state is complete.

>> Hence the saved eip/eie bits are ORed into the new VS-file rather than
>> written to it, so that such MSIs aren't lost. eithreshold and
>> eidelivery are restored last: the new VS-file was cleared when it was
>> acquired, so it doesn't deliver interrupts until its pending and enable
>> bits are complete.
>>
>> As with reading the old VS-file, this has to be done on the pCPU owning
>> the new VS-file, with hstatus.VGEIN temporarily selecting it. That is
>> v->processor, the pCPU the vCPU is migrating to.
>>
>> Finally, point hstatus.VGEIN in the vCPU's saved context at the new
>> VS-file, so that it becomes the source of the vCPU's VS-level external
>> interrupts and the file the guest accesses through its siselect/sireg.
>> With that the migration is complete, so drop the BUG_ON("unimplemented")
> Great!
>> [ ... 82 lines skipped ... ]
>> +static void cf_check imsic_vsfile_local_update(void *data)
>> +{
>> +    unsigned int i;
>> +    const struct imsic_vsfile_data *idata = data;
>> +    struct imsic_mrif *mrif = idata->mrif;
> mrif is only read here, so it can be const:
>      const struct imsic_mrif *mrif = idata->mrif;

Good point. I will apply that.

>> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
>> +
>> +    /* We can only update if we have a HW IMSIC context */
>> +    if ( !idata->hgei )
>> +        return;
>> +
>> +    /*
>> +     * No atomic accessors are needed to read the values out of the MRIF here,
>> +     * as this is always called with a pointer to a temporary MRIF on the
>> +     * stack.
>> +     */
>> +
>> +    /*
>> +     * The file is reached by retargeting hstatus.VGEIN, and the
>> +     * imsic_vs_csr_*() accessors alter vsiselect. Both belong to the vCPU
>> +     * running on this pCPU, so restore them before returning.
>> +     */
> Same comment as on the previous patch: you are not restoring the CSRs
> here but saving them, as imsic_vs_csr_*() will alter vsiselect. Please
> update the comment accordingly.

Sure! As I mentioned in reply to prev. patch I think that it would be 
better to factor out the sequence of work with hstatus&vsiselect to 
separate helpers, put your comment suggestion above the helpers once.

>> [ ... 32 lines skipped ... ]
>> @@ -1152,5 +1222,11 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>       /* Free-up old IMSIC VS-file */
>>       vgein_release(v, old_vsfile_id, old_vsfile_cpu);
>>   
>> -    BUG_ON("unimplemented");
>> +    /* Restore register state in the new IMSIC VS-file */
>> +    imsic_call_on_cpu(v->processor, imsic_vsfile_local_update, &vsfile_data);
>> +
>> +    /* Set VCPU HSTATUS.VGEIN to new IMSIC VS-file */
> Nit: s/VCPU/vCPU/
> 

Acked.

Thanks for review.

~ Oleksii


