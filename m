Return-Path: <SRS0=VkMt=LS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23753C48BDF
	for <xen-devel@archiver.kernel.org>; Thu, 24 Jun 2021 10:28:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB74613FD
	for <xen-devel@archiver.kernel.org>; Thu, 24 Jun 2021 10:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB74613FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.146614.269858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwMb1-0006Vl-8f; Thu, 24 Jun 2021 10:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146614.269858; Thu, 24 Jun 2021 10:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwMb1-0006Ve-5g; Thu, 24 Jun 2021 10:28:31 +0000
Received: by outflank-mailman (input) for mailman id 146614;
 Thu, 24 Jun 2021 10:28:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwMaz-0006Ub-GC
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 10:28:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwMax-00068P-9B; Thu, 24 Jun 2021 10:28:27 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwMax-0006jm-1B; Thu, 24 Jun 2021 10:28:27 +0000
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
	bh=eGnAXvie1t0y8LYszeIBp26woJ1w2LQ5PuA7OhLh51c=; b=hi1jb4MeNm3TA//f26P+nnlgKW
	gRUAK6A7iu9ZRJpkgwsZe0UP2K9XqWuNPbTcwtJfPx9rGpezqXsOULgE91NZ0WUlLctjHcV5RyBHU
	OuaP8SS7nwRf/yfREgSw751ihOYyboGHg2Naoc4Y3N6TIwxD+iFpps9aZNxIFTUQluA0=;
Subject: Re: [PATCH 09/10] tools/xenstored: Dump delayed requests
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-10-julien@xen.org>
 <5b6455f3-9b44-2cf3-e53d-1f235977a4e2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d42131c2-ae2d-883b-037d-2ab6370678c3@xen.org>
Date: Thu, 24 Jun 2021 12:28:24 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5b6455f3-9b44-2cf3-e53d-1f235977a4e2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 24/06/2021 10:41, Juergen Gross wrote:
> On 16.06.21 16:43, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, only Live-Update request can be delayed. In a follow-up,
>> we will want to delay more requests (e.g. transaction start).
>> Therefore we want to preserve delayed requests across Live-Update.
>>
>> Delayed requests are just complete "in" buffer. So the code is
>> refactored to allow sharing the code to dump "in" buffer.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   tools/xenstore/xenstored_core.c | 42 +++++++++++++++++++++++++--------
>>   1 file changed, 32 insertions(+), 10 deletions(-)
>>
>> diff --git a/tools/xenstore/xenstored_core.c 
>> b/tools/xenstore/xenstored_core.c
>> index 5b7ab7f74013..9eca58682b51 100644
>> --- a/tools/xenstore/xenstored_core.c
>> +++ b/tools/xenstore/xenstored_core.c
>> @@ -2403,25 +2403,47 @@ const char *dump_state_global(FILE *fp)
>>       return NULL;
>>   }
>> +static const char *dump_input_buffered_data(FILE *fp,
>> +                        const struct buffered_data *in,
>> +                        unsigned int *total_len)
>> +{
>> +    unsigned int hlen = in->inhdr ? in->used : sizeof(in->hdr);
>> +
>> +    *total_len += hlen;
>> +    if (fp && fwrite(&in->hdr, hlen, 1, fp) != 1)
>> +        return "Dump read data error";
>> +    if (!in->inhdr && in->used) {
>> +        *total_len += in->used;
>> +        if (fp && fwrite(in->buffer, in->used, 1, fp) != 1)
>> +            return "Dump read data error";
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>>   /* Called twice: first with fp == NULL to get length, then for 
>> writing data. */
>>   const char *dump_state_buffered_data(FILE *fp, const struct 
>> connection *c,
>>                        struct xs_state_connection *sc)
>>   {
>>       unsigned int len = 0, used;
>> -    struct buffered_data *out, *in = c->in;
>> +    struct buffered_data *out;
>>       bool partial = true;
>> +    struct delayed_request *req;
>> +    const char *ret;
>> -    if (in) {
>> -        len = in->inhdr ? in->used : sizeof(in->hdr);
>> -        if (fp && fwrite(&in->hdr, len, 1, fp) != 1)
>> -            return "Dump read data error";
>> -        if (!in->inhdr && in->used) {
>> -            len += in->used;
>> -            if (fp && fwrite(in->buffer, in->used, 1, fp) != 1)
>> -                return "Dump read data error";
>> -        }
>> +    /* Dump any command that was delayed */
>> +    list_for_each_entry(req, &c->delayed, list) {
> 
> Please add a comment here that the following if() serves especially to
> avoid dumping the data for do_lu_start().

Would you be happy to give your acked-by/reviewed-by if I add the 
following on commit?

"
We only want to preserve commands that wasn't processed at all. All the 
other delayed requests (such as do_lu_start()) must be processed before 
Live-Update.
"

> 
>> +        if (req->func != process_delayed_message)
>> +            continue;
>> +
>> +        assert(!req->in->inhdr);
>> +        if ((ret = dump_input_buffered_data(fp, req->in, &len)))
>> +            return ret;
>>       }
>> +    if (c->in && (ret = dump_input_buffered_data(fp, c->in, &len)))
>> +        return ret;
>> +
>>       if (sc) {
>>           sc->data_in_len = len;
>>           sc->data_resp_len = 0;
>>
> 
> Juergen

Cheers,

-- 
Julien Grall

