Return-Path: <SRS0=1OSo=HD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7D8C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 13:09:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C9764EA3
	for <xen-devel@archiver.kernel.org>; Mon,  1 Feb 2021 13:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C9764EA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=amsat.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.79874.145609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Yx4-0006e4-O1; Mon, 01 Feb 2021 13:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79874.145609; Mon, 01 Feb 2021 13:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6Yx4-0006dx-L8; Mon, 01 Feb 2021 13:09:10 +0000
Received: by outflank-mailman (input) for mailman id 79874;
 Mon, 01 Feb 2021 13:09:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUbX=HD=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1l6Yx3-0006dq-BZ
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 13:09:09 +0000
Received: from mail-ej1-x635.google.com (unknown [2a00:1450:4864:20::635])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32e97fcf-6f1c-48bb-a6e5-0d55376c0de3;
 Mon, 01 Feb 2021 13:09:08 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id w1so24205084ejf.11
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 05:09:08 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id jt8sm8070132ejc.40.2021.02.01.05.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 05:09:06 -0800 (PST)
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
X-Inumbo-ID: 32e97fcf-6f1c-48bb-a6e5-0d55376c0de3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rP9I+61hg7LNIUhfLLrTy63wjzGJQeyog0qeGD9KQOk=;
        b=PqljVBE7qJ3DWkvlnvaUln3090pAAuOSz/DQV8eqwDSLCduh6EOA+HKQcrTK05r7O7
         wOhRqk2exJ1038aBtNY2ugNVEx5Ei7H6zj9E0YuLI786lxJ44EMzOVYuamswZPG/GWnW
         u+mX0q0CPvkWkDXyWYjrTPeO8UwmavQSnDmcYCJHj20fvEG7FCo9FcrK28NH0h+JHESU
         KSJEacavGpsmlcbRRSwC/6lnj5dPr9JHXGC7s6IwcPgr8nosYzQna+4/t+8P+xhE6GHg
         2pKpb+tdPYokxpZVdworJIEMcU4qE+hb+Q1kATfChus1ukNQZUYjiiMAPLS/EfUCu/t0
         Ntfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rP9I+61hg7LNIUhfLLrTy63wjzGJQeyog0qeGD9KQOk=;
        b=Q5WNfAY/Xjp4zH69hFaFg2vMd1Ldeg0FkUl5jLtz0tYrV4+9YUu76yBYDlvDQL8FL1
         HDOcAmb6yuHOfFEIYAtKQDPSiUHba42owu74yNtAYBBx/OWiKPZ8lwd3HC9pqOKhVDsK
         AjYporJdxp0MOF4VDpOreQrom0QGQDlH4vtA2olBdBz+0LhvYpnfJYS3DiBc//GMYXG5
         RuyrKRz0y6EVWoOyc7Jj4BtKym9shJP+RgiXtDQKiXwEzO3X0dXpNluqtN1anMW8vEmn
         1dCKoxJfeseAZA4gzwjk8fiMs8RZ29oCwsOSHuL14tE2SUUgu2Ps5dVT19VdsWRBpkIt
         /9VQ==
X-Gm-Message-State: AOAM533x1HETmQRdAhilcsc9o5ieUVMJOCgQz/8sPPosTnJZ2GPrqzP/
	uUBJxhVSzq6LUj8nGsw1K7Y=
X-Google-Smtp-Source: ABdhPJw40nPrERTfiMARHLjmWXlD4UMilhu04GifoKIpMYQFjX66d7uewWoAbwIsEoqdkYi/phZtTg==
X-Received: by 2002:a17:906:8410:: with SMTP id n16mr17948338ejx.551.1612184947588;
        Mon, 01 Feb 2021 05:09:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 5/7] hw/xen: Make xen_shutdown_fatal_error() available
 out of X86 HVM
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210201112905.545144-1-f4bug@amsat.org>
 <20210201112905.545144-6-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a77a620d-beca-0d13-6ffe-861528c6cbc4@amsat.org>
Date: Mon, 1 Feb 2021 14:09:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201112905.545144-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/1/21 12:29 PM, Philippe Mathieu-Daudé wrote:
> xen_shutdown_fatal_error() is also used by XEN_PV.
> 
> This fixes when XEN_PV without XEN_FV:
> 
>   /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt_config_init.c.o: in function `xen_pt_status_reg_init':
>   hw/xen/xen_pt_config_init.c:281: undefined reference to `xen_shutdown_fatal_error'
>   /usr/bin/ld: hw/xen/xen_pt_config_init.c:275: undefined reference to `xen_shutdown_fatal_error'
>   /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt.c.o: in function `xen_pt_pci_read_config':
>   hw/xen/xen_pt.c:220: undefined reference to `xen_shutdown_fatal_error'
>   /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt.c.o: in function `xen_pt_pci_write_config':
>   hw/xen/xen_pt.c:369: undefined reference to `xen_shutdown_fatal_error'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/xen/xen-hvm.c | 13 -------------
>  hw/xen/xen-utils.c    | 25 +++++++++++++++++++++++++
>  hw/xen/meson.build    |  1 +
>  3 files changed, 26 insertions(+), 13 deletions(-)
>  create mode 100644 hw/xen/xen-utils.c
> 
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 7156ab13329..69196754a30 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -28,7 +28,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/range.h"
> -#include "sysemu/runstate.h"

^ self-nack, was not supposed to remove this.

>  #include "sysemu/sysemu.h"
>  #include "sysemu/xen.h"
>  #include "trace.h"
> @@ -1570,18 +1569,6 @@ void xen_register_framebuffer(MemoryRegion *mr)
>      framebuffer = mr;
>  }

