Return-Path: <SRS0=QRFW=DN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E86C41604
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2020 08:19:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D777208FE
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2020 08:19:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="XAq0wptW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D777208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.3140.9049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPiCF-0004VH-Vv; Tue, 06 Oct 2020 08:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3140.9049; Tue, 06 Oct 2020 08:19:43 +0000
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
	id 1kPiCF-0004VA-SA; Tue, 06 Oct 2020 08:19:43 +0000
Received: by outflank-mailman (input) for mailman id 3140;
 Tue, 06 Oct 2020 08:19:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PqFe=DN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kPiCE-0004V5-7K
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 08:19:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c760beb-24d7-47b9-95d4-a2bfc67b1aff;
 Tue, 06 Oct 2020 08:19:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99231ACC8;
 Tue,  6 Oct 2020 08:19:40 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PqFe=DN=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kPiCE-0004V5-7K
	for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 08:19:42 +0000
X-Inumbo-ID: 3c760beb-24d7-47b9-95d4-a2bfc67b1aff
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3c760beb-24d7-47b9-95d4-a2bfc67b1aff;
	Tue, 06 Oct 2020 08:19:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601972380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbIVLc8eRnlTgQmnFKJDsn72Hr2mQI7x9coSJaceAVc=;
	b=XAq0wptWsCEmmuBIwv9sCsACyOznIWYk01TY0ApjF5kh7ybpmZEo5rArFzQBHpFGiE24VH
	TVA3/iKscokPT8ADmCKFRRczFU+a9TEcwq6xCQf1dEbQvZZI4ryCNQbUvrRkInASJ8P+HZ
	eOX6q9RcEk8y5+HJbHpIzh+hDFIXgs4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 99231ACC8;
	Tue,  6 Oct 2020 08:19:40 +0000 (UTC)
Subject: Re: [PATCH 1/2] tools: use memcpy instead of strncpy in getBridge
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1601913536.git.bertrand.marquis@arm.com>
 <3de58159c6fde0cdfa4d0f292fa55fdb931cb3aa.1601913536.git.bertrand.marquis@arm.com>
 <95b2a6f9-e063-8276-db62-ddaac06f4b7b@suse.com>
 <F313E5EA-DF1A-4AC2-885B-75FD1B1D8211@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <58c4b793-e093-ca49-a6a1-1a5073013831@suse.com>
Date: Tue, 6 Oct 2020 10:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <F313E5EA-DF1A-4AC2-885B-75FD1B1D8211@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06.10.20 09:51, Bertrand Marquis wrote:
> 
> 
>> On 6 Oct 2020, at 05:34, Jürgen Groß <jgross@suse.com> wrote:
>>
>> On 05.10.20 18:02, Bertrand Marquis wrote:
>>> Use memcpy in getBridge to prevent gcc warnings about truncated
>>> strings. We know that we might truncate it, so the gcc warning
>>> here is wrong.
>>> Revert previous change changing buffer sizes as bigger buffers
>>> are not needed.
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>>   tools/libs/stat/xenstat_linux.c | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>> diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
>>> index d2ee6fda64..1db35c604c 100644
>>> --- a/tools/libs/stat/xenstat_linux.c
>>> +++ b/tools/libs/stat/xenstat_linux.c
>>> @@ -78,7 +78,12 @@ static void getBridge(char *excludeName, char *result, size_t resultLen)
>>>   				sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
>>>     				if (access(tmp, F_OK) == 0) {
>>> -					strncpy(result, de->d_name, resultLen);
>>> +					/*
>>> +					 * Do not use strncpy to prevent compiler warning with
>>> +					 * gcc >= 10.0
>>> +					 * If de->d_name is longer then resultLen we truncate it
>>> +					 */
>>> +					memcpy(result, de->d_name, resultLen - 1);
>>
>> I think you want min(NAME_MAX, resultLen - 1) for the length.
> 
> true, I will fix that and send a v2.

Hmm, maybe you should use

min(strnlen(de->d_name, NAME_MAX), resultLen - 1)

for the case that de->d_name is near the end of a page, as otherwise
you could try to copy unallocated space.


Juergen

