Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB32D606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 08:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fyQkOSvm
Received: from list by lists.xenproject.org with outflank-mailman.1500281.1696507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVPGW-0002bY-NH; Mon, 23 Nov 2026 08:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500281.1696507; Mon, 23 Nov 2026 08:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVPGW-0002bQ-J3; Mon, 23 Nov 2026 08:19:08 +0000
Received: by outflank-mailman (input) for mailman id 1500281;
 Mon, 23 Nov 2026 08:19:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVPGU-0002bK-Il
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 08:19:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVPGT-002uwJ-Iy
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 09:19:05 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b03f6f8-8faa-0a2a0a5109dd-0a2a4502dd50-10
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 09:19:05 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b03f6da-4900-0a2a45020019-d1558036c098-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 09:18:34 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so24988245e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 00:18:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b216esm372697275e9.12.2026.11.23.00.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 00:18:33 -0800 (PST)
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
        d=suse.com; s=google; t=1795421913; x=1796026713; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2yQ8oD5gpAOY2TPq2RMld577SqvkNMbIBYTn6tAc5mw=;
        b=fyQkOSvmwIs8ItEhuiZ32xZNgEy5oE8Oyfm8mnlQ5b2k0+hgQT7hDoPCZ/Ans1llFf
         8d73QD5pxybXbJW92ap0/fCDIVJ9vZ67r+y1CVz/39s+dIGXX03sNvHUufck0aTWLYCD
         bUI4k2JjIcfc+KcZkkUYTjndjaLYAlxsLCydDRM3/+cNFoAx+xUP2tF3Ek5z1Nzt3xcx
         Cqt5z5kH9ABSqfMSa29xPj1gkOoorZ1W5jY4jUVkb0QfX3u3L0mkvdRLXh5S04xulNMc
         6MpWZgTkzCfoC/m6aeOnu2MPLgqD5hZYq029cgwe1sEVBIe/f71ra64VyDRUjnZvA+iI
         aMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421913; x=1796026713;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2yQ8oD5gpAOY2TPq2RMld577SqvkNMbIBYTn6tAc5mw=;
        b=Kksm3oGHVtpjmplL3gfUhFnIzVjAjyrBHiB+no9ev1xTwLVQwb4Z6zW7Ewblu5Uh+u
         2c4MUPdOWcg0yFtzoAq9cZCvw5bgOwijZCBy+WMK9M3D/LegVpB/SfWOMJNCj8RYwMMo
         Gy7Rn7da9gGMWlET3qJkZ+mlYZostspB3hT9EbdU/SP+XvsR8DtH8F/9CkB7Tmvg1z6K
         YkP57xfITcAi6cAH4t3fcy1jnoVgeeesFmLUYO4NkSdnuwca+CbbPUlzEk2LB9a2tTm2
         v+0up+W6bXVfDRsbV2v37dW6OjWsVYpVvgaoQQggdF1EfS3HktrCnDtxjLecMG9iWlaL
         iBbg==
X-Forwarded-Encrypted: i=1; AL+hErG/xy+lVkSEwYWN9LSgDMIxd7ofN7PzgCT6xTqiGCCbu1w6D4zN3Nf0MvTfVOdhkEKPGpVF8qg+JC4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z85E44JqZQ8DkB+EBE/JLjBtfLXlZPriLG5A+p/ZyLPd1zHELlK
	gvjnuAj56cd0BZy9qdR40RQMstFCL0UnpmkVRKTEqhqIW7Vf/qd56ijfM5U9l/pkbA==
X-Gm-Gg: AZFdTZc5Vw3j8WivcudxF/mpo6qZWVYrKLmrZMyi3nmQqKPPPZMv1urjMVkoBbgI/tV
	/j9D8roxJZdR1876PGE0nGxeoCV43kQy1xBTf9c6HqjMylXcaiRvYxGltUNfynf9s4qGemKoq54
	uGGqoa8X8fwwq5g9EtQZvLnraE7Zq7wFllIKkek9h9EGtkqnualT5cYlNJdbQKQtWecE8dpsX7j
	OGDTUv2R5UICCIq+Yyl4zNIk8ZoksPvulJUMCpLDuIxtk9XxXrWDU7yTdUq0VPHuQCK95Bq/Cnd
	821AsoV3Xu5Dqg49rdVIiHdBAG3J0Sz1/9H1wW5xCHlaLh1WFJGgzEqn1KqolnIgAo4gLl2R7Q3
	NyjkqEmlnliJ0ymZGFPFqDiFB9JEXrj201tfDZGFE52Zizqz9HZCFaN3LiErM9NY6s3cReUo69y
	ZSrKvq8DHykQdhc/F/y7ypfb7Hdh3khU8goMIbc4ofobSjQe45THNtvY5aqtL+fg+wlTsYLLZII
	okbuEe71O+3TfZHxgiq+54AZ6xGeJ1BZLTNi6s4q9Hbr9CKFWljQ5rvis+/W/n5Wy4KQPz8Q6/h
	xRjZYttDLhskg+GlShIF5MP3FPpoP+BtU37qRZuOwlvcKkGOe/1RqbaOuC9moJYcod8kifbPEhM
	XiyvSTgnD5Ul5gp9kX6v/wZFuW2p+eR9oszuwrQ==
X-Received: by 2002:a05:600c:1c1b:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4bb887e2677mr255056315e9.4.1795421913578;
        Mon, 23 Nov 2026 00:18:33 -0800 (PST)
Message-ID: <23166d22-4d96-41c0-8da5-789fdc8b3cd7@suse.com>
Date: Mon, 23 Nov 2026 09:18:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: handle domain_shutdown() return values
To: Mykola Kvach <Mykola_Kvach@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20261120160804.230032-1-mykola_kvach@epam.com>
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
In-Reply-To: <20261120160804.230032-1-mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1795421914-F83246C6-F6A7DB0A/10/78276251493
X-purgate-type: spam
X-purgate-size: 2298
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20.11.2026 17:08, Mykola Kvach wrote:
> --- a/xen/arch/x86/compat.c
> +++ b/xen/arch/x86/compat.c
> @@ -39,14 +39,11 @@ long do_sched_op_compat(int cmd, unsigned long arg)
>      case SCHEDOP_shutdown:
>          TRACE_TIME(TRC_SCHED_SHUTDOWN,
>                     current->domain->domain_id, current->vcpu_id, arg);
> -        domain_shutdown(current->domain, (u8)arg);
> -        break;
> +        return domain_shutdown(current->domain, (u8)arg);
>  
>      default:
>          return -ENOSYS;
>      }
> -
> -    return 0;
>  }

I'm not quite sure whether we ought to alter the behavior of this (very)
legacy hypercall. The case you mention in the description (shim) post-
dates this hypercall's replacement by many years.

> @@ -1750,12 +1754,16 @@ void hvm_triple_fault(void)
>      struct vcpu *v = current;
>      struct domain *d = v->domain;
>      u8 reason = d->arch.hvm.params[HVM_PARAM_TRIPLE_FAULT_REASON];
> +    int rc;
>  
>      gprintk(XENLOG_ERR,
>              "Triple fault - invoking HVM shutdown action %d\n",
>              reason);
>      vcpu_show_execution_state(v);
> -    domain_shutdown(d, reason);
> +    rc = domain_shutdown(d, reason);
> +    if ( unlikely(rc < 0) )
> +        gprintk(XENLOG_ERR, "Failed to shut down after triple fault: %d\n",
> +                rc);
>  }

Here and ...

> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1588,6 +1588,7 @@ static void cf_check domain_watchdog_timeout(void *data)
>       */
>      struct domain *d = _p((unsigned long)data & PAGE_MASK);
>      unsigned int id = (unsigned long)data & ~PAGE_MASK;
> +    int rc;
>  
>      BUILD_BUG_ON(alignof(*d) < PAGE_SIZE);
>  
> @@ -1595,7 +1596,10 @@ static void cf_check domain_watchdog_timeout(void *data)
>          return;
>  
>      printk("Watchdog timer %u fired for %pd\n", id, d);
> -    domain_shutdown(d, SHUTDOWN_watchdog);
> +    rc = domain_shutdown(d, SHUTDOWN_watchdog);
> +    if ( unlikely(rc) )
> +        printk(XENLOG_G_ERR "Watchdog timer %u failed to shut down %pd: %d\n",
> +               id, d, rc);
>  }

... here I wonder whether we shouldn't go farther than merely logging a
message. If the domain can't be "shut down", maybe it should be crashed?

Jan

