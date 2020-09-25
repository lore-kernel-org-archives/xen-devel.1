Return-Path: <SRS0=eoLF=DC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C099C4363D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2020 14:01:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8AB208A9
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2020 14:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Eqaqt8aP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA8AB208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLoHP-00031N-9n; Fri, 25 Sep 2020 14:00:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9v36=DC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLoHN-00031I-Ub
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 14:00:53 +0000
X-Inumbo-ID: 818d3961-aee8-4e1e-8cb8-4ed3e85cbea1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 818d3961-aee8-4e1e-8cb8-4ed3e85cbea1;
 Fri, 25 Sep 2020 14:00:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601042452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgydADyCw89aBbyJRs5VBaKQ6Mc9dhZddkJCrlc6Emw=;
 b=Eqaqt8aPxRLLuyUjanMNQGx2Gq+j9mNtvrFqaZLAfL/rLUZ0fdQXLNvnwHjPdksXkrqo9k
 7yZytCFPaAJ5GcrGRgoW0ri2SFC2378A2kszoZJ/oV1j1fM8zLTsA5DASeSvLV8GyVi9lG
 P26u06zjylzRjM58GLkcfhybZMIIxmw=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6CD4FAF49;
 Fri, 25 Sep 2020 14:00:52 +0000 (UTC)
Subject: Re: [PATCH] x86/xen: disable Firmware First mode for correctable
 memory errors
To: boris.ostrovsky@oracle.com, Juergen Gross <jgross@suse.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 stable@vger.kernel.org
References: <20200925101148.21012-1-jgross@suse.com>
 <171970df-5f6e-5a2b-e784-e62d300a005b@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c017f364-e34c-092c-18ca-0ab9a2d75f59@suse.com>
Date: Fri, 25 Sep 2020 16:00:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <171970df-5f6e-5a2b-e784-e62d300a005b@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.09.2020 15:45, boris.ostrovsky@oracle.com wrote:
> On 9/25/20 6:11 AM, Juergen Gross wrote:
>> @@ -1296,6 +1296,14 @@ asmlinkage __visible void __init xen_start_kernel(void)
>>  
>>  	xen_smp_init();
>>  
>> +#ifdef CONFIG_ACPI
>> +	/*
>> +	 * Disable selecting "Firmware First mode" for correctable memory
>> +	 * errors, as this is the duty of the hypervisor to decide.
>> +	 */
>> +	acpi_disable_cmcff = 1;
>> +#endif
> 
> 
> Not that it matters greatly but should this go under if (xen_initial_domain())
> clause a bit further down?

Yes - DomU-s are supposed to be in charge of their (virtual) firmware,
no matter that right now APEI for guests is completely out of sight as
far as I'm aware.

Jan

