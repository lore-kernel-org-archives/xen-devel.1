Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C2606A32C
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMkWm+EY
Received: from list by lists.xenproject.org with outflank-mailman.1476408.1682523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPGcF-0003fg-0c; Fri, 06 Nov 2026 09:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476408.1682523; Fri, 06 Nov 2026 09:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPGcE-0003fZ-U4; Fri, 06 Nov 2026 09:52:10 +0000
Received: by outflank-mailman (input) for mailman id 1476408;
 Fri, 06 Nov 2026 09:52:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xPGcC-0003fQ-U4
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 09:52:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPGcC-001E81-30
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 10:52:08 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeda346-8faa-0a2a0a5109dd-0a2a4504c034-20
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 10:52:08 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeda347-b57f-0a2a45040019-d1558030d850-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 10:52:07 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so2775315e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 01:52:07 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d7bcfcbfsm2714744f8f.43.2026.11.06.01.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 01:52:06 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793958727; x=1794563527; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj/SuCvTZV4F+ViWavf4AIjO66CXESLhc3puaxUNL9M=;
        b=cMkWm+EYx3KF92qMEyjTzXTJCPOJ4wlRE6fhv8mDspp27fFxTVZUhjVs5KQwQtaaVr
         nUhkX4h9GB1PEzdRSE/7FsYGwoJuJaMGk8zzX6nsU//IV3TxzG5FtYTHjfT8AEgz6U2Z
         O7K1f8Sm7B4iEj2kpxcNAR+4fucylGDk9VH2IoFFPf7Vpn9wPLAXS1t1HYu05x7rhpSM
         Cna/6WxkwL99GOrRdMN0JaoTYkRR+cE2vAN3hLLJQhd0DpvIFlVQOwKHOb2QJTFWxNWa
         3FBuF2BUXhd1KZPDwxG3XsObuzIYdsdTjIWPnjiVPLerx3pO5/X1ExHJMluEcmfn/agy
         uzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958727; x=1794563527;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zj/SuCvTZV4F+ViWavf4AIjO66CXESLhc3puaxUNL9M=;
        b=kpu0mxW0BL6N1w8cg2pquPj+ux+jN0N0KB2bjJwowWsOt/AJF7Pguogmyea7ZufEPw
         tDTolvANaDebZ5LdPkiHCElwGLiNtO88cIsrmN23ppLjBoE+z2xry/nizEfPLd+16vhQ
         LvagA4MCys6PyKcr1DOWs1L/j583bBvk/1MekveYpQcwIB05IVakpeuU22pbrpAjlTKZ
         Xre/YiKkSGvSpuZSED8XZACeA2NXLNQNtb0SV8Ukbqz+WCJQOetERCmKk4bKuRoPCdjM
         I/fU6hMu1m4B8gyHbmsaQ8NpHnrsqJL4NOYDIUrU8MnmBJDpPgOh0co/Cy/5QF1jA4TI
         Pviw==
X-Gm-Message-State: APuU4Z+8136QzRXhASmImdp/lNI1ujdhAp/qLSUo91PlzFfmdJ/C8Zf1
	p43zxfuOXYPOIZZyl3WC7d158goQPT4iGmYisKaZYs2IqVF5DnyA2OLI
X-Gm-Gg: AYBFou0gyTIf/TdlN2jhcvGNLYM1pMnPMiz4BXNlsL6czUkFnXeqVw0f0EFl7w87u7z
	cKKzmQ25ZJmnf0Zg4b8QvYrcXzE4dBm2JGT/TT1rmmtNkRtA/2vAno8LUlmX7N+8pAdbki++R0M
	8FzNyY+vqoYG55HoHcL5clk6FPaXFwskynR4+DIjcTKMSRmvQCr1axMYSsfWw8HnaynWJo3lQJA
	CH5jQZEKZsXXf9pxevXK8AJY6hW2fMCRIpmhgjrnccgCGQEPvUcj/N3R+UJt86+FIvx9sDWrUCS
	VOV7RAOlE6O0nlKzzwDPp0GOueIU6oYBFKMYBfK9erXM1vTmEXuP4iQ51erMyUmBIR4RDBjBuGl
	Bws7ECJb+Yht5wHoBcUhx9E7p0VKf8pThNEfXjtuVR+/elllb71PjiJ3KDzE5vaHrYhsVJjz2Yo
	EkcvsLhj5k6Eif2TjlQZa8SB2dU+MjBnOsakfIpJwYoZOApIUJ+C0j5aT7nA918LqQECkuqHIbN
	R8711g8EfNiLGDGMKh4PlNAuT4mSiugRCD2yGbvvdyEHGaiBarPf3SUyeeyBtvZ7V7krajVRBx2
	8DqMOYCrL2ox7C73eG5TA1CkH6/BC2yB6W6kjLAILlGYn9W+1CuxnrDtyPhNmSw6a3PdtohsoUo
	SvNYYGdmSqtWQopjsBoviBA==
X-Received: by 2002:a05:600c:1552:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4b6ddee32eemr28179455e9.5.1793958726639;
        Fri, 06 Nov 2026 01:52:06 -0800 (PST)
Message-ID: <83bd8ba2-9053-44ac-a15e-fa6ea52429e2@gmail.com>
Date: Fri, 6 Nov 2026 10:52:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 32/39] xen/riscv: save and clear the old IMSIC VS-file
 on vCPU migration
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
 <e2cf140c63b1f1cff8e63988f82fff7e2b063c84.1790779209.git.oleksii.kurochko@gmail.com>
 <1793721767.8631fc262581453bbf619ec5b2062170.1a1a22617dd000403d@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1793721767.8631fc262581453bbf619ec5b2062170.1a1a22617dd000403d@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793958727-C3EC6B50-583FD27B/10/73395122804
X-purgate-type: spam
X-purgate-size: 4253
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/26 5:02 PM, Baptiste Le Duc wrote:
>> When a vCPU migrates to another pCPU, its guest interrupt file has to
>> move as well: the eidelivery, eithreshold and eip/eie state of the old
>> IMSIC VS-file has to be carried over to the newly acquired one.
>>
>> Once all interrupt producers have been retargeted to the new VS-file,
>> so that nothing can reach the old one anymore, read the state of the
>> old one and clear it at the same time. This has to be done on the pCPU
>> owning the old VS-file, as a guest interrupt file is only accessible
>> through vsiselect/vsireg with hstatus.VGEIN selecting it. After that
>> the old VS-file is no longer in use and its guest external interrupt
>> number can be released.
>>
>> The state is saved into struct imsic_mrif. Its eix[] array follows the
>> layout of a memory-resident interrupt file (MRIF) as defined by the AIA
>> specification: pairs of 64-bit interrupt-pending and interrupt-enable
>> doublewords, each pair covering 64 interrupt identities. eithreshold
>> and eidelivery aren't part of an MRIF and are stored next to it as they
>> belong to the interrupt file state too. Using the MRIF layout allows
>> the same structure to hold the interrupt file of a vCPU which doesn't
>> own a guest interrupt file, which is how the AIA specification
>> describes MRIFs being used by a hypervisor.
> 
> I think it's worth mentioning that this MRIF structure could be reused
> for software interrupt files later.

I'm fine with making that explicit. I tried to cover it with "... a vCPU
which doesn't own a guest interrupt file ...", and adding "hardware"
should make it clearer: "... a vCPU which doesn't own a hardware guest
interrupt file ...". I think that covers your suggestion as well, so
I'll add it.

To be honest, I'm a bit unsure how much to say about software interrupt 
files at this point: some earlier commit messages mentioned them, and I 
was asked to drop that, as they are neither introduced nor used yet.
That's why I'd rather keep the wording implicit as above, but if you
still prefer them to be named explicitly, I can add a sentence.

At this point, I'm honestly getting a bit confused about how commit 
messages are supposed to be written.

>> [ ... 172 lines skipped ... ]
>> +static void cf_check imsic_vsfile_local_read_clear(void *data)
>> +{
>> +    unsigned int i;
>> +    const struct imsic_vsfile_data *idata = data;
>> +    struct imsic_mrif *mrif = idata->mrif;
>> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
>> +
>> +    /*
>> +     * The file is reached by retargeting hstatus.VGEIN, and
>> +     * imsic_vs_csr_swap() alters vsiselect. Both belong to the vCPU running
>> +     * on this pCPU, so restore them before returning.
>> +     */
> You're saving the registers here, not restoring them. 

It was about CSR_HSTATUS, and CSR_VSISELECT which are stored and restored:

+    csr_write(CSR_HSTATUS, old_hstatus);
+    csr_write(CSR_VSISELECT, old_vsiselect);

> I'd use something
> like:
>      /*
>       * vsiselect/vsireg only reach the guest interrupt file selected by
>       * hstatus.VGEIN, so point VGEIN at this file for the access.
>       * hstatus and vsiselect hold the state of the vCPU running on this
>       * pCPU; save them here and restore them before returning.
>       */

I agree that this option is clearer.

Also, as the same switch to a guest interrupt file is done in
three more places (in the prev patches), I'll factor it out into 
imsic_vsfile_select() and imsic_vsfile_deselect(), with your wording as 
the comment on them.

> 
>> +    old_vsiselect = csr_read(CSR_VSISELECT);
>> +    old_hstatus = csr_read(CSR_HSTATUS);
>> +    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
>> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
>> +    csr_write(CSR_HSTATUS, new_hstatus);
>> +
>> +    /*
>> +     * No atomic accessors are needed to store the values into the MRIF here,
>> +     * as imsic_vsfile_read_clear() is always called with a pointer to a
>> +     * temporary MRIF on the stack.
>> +     */
> Nit: is this blank line really needed?
> 

No real need. Lets drop it.

Thanks for review!

~ Oleksii

