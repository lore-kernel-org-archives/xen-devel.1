Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACE0C5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:50:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389692.1630334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuS5H-0003gq-Vz; Thu, 13 Aug 2026 09:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389692.1630334; Thu, 13 Aug 2026 09:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuS5H-0003gj-TU; Thu, 13 Aug 2026 09:50:47 +0000
Received: by outflank-mailman (input) for mailman id 1389692;
 Thu, 13 Aug 2026 09:50:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuS5G-0003gX-Lh
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:50:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuS5G-009muO-1r
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:50:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d9369-8faa-0a2a0a5109dd-0a2a4501db02-38
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:50:45 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7d92c1-5984-0a2a45010019-d1558034d1b0-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:47:45 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4995b0343c1so4956365e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 02:47:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b1bd61sm49932925e9.8.2026.08.13.02.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 02:47:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1786614465; x=1787219265; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnYMFDlAdA0MjjYhLDJNo9oUGcqFZKY+VX+ctoUp8Gc=;
        b=RupJz0muy4NktoqsnsQ60P3rGSLrpd3UiqFihAsA51YpMwQNzaXTQQ6O2mYwKnxeDH
         YkoPq3MJCQI9CC+FspgXZCC2wxq3FLCmvGf2Kpzn0Km+UBThPTEGc1YEgmpkFrrTyXPt
         fmFPhTu/kFH0iScopkz+XU5UT2mLycUEjexTdTpcMk+0NJxmSQi2OoxGcxiQEhohMAER
         eiO22xMPxUH01OgR1F/ClqnWQ68f8XyxTBgVROMk/QlIXL8mvj8pWro9DUYhLs1PlL+T
         0Pz3HKzgYC9ErDXr01gN+KeBESkjdXxpysDwGoJUuhqNK19dxtr8p4hxSMmH9RXJmom/
         i9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614465; x=1787219265;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnYMFDlAdA0MjjYhLDJNo9oUGcqFZKY+VX+ctoUp8Gc=;
        b=aiBQt7jYxW/3mJYpb4EHxs9aJ3fHMPiyowX/Stm2T/bw6SEcIuLkBbJMO32/xHGW7s
         OmsqlF5ceB5LE/RzvTTQSgqtwz+RmV2IMS4UNIUZ7Vy8xVJvk+iTSl22my3mxK9mqkq/
         DEDQJdGsweVrlKhJkRe2vthhkKr3bTEOCTbOpAuC2Itz0MzqkurdbKhG5U0NiXiVT0q4
         mU9XejZlCGzi3qxSaR2sHjJsBmjDnqoqnasyeYhm1zROokPkmVmnxjtFUuvXmNvWCLPq
         7H+1to2zF7tBtxCNJF+rMosiQQUSdK3Y6oAaISrMPVb4A8KiJ2OsEUG95Odcc5ls/lU/
         fNKg==
X-Gm-Message-State: AOJu0Yw4ut0XVRNDVMIcVF8imKAOoDarcu/MZcmu8jEl6cPilZDNLvmi
	nhierW+gih6h2pSuThnIYwZHkyKWaM3fV7pf4J9VLlgHFGzOQQthHCdW0fkcuhX4IQ==
X-Gm-Gg: AR+sD133YnMbx2Jcm+KVx35qPdJovSMKfG4QHh8KLFk/xS8ycU3BZzTnFJQZFIhDus2
	g54oNNFZi7vWoIaZ2SycjLGn9u1pjlhxZVjTp+Rkw75S+llzGzYLQb8qUyq7/GWN8ZlVe5N0bdA
	+FzVbsGX4pvUxQyI1YP5baVoV6541Wg3i0H01HE835UGhEpJ7TNQ/AGAM55skoCeaGxXDPE/K12
	ry16SdDmaZlxph8KWiiQrmEerEDCVUR0crfjsFrEnHtav/acBXQBtCItGOy0BzZHWvQTrShKuaC
	rtTZl77PDGak89zR1oEyM5/Y6aGzaYFFgI2kLB3Wm6WrENE9CeGBc73oYqqbN7Bvjsa9rR073Nn
	vKukICUm38VPXC3Lh2AulgHAXny852WXCJEBWidaTty9go/kaZKh7O0eThZ8OupUMLJnPlsBJCe
	VSieUmTGv1NAD6a4bHD/laQL8wVbOv+en3UI7kiuVoJLYvYTyreOpBhvwi9gKyg3sr5uh2i3cGb
	h/koE+7MG6h/+82O4W4mCV+NsQAy0tITRfcwI7RNobJ3a+EmOyK
X-Received: by 2002:a05:600c:8706:b0:499:5f7a:7ea2 with SMTP id 5b1f17b1804b1-49982185170mr60983185e9.12.1786614464862;
        Thu, 13 Aug 2026 02:47:44 -0700 (PDT)
Message-ID: <8273fde5-98b5-4b23-9f3b-9a7cc3749716@suse.com>
Date: Thu, 13 Aug 2026 11:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/17] xen/riscv: introduce vCPU AIA initialization
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b3aca8278dfd70bf6ce888bfcb0a3fbc32bb4971.1784560663.git.oleksii.kurochko@gmail.com>
 <1786613090.8631fc262581453bbf619ec5b2062170.19ffa7047d4000c4f3@vates.tech>
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
In-Reply-To: <1786613090.8631fc262581453bbf619ec5b2062170.19ffa7047d4000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786614465-1F063757-D877F4E3/13/0
X-purgate-type: spam
X-purgate-size: 1649

On 13.08.2026 11:24, Baptiste Le Duc wrote:
>> --- a/xen/arch/riscv/aia.c
>> +++ b/xen/arch/riscv/aia.c
>> @@ -14,6 +14,7 @@
>>  #include <asm/cpufeature.h>
>>  #include <asm/csr.h>
>>  #include <asm/current.h>
>> +#include <asm/imsic.h>
>>  
>>  struct vgein_ctrl {
>>      unsigned long bmp;
>> @@ -36,6 +37,35 @@ bool aia_usable(void)
>>      return _aia_usable;
>>  }
>>  
>> +void vcpu_aia_init(struct vcpu *v)
>> +{
>> +    unsigned int new_vsfile_id;
>> +    int rc;
>> +
>> +    if ( !aia_usable() )
>> +        return;
>> +
>> +    new_vsfile_id = vgein_assign(v);
>> +
>> +    /*
>> +     * vgein_assign() returns 0 when no free h/w guest interrupt file is
>> +     * available (including GEILEN == 0); imsic_map_guest_file() maps nothing
>> +     * in that case.
>> +     */
>> +    rc = imsic_map_guest_file(v, new_vsfile_id);
>> +    if ( rc )
>> +    {
>> +        /* Can't continue w/o correctly mapped IMSIC interrupt file */
>> +        domain_crash(v->domain);
> 
> The vgein id assigned a few lines up is not released here. The domain is dying
> anyway, but the guest interrupt file stays marked in use on that pCPU forever,
> since nothing else ever calls vgein_release(). A vgein_release(v,
> new_vsfile_id) before the domain_crash() would fix it.

Instead of (or in addition to) doing that here, wouldn't releasing better be part
of the normal cleanup path? Whether "instead of" or "in addition to" depends on
the implications of deferring the release. But to guarantee no leak, domain
cleanup will want to either do the release, or have an explicit check that is was
done.

Jan

