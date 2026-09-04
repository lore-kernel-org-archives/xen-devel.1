Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4341BC61DD3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 06:00:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407863.1640677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2MyO-0005hC-63; Fri, 04 Sep 2026 06:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407863.1640677; Fri, 04 Sep 2026 06:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2MyO-0005h5-3K; Fri, 04 Sep 2026 06:00:24 +0000
Received: by outflank-mailman (input) for mailman id 1407863;
 Fri, 04 Sep 2026 06:00:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x2MyM-0005gz-Dg
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 06:00:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2MyL-00Gkv2-QJ
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 08:00:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a5e75-e002-0a2a0a5209dd-0a2a4502a8e6-2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 08:00:21 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9a5e74-6ca4-0a2a45020019-d155802cd8e9-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 08:00:20 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49b0d78a801so5529155e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 23:00:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf75ce49esm77590115e9.1.2026.09.03.23.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 23:00:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788501620; x=1789106420; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXrPMhrbWpbmDOXTRXiHtULtJkGQYTDdglvtg7g8E5c=;
        b=Wt0Q7XAkfZKk9Tj0KjU8Ee3oHTbvl20U9YIpKTYSMNs/lurxsdttAKb2afpA+mODV3
         /Ge7hw8WNZQZs+rry98suTRHTqdlubfHVjKhNsYmrn16jUJM2KpRC5v191T0urzvRTM3
         Th4HYGQ/EQzfWua9fSMLWhn2MCeVHdrYSLD80HdK/JdR3EA2mrbY1QU8Dgu5uZ7Lw88F
         hB2H93PtrB4ziMlLvcbwlBV6QuKIuXyEaSJpv2iga37nGSvzlLoLElIT6UlW4259iu9M
         KcQy4mxnpZLJA1cZ/VMFkKYB2txKHN8IKWvL2TE35bJtahqzRkecA6VC9JaAPt3Ogy22
         gsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788501620; x=1789106420;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXrPMhrbWpbmDOXTRXiHtULtJkGQYTDdglvtg7g8E5c=;
        b=p9dTnuUjcKJfBUqwtuMVfwwSH0I5Uft4W7SG1CZ7XtZmbRd5vfY4DaJTTawVe5pbpz
         FkiaZyTTinOFw02GAIeMDTxNkgFNQd9Q31Nz5b5hpEwIy94gsSIHmxdoIWeMTpZSyqRB
         /SPP/HcSMbPSMfGU2A9qFIuG5qVnbJ8Gv9WIBWN+mFT4MDO0eoSED7OFN71vBRSqFr5S
         iGUmLc8iK8WQkl5xK/mel3Kmg5/UmbPmBGmgMbKi9YV3Nk/n8eyQcjRQIvU4z18QCWLv
         sYRU12Gck6djJsUdxyS0dAlV9tOY4l03W1/zs0Hu0BzAXY4oKieFTJjT5OOR2oLIqVR0
         YNPg==
X-Forwarded-Encrypted: i=1; AKwUvBwmB4EzFKwEaNt7RXCif8AnOs6AUCtZVdwDc6G8somJMFwDL9ZS9OabW/eaHBfSQRS13a87Ur1pu6A=@lists.xenproject.org
X-Gm-Message-State: AFuF++lOXf29eQPiOlJ4lve4uhUHxxpk+S6JjBhfUU0bktzO18n2YMwu
	UEkkp9n9NThnmZVuU2jC0q8ryNmTBk/+rjOyWTOQ6CkLJU0pY7WbAFSYF7AZv9dn6A==
X-Gm-Gg: AYBFou0QoBb/nmeDxB5f1JLCV7V/EQVYCX0cJ5SJxVNLL48BEj3hCkFkfqTmqb9ydiH
	NsURVbNq96iH7BizHUMDoazG+C+U3vS/0kRSS5lgW2yBfhK1kMbQhrWy3Gc/1FWnuUxiI0hF1io
	nuj4ltcC6WnTtQofkw4nv4Slo7Pb7Qrlft+VzfUiLL7noimgL9sdnZPxIow9DcBGFGZymqp5RX5
	cONAzNfEf+SZwfe6CjGkPebhJJ2gKrLP0brpJFzCef84cKuCDWh1r6FCnr4Pv1pzXOd0Ft6aZJo
	JMXjdYtZLIuQdCj+eMOPtj3PQKYV0m9bo8NzDJXUDj9fZQGQx3dvmo9uAz20Je8+wk07JaQ5LYm
	BfCFnQKtEpzhkY3MmZtxeQQgmKcbqzs56beBonGVYykAAu68nyRvPGiwfJTaIfMvuhAk2K3VOco
	RNMszShb6oMmMAaqHThPcgfHqVE8YQA++98yE4EElRoMnkOK5N13FMMVesIOC2h04eGjQa630zY
	kw9NTczxTy8m2H3dPwAqfrMEp8Wk69LTXUFGMzJljqoJ1vGI2a8
X-Received: by 2002:a05:600c:3ba5:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49cf7f39c8bmr44433615e9.0.1788501620048;
        Thu, 03 Sep 2026 23:00:20 -0700 (PDT)
Message-ID: <07d332a4-a5a3-44d4-95ce-fc67d86edacf@suse.com>
Date: Fri, 4 Sep 2026 08:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map
 the Xen GDT
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-3-ecc269f268b7@xenproject.org>
 <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
 <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CAFLBxZYqOWkd60As00ytcNqTZg99Gu220OMrse5MXYgOHfx0Pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788501620-F20A82AC-1F735644/0/0
X-purgate-type: clean
X-purgate-size: 3670

On 04.09.2026 00:35, George Dunlap wrote:
> On Thu, Sep 3, 2026 at 5:11 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.09.2026 11:43, George Dunlap wrote:
>>> From: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Currently, update_xen_slot_in_full_gdt() uses the stashed direct-map
>>> pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming vcpu's
>>> page tables with Xen's GDT, by writing a stashed per-cpu copy of a
>>> pre-baked L1 entry (either 64-bit or compat version).
>>>
>>> Switch this to using populate_perdomain_mapping(), which doesn't rely
>>> on the stashed address of the l1 page in the direct map.  Rather than
>>> also stashing a pre-baked value for the payload, compute the mfn from
>>> the per-cpu GDT pointer at use: the conversion is a handful of cycles
>>> on a path costing thousands, and computing at use removes the
>>> parallel {,compat_}gdt_l1e bookkeeping along with its boot-ordering
>>> constraint (the cached value could only be generated after Xen's
>>> physical relocation, and had to be in place before the first context
>>> switch; a use-time lookup is correct by construction).  The flags on
>>> the final mapping are identical.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
>>> Signed-off-by: George Dunlap <gwd@xenproject.org>
>>> ---
>>> Changes in v2:
>>> - Drop the {,compat_}gdt_mfn caching entirely (suggested by Andrew
>>>    Cooper): compute virt_to_mfn() from the per-cpu GDT pointer at use.
>>>    The PDX lookup behind it measures ~5-10 cycles warm against a
>>>    ~1,500-cycle context switch, and this removes the double
>>>    bookkeeping and the after-relocation caching constraint.  The
>>>    cached-MFN assertion goes with the cache: a use-time computation
>>>    from a live pointer needs no staleness check.
>>
>> This looks to contradict what 564d261687c0 ("x86/ctxt-switch: Document
>> and improve GDT handling") used as justification to put in place the
>> caching. Also Cc-ing Jürgen, who also was involved there, for possible
>> further insight.
>>
>> Functionally the change looks okay to me, but the above will need
>> sorting, at the very least by specifically discussing why effectively
>> undoing that earlier change is okay.
> 
> So looking back at the thread, Jürgen measured a 14% improvement for
> something that might be described as a microbenchmark before and after
> the patch (a benchmark purposely trying to set up an unusual scenario
> to maximize the effect of context switch overhead, not one to
> represent a typical workflow).  But are the numbers really plausible?
> Even at an implausible 100k switches/s across the box, saving 100
> cycles per switch is about 0.04% of eight 3 GHz cores.
> 
> At any rate, we're already adding several map/unmap operations, and
> about to add several more.  Keeping the PTE caching would require
> adding a separate path that can write just PTEs, which then will
> potentially further complication future paths where we need to make
> sure we handle both domain-wide perdomain areas and per-vcpu areas.
> If it were easy I would already have been keeping it.
> 
> I'd be inclined to say: Since we're going to be adding more
> populate_perdomain_mapping() calls anyway, let's do it the simple
> correct way first; and then explore the idea of stashing mfns of
> frequently-mapped L1s (rather than having to walk L3 -> L2 -> L1); and
> at that time look into stashing baked l1es to avoid conversions.

Perhaps; I'd like to have Jürgen's and/or Andrew's input here, though.

Jan

