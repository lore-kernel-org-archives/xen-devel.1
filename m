Return-Path: <SRS0=Ywvf=BA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E93C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 12:25:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A2722BEF
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 12:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4A2722BEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxrKK-0008Pj-MJ; Tue, 21 Jul 2020 12:24:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d7zm=BA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jxrKI-0008Pd-Vg
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 12:24:55 +0000
X-Inumbo-ID: 2da11378-cb4d-11ea-a0ac-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2da11378-cb4d-11ea-a0ac-12813bfff9fa;
 Tue, 21 Jul 2020 12:24:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22E6BB947;
 Tue, 21 Jul 2020 12:24:59 +0000 (UTC)
Subject: Re: [PATCH v2] mini-os: don't hard-wire xen internal paths
To: Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20200713084230.18177-1-jgross@suse.com>
 <20200718181827.7jrs5ilutt3jzp4i@function>
 <20200721122122.ypuumlnwn4djwevw@liuwe-devbox-debian-v2>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3f8f2da2-552c-c651-5744-dfa01bd9821c@suse.com>
Date: Tue, 21 Jul 2020 14:24:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721122122.ypuumlnwn4djwevw@liuwe-devbox-debian-v2>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.07.20 14:21, Wei Liu wrote:
> On Sat, Jul 18, 2020 at 08:18:27PM +0200, Samuel Thibault wrote:
>> Juergen Gross, le lun. 13 juil. 2020 10:42:30 +0200, a ecrit:
>>> Mini-OS shouldn't use Xen internal paths for building. Import the
>>> needed paths from Xen and fall back to the current values only if
>>> the import was not possible.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 
> Unfortunately this doesn't apply to staging.

Since when does mini-os.git have a staging branch?

> Juergen, can you rebase?

To what?


Juergen

