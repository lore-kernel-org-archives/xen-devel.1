Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6969D606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ABWB+Iy0
Received: from list by lists.xenproject.org with outflank-mailman.1468215.1677303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsJF-0000Pi-0n; Mon, 02 Nov 2026 13:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468215.1677303; Mon, 02 Nov 2026 13:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNsJE-0000Pb-Sx; Mon, 02 Nov 2026 13:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1468215;
 Mon, 02 Nov 2026 13:42:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNsJD-0000PU-LH
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 13:42:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNsJD-00GzGy-20
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:42:47 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae89357-2eae-0a2a0a5409dd-0a2a45028fd8-0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:42:47 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae89356-6ca4-0a2a45020019-d155802bbc86-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 14:42:46 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a5087a5348so24342755e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 05:42:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ab61d8b9f4sm319013765e9.12.2026.11.02.05.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2026 05:42:45 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793626966; x=1794231766; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GovrW9U8cuxL4mNt3PwGk61352+7/T5g3Af5gQdbHgA=;
        b=ABWB+Iy06TXH/WaiNpRVStGOgRceASLUPULLjDQaoMWxgQxTqecHb5dsUDBIUAsJTW
         C3uVe7h37xJYXVpfhSEDenkeB4Z9SDxUj43TySYcQvmMDMVAFakkdQKb4EHsp52Wtled
         fWfEMMZ6lffMJabsRvAX3+7ug0pZBIwv/ZGnBknVren4ZvHxbUSh6f7cZUqk3FlPOOS3
         zV6yOuwzpNgGYiRS6s2mAHUihEGc8VxVMGefAboxqvJA7hjqwOesg5jYBNXoCSlFazTa
         5PdmVZiMEkJ2O3nm+hfALqgkFTVZWWDfnabs12HEirYDhcHpy3NkdXEXVD6umqkxaCiR
         rG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626966; x=1794231766;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GovrW9U8cuxL4mNt3PwGk61352+7/T5g3Af5gQdbHgA=;
        b=uf5Na5H+/Td8qdDVd3Q9vwB3JBYwMcTQDaspLbo1ozaSvbfJuxqRA8LkHR+WsemxuG
         /sYvDKLwp1FnXv8o8lQ91k/65HRtsAr1Z1x2axq3SWzoXbn5GZzlRJAsi5oZXKQsxnrf
         /JSu8sXrQMwmaCq1sbNmN9IG7Xc6aeXvFR2T6iawsk+1q+j65mfFw71qC3kFV9cIoZ1d
         zvYIz4or7cA9jEKBbJmKiNHdQbJZZNfTZ40zc5s7TZq0h3HKdvTWflyish0n3uotD9I0
         r9Db88+uwkmBfBlBkFsPwIg1r8HZ4kU7b8PYZOWfMibzLffRvyLEZyd4ZPhqXUbXVMBB
         0+WA==
X-Forwarded-Encrypted: i=1; AKwUvBzauaeaJXrRbmrD/JHEbEu7Yvp61Xubf3naeV4QXYZ2NfmynQ6vzBfGv7OJlydiog6B8B8HvAlLliI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK8LHC6CFyvX3UjBhlGgMj7sc/ZLmW7RqYjL7mF0M02fGYjlFf8
	0HAgPKa/kolZu3mqhmJxtZnj37MdGDtFT40nNPnkGErBSmQVwuUt1JpociuMIEBt4A==
X-Gm-Gg: AYBFou1Kt1ssc2moDHCyfwDpkLZGAqbVWZrT8HqMpaGuh7T+d0Opxgcul4ULQjeUtej
	o1aSO/3EQXmd2NbvmBydgUz25FQtP/eeMzmkrazyFqera/x7j8h9uutmaGZLY5uhiMgWkwdD81/
	CkVix5zZrW8QuE93rboxNu0uCB09VcVoY7gXUu9kP+d/EooPqVnTFSZZi4cej86PSWp9WU8hjhx
	XuMudjtTXBA1RFdK/6tpv+X2un3g3O7Bcj+sYsDzk59ZsiASEalpkuaZnIPeN5HEpfqoi6WEqYl
	7ea2A7eDCOTGzNBibJ5mIfxhlIjGxwbQptfmaa5RDwAc5/lr9YrNaH6kLaTnnCMUiSM++v1gdz+
	kKrFn7LNjSWnKRdtpqEHoyFE4A1MNuSeIFtgynLNMDWzFweLcxI1rzNF0QA/RvoekSAoK06MX4T
	vMlTwu01H0ju9RQWPGk44im6guk7a77NrRP2PDehHkoKFooXO+Q4tcf/Oau673gzMP45pv1yCh/
	6Jtqr64wGpLlcJVNeWWGZmxM5IZXJhsmAc/pH1bGQy7j5HDJmAfTBHwvmknNebQ/a7SgxZbjNYU
	HEA39IENZYFRFgud1kKITkitcmAKp+xekm8eWn6olxgyjnC/0Xiipjif8gdE9lrW95qjxMBsyec
	lO5z8xiltvzS6vPHf
X-Received: by 2002:a05:600c:19c8:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4ac1913ef8fmr235245995e9.27.1793626966212;
        Mon, 02 Nov 2026 05:42:46 -0800 (PST)
Message-ID: <aab7c1d8-fa64-456c-b37a-162ab3e2ae1e@suse.com>
Date: Mon, 2 Nov 2026 14:42:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] vpci: add SR-IOV support for PVH Dom0
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <103b10d012cc291906025045a2da1ce728f0bffd.1792072426.git.mykyta_poturai@epam.com>
 <fe02f3ef-a215-4c81-be64-e2a5a30ae3e8@suse.com>
 <8d339d8d-ea7f-452b-8720-164dc9244079@epam.com>
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
In-Reply-To: <8d339d8d-ea7f-452b-8720-164dc9244079@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1793626966-31BC82AC-18303E02/10/78276251493
X-purgate-type: spam
X-purgate-size: 2030
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 02.11.2026 14:22, Mykyta Poturai wrote:
> On 10/28/26 3:49 PM, Jan Beulich wrote:
>> On 15.10.2026 16:08, Mykyta Poturai wrote:
>>> @@ -139,6 +142,47 @@ const unsigned long *pci_get_ro_map(u16 seg)
>>>       return pseg ? pseg->ro_map : NULL;
>>>   }
>>>
>>> +/*
>>> + * Marking is serialised by the hardware domain's pci_lock, which the SR-IOV
>>> + * control register write handler holds; unmarking only clears a bit.
>>> + */
>>
>> What about pci_vf_setup_pending()? How's that (to be) serialized again marking
>> and unmarking?
>>
> It isn't. The test runs ahead of any lock because adding the VF takes them.
> 
> We could put it under the hardware domain's pci_lock, which is what
> control_write() holds for marking and unmarking, but it would have to be
> dropped before vpci_sriov_add_vf() anyway: pci_add_device() takes pcidevs_lock,
> and the order is pcidevs_lock then pci_lock. So the test and the add can't be
> made atomic with the locks we have. Is the lock worth taking just for the bit
> test?

No, such locking would make sense only when held from before the test until
after the result was actually acted upon (in the case here: the bit was
cleared by pci_vf_setup_end()).

pcidevs_lock vs d->pci_lock wouldn't really be an issue here, though: The
former is recursive, so you could acquire ahead of acquiring d->pci_lock.
The "inner" acquire in pci_add_device() would then be little more than a
no-op. (Of course proper commentary would need adding if such an approach
was taken.)

> The only thing I can see actually misfiring is vf_setup_map: xvzalloc_array()
> zeroes it and the pointer store publishes it with nothing in between, so a
> reader can theoretically see the pointer ahead of the zeroing and test an
> uninitialised bit. Should we reallocate it in alloc_pseg(), or just add a memory barrier?

Hmm, is this really the only issue? What if two racing pci_vf_setup_pending()
both yield true? Then we'd end up with two competing vpci_sriov_add_vf().

Jan

