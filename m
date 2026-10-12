Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243EECA9ED1
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:43:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446002.1661912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBci-0002VB-J7; Mon, 12 Oct 2026 08:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446002.1661912; Mon, 12 Oct 2026 08:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBci-0002V3-FJ; Mon, 12 Oct 2026 08:43:08 +0000
Received: by outflank-mailman (input) for mailman id 1446002;
 Mon, 12 Oct 2026 08:43:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBch-0002Ux-Ey
 for xen-devel@lists.xen.org; Mon, 12 Oct 2026 08:43:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBcg-008j8D-70
 for xen-devel@lists.xen.org; Mon, 12 Oct 2026 10:43:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9d97-bab6-0a2a0a5309dd-0a2a450ba330-0
 for <xen-devel@lists.xen.org>; Mon, 12 Oct 2026 10:43:03 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9d97-b7e8-0a2a450b0019-d1558029f194-3
 for <xen-devel@lists.xen.org>; Mon, 12 Oct 2026 10:43:03 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso19174015e9.3
 for <xen-devel@lists.xen.org>; Mon, 12 Oct 2026 01:43:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bea0f1csm395457535e9.9.2026.10.12.01.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:43:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791794583; x=1792399383; darn=lists.xen.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5MU5s8GjKUuc/tujX6IkCZkv91mwkdLwUwTaQKBEdU=;
        b=M0987V5K2ZnmuuTJKJRWVfCqBwqBMIOTme2Fn/MVAXM+aagQYbTBM9V7CVX+2vm1mQ
         KvIQ4PVbEsw+3TX091KlPhRGWMD7RrGRtgU7Sj+L6fIMo9CoIOgyyEriNULooXzKra4r
         tNxQeTWw1YMFYWyGp364kEsDGK/d4NycTOCN5c9plXI9iViooLiIBKv8fCrj7zWb+vK7
         oney2VH3Z/xjezt36PE0duq4ArRtdTfeo7qBW/MUZuUIZ36rvb2vVb1R037yz+I2Y/WK
         7zgeuz4Tk47cdpEc0nH8bqbsBhxQpVbBngLWt5pff7dP8GSpAdtP/7K10CI5hWP5YveH
         f16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794583; x=1792399383;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5MU5s8GjKUuc/tujX6IkCZkv91mwkdLwUwTaQKBEdU=;
        b=CHi/ma0TfChLMnby7uSbTKm9WU1JDNuqPVriCZedV957dfaBXj4eivIXQdt4mX0Vsb
         aA2wG4VS5JHdVeeeJGzSI7D807NL9uJJdwUfr1bXY5aukw/Vo0SKchmaMTjOa3cvtYFz
         8mjUS0GzP6EdxXf30k/Dwf1OTY9v7TzyL0SI2GUR50pnQAGUbcHuAuX2p8arOPxSC2Uq
         3ZfZ3HokERuvCOSiujg6GGDxpkpR4KgYm0bLPuTrPKNbSUPHogaaZnTE8lizEUOUO2i1
         t70h38ujUIt6AzUdgz+WZwJ/lFyAwProoQyvDp1Mu1XKsMYZzkswX7ux199s4C8ZXK9B
         M3sA==
X-Gm-Message-State: AFq9FYK+ceD3wWQkWWrShKKJ8FUwFbV+ZdDDgBO4k0P174G6HopOe5Cm
	nS8T8vy+DA/38FX/wrZQVDHHsf+zZUFChh7kv5HzcVpckJEe/PXio7UuyDYgKfo4EA==
X-Gm-Gg: AYBFou0ndO4MRt5ENyY7fmN3Ve5a2aHDMNc2art/v/r724oYwp6zIj1uZyXmaFmWsdn
	jhjffMaBXhoKoZlolt06tP+RCvNCWOox2mjZPB4KAMkWX1y3cWsGfqoxr88tyarGEd5RfZ6EjiX
	OmrpiyA+wdHD+ygJo/83IEKvjI8WpYLTZ4tljm5jXVfBK/rPr9HIP0sq4rBuSbyb8H05Ou2ymW6
	cNURpLnWDpQuQQwGs7K9IVBMu4LF605RWyqKV59DKaia0kt8Xk62ck7Tc0e2P8Ye+f4XM/zpRL0
	peA1mev+/+EOEDW8mxZGNYbA+07gdDC6dYLeb6UHZ2S62Ats6KiCIBAb2fHpCMRn+Jqhi1FpbOo
	Ug28l/4gYg0HAG3LF8hd0+Zdu/0Q16qpz11nw0DDe4ab30yidvVsOJ33avKioWw/pf82XiWiURe
	wYPB85CWVZxEowJeATR9W9wwOZF+7JofiMd0aykQTOsaPBY+hDXZPps22gYaIZVHyoIUJtLQq7m
	lX6gjWCxz0TLIZn/hd3TMU0cyb3/t7nK74NlgWLoHtEb6dG4lCIlv9YGf/S3BA=
X-Received: by 2002:a05:600c:c092:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a19831a9f7mr60949015e9.30.1791794582789;
        Mon, 12 Oct 2026 01:43:02 -0700 (PDT)
Message-ID: <e3aa9017-1481-417b-8588-6c7af6c4875f@suse.com>
Date: Mon, 12 Oct 2026 10:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Xen Dom0 fails to boot with "nvme.poll_queues=24" and
 "dom0_max_vcpus=6 dom0_vcpus_pin"
To: Egon Ojamaa <egon.ojamaa@protonmail.com>
References: <U7HCP3LJd4EyfAH4QnOSFByAb7GtqgCBigeGGjopZ501a2wAYBQ8ySpQ5_tHz9UCQ8Si5_3lEV0trGVLcQO0c2_ZWGnlwK0kF2gRVOHTv5w=@protonmail.com>
Content-Language: en-US
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
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
In-Reply-To: <U7HCP3LJd4EyfAH4QnOSFByAb7GtqgCBigeGGjopZ501a2wAYBQ8ySpQ5_tHz9UCQ8Si5_3lEV0trGVLcQO0c2_ZWGnlwK0kF2gRVOHTv5w=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791794583-1ACDF9EA-64A2D17E/10/78276251493
X-purgate-type: spam
X-purgate-size: 2267

On 09.10.2026 05:41, Egon Ojamaa wrote:
> Hello, Real human writing, not AI here ;)

Good to know such can still happen.

> #### Problem:
> 
> Booting Xen hypervisor with Linux Dom0.
> GRUB loads, Xen kernel messages load up to "Using 6 CPU"
> 
> # From this point:
> Next screen goes black and stays blank for 10+minutes.
> Have to force reboot and choose non XEN kernel booting option via GRUB.
> 
> # From this point expected behaviour without bug:
> Next screen goes black and stays so for 30-70sec and Dom0 kernel messages appear,
> Next login is possible and system is running, "xl info" and other xl commands function.
> 
> #### Cause:
> I spent 2 days rebooting to narrow this down..
> 
> This happens if we set both settings same time:
> NVME io polling and XEN kernel CPU limits, via default grub configs:
> 
> GRUB_CMDLINE_LINUX_DEFAULT="nvme.poll_queues=24"
> 
> # Can also be set via /mnt/oldroot/etc/modprobe.d/nvme.conf
> # For proper polling setup nvme.io_poll=1 should also be set,
> # but symptom already appears if we set only nvme.poll_queues=24
> 
> and
> 
> GRUB_CMDLINE_XEN_DEFAULT="dom0_max_vcpus=6 dom0_vcpus_pin"

Did you isolate which of the two options it actually is that causes the
problem, or whether it needs to be both together? Also, is 6 a necessary
(exact) precondition to the issue occurring?

> Sadly not my personal system, so I can not do further heavy testing on it.
> io polling does give very good performance boost to Gen5 NVME, and even Gen4.
> Sad we cant use it, as CPU pinning is more important for XEN hypervizor system.
> 
> This has been also reported to launchpad.net:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2170270

As was meanwhile also indicated in that report: What's completely missing
here, but very likely necessary for further analysis, are logs. That may
also help establishing whether it's the kernel (driver) that's hung, or
whether the system as a whole (i.e. Xen) is stuck. If nothing else in the
log has any indication either way, issuing a debug key (for starters just
'h', later maybe others) may help telling one from the other. If issuing
debug keys isn't possible anymore, try adding "watchdog" to the Xen
command line.

Jan

