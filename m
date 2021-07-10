Return-Path: <SRS0=L+xA=MC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DEBC07E99
	for <xen-devel@archiver.kernel.org>; Sat, 10 Jul 2021 00:50:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1123D613BF
	for <xen-devel@archiver.kernel.org>; Sat, 10 Jul 2021 00:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1123D613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.153900.284366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m21C0-0003c2-3T; Sat, 10 Jul 2021 00:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153900.284366; Sat, 10 Jul 2021 00:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m21C0-0003bP-0T; Sat, 10 Jul 2021 00:50:04 +0000
Received: by outflank-mailman (input) for mailman id 153900;
 Sat, 10 Jul 2021 00:50:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=enOJ=MC=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1m21By-0003Qb-Lu
 for xen-devel@lists.xenproject.org; Sat, 10 Jul 2021 00:50:02 +0000
Received: from mail-il1-x12d.google.com (unknown [2607:f8b0:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f17ae1e6-01f7-4f36-8d22-8e4a61b01f30;
 Sat, 10 Jul 2021 00:50:01 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id w1so10243193ilg.10
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jul 2021 17:50:01 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id g20sm3797355ilk.81.2021.07.09.17.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 17:50:00 -0700 (PDT)
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
X-Inumbo-ID: f17ae1e6-01f7-4f36-8d22-8e4a61b01f30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GyA7orxIj2I4yfecdJ2AxRucK28QZX1c2h0DymEbjX4=;
        b=RHTm+apOKPJL9IXreo+VSxRIXbcqvBYUIIWdyfzwo08RzziUjnu12h/qnKr2mAW8OB
         24+yOwzwXgJahWc8oVH/EpJJP9Q3UZ6qH0hGHYafxshTKWqcB/zRQ3Zb3Y8YNEK9ra1v
         ZjWC1oQrPEW8s8S4PZG2ghSN7NnUGiazcU5eZ9hmvXrPEi957vweydOZ0viRa9Z21r3s
         XZ75ieG1UwdNUhZ0v/poFlbK4mURN6qudFu3IgqfRA5vt1WuWPAw7dpr8ubH3PtDHs71
         FcTDA7B27AWGbI7OhpK7ns/aQ83NO2MJeRcKl8gSX+t+sstGaMhcX23oimE6SjrSmw3V
         ZqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GyA7orxIj2I4yfecdJ2AxRucK28QZX1c2h0DymEbjX4=;
        b=gnIWrvsqDMzw4ji/eOApaENY9/cw/jJK7ma+nTDVfsFXBxrkAwN5ZoykJB/clnS0cH
         /rebmMyAP8Jq4mlXYbVw/ybkPYbuScsmXPoUe3cCVDyVjjbWBlVOd/fcIqpTV1AfAS4N
         5mGUniHRKJTu3F5TqynSKvu24Khetn5pIkGgWiDhMpUVGO//wA4+ilNg4R7XuCrdhg9/
         rjhcD2LKMXaVkYSOzGT0tVVnbLnrE4s9epzYTB53RNKjj9XVyWKI7VVsDOEYKFjHfr19
         jdpBnfY93r6X1UhB0jXNB9folPeTRDNZWceOK9u+LpOveuQZHlHdF+22+QhD3p5jN0XW
         MV+A==
X-Gm-Message-State: AOAM531Z9Ev9HTd1UUFuwuwDwLm5xbtf1NBv1RzaP422YVgKKubdwa54
	FAHgei8LaRR/G3L4A4VmI3s=
X-Google-Smtp-Source: ABdhPJxtB3KFa4Mi31hHm+JelZtFbJLH/GLWxiVhWyzvtVJpEHSJUMy4bzNC/TWap9Ljbp6q4wP6QQ==
X-Received: by 2002:a92:d44b:: with SMTP id r11mr6661033ilm.217.1625878201215;
        Fri, 09 Jul 2021 17:50:01 -0700 (PDT)
Subject: Re: [XEN PATCH v6 31/31] build,riscv: tell the build system about
 riscv64/head.S
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-32-anthony.perard@citrix.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <3da1bee5-13cb-2f32-67ae-4a56fe356d7c@gmail.com>
Date: Fri, 9 Jul 2021 18:50:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701141011.785641-32-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/1/21 8:10 AM, Anthony PERARD wrote:
> This allows to `make arch/riscv/riscv64/head.o`.
>
> Example of rune on a fresh copy of the repository:
>      make XEN_TARGET_ARCH=riscv64 CROSS_COMPILE=riscv64-linux-gnu- KBUILD_DEFCONFIG=tiny64_defconfig arch/riscv/riscv64/head.o
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>   xen/arch/riscv/riscv64/Makefile | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 100644 xen/arch/riscv/riscv64/Makefile
>
> diff --git a/xen/arch/riscv/riscv64/Makefile b/xen/arch/riscv/riscv64/Makefile
> new file mode 100644
> index 000000000000..15a4a65f6615
> --- /dev/null
> +++ b/xen/arch/riscv/riscv64/Makefile
> @@ -0,0 +1 @@
> +extra-y += head.o
Acked-by: Connor Davis <connojdavis@gmail.com>


- Connor

