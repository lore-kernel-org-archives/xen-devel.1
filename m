Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550EA60A2618
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ys6MzT3C
Received: from list by lists.xenproject.org with outflank-mailman.1497956.1695985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULBv-0007zF-Mh; Fri, 20 Nov 2026 09:45:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497956.1695985; Fri, 20 Nov 2026 09:45:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xULBv-0007z8-I1; Fri, 20 Nov 2026 09:45:59 +0000
Received: by outflank-mailman (input) for mailman id 1497956;
 Fri, 20 Nov 2026 09:45:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xULBu-0007z0-AN
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:45:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xULBt-00ESxA-FJ
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:45:57 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b0016ca-2eae-0a2a0a5409dd-0a2a4507b750-44
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:45:57 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6b0016d5-b4ea-0a2a45070019-d155dd30b1cf-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:45:57 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4a357b1c649so293749f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 01:45:57 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2d1bsm4713650f8f.8.2026.11.20.01.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 01:45:56 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795167957; x=1795772757; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2oWKyaPow4wMh8EHq8NnpScceCZs0zDTm5Zy3R0pMM=;
        b=ys6MzT3Ct5AzjoiLbHAFY4MMqqvZF01UM+EK5nD5jizPX2qKMcc40fNWdXbH1kSAta
         7MmybO0emZHaP3CHI+l6WlZY0yFk4YDwmO2KlIydDLlJR2ulYkGcdGaoDYpskOx8UXqZ
         ephxI4sBNHh0JFu8fscSnP8kOgy+0tECPyMkYGXkv3bLMyid9vx9YwpnqqoW8P2tbbKb
         Q5q0H0+QFLaI3rk+QnGEFD5JqytTY9m21n6y9l3kJa/CMaaayqBFBJuPT0mVJk20xP4v
         hLESb0WIEBzcsFYyxe45Eympa3829j0wl3+PuE60nbrGA1YQWybNYLwUSSObmTzmTPXj
         LL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167957; x=1795772757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2oWKyaPow4wMh8EHq8NnpScceCZs0zDTm5Zy3R0pMM=;
        b=Ttpb49Cd5Ff/Cw+Q2vNPZkajQeqUdNDCJWZf69C1axVBAAf3iPRBckLgO4t+Jgq3E9
         JIL1vLwo6HznBAQdoO8XKoQQW4mcl7n6mjfp1Ad7TYoaabgl6LVt5QIk3is11O2tmb4b
         YbFGsKWvVDRbjvEnqG/6VvCsaHy4iZjL2X86p10MeMgKlXVcAR7eUcJEIHOlXdC1+ajg
         /QjSlbFE3lQ3Q2rVVE/Xi91WNhmUT3gmnvkUQNh/vr7dWCsZoVVEct+RGZPMhtPxt2wX
         8qRQ9zQcCaEd7VSR4Uyy62Jk7DZSYimZB1qK4AHTQRik36GbRb5iVx7WRHQdhXiilC/J
         StaQ==
X-Forwarded-Encrypted: i=1; AL+hErHlrF6eiQdSfccxBGvOZT3+COHyYfBWfhk74n/PX1KCxhN5X+cwni7umJXflOwdPj/uYyMzhlgHnuQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8qb+8YkwAv2x8yfh4NAEGeXPyToYFCN5BDxCruy4GkK85hUUJW
	4teIJ8aDPUjM96IbsvmzbYg54NlaG6fB0rQdqbNe3KFekBRLBk7z6rQW
X-Gm-Gg: AZFdTZdwDkbwjv4e9ROKDjGuROvr0+WhuRnzssytWMkthtUAgsSl8sAawl5sfX+ED7Z
	WDFheqwXVWDKCGSlPs4pIGN9jbB7TR0z4TAFyLc5dnhSpsK2HASbeRx01+Hs/vHH2DODodiZEWw
	VsB1pAUWhriMR2MEMlxX3cgTR7g2WBdTWXtS7N3Pl59VCJ0pW2U+5YRSwUomM2BDhiuhE8/ZG9G
	zA4nIhNQCQEFmzmwB0F50/uNqI6p0VS+SNtKHBnllzy8GkcUkN5ziJHITV6gMzF910/P2/OBjrM
	ByfFW24l1K9zqprw3Qc2IyvvIiebLfa0w4sLgTE31n/vzga6sLzMSnHZSpvMkJsxZ451tNMtKtb
	qdwFJJ5tZxHtOUAk8Gia/UGr9TfpytIHX7pJgax2KsW6q213fDwxY3ltfvL3a2g5zCK4w8GdJ3t
	ISM3+TDdRojvardMN8CNi3J61N9lqgkse3VBDXXuQ5GOt1P0O6Xm8ji5sAkMTrpEUtwdpG6MROI
	8338UgfExq/tMq1TWyQqobOCE28RbMHedS2Aqy3QpM32CMsGZe9ybsBZqWhZX/LF4Fgu5KZZIpV
	ld57xszcW59IpqBW7+W5o5tDKrWxsKcd/UragnZKKXIL0gWySTQK/5CROtTGSN13MDD0CXgtcr2
	ZhQ==
X-Received: by 2002:a05:6000:299c:20b0:4aa:2bf2:4d98 with SMTP id ffacd0b85a97d-4abb0f3b4b0mr3522825f8f.29.1795167956896;
        Fri, 20 Nov 2026 01:45:56 -0800 (PST)
Message-ID: <4b5b5619-a101-4892-9bdd-ee2cc5dd1d71@gmail.com>
Date: Fri, 20 Nov 2026 10:45:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/26] emul/ns16x50: enable emulator
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-16-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-16-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1795167957-3C610AE4-611285B4/10/73395122804
X-purgate-type: spam
X-purgate-size: 1630
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>

Commit subject: "emul/ns16x50: enable emulator"

Nit: the patch doesn't touch ns16x50.c; it wires the framework into
x86 HVM domain creation, so "x86/hvm:" (or "emul/vuart:") seems more
fitting as the prefix.

> 
> Wire emulator to domain creation code.
> 
> Introduce a helper `vuart_probe()` call to get the parsed vUART
> configuration settings and use it while constructing domain with vUART.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/arch/x86/hvm/hvm.c        | 9 +++++++++
>   xen/common/emul/vuart/vuart.c | 8 ++++++++
>   xen/include/xen/vuart.h       | 6 ++++++
>   3 files changed, 23 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index ef9c7cd05777..f4d2fbe75fc6 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -29,6 +29,7 @@
>   #include <xen/trace.h>
>   #include <xen/vm_event.h>
>   #include <xen/vpci.h>
> +#include <xen/vuart.h>
>   #include <xen/wait.h>
>   #include <xen/warning.h>
>   
> @@ -699,6 +700,10 @@ int hvm_domain_initialise(struct domain *d,
>       if ( rc != 0 )
>           goto fail1;
>   
> +    rc = vuart_init(d, vuart_probe(d));
> +    if ( rc )
> +        goto out_vioapic_deinit;
> +
>       stdvga_init(d);
>   
>       rtc_init(d);
> @@ -722,6 +727,8 @@ int hvm_domain_initialise(struct domain *d,
>       return 0;
>   
>    fail2:
> +    vuart_deinit(d);
> + out_vioapic_deinit:

Nit: the new label doesn't follow the failN naming used around it.

~ Oleksii

