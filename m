Return-Path: <SRS0=k7LG=6U=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09EEC38A24
	for <xen-devel@archiver.kernel.org>; Wed,  6 May 2020 09:47:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 920D62070B
	for <xen-devel@archiver.kernel.org>; Wed,  6 May 2020 09:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="h2b0c/g6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 920D62070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWGde-0000Jv-2l; Wed, 06 May 2020 09:46:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C64T=6U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jWGdd-0000Jq-7s
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 09:46:49 +0000
X-Inumbo-ID: 81779c98-8f7e-11ea-9e2b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81779c98-8f7e-11ea-9e2b-12813bfff9fa;
 Wed, 06 May 2020 09:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Flmg0pC/A30wPca0pIylAF4z9Ya865mavKNqv7oous=; b=h2b0c/g6ixht7EC8+j+sBOUT4j
 tMTM8Y0sZ6fHqzbSRag9638Bif5MMohLRxxU+3FKsvZlz4GnbefZ5OZSCsQFK+GTE3wVxcszqWPSw
 ht2EzA09sh2BAZ3jTyVGCe2G9jCdraxUQDxVCGzL/AsHzL+XBhyZt4QyxCozdGC4pk1o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jWGdb-0000yo-Ji; Wed, 06 May 2020 09:46:47 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jWGdb-0000Yt-DB; Wed, 06 May 2020 09:46:47 +0000
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <debb2604-a239-46f7-740c-d4ac9968b4a5@xen.org>
Date: Wed, 6 May 2020 10:46:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi George,

On 04/05/2020 12:10, George Dunlap wrote:
> 
> 
>> On Apr 30, 2020, at 3:50 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>
>>> In order to make easier to experiment, the option EXPERT can now be
>>> selected from the menuconfig rather than make command line. This does
>>> not change the fact a kernel with EXPERT mode selected will not be
>>> security supported.
>>
>> Well, if I'm not mis-remembering it was on purpose to make it more
>> difficult for people to declare themselves "experts". FAOD I'm not
>> meaning to imply I don't see and accept the frustration aspect you
>> mention further up. The two need to be carefully weighed against
>> one another.
> 
> I don’t think we need to make it difficult for people to declare themselves experts, particularly as “all” it means at the moment is, “Can build something which is not security supported”.  People who are building their own hypervisors are already pretty well advanced; I think we can let them shoot themselves in the foot if they want to.

Assuming I reword the commit message regarding "make clean", could I 
consider this as an acked-by?

Cheers,

-- 
Julien Grall

