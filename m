Return-Path: <SRS0=Vf37=J7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF383C433ED
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 11:49:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C5C60FEA
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 11:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57C5C60FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.122148.230367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtXo-00071D-Qw; Tue, 04 May 2021 11:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122148.230367; Tue, 04 May 2021 11:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtXo-000716-My; Tue, 04 May 2021 11:48:52 +0000
Received: by outflank-mailman (input) for mailman id 122148;
 Tue, 04 May 2021 11:48:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldtXn-000711-9R
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 11:48:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 451d6ac6-91b6-4985-8579-eed8b1a69fa6;
 Tue, 04 May 2021 11:48:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4ADB5B1AB;
 Tue,  4 May 2021 11:48:49 +0000 (UTC)
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
X-Inumbo-ID: 451d6ac6-91b6-4985-8579-eed8b1a69fa6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620128929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cWwn9iWhot3yHq5n08aa+U0hOkGHwH+wkF4UOgeBK4=;
	b=UPJ53o2sbXeExC8IY+3+cSWCwTxZ6c0OvTV+AxhNVBXF3CACwNfO9QSjhfUwidbooXdZBQ
	LoSaKlq1USHhMFbq6aSwakX0Pn4n/TzBOycG/JnOhOlmT8AD+dqaKeOFl8HOWT+BBMuFcK
	nanlnAB6U7Z3sB6dTtaaPeD9jckERlk=
Subject: Re: [PATCH v4 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210504094606.7125-1-luca.fancellu@arm.com>
 <20210504094606.7125-4-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37e5b461-40fe-ac78-59b9-033ff8cdc6d1@suse.com>
Date: Tue, 4 May 2021 13:48:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504094606.7125-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.05.2021 11:46, Luca Fancellu wrote:
> @@ -451,11 +466,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>   * bytes to be copied.
>   */
>  
> -#define _GNTCOPY_source_gref      (0)
> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
> -#define _GNTCOPY_dest_gref        (1)
> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
> -
>  struct gnttab_copy {
>      /* IN parameters. */
>      struct gnttab_copy_ptr {
> @@ -471,6 +481,12 @@ struct gnttab_copy {
>      /* OUT parameters. */
>      int16_t       status;
>  };
> +
> +#define _GNTCOPY_source_gref      (0)
> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
> +#define _GNTCOPY_dest_gref        (1)
> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)

Didn't you say you agree with moving this back up some, next to the
field using these?

Jan

