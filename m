Return-Path: <SRS0=J13s=EC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E227BC4363A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 10:16:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F9FD22264
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 10:16:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="f0iykRrB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F9FD22264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12740.33005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXM1P-0006mr-75; Tue, 27 Oct 2020 10:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12740.33005; Tue, 27 Oct 2020 10:16:07 +0000
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
	id 1kXM1P-0006mk-3h; Tue, 27 Oct 2020 10:16:07 +0000
Received: by outflank-mailman (input) for mailman id 12740;
 Tue, 27 Oct 2020 10:16:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXM1O-0006mf-7q
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:16:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 126356f5-4a59-4741-9e19-b6145b081e87;
 Tue, 27 Oct 2020 10:16:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90BEFAC3F;
 Tue, 27 Oct 2020 10:16:04 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXM1O-0006mf-7q
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:16:06 +0000
X-Inumbo-ID: 126356f5-4a59-4741-9e19-b6145b081e87
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 126356f5-4a59-4741-9e19-b6145b081e87;
	Tue, 27 Oct 2020 10:16:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603793764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uio1N1/bRRMGiCixJ50d+oeJQt91viHk8fB+jmT1j2A=;
	b=f0iykRrB50vPYNALhXVWYcbICEgM5Ged8dFO2K6snCSVLxB/L0+FvwxD3WrSLSFbtxps+m
	XolQ6U5YYh+T8r2wH34fH6/hRmbBhBvcpb0cl/MlzxS/InMK0yHlL9I56/gDP9ykWAcDXp
	/Hh6o9T0oPTGK3K2HEUEBUPNWNyfVfU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 90BEFAC3F;
	Tue, 27 Oct 2020 10:16:04 +0000 (UTC)
Subject: Re: [PATCH v1] libacpi: use temporary files for generated files
To: Olaf Hering <olaf@aepfle.de>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201026204151.23459-1-olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68312718-c8ad-040b-be45-192d2c91ba8f@suse.com>
Date: Tue, 27 Oct 2020 11:16:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026204151.23459-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 21:41, Olaf Hering wrote:
> Use a temporay file, and move it in place once done.
> The same pattern exists already for other dependencies.

This pattern is used when a rule consists of multiple commands
having their output appended to one another's. This isn't the
case here, so I'm afraid I'd like it to be made more obvious
what the gain / improvement is. That is - I don't mind the
change, if indeed it is for a good reason.

Jan

> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  tools/libacpi/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libacpi/Makefile b/tools/libacpi/Makefile
> index c17f3924cc..2cc4cc585b 100644
> --- a/tools/libacpi/Makefile
> +++ b/tools/libacpi/Makefile
> @@ -43,7 +43,8 @@ all: $(C_SRC) $(H_SRC)
>  
>  $(H_SRC): $(ACPI_BUILD_DIR)/%.h: %.asl iasl
>  	iasl -vs -p $(ACPI_BUILD_DIR)/$*.$(TMP_SUFFIX) -tc $<
> -	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex >$@
> +	sed -e 's/AmlCode/$*/g' -e 's/_aml_code//g' $(ACPI_BUILD_DIR)/$*.hex >$@.$(TMP_SUFFIX)
> +	mv -f $@.$(TMP_SUFFIX) $@
>  	rm -f $(addprefix $(ACPI_BUILD_DIR)/, $*.aml $*.hex)
>   
>  $(MK_DSDT): mk_dsdt.c
> 


