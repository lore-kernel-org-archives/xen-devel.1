Return-Path: <SRS0=o2nd=EL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BFAC00A89
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 11:57:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D6C206ED
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 11:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dWHUU2T8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D6C206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.19741.45061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kadsn-0000Gb-EX; Thu, 05 Nov 2020 11:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19741.45061; Thu, 05 Nov 2020 11:56:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kadsn-0000GU-Aw; Thu, 05 Nov 2020 11:56:49 +0000
Received: by outflank-mailman (input) for mailman id 19741;
 Thu, 05 Nov 2020 11:56:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kadsm-0000GP-1C
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 11:56:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3b14e2c-1f39-4b33-9413-1d109a036771;
 Thu, 05 Nov 2020 11:56:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59637ABDE;
 Thu,  5 Nov 2020 11:56:46 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kadsm-0000GP-1C
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 11:56:48 +0000
X-Inumbo-ID: c3b14e2c-1f39-4b33-9413-1d109a036771
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c3b14e2c-1f39-4b33-9413-1d109a036771;
	Thu, 05 Nov 2020 11:56:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604577406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6zB8KEK+nBzVoOInEmzNrPpJZ/h0ekA5YpK91js6qt0=;
	b=dWHUU2T8+npwRfyDN0GZxvf9G1jaz3qA8PfcQrS20b78nrYL3G5mCHET4XG7tmR57AYusv
	B1ju9kQHDCWG+B6WFSwDj3lzUH+WNkKo1//mGm5b4GX2rGvcDUMmFiR0l/68VPvzFQw5za
	9iI/ONCe2uPsIYorMLGMDZF9EG/UF7k=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 59637ABDE;
	Thu,  5 Nov 2020 11:56:46 +0000 (UTC)
Subject: Ping: [PATCH] libxl: fix libacpi dependency
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: Olaf Hering <olaf@aepfle.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bd68e8f4-ce57-7798-f6d2-53e85319b8d4@suse.com>
Message-ID: <f2172d3f-38fc-7f9f-9b31-2c07a1686cff@suse.com>
Date: Thu, 5 Nov 2020 12:56:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <bd68e8f4-ce57-7798-f6d2-53e85319b8d4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.10.2020 12:40, Jan Beulich wrote:
> $(DSDT_FILES-y) depends on the recursive make to have run in libacpi/
> such that the file(s) itself/themselves were generated before
> compilation gets attempted. The same, however, is also necessary for
> generated headers, before source files including them would get
> attempted to be compiled.
> 
> The dependency specified in libacpi's Makefile, otoh, is entirely
> pointless nowadays - no compilation happens there anymore (except for
> tools involved in building the generated files). Together with it, the
> rule generating acpi.a also can go away.
> 
> Reported-by: Olaf Hering <olaf@aepfle.de>
> Fixes: 14c0d328da2b ("libxl/acpi: Build ACPI tables for HVMlite guests")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'd appreciate a libxl side ack (or otherwise) here.

Thanks, Jan

> ---
> Arguably we might also use $(ACPI_OBJS) instead of specifying just the
> one object file we know has respective #include directives.
> 
> --- a/tools/libacpi/Makefile
> +++ b/tools/libacpi/Makefile
> @@ -89,11 +89,6 @@ iasl:
>  	@echo 
>  	@exit 1
>  
> -build.o: ssdt_s3.h ssdt_s4.h ssdt_pm.h ssdt_tpm.h ssdt_laptop_slate.h
> -
> -acpi.a: $(OBJS)
> -	$(AR) rc $@ $(OBJS)
> -
>  clean:
>  	rm -f $(C_SRC) $(H_SRC) $(MK_DSDT) $(C_SRC:=.$(TMP_SUFFIX))
>  	rm -f $(patsubst %.c,%.hex,$(C_SRC)) $(patsubst %.c,%.aml,$(C_SRC)) $(patsubst %.c,%.asl,$(C_SRC))
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -32,7 +32,7 @@ ACPI_PATH  = $(XEN_ROOT)/tools/libacpi
>  DSDT_FILES-$(CONFIG_X86) = dsdt_pvh.c
>  ACPI_OBJS  = $(patsubst %.c,%.o,$(DSDT_FILES-y)) build.o static_tables.o
>  ACPI_PIC_OBJS = $(patsubst %.o,%.opic,$(ACPI_OBJS))
> -$(DSDT_FILES-y): acpi
> +$(DSDT_FILES-y) build.o: acpi
>  vpath build.c $(ACPI_PATH)/
>  vpath static_tables.c $(ACPI_PATH)/
>  
> 


