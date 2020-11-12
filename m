Return-Path: <SRS0=Jwwc=ES=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F5FC2D0A3
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 08:38:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 749CA221FE
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2020 08:38:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="OAJie9wq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 749CA221FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.25545.53362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kd87A-0008N2-HW; Thu, 12 Nov 2020 08:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25545.53362; Thu, 12 Nov 2020 08:37:56 +0000
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
	id 1kd87A-0008Mv-EV; Thu, 12 Nov 2020 08:37:56 +0000
Received: by outflank-mailman (input) for mailman id 25545;
 Thu, 12 Nov 2020 08:37:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kd879-0008Mq-BS
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:37:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f739ebd6-2c27-44d8-9f3f-ede26ee4e126;
 Thu, 12 Nov 2020 08:37:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8ABD5AE49;
 Thu, 12 Nov 2020 08:37:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kd879-0008Mq-BS
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 08:37:55 +0000
X-Inumbo-ID: f739ebd6-2c27-44d8-9f3f-ede26ee4e126
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f739ebd6-2c27-44d8-9f3f-ede26ee4e126;
	Thu, 12 Nov 2020 08:37:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605170273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKtBw0yrqCVPrbGQ5riNB4AdQHefK1Z3wzKKVyz7SEY=;
	b=OAJie9wqKmWRzmP9One/YxJWpWmp1Y+NWz5psVvjIjXZlijrz8t/hh2s+ItJAetvKwMBnc
	bOh0P3qAMJFOxXKj1HxftCfCvJ8dXIJhZx7NtZiVboJj8f+vcYWlbEfknOPpHZC0/jKuiv
	NX5r9PSrBpx+FHLN8GsiHOlXE46cT7k=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8ABD5AE49;
	Thu, 12 Nov 2020 08:37:53 +0000 (UTC)
Subject: Re: [PATCH 02/10] viridian: move IPI hypercall implementation into
 separate function
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201111200721.30551-1-paul@xen.org>
 <20201111200721.30551-3-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37655f80-2f72-5069-6de4-0b2c8dce47bf@suse.com>
Date: Thu, 12 Nov 2020 09:37:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201111200721.30551-3-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.11.2020 21:07, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch moves the implementation of HVCALL_SEND_IPI that is currently
> inline in viridian_hypercall() into a new hvcall_ipi() function.
> 
> The new function returns Xen errno values similarly to hvcall_flush(). Hence
> the errno translation code in viridial_hypercall() is generalized, removing
> the need for the local 'status' variable.
> 
> NOTE: The formatting of the 'out' label also corrected as per CODING_STYLE

How about correcting the adjacent switch() at the same time as well?

>       and the code is adjusted to avoid a register copy-back if 'mode' is
>       neither 8 nor 4.

While you mention it here, isn't this an unrelated change wanting
its own justification?

Jan

