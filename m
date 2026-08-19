Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4639C5DF6D
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 12:22:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395315.1633767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwfIn-0006JC-M3; Wed, 19 Aug 2026 12:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395315.1633767; Wed, 19 Aug 2026 12:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwfIn-0006J5-JY; Wed, 19 Aug 2026 12:21:53 +0000
Received: by outflank-mailman (input) for mailman id 1395315;
 Wed, 19 Aug 2026 12:21:53 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwfIm-0006Iy-TA
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 12:21:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwfIm-005r8u-9t
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 14:21:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a859fbc-2eae-0a2a0a5409dd-0a2a450bad14-48
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 14:21:52 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a859fe0-b7e8-0a2a450b0019-d155dd35e0da-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 14:21:52 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47f3b39f2a1so779442f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 05:21:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b144173csm5656496f8f.6.2026.08.19.05.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 05:21:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1787142112; x=1787746912; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ymdwcq3ZzdgRlLof7/7lfEkobjba6OLnUYf9Fg42gA=;
        b=G5giJRQXID4z6kOkVh0P2h0e/P+mMT8og7jNjzWtuY2cwvENaWVvwMzL1Ps2b2DXn9
         XNU9CeKuzXG/BNW69/CGcJtRcorcRDVCzx0iCAhNkU1SHTKXVGXJi7+fRN39qteTC9ZY
         hDOiPPCoLces7+01gc7PUzVuO6nL9FVYt1Ieqxu+m8BUoCv/muzhkgQHOrn9880q4862
         kpoRuDoRbafa+jVSkAqkbTALZgrpKC68dZY5Po1Mvep5xQLASFopyaiqH4KpuBmDVS0k
         UH93o+jlmcaCX9G3N39Cee8DJR7EE5rnSICvlhg1v/fBMJi8HJfpiqCkav9iOnBxT3wX
         Xc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787142112; x=1787746912;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ymdwcq3ZzdgRlLof7/7lfEkobjba6OLnUYf9Fg42gA=;
        b=qp/u6u2tW6u+4/gFm0ORHsfDbpp0lJKSwpzEagDqxAUFab5Tr0EuHJpzGaHgbeZwGR
         D7GJesgszmLsDKC2h7VehKDAkrdPjdaDx26X7KbIowXBGnKAt4iNulqV08Ih3RYHjpfN
         Lq28qubHewxVMSXDwQalkahQsJxa8NA7iQ1vsrxSETP2s3le3CPGqqvsLPQaxbySjIWl
         93p2stwjCfDi2zNGteLic8fU2aepNl6Qa44zvXFDC0fzWWu1XwfqBLp+GmZN3XnI8LD+
         mvs203kCq98MmgOHYGk25h6acUhj5wiowwP0QRkKYXlspv9ntdrDtyuOqNRkQWq0VWkF
         gTyg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8UwYfLwQH0Tg4vVVvoNEbiO4dCjiZS93+JZ/+VVBCU6Y9G/3F9zT9VLJOV5iofKy3kWs38hGScRA=@lists.xenproject.org
X-Gm-Message-State: AFuF++mpo/ePwFSIY1gsVI2dY9t5fvpC1OEhByD/zPQHWiQH9x46OLXG
	2ELsMo4xfjXLN4dqPDiMCWbS5+ooPO3XKJec73MW75PX2nYLSybg/+f4YczVq1Rfpg==
X-Gm-Gg: AR+sD1354jBRvEnxrQj9DxDjGx/9jTZj2Pt6S0feLjpvXvLF+Bug5CKq/V6GS/fGmJl
	498eH7vBjpD+vvW1Nc3fedOSmJCZrQZVozYCE10UaPHe2w4ySE3vETVB6o1uLHgGRGY4MNMkMIG
	k3HWjDkxVS+ee3xj1i33TWN1io1GMaKG6R1dTKLEjUijR27HU/Me+1IFYH0bnmk6WrD01s3YK2H
	Kwb13egiKdW4DhNwI2rYmc5WKqCb+F+6C6UdEalwg8FG+pt+RcA6ZnCbR5xwf4Fm290mQ9Jj5hj
	D6vK3hOPGTJIufkNQPvynp/njWiKVfEQBjohSjFUN8CAHmsyi5MMTa6WTlvIBkZQK7IpmPvD9EH
	DjiEFpK7Qxb64Kd/grJUIW6SuRtCm+cM9OvEKiS+XUnqJV9D0uAst0cHpOsVBhS/cF2Ior0gbrJ
	sPkSFS7UlAp80OqofYjHEY4aTiRYL5bYkXpDKC13msUTtzhfowpIcnCFMYOi6b9nZUptUmcv+OB
	GRmpi0Pzs656dt7fzxDXB6jMID9JdvsF5XGj4qqI5r8pbsWf1vr
X-Received: by 2002:a05:6000:2f84:b0:47f:c648:e265 with SMTP id ffacd0b85a97d-482b1feb260mr6928494f8f.17.1787142111697;
        Wed, 19 Aug 2026 05:21:51 -0700 (PDT)
Message-ID: <d4ef5689-4197-499e-97e4-642a6b3bc6b9@suse.com>
Date: Wed, 19 Aug 2026 14:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] x86/dmop: Add XEN_DMOP_{bind,unbind}_pt_msi_irq DM
 ops
To: Teddy Astie <teddy.astie@vates.tech>,
 Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf388597000f373@vates.tech>
 <1777392179.8631fc262581453bbf619ec5b2062170.19dd4d45724000f373@vates.tech>
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
In-Reply-To: <1777392179.8631fc262581453bbf619ec5b2062170.19dd4d45724000f373@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787142112-18CCF9EA-9C4EC526/0/0
X-purgate-type: clean
X-purgate-size: 3049

On 28.04.2026 18:02, Teddy Astie wrote:
> Le 27/04/2026 à 15:57, Julian Vetter a écrit :
>> Add two DM ops for MSI passthrough IRQs. These new DM ops take the raw
>> MSI address and data fields rather than pre-decoded gflags values. Xen
>> decodes the destination ID via msi_addr_to_gflags(), including any
>> extended destination bits in address[11:5]. This means the device model
>> does not need to understand the extended destination ID encoding, and
>> simply forwards the MSI address it observes from the guest.
>>
>> With these DM ops in place, redirect xc_domain_update_msi_irq() and
>> xc_domain_unbind_msi_irq() in libxenctrl to use
>> xendevicemodel_bind_pt_msi_irq() / xendevicemodel_unbind_pt_msi_irq()
>> via xch->dmod. The gflags/gvec arguments are translated to the raw MSI
>> address and data words at the libxc level using the standard x86 MSI
>> address format.
>>
>> Reject the PT_IRQ_TYPE_MSI sub-case in XEN_DOMCTL_bind_pt_irq and
>> XEN_DOMCTL_unbind_pt_irq: all callers now go through the DM op path, so
>> the domctl sub-case is fully obsolete.
> 
> We probably want to reflect that on XEN_DOMCTL_{un}bind_pt_irq interface 
> in domctl.h (e.g through a note saying that PT_IRQ_TYPE_MSI type is now 
> deprecated and unsupported).

Which may further want mentioning in ./CHANGELOG.md.

>> --- a/tools/libs/devicemodel/core.c
>> +++ b/tools/libs/devicemodel/core.c
>> @@ -645,6 +645,44 @@ int xendevicemodel_nr_vcpus(
>>       return 0;
>>   }
>>   
>> +int xendevicemodel_bind_pt_msi_irq(
>> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq,
>> +    uint64_t msi_addr, uint32_t msi_data, uint64_t gtable, int unmasked)
>> +{
>> +    struct xen_dm_op op;
>> +    struct xen_dm_op_bind_pt_msi_irq *data;
>> +
>> +    memset(&op, 0, sizeof(op));
>> +
>> +    op.op = XEN_DMOP_bind_pt_msi_irq;
>> +    data = &op.u.bind_pt_msi_irq;
>> +
>> +    data->machine_irq = machine_irq;
>> +    data->data = msi_data;
>> +    data->addr = msi_addr;
>> +    data->gtable = gtable;
>> +    if ( unmasked )
>> +        data->flags |= XEN_DMOP_MSI_FLAG_UNMASKED;
>> +
>> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
>> +}
>> +
>> +int xendevicemodel_unbind_pt_msi_irq(
>> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t machine_irq)
>> +{
>> +    struct xen_dm_op op;
>> +    struct xen_dm_op_unbind_pt_msi_irq *data;
>> +
>> +    memset(&op, 0, sizeof(op));
>> +
>> +    op.op = XEN_DMOP_unbind_pt_msi_irq;
>> +    data = &op.u.unbind_pt_msi_irq;
>> +
>> +    data->machine_irq = machine_irq;
>> +
>> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
>> +}
>> +
> 
> I think we want to mark 
> xc_domain_update_msi_irq/xc_domain_unbind_msi_irq as deprecated since we 
> implemented a newer (better) version of it in xendevicemodel; and the 
> old one is now a wrapper.

Why mark it deprecated? It can be removed right away when there are no callers
left. libxc doesn't offer a stable API.

Jan

