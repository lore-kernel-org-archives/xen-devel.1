Return-Path: <SRS0=7M4+=KK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D003C433ED
	for <xen-devel@archiver.kernel.org>; Sat, 15 May 2021 11:52:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA82D613B5
	for <xen-devel@archiver.kernel.org>; Sat, 15 May 2021 11:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA82D613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.127728.240062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhspW-0002g3-Kz; Sat, 15 May 2021 11:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127728.240062; Sat, 15 May 2021 11:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhspW-0002fw-Gy; Sat, 15 May 2021 11:51:38 +0000
Received: by outflank-mailman (input) for mailman id 127728;
 Sat, 15 May 2021 11:51:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhspV-0002fq-Q3
 for xen-devel@lists.xenproject.org; Sat, 15 May 2021 11:51:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhspU-0006Kd-II; Sat, 15 May 2021 11:51:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhspU-0000uc-Bq; Sat, 15 May 2021 11:51:36 +0000
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
	bh=Wpju7DBlbS1T4x153hwpUWrnAHoqUjoofi9gJKTKU7A=; b=Q/SNTjg4zFfBEvgQem+IlZSkHA
	ww9ikLnxMEH3XaMQKNkXvrEmfH2CNWEpjKtyoVATP5Ud7w+CeVvSr3ENK+QZuJik/LR5UDTLUhpSx
	UeOLJAdI9VN/Eig6BUCDY8eTsatxQVS2RSDteZxP6KoLL0KYaGzCma6TlBRHSK3TI4tc=;
Subject: Re: [PATCH] tools/xenstore: simplify xenstored main loop
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210514083905.18212-1-jgross@suse.com>
 <304944cf-ac92-be14-e088-1975ef073255@xen.org>
 <3be1937f-3cd9-3eb8-48fd-bc9c9a85c051@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5744a347-282c-ff61-7507-03b7a1e9d4c9@xen.org>
Date: Sat, 15 May 2021 12:51:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3be1937f-3cd9-3eb8-48fd-bc9c9a85c051@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 14/05/2021 10:42, Juergen Gross wrote:
> On 14.05.21 11:35, Julien Grall wrote:
>>> -struct connection *new_connection(connwritefn_t *write, connreadfn_t 
>>> *read);
>>> +struct connection *new_connection(struct interface_funcs *funcs);
>>>   struct connection *get_connection_by_id(unsigned int conn_id);
>>>   void check_store(void);
>>>   void corrupt(struct connection *conn, const char *fmt, ...);
>>> @@ -254,9 +258,6 @@ void finish_daemonize(void);
>>>   /* Open a pipe for signal handling */
>>>   void init_pipe(int reopen_log_pipe[2]);
>>> -int writefd(struct connection *conn, const void *data, unsigned int 
>>> len);
>>> -int readfd(struct connection *conn, void *data, unsigned int len);
>>> -
>>>   extern struct interface_funcs socket_funcs;
>>
>> Hmmm... I guess this change splipped in the staging before hand?
> 
> No, I just forgot to make the functions static.

Hmmm... I am not sure how this is related to my question. What I meant 
it the line "extern struct interface_funcs ..." doesn't have a '+' in front.

If you look at the history, this was added by mistake in:

commit 2ea411bc2c0a5a4c7ab145270f1949630460e72b
Author: Juergen Gross <jgross@suse.com>
Date:   Wed Jan 13 14:00:20 2021 +0100

     tools/xenstore: add read connection state for live update

     Add the needed functions for reading connection state for live update.

     As the connection is identified by a unique connection id in the state
     records we need to add this to struct connection. Add a new function
     to return the connection based on a connection id.

     Signed-off-by: Juergen Gross <jgross@suse.com>
     Reviewed-by: Julien Grall <jgrall@amazon.com>
     Acked-by: Wei Liu <wl@xen.org>

> 
> 
> Juergen

-- 
Julien Grall

