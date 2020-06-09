Return-Path: <SRS0=4XJi=7W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85968C433E1
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 09:36:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6148F2063A
	for <xen-devel@archiver.kernel.org>; Tue,  9 Jun 2020 09:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6148F2063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiafk-0001gE-Ee; Tue, 09 Jun 2020 09:35:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jiafj-0001fT-5c
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 09:35:55 +0000
X-Inumbo-ID: 99033a72-aa34-11ea-b2f8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99033a72-aa34-11ea-b2f8-12813bfff9fa;
 Tue, 09 Jun 2020 09:35:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 08C6AAD5D;
 Tue,  9 Jun 2020 09:35:49 +0000 (UTC)
Subject: Re: Xen 4.14 RC1
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <20200608163934.313-1-paul@xen.org>
 <CABfawhn3HJCHonYKnMFPgUEN125SDBSXKcMFMWd2hG5SGKF8YQ@mail.gmail.com>
 <20200609081039.GA1635@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8cfad05-3a03-5b9b-243f-030eba8de199@suse.com>
Date: Tue, 9 Jun 2020 11:35:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200609081039.GA1635@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Paul Durrant <paul@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 xen-announce@lists.xenproject.org, xen-users@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09.06.2020 10:11, Roger Pau Monné wrote:
> On Mon, Jun 08, 2020 at 02:02:31PM -0600, Tamas K Lengyel wrote:
>> On Mon, Jun 8, 2020 at 10:41 AM Paul Durrant <paul@xen.org> wrote:
>>>
>>> Hi all,
>>>
>>> Xen 4.14 RC1 is tagged. You can check that out from xen.git:
>>>
>>> git://xenbits.xen.org/xen.git 4.14.0-rc1
>>>
>>> For your convenience there is also a tarball at:
>>> https://downloads.xenproject.org/release/xen/4.14.0-rc1/xen-4.14.0-rc1.tar.gz
>>>
>>> And the signature is at:
>>> https://downloads.xenproject.org/release/xen/4.14.0-rc1/xen-4.14.0-rc1.tar.gz.sig
>>>
>>> Please send bug reports and test reports to xen-devel@lists.xenproject.org.
>>> When sending bug reports, please CC relevant maintainers and me (paul@xen.org).
>>>
>>> As a reminder, there will be a Xen Test Day. Please see the test day schedule at
>>> https://wiki.xenproject.org/wiki/Xen_Project_Test_Days and test instructions at
>>> https://wiki.xenproject.org/wiki/Xen_4.14_RC_test_instructions.
>>
>> Hi Paul,
>> I'm sad to see this RC1 still missing patch:
>>
>> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00179.html
>>
>> The following even have the release-ack and yet are also missing:
>>
>> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00025.html
> 
> Ideally this one requires an Ack from the VMX maintainers, which
> hasn't happened AFAICT. Might be worth trying to ping them on the patch
> by putting them on the To field.
> 
> Alternatively we can consider pushing it without such Ack if the x86
> maintainers agree.

I would likely do so once the time we usually see Kevin reply has
expired, but we're not past that point yet.

Jan

