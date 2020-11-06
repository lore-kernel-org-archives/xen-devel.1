Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC42C2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 08:50:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F060F208B3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 08:50:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="A6GClXKq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F060F208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20498.46414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaxSH-00056x-1E; Fri, 06 Nov 2020 08:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20498.46414; Fri, 06 Nov 2020 08:50:45 +0000
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
	id 1kaxSG-00056q-U1; Fri, 06 Nov 2020 08:50:44 +0000
Received: by outflank-mailman (input) for mailman id 20498;
 Fri, 06 Nov 2020 08:50:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaxSG-00056l-7P
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 08:50:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69d4a2d1-5ffc-452d-a942-5fcfb4a539b7;
 Fri, 06 Nov 2020 08:50:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9B729AB8F;
 Fri,  6 Nov 2020 08:50:42 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaxSG-00056l-7P
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 08:50:44 +0000
X-Inumbo-ID: 69d4a2d1-5ffc-452d-a942-5fcfb4a539b7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 69d4a2d1-5ffc-452d-a942-5fcfb4a539b7;
	Fri, 06 Nov 2020 08:50:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604652642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9oX95/HNDAsnsACCUA+gSWI27///UQmU0uf7P335ms=;
	b=A6GClXKqFCXB1jLSXiIt3iZrfQGPCTz0aMrkzORWLkNySVzcPkCREg7IOEXJLdMg2hQDfR
	IyLPquQe/c81ZYnBRmAmWlnJuMaQL4HqWSN222vAENuRGc9Ai27bcYOAkFYOVKl1Q71lBv
	nSNAnNpyEykPQEu7qmjC4AW0sPj6IRY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9B729AB8F;
	Fri,  6 Nov 2020 08:50:42 +0000 (UTC)
Subject: Re: preparations for 4.14.1
To: Julien Grall <julien@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5aa0791a-db56-8f5a-51a1-5863748ce7f1@suse.com>
 <6b67e93b-1dff-ff31-457d-400cf33cd4b6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f5aa1f3-fb63-bb38-bb96-497c47a1e920@suse.com>
Date: Fri, 6 Nov 2020 09:50:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6b67e93b-1dff-ff31-457d-400cf33cd4b6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.11.2020 09:45, Julien Grall wrote:
> On 04/11/2020 10:12, Jan Beulich wrote:
>> the release is due in a couple of weeks time. Please point out
>> backports you find missing from the respective staging branch,
>> but which you consider relevant. (Ian: Please double check
>> there are indeed no tools side backports needed here.)
> 
> Would it be possible to consider the backport mentioned [1]? For 
> convenience, this is:
> 
> d25cc3ec93eb "libxl: workaround gcc 10.2 maybe-uninitialized warning"
> 
> In addition, I would like to request a backport for:
> 
> fff1b7f50e75 "libxl: fix -Werror=stringop-truncation in
> libxl__prepare_sockaddr_un"
> 
> Both patches are necessary to get Xen building with newer GCC.

While I support the request, it really should have gone to Ian.
Ian - please consider.

Jan

