Return-Path: <SRS0=QSaH=BO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17355C433DF
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 14:03:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54652086A
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 14:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="JT3do+Hr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54652086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2xWH-0002gS-T9; Tue, 04 Aug 2020 14:02:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KvlI=BO=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k2xWG-0002gN-Bn
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 14:02:20 +0000
X-Inumbo-ID: 700f1ab7-786a-4b27-b03b-99a20e3dfb7c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 700f1ab7-786a-4b27-b03b-99a20e3dfb7c;
 Tue, 04 Aug 2020 14:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0xm34ZhZtkbjneIiksswdOIJjA+6W/un6UZlSsYeumU=; b=JT3do+Hri4H5cQNf7WCPxIcj9R
 +WN9eDi+alRjVABzYukw0nZEIVVYItwh6zkY6Et6EmBykTI2kQ1YX9Sd0cfaIzvyvwGcvSDuMoDhV
 MD0dAUIQSVBv6wUhr+fTbJNTNlwtQKQrEp1sxX47DfbmorBG3Ze+ueyjNfzyi9YYuPRA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k2xVw-0000C7-Qr; Tue, 04 Aug 2020 14:02:00 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k2xVw-0004ro-Fr; Tue, 04 Aug 2020 14:02:00 +0000
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: paul@xen.org, 'Oleksandr Tyshchenko' <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <001101d66a33$bba44670$32ecd350$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <6c4f7698-a015-91c7-83ec-203f63d48900@xen.org>
Date: Tue, 4 Aug 2020 15:01:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <001101d66a33$bba44670$32ecd350$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 04/08/2020 08:49, Paul Durrant wrote:
>> diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xc_dom_arm.c
>> index 931404c..b5fc066 100644
>> --- a/tools/libxc/xc_dom_arm.c
>> +++ b/tools/libxc/xc_dom_arm.c
>> @@ -26,11 +26,19 @@
>>   #include "xg_private.h"
>>   #include "xc_dom.h"
>>
>> -#define NR_MAGIC_PAGES 4
>> +
>>   #define CONSOLE_PFN_OFFSET 0
>>   #define XENSTORE_PFN_OFFSET 1
>>   #define MEMACCESS_PFN_OFFSET 2
>>   #define VUART_PFN_OFFSET 3
>> +#define IOREQ_SERVER_PFN_OFFSET 4
>> +
>> +#define NR_IOREQ_SERVER_PAGES 8
>> +#define NR_MAGIC_PAGES (4 + NR_IOREQ_SERVER_PAGES)
>> +
>> +#define GUEST_MAGIC_BASE_PFN (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT)
>> +
>> +#define special_pfn(x)  (GUEST_MAGIC_BASE_PFN + (x))
> 
> Why introduce 'magic pages' for Arm? It's quite a horrible hack that we have begun to do away with by adding resource mapping.

This would require us to mandate at least Linux 4.17 in a domain that 
will run an IOREQ server. If we don't mandate this, the minimum version 
would be 4.10 where DM OP was introduced.

Because of XSA-300, we could technically not safely run an IOREQ server 
with existing Linux. So it is probably OK to enforce the use of the 
acquire interface.

Note that I haven't yet looked at the rest of the series. So I am not 
sure if there is more work necessary to enable it.

Cheers,

-- 
Julien Grall

