Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C17C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 07:02:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348356.1606143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSTr-0005s6-1v; Tue, 30 Jun 2026 07:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348356.1606143; Tue, 30 Jun 2026 07:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSTq-0005rz-Vc; Tue, 30 Jun 2026 07:02:02 +0000
Received: by outflank-mailman (input) for mailman id 1348356;
 Tue, 30 Jun 2026 07:02:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weSTp-0005rr-Mp
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 07:02:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weSTp-005z5T-3U
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:02:01 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4369e0-5cb7-0a2a0a5109dd-0a2a450bc1fc-32
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:02:00 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4369e8-ac48-0a2a450b0019-d1558030bd1a-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:02:00 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493bb510ce4so1703415e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 00:02:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493b8c721f3sm61731595e9.5.2026.06.30.00.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 00:01:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782802920; x=1783407720; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H24hNUAaAm3gtzGZyb1n+TgaV7Hmn+OvyOZoiWP67FI=;
        b=PEesmhzwLgfVwkb1P1UacHNmR/3VfTA8kYBhYjtEXg8tX0kXNMMzmuEkLVExNkqu8X
         iToXnj4EnKi2N3VTb/Ryiq1nEZIfngJhj4He0vkhGt9CDyrttJrb+ngAfd9uIxd8iw8L
         R8+DJ+DChAVouTrsJnx0V57QRF0X2Y9VlN++D7ugJdgSLyMReqDo9GuINcLvkMoAMJ2F
         oC77PRaw3fPwPEldKLQ58W7ScB0aC3l1m45d1j6jBc5PehzG6TtEBEF2/7BLqhdo3PN/
         CGitZj11M33Ho7f5GnYy9KlPOeAbe0VMbIwEpi9maH5E9xqjgIYn4C4zs42IpDVOye3k
         VPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802920; x=1783407720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H24hNUAaAm3gtzGZyb1n+TgaV7Hmn+OvyOZoiWP67FI=;
        b=tRt13nyqEPad8eHXkejVOLU571XcSc32WIRGe+Jc37zTCJyxLZlrJkkrOppyThezz1
         0x0mNyyhj4I88oEoR4jtaW8y1cmvrpZVoYxH+ulz+em5QT+8KsKScpusjwVFAePXUhYt
         8LNCDlbJskgghMn013UEndWu9F2THei7WwY3QkXMm4S5Y64Qf8BTXs97o64ntkseNI7L
         +6yQhXoXQ74vEucSaFHPWE4tSEVUBrHYaQ10TgRB1/4JOkGNK/+Cvw0oW1UOgI2p1Qf+
         oKZTVtKi2VSw7PvBpLq4xqUyYQo1IyYmpvtG0OyOrGC52MbSdzKYP9MIePSdcvg7OS9k
         On1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+CmhaUwqMnmX3RC765bDN8osKiqOlg4R1adpxyBwS0vGcU1VKSRPhmdBvKychhDzH22bFua2hP4mk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRqZyhBWKexmN3vE6OicrB5VHuN7MJXciZv9/09oB9p1acfvsM
	GrgDP0YJ6G0ho2TeJ2sgLsXbhEeb+DkPS/soPOhAQx2piCq9fZ6DjWsi/ofZmQVKWg==
X-Gm-Gg: AfdE7cmyTlZ8ldrgmzpoW+Kxuq/mZ2jKnE10dpODb/E0jZiksKulkVV+TBvb9H/2SC7
	iOhRARPRKUhcJcGiEXcfQYFHNvQEyo1mL4ExU2FY8vOAWmVhBBRwNVUW4cxeDpvIWd49up7UkW5
	z++8CkTMf/ekffFeciVJWIXmkXPheq6lZPqu24W0BwE52Qu95391xzPcGaEgA8KrX22C0MqraHH
	/yBGS0o4w+c4O6a+838j8PppKyq03hR0FCdVq4knJ/HkNS9DHHNlWlGz619ak9s5MxHpctIO9Iq
	EMaobn8+G7/SAR2CYxkXj5oMtvqz0xmEBdIF0xyuch0HNNgxbwAQY9cQSWq/QXp6wQfcYSc0ln4
	jbQAdIB4bA6HPCpo6phtrZuD9CxGhJoV8kHHeeJrQ3uP4INHDJq0GFXqIY2sLp3GERvQZ5Z5ZZP
	6dwx7lTnnCQpxzdQTQGkeRaNL+yyRMOMt/DpGoF/yhJI25XPt2ZuI9qmJZrHqqcqVcX4Rids3rP
	/t5
X-Received: by 2002:a05:600c:4e08:b0:490:d32b:39d6 with SMTP id 5b1f17b1804b1-493b82ad241mr33521965e9.19.1782802920104;
        Tue, 30 Jun 2026 00:02:00 -0700 (PDT)
Message-ID: <e01e0ce5-b0a0-4942-9018-20ab252abfc1@suse.com>
Date: Tue, 30 Jun 2026 09:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/sched: Link CPU topology to scheduler
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260629215806.11610-1-taka@valinux.co.jp>
 <20260629215806.11610-3-taka@valinux.co.jp>
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
In-Reply-To: <20260629215806.11610-3-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782802920-39F26220-DC07AD37/0/0
X-purgate-type: clean
X-purgate-size: 2219

On 29.06.2026 23:58, Hirokazu Takahashi wrote:
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -9,6 +9,7 @@
>   * Based on an earlier verson by Emmanuel Ackaouy.
>   */
>  
> +#include <xen/cpu-topology.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> @@ -37,6 +38,8 @@ static unsigned int cpu_nr_siblings(unsigned int cpu)
>  {
>  #ifdef CONFIG_X86
>      return cpu_data[cpu].x86_num_siblings;
> +#elif defined(CONFIG_CPU_TOPOLOGY)
> +    return cpu_topology ? cpu_topology[cpu].num_siblings : 1;

See my earlier remark regarding the ordering here.

> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -28,6 +28,7 @@
>  #include <xen/pmstat.h>
>  #include <xen/livepatch.h>
>  #include <xen/coverage.h>
> +#include <xen/cpu-topology.h>

Taking e.g. this #include, ...

> --- a/xen/include/xen/cpu-topology.h
> +++ b/xen/include/xen/cpu-topology.h
> @@ -9,6 +9,10 @@ struct cpu_topology {
>      cpumask_var_t thread_sibling;
>      cpumask_var_t core_sibling;
>      cpumask_var_t cluster_sibling;
> +    unsigned int phys_core_id;
> +    unsigned int phys_cluster_id;
> +    unsigned int phys_socket_id;
> +    unsigned int num_siblings;
>  };
>  
>  #ifdef CONFIG_CPU_TOPOLOGY
> @@ -16,11 +20,22 @@ struct cpu_topology {
>  extern struct cpu_topology *cpu_topology;
>  void init_cpu_topology(void);
>  
> +#define cpu_to_core(cpu) (cpu_topology ? cpu_topology[cpu].phys_core_id : 0)
> +#define cpu_to_socket(cpu) (cpu_topology ? cpu_topology[cpu].phys_socket_id : 0)
> +
>  #else /* CONFIG_CPU_TOPOLOGY */
>  
>  #define cpu_topology ((struct cpu_topology *)NULL)
>  static inline void init_cpu_topology(void) {}
>  
> +#ifndef cpu_to_core
> +#define cpu_to_core(cpu)   (0)
> +#endif
> +
> +#ifndef cpu_to_socket
> +#define cpu_to_socket(cpu) (0)
> +#endif

... what guarantees, on x86, that cpu_to_core and cpu_to_socket are already
#define-d by this point, so that these fallbacks don't take effect there?
(IOW I think you need to explicitly "#include <asm/processor.h>" below the
#else here. Yet better might be to move those two x86 #define-s to a new
asm/topology.h.)

Jan

