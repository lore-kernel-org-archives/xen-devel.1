Return-Path: <SRS0=J13s=EC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3995C4363A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 10:38:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D72A20829
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2020 10:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="NcaMyDlg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D72A20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12766.33076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXMMi-0000lA-E2; Tue, 27 Oct 2020 10:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12766.33076; Tue, 27 Oct 2020 10:38:08 +0000
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
	id 1kXMMi-0000l3-Aq; Tue, 27 Oct 2020 10:38:08 +0000
Received: by outflank-mailman (input) for mailman id 12766;
 Tue, 27 Oct 2020 10:38:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXMMh-0000kx-6x
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:38:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3352c78-5fcf-459e-92e2-de3a83449ef1;
 Tue, 27 Oct 2020 10:38:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91D3FACBA;
 Tue, 27 Oct 2020 10:38:04 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aH5n=EC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXMMh-0000kx-6x
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 10:38:07 +0000
X-Inumbo-ID: f3352c78-5fcf-459e-92e2-de3a83449ef1
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f3352c78-5fcf-459e-92e2-de3a83449ef1;
	Tue, 27 Oct 2020 10:38:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603795084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=So6bAdwK3hurOT3c3zOnY3wChVhg335l5tUGEor9+ag=;
	b=NcaMyDlgZbSM3XtWgwn7qqUx1ThnCpF9B1ecr+hIZSAZnvRdbpUFrg1nMDgJk0datdw9mt
	+xOc8cXpVn+i2bSOd76O7oyu4Vp1a+kXScse9kmS/GaazRfQxvkZR+o9wnmu+nHeEVXmSR
	bkUZj4X0dh6+5Ru5rtQLQ0gSZiJnaXQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 91D3FACBA;
	Tue, 27 Oct 2020 10:38:04 +0000 (UTC)
Subject: Re: flawed Makefile dependencies in libacpi
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20201027104548.5823c554.olaf@aepfle.de>
 <d6e3a7b0-129e-9b47-8802-b71eb8642519@suse.com>
 <da99d577-ce8d-8fcf-c157-5b91ee895097@suse.com>
 <20201027113024.36948380.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0729e4ae-c513-9a1e-ab02-cf051cee6845@suse.com>
Date: Tue, 27 Oct 2020 11:38:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201027113024.36948380.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.10.2020 11:30, Olaf Hering wrote:
> Am Tue, 27 Oct 2020 11:25:17 +0100
> schrieb Jan Beulich <jbeulich@suse.com>:
> 
>> In this context it then is relevant in which context you see the failure - firmware/hvmloader/ or libs/light/ ?
> 
> I do not have the log anymore to check this detail.

From looking at both makefiles, it's only libxl which is affected.
I guess I'll make a patch then.

Jan

