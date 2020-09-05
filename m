Return-Path: <SRS0=/E4b=CO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D391C433E2
	for <xen-devel@archiver.kernel.org>; Sat,  5 Sep 2020 04:50:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D670A2078E
	for <xen-devel@archiver.kernel.org>; Sat,  5 Sep 2020 04:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D670A2078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEQ9b-0008Df-HK; Sat, 05 Sep 2020 04:50:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ib7E=CO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kEQ9a-0008Da-8u
 for xen-devel@lists.xenproject.org; Sat, 05 Sep 2020 04:50:18 +0000
X-Inumbo-ID: c001b49a-dcc0-4a2b-873d-c98ee6ae49a3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c001b49a-dcc0-4a2b-873d-c98ee6ae49a3;
 Sat, 05 Sep 2020 04:50:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DCCFAE2A;
 Sat,  5 Sep 2020 04:50:17 +0000 (UTC)
Subject: Re: [xen-unstable test] 153602: regressions - FAIL [and 1 more
 messages]
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: xen-devel@lists.xenproject.org
References: <233c6207-4724-55b0-3c92-84251edfc5b2@suse.com>
 <20200904160034.11456-1-iwj@xenproject.org>
 <osstest-153602-mainreport@xen.org>
 <1bdbf90f-2150-cb86-63a2-37e5148ec34e@suse.com>
 <24401.5895.115731.487189@mariner.uk.xensource.com>
 <52d2bdeb-ccde-9d9d-9f62-24571e9e4c15@suse.com>
 <565646cc-2833-d34e-2bc3-eb920ac7f140@suse.com>
 <24402.28756.378598.517505@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2f4a7c0c-694b-908c-6c10-59dda927b21e@suse.com>
Date: Sat, 5 Sep 2020 06:50:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <24402.28756.378598.517505@mariner.uk.xensource.com>
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

On 04.09.20 18:50, Ian Jackson wrote:
> Jan Beulich writes ("Re: [xen-unstable test] 153602: regressions - FAIL"):
>> Actually, with also reverting 8d990807ec2c in the main tree (along with
>> effectively reverting e013e8514389, which comes down to the same as Ian
>> suggested for 165f3afbfc3d), and with its future re-installment at the
>> same time bumping the mini-os commit to use, things ought to work I
>> would think. That would then be the same model again as used for
>> qemu-trad.
> 
> I implemented this here:
> 
> Ian Jackson writes ("[PATCH] minios: Revert recent change and revert to working minios"):
>> Currently, xen.git#staging does not build in many environments because
>> of issues with minios master.  This regression was introduced in an
>> uncontrolled manner by an update to mini-os.git#master.
> 
> I don't have any formal acks for this but, having build-tested it, I
> am going to push it now, because the build is broken.

Any reason you selected the 4.13 tag instead of the 4.14 one?

Would you even consider using d8a7bd2430a590a958f3c17fc1b2f7f563a04db2
in order not to block my libbuild series?


Juergen

