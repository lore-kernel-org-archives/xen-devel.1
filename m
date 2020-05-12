Return-Path: <SRS0=FkqA=62=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EE7C54E4B
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 04:24:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA5BD20730
	for <xen-devel@archiver.kernel.org>; Tue, 12 May 2020 04:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA5BD20730
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYMSu-0007o9-9P; Tue, 12 May 2020 04:24:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pTU5=62=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jYMSt-0007o4-85
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 04:24:23 +0000
X-Inumbo-ID: 7400ccfe-9408-11ea-a275-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7400ccfe-9408-11ea-a275-12813bfff9fa;
 Tue, 12 May 2020 04:24:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A3E99AEDF;
 Tue, 12 May 2020 04:24:23 +0000 (UTC)
Subject: Re: [PATCH] xen/pvcalls-back: test for errors when calling
 backend_connect()
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200511074231.19794-1-jgross@suse.com>
 <alpine.DEB.2.21.2005111440210.26167@sstabellini-ThinkPad-T480s>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <17512c98-b309-7b83-8c9c-cc8d43a495a2@suse.com>
Date: Tue, 12 May 2020 06:24:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005111440210.26167@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.20 23:41, Stefano Stabellini wrote:
> On Mon, 11 May 2020, Juergen Gross wrote:
>> backend_connect() can fail, so switch the device to connected only if
>> no error occurred.
>>
>> Fixes: 0a9c75c2c7258f2 ("xen/pvcalls: xenbus state handling")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
>> ---
>>   drivers/xen/pvcalls-back.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
>> index cf4ce3e9358d..41a18ece029a 100644
>> --- a/drivers/xen/pvcalls-back.c
>> +++ b/drivers/xen/pvcalls-back.c
>> @@ -1088,7 +1088,8 @@ static void set_backend_state(struct xenbus_device *dev,
>>   		case XenbusStateInitialised:
>>   			switch (state) {
>>   			case XenbusStateConnected:
>> -				backend_connect(dev);
>> +				if (backend_connect(dev))
>> +					return;
> 
> Do you think it would make sense to WARN?

There already should be an error message (either due to a failed
grant mapping or a failed memory allocation).


Juergen

