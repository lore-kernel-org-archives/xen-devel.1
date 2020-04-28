Return-Path: <SRS0=URyG=6M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5058C83000
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 11:32:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DA78206A1
	for <xen-devel@archiver.kernel.org>; Tue, 28 Apr 2020 11:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DA78206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTOTl-0005eP-LV; Tue, 28 Apr 2020 11:32:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTOTk-0005eK-1j
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 11:32:44 +0000
X-Inumbo-ID: f90ff143-8943-11ea-984e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f90ff143-8943-11ea-984e-12813bfff9fa;
 Tue, 28 Apr 2020 11:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C4FD9AC69;
 Tue, 28 Apr 2020 11:32:40 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: list myself as mini-os reviewer
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, Wei Liu <wl@xen.org>
References: <20200428112346.10498-1-wl@xen.org>
 <20200428113020.twmgdpcddmbaj73l@function>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e76003b-c1b3-3010-02ea-d45cf977feb0@suse.com>
Date: Tue, 28 Apr 2020 13:32:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428113020.twmgdpcddmbaj73l@function>
Content-Type: text/plain; charset=utf-8
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, minios-devel@lists.xenproject.org,
 Xen Development List <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.04.2020 13:30, Samuel Thibault wrote:
> Wei Liu, le mar. 28 avril 2020 12:23:46 +0100, a ecrit:
>> I probably don't have much time to actually review patches, but I do
>> want to be CC'ed such that I can commit patches in a timely manner.
>>
>> Signed-off-by: Wei Liu <wl@xen.org>
> 
> I actually thought you were already referenced there...
> 
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

