Return-Path: <SRS0=zvGf=KJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8B0C433B4
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 16:34:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08C4861457
	for <xen-devel@archiver.kernel.org>; Fri, 14 May 2021 16:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08C4861457
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.127433.239526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhal9-0002Xx-Tr; Fri, 14 May 2021 16:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127433.239526; Fri, 14 May 2021 16:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhal9-0002Xq-Qr; Fri, 14 May 2021 16:33:55 +0000
Received: by outflank-mailman (input) for mailman id 127433;
 Fri, 14 May 2021 16:33:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhal8-0002Xk-V1
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 16:33:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhal7-0004ox-RB; Fri, 14 May 2021 16:33:53 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhal7-0003Og-LF; Fri, 14 May 2021 16:33:53 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=DCXhxaY0lIxT0yFC9K4BXwQrMISl65/MMj4Y8q1Zg1U=; b=MAfybQN/RmUtrXaz27KmVbToeK
	g6UmqjAQZfEYoG/6uPbJAJULrmcs1GGOHuCtpAaYe0YtIU4YUOi3fdp3nL+MxLzNSr9dWD4YNnv+i
	q0Ebo2ovCXUvBljzlAfafo/gxmdyW4SN0Q5zSd66L+xHHsbJ2GsnFrTdQHscyNI8q330=;
Subject: Re: [PATCH v2 1/2] tools/xenstore: move per connection read and write
 func hooks into a struct
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210514115620.32731-1-jgross@suse.com>
 <20210514115620.32731-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7cdd7f43-3f3f-12e4-abf9-0e4d698a85b1@xen.org>
Date: Fri, 14 May 2021 17:33:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514115620.32731-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/05/2021 12:56, Juergen Gross wrote:
> -struct connection *new_connection(connwritefn_t *write, connreadfn_t *read);
> +struct connection *new_connection(const struct interface_funcs *funcs);
>   struct connection *get_connection_by_id(unsigned int conn_id);
>   void check_store(void);
>   void corrupt(struct connection *conn, const char *fmt, ...);
> @@ -254,10 +256,7 @@ void finish_daemonize(void);
>   /* Open a pipe for signal handling */
>   void init_pipe(int reopen_log_pipe[2]);
>   
> -int writefd(struct connection *conn, const void *data, unsigned int len);
> -int readfd(struct connection *conn, void *data, unsigned int len);
> -
> -extern struct interface_funcs socket_funcs;
> +extern const struct interface_funcs socket_funcs;
Shouldn't this be protected with #ifdef NO_SOCKETS?

The rest looks good to me:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

