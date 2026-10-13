Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCFECC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 14:53:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447979.1663944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGdsV-0001Pc-2x; Tue, 13 Oct 2026 14:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447979.1663944; Tue, 13 Oct 2026 14:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGdsV-0001PV-0N; Tue, 13 Oct 2026 14:53:19 +0000
Received: by outflank-mailman (input) for mailman id 1447979;
 Tue, 13 Oct 2026 14:53:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGdsT-0001PP-Fn
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 14:53:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGdsS-00A7a3-LD
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:53:16 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace45d7-8faa-0a2a0a5109dd-0a2a45089c80-4
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 16:53:16 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ace45d9-f659-0a2a45080019-d155dd2ce4f1-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 16:53:13 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48b0ef9c76eso2468932f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 07:53:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0acb1ebsm5826169f8f.44.2026.10.13.07.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 07:53:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1791903193; x=1792507993; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vuBU24Y/Ww/MLNIdbrH0LlUn8ynZUHhtY0QckEh4Mzs=;
        b=ULELQRJB3x52gspxlmqzwJlt2C6s/VWTA1fMW0Se2g0Z046uPPno5GCFfi4Yzcd7po
         LPuOv9FIZdWaRoRVMDkLkGWhg/LYyCOhfjNG4pyrCQ4jCH1iP5R5xEdY1OmufExL2G8b
         yRYJTwgp1nnrVIekFKvYxJQSuHgKXZFPwzMnY8Q7pQihMkOXkEtUfOLrhDgEvRZL55nz
         EKsIBlpYuXBBYqXOPYMhkBCCeBfXLdU2+DuqcdNmb5G59pu8w05EjBpuqaXYIsGKLRe7
         URTTijY+IB44Du4h44hSoxpbWPA69wF896Rig48+2kAnv5AndZbwXCjlDn7Qa88aXukJ
         1S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903193; x=1792507993;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuBU24Y/Ww/MLNIdbrH0LlUn8ynZUHhtY0QckEh4Mzs=;
        b=fVZ2QF0XkDBeD1MzmlLIuYMZB2wiO4nzpIKpXYNlGdSROMQN/tsEPl5uKcBziuaELW
         2A2Us9fmVmugevZI+l+d+7KCzT98ruJEckbJFZxMtKNTpz+ORRrtT3RMi803H7AH0s5K
         WLkaVYwKfiXJcoEcg9Zy5ghPpJ0unsUv2T9PLCfMgCOmbOEZIvhm7Cy4ckXWjcGYK3QL
         Q6HA0eVCoirpxgzuEB3QBN6U/cWbsbW6IJ0yLe7jJMUL5KUYfuBmseWbaCOlmB7+lGJP
         wzNO9B7pYQywgGBhgcKID1OnqTcznB7UVubWb77mimVG9tpcevUTLxDWRCidLubDhL83
         ivrg==
X-Gm-Message-State: AFq9FYLZMPTHc80Zv1RywG3Ze1r1G9X1y9bwnM/5K/e0qz3gNaAgS2Wo
	HgmhkIAFhX+Xo2TnpER0fRpWSZQ7+Vz9F4uU9F1ovGBeqX1XEO3J8mesK9AmRZMBNA==
X-Gm-Gg: AYBFou0i622JqKQ5g4mC5d4Oy6VTlWUpMLbdO30XXRvC16xQCiNvuasVIhn0e7aJCc8
	9Jbi9SIVzSExQJGvshiI2SHFKFcC/WeZO/nj/n5L1XPvGGl95u7Mx5adbbJsD4ER+4Qevu4Gi98
	+1mha8v9klOY8pGG/38G5BckeGQwTa1lktLl+Pi7j9nrAlCKYHdsEam27Rzs690dw90CW5VLPA9
	+oYFD9M/D16m7cLihHDrJHxFUI//nE01MBtAgJmYw/9HX13wihJtDBIfFXH8weceI5qA8xHAPlU
	KspxqKj6XE2r56OEMzgcJA9D2tglS9cICywIGKOkE8RxmJ76qK1Ho9CLxkv3T4f1Q0XgW33BzGr
	z/Ah/jgs7/F8b9bhUxiniE9zhXEzLhayHBvoCut47M2BjoHM0bjHL4Km42w1FOxCmKsVZG311xk
	FMTE+OJ3ZFC1Hqk/ONelYruwAnIjQut11vsio4z3prX9OeZyXG1EKz4pox+1koIiqYINFFJr6I8
	P6CMT/eSaLkrh2ZfaWYxV5JxP4jIafJD2cN3rBAlwi2TuVUSTRFr7asn1HnXg==
X-Received: by 2002:a5d:644a:0:b0:486:f42f:6860 with SMTP id ffacd0b85a97d-48dbaaefc28mr18457544f8f.56.1791903192427;
        Tue, 13 Oct 2026 07:53:12 -0700 (PDT)
Message-ID: <5756a0b2-9480-4f31-ab0a-e23fd0ee080b@suse.com>
Date: Tue, 13 Oct 2026 16:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/PVH: keep a copy of Dom0's initial E820 map
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <575ec1bc-764c-4016-a584-a79e57817d9a@suse.com> <as42mhs42tvU9XIL@Mac.lan>
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
In-Reply-To: <as42mhs42tvU9XIL@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1791903193-CC37587B-DF6A9724/10/78276251493
X-purgate-type: spam
X-purgate-size: 1771

On 13.10.2026 15:48, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:21:55AM +0200, Jan Beulich wrote:
>> pvh_populate_p2m() needs to populate RAM according to the initial map
>> established, prior to any stealing by pvh_steal_ram(). Subsequently the
>> invocations of those functions will (need to) move ahead of
>> pvh_populate_p2m(), so what to act on is no longer Dom0's memory map at
>> the time of invocation.
> 
> But (most of?) the uses of pvh_steal_ram() expect to access the stolen
> RAM, and hence using pvh_steal_ram() ahead of pvh_populate_p2m() is
> not a present use-case?
> 
> I assume you have a further use-case for pvh_steal_ram() that wants to
> steal a range before it's populated, which might be worth mentioning
> here, to add a bit more context?

I thought that I'm saying just that already with "Subsequently ...". All
that logic needs splitting: Obtain a range ahead of populating, access
the range only afterwards.

>> @@ -1389,6 +1395,15 @@ int __init dom0_construct_pvh(const stru
>>  
>>      iommu_hwdom_init(d);
>>  
>> +    nr_orig_e820 = d->arch.nr_e820;
>> +    orig_e820 = xvmalloc_array(struct e820entry, nr_orig_e820);
>> +    if ( !orig_e820 )
>> +    {
>> +        printk("No memory for copy of E820 map (%u entries)\n", nr_orig_e820);
> 
> For some of the printks during dom0 PVH construction we already print
> the domain (%pd), and I think it would be good to print it here also.
> Some not-yet-upstream uses (hyperlaunch) create several domains using
> this logic, it would be good to easily spot which domain triggered the
> errors.

Can do, sure. That'll be a little inconsistent then for a while; maybe
I should add a patch adjusting all printk()s I didn't otherwise touch.

Jan

