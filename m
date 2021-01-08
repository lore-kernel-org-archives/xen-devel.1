Return-Path: <SRS0=/Lw+=GL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C95C433DB
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 11:27:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD915238EF
	for <xen-devel@archiver.kernel.org>; Fri,  8 Jan 2021 11:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD915238EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.63346.112466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxpvH-0001XX-6Y; Fri, 08 Jan 2021 11:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63346.112466; Fri, 08 Jan 2021 11:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxpvH-0001XQ-1e; Fri, 08 Jan 2021 11:27:15 +0000
Received: by outflank-mailman (input) for mailman id 63346;
 Fri, 08 Jan 2021 11:27:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BSv=GL=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kxpvF-0001XL-G1
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 11:27:13 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b3f87f7-a936-4bed-8751-0910e310a58e;
 Fri, 08 Jan 2021 11:27:12 +0000 (UTC)
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
X-Inumbo-ID: 3b3f87f7-a936-4bed-8751-0910e310a58e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610105231;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=bgbkvyTdi/dk9B0Gzau0yTML8jm3wFwGRaLW08NcQbo=;
  b=RpyZ0M/20/KT9MBjjEh6v3eF1t5IjK/PDK1b58gqZp87g9LDpa6XA0iF
   x3Kz60DMB1bog7MiJr8eMlheypMCbanS0lrVPwPgxpETYrVRSKIDAtup1
   03fdOOHdZnIXPFBXdcHgCAdsU1UJ9UEcXw5zuuWQjwdCasprAiF+MN+v4
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Rk0hn7JezvPRAItXqPQbbzORnT0KODLIttHuvTh3Ei4MGd95Lkxc6gMFsP/BkAsbsZIkW/11n9
 XBhgRbaLiDuzSHhhfl/ZGPgMPspkU3mgQaTSldh7i4OTxA8JsBpaUTMIIqXN/OcEHfLPUZ6xDA
 qxHdsR0WJlmXAFY+zhF/b3TNk69tPnrfnTbSR9KNoBVHGIpR6bSRRoVW546zwlQ9T2JdAHtlDR
 buSCICkhQkPPELQyCIb+8Vg4/XanHJ40FBLzOKrt1d8ZGrYZLx4jsfFMATYJDrWd69l/3BM+GW
 jQ4=
X-SBRS: 5.2
X-MesageID: 35963332
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,330,1602561600"; 
   d="scan'208";a="35963332"
Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: Jan Beulich <jbeulich@suse.com>
CC: <paul@xen.org>, <wl@xen.org>, <iwj@xenproject.org>,
	<anthony.perard@citrix.com>, <andrew.cooper3@citrix.com>,
	<george.dunlap@citrix.com>, <julien@xen.org>, <sstabellini@kernel.org>,
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <62d08bab-6de4-c190-7a8c-910693f16846@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <f3673d8c-4827-486a-8c72-760c9e314fd4@citrix.com>
Date: Fri, 8 Jan 2021 11:27:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <62d08bab-6de4-c190-7a8c-910693f16846@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/01/2021 09:19, Jan Beulich wrote:
> On 08.01.2021 01:46, Igor Druzhinin wrote:
>> --- a/tools/libs/light/libxl_x86.c
>> +++ b/tools/libs/light/libxl_x86.c
>> @@ -336,7 +336,7 @@ static int hvm_set_viridian_features(libxl__gc *gc, uint32_t domid,
>>          LOG(DETAIL, "%s group enabled", libxl_viridian_enlightenment_to_string(v));
>>  
>>      if (libxl_bitmap_test(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_BASE)) {
>> -        mask |= HVMPV_base_freq;
>> +        mask |= HVMPV_base_freq | HVMPV_no_vp_limit;
> 
> Could you clarify the point of having the new control when at
> the guest config level there's no way to prevent it from
> getting enabled (short of disabling Viridian extensions
> altogether)?

If you migrate in from a host without this code (previous version
of Xen)- you will keep the old behavior for the guest thus preserving
binary compatibility.

Igor

