Return-Path: <SRS0=f2UP=HK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7C1C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 09:50:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F9E464E9A
	for <xen-devel@archiver.kernel.org>; Mon,  8 Feb 2021 09:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F9E464E9A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.82681.152684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93BP-0003Yn-9h; Mon, 08 Feb 2021 09:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82681.152684; Mon, 08 Feb 2021 09:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l93BP-0003Yg-6u; Mon, 08 Feb 2021 09:50:15 +0000
Received: by outflank-mailman (input) for mailman id 82681;
 Mon, 08 Feb 2021 09:50:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l93BO-0003Ya-0o
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 09:50:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acac2de7-8b8f-4e6b-941b-06af315ee6b9;
 Mon, 08 Feb 2021 09:50:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B27ACADCD;
 Mon,  8 Feb 2021 09:50:11 +0000 (UTC)
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
X-Inumbo-ID: acac2de7-8b8f-4e6b-941b-06af315ee6b9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612777811; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MoTBA6avz+A5L1BdaknRfGBP0w5pvSSOGiusH5vYDLg=;
	b=V8EHf/3iHEYlg8oCEopDrfPwpSnRJZHbotdl/3VZvjcRnKLAiYBfUuLlEn57q7d+GwKCf2
	p0sDGsDk2r/IdKR2od8UkH1+zySf2vCmmNW4gxaTekyswxXzjTANm6Fk2cqQFu+X2zbB6a
	tgZtprSKGTYZPMv0XiX2jib5gUKbkYE=
Subject: Re: [PATCH 6/7] xen/evtch: use smp barriers for user event ring
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-7-jgross@suse.com>
 <2d354cad-3413-a416-0bc1-01d03e1f41cd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dfa40af0-2706-2540-c59a-6593c1c0553a@suse.com>
Date: Mon, 8 Feb 2021 10:50:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2d354cad-3413-a416-0bc1-01d03e1f41cd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.02.2021 10:44, Andrew Cooper wrote:
> On 06/02/2021 10:49, Juergen Gross wrote:
>> The ring buffer for user events is used in the local system only, so
>> smp barriers are fine for ensuring consistency.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> These need to be virt_* to not break in UP builds (on non-x86).

Initially I though so, too, but isn't the sole vCPU of such a
VM getting re-scheduled to a different pCPU in the hypervisor
an implied barrier anyway?

Jan

