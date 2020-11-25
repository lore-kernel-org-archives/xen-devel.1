Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCCCC5519F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 06:41:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94D9920708
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 06:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94D9920708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37332.69631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khoUn-0007UL-KB; Wed, 25 Nov 2020 06:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37332.69631; Wed, 25 Nov 2020 06:41:41 +0000
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
	id 1khoUn-0007UE-HB; Wed, 25 Nov 2020 06:41:41 +0000
Received: by outflank-mailman (input) for mailman id 37332;
 Wed, 25 Nov 2020 06:41:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yrgl=E7=suse.de=hare@srs-us1.protection.inumbo.net>)
 id 1khoUm-0007TP-Ri
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 06:41:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20977a22-5dd5-4d7f-8f84-5cec86f86a87;
 Wed, 25 Nov 2020 06:41:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63062ABCE;
 Wed, 25 Nov 2020 06:41:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yrgl=E7=suse.de=hare@srs-us1.protection.inumbo.net>)
	id 1khoUm-0007TP-Ri
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 06:41:40 +0000
X-Inumbo-ID: 20977a22-5dd5-4d7f-8f84-5cec86f86a87
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 20977a22-5dd5-4d7f-8f84-5cec86f86a87;
	Wed, 25 Nov 2020 06:41:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 63062ABCE;
	Wed, 25 Nov 2020 06:41:39 +0000 (UTC)
Subject: Re: [PATCH 02/45] filemap: consistently use ->f_mapping over
 ->i_mapping
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Coly Li <colyli@suse.de>,
 Mike Snitzer <snitzer@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.cz>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, dm-devel@redhat.com,
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.com>,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-3-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <aca8a60e-d6da-7a17-0a20-3187eed83cc1@suse.de>
Date: Wed, 25 Nov 2020 07:41:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-3-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/24/20 2:27 PM, Christoph Hellwig wrote:
> Use file->f_mapping in all remaining places that have a struct file
> available to properly handle the case where inode->i_mapping !=
> file_inode(file)->i_mapping.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   mm/filemap.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

