Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9E3C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 13:18:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C6D72225E
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 13:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C6D72225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61185.107420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPkO-0008FF-N0; Mon, 04 Jan 2021 13:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61185.107420; Mon, 04 Jan 2021 13:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPkO-0008F8-JX; Mon, 04 Jan 2021 13:18:08 +0000
Received: by outflank-mailman (input) for mailman id 61185;
 Mon, 04 Jan 2021 13:18:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwPkN-0008F0-Da
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 13:18:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af059f50-a705-4468-ba94-69c394d2347b;
 Mon, 04 Jan 2021 13:18:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F68BAD19;
 Mon,  4 Jan 2021 13:18:05 +0000 (UTC)
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
X-Inumbo-ID: af059f50-a705-4468-ba94-69c394d2347b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609766285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57uqYdOJU1q+8Lu0nfjORdcwcwW0KrevGZ+XMHSBRoA=;
	b=tZ7UC8uaQNhXqLFYtfC/FxMe6tb3kIIGybtLQcSvleQC7ByFFfJWqQ1W0DnNURYmgV0O23
	GCnx/SiplOtuedy9tkXUui0DIqgueN8fokc+9mcoEZc0N2rNYbo1Xnih/bUkBNuFeLYsFd
	OysgdbB16Pckp9mjJeKq8w7klLnmBNI=
Subject: Re: [PATCH 1/4] x86/ACPI: fix mapping of FACS
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
 <81a8c2f0-ae9b-98e0-f5c5-d32b423db491@suse.com>
 <20201229105646.fjeq364wcfstff4a@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2ba702c-bd3b-6fab-4af6-86f20b3d55d7@suse.com>
Date: Mon, 4 Jan 2021 14:18:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201229105646.fjeq364wcfstff4a@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.12.2020 11:56, Roger Pau Monné wrote:
> On Mon, Nov 23, 2020 at 01:39:55PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/acpi/boot.c
>> +++ b/xen/arch/x86/acpi/boot.c
>> @@ -422,8 +422,7 @@ acpi_fadt_parse_sleep_info(struct acpi_t
>>  	if (!facs_pa)
>>  		goto bad;
>>  
>> -	facs = (struct acpi_table_facs *)
>> -		__acpi_map_table(facs_pa, sizeof(struct acpi_table_facs));
>> +	facs = acpi_os_map_memory(facs_pa, sizeof(*facs));
>>  	if (!facs)
>>  		goto bad;
>>  
>> @@ -448,11 +447,16 @@ acpi_fadt_parse_sleep_info(struct acpi_t
>>  		offsetof(struct acpi_table_facs, firmware_waking_vector);
>>  	acpi_sinfo.vector_width = 32;
>>  
>> +	acpi_os_unmap_memory(facs, sizeof(*facs));
> 
> Nit: looking at this again, I think you could move the
> acpi_os_unmap_memory further up, just after the last usage of facs
> (ie: before setting the wakeup_vector field).

Indeed I had it this way first, but then realized placing it here
results in less code churn in patch 4 of this series.

Jan

