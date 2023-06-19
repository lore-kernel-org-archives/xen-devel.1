Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C6BEB64D9
	for <xen-devel@archiver.kernel.org>; Mon, 19 Jun 2023 17:55:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.551299.860770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBJ5t-0005GC-VV; Mon, 19 Jun 2023 17:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551299.860770; Mon, 19 Jun 2023 17:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBJ5t-0005G5-SV; Mon, 19 Jun 2023 17:55:13 +0000
Received: by outflank-mailman (input) for mailman id 551299;
 Mon, 19 Jun 2023 17:55:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBJ5t-0005Fz-0q
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 17:55:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBJ5r-0003s3-GA; Mon, 19 Jun 2023 17:55:11 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.19.123]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBJ5r-0000sq-Aa; Mon, 19 Jun 2023 17:55:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=mZZ6hhZkb6HxvUXR9AvhRkraE0p1HVSiyZ7+eC5cc6E=; b=eRI9y+TVJ2PjaEbjag389b3Jc6
	nyYGCXw4xI2MBtonbzOpAJpKWjV1SbPtcNG8J5BSnsfYbDfN1OCjrwVoMDYpCDCLLHJNLLFeFa0w0
	xX0U0yc+DcBqzIOCyzFz7NwlPlSAoo5w5tpQod/5yfhwDQv/064ULzAoLpAIRaHPyAGs=;
Message-ID: <94daf68e-f623-acf0-5139-fdcb736a367e@xen.org>
Date: Mon, 19 Jun 2023 18:55:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 14/16] tools/xenstore: split out environment specific
 live update code
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-15-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530085418.5417-15-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:54, Juergen Gross wrote:
> -static struct live_update *lu_status;
> -
> -struct lu_dump_state {
> -	void *buf;
> -	unsigned int size;
> -#ifndef __MINIOS__
> -	int fd;
> -	char *filename;
> -#endif
> -};
> -
> -static int lu_destroy(void *data)
> -{
> -#ifdef __MINIOS__
> -	if (lu_status->dump_state)
> -		munmap(lu_status->dump_state, lu_status->dump_size);
> -#endif
> -	lu_status = NULL;
> -
> -	return 0;
> -}

I think moving all lu_destroy() out of xenstored_control.c is a mistake 
because we now need to remember that any common change in lu_begin() may 
need an update in the two implementation of lu_destroy().

Even if this seems pointless for a few lines, it would be best to split 
lu_destroy() in two parts: one common and one per lu backend.

The rest of the changes look good to me.

Cheers,

-- 
Julien Grall

