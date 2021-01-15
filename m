Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56EFC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 11:57:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 908B323884
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 11:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 908B323884
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.68021.121659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Nil-0000hz-Gc; Fri, 15 Jan 2021 11:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68021.121659; Fri, 15 Jan 2021 11:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Nil-0000hs-D6; Fri, 15 Jan 2021 11:56:51 +0000
Received: by outflank-mailman (input) for mailman id 68021;
 Fri, 15 Jan 2021 11:56:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Nik-0000hn-LL
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 11:56:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 948e200f-1427-491f-a06a-69270b5356ee;
 Fri, 15 Jan 2021 11:56:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 198BAAD6A;
 Fri, 15 Jan 2021 11:56:48 +0000 (UTC)
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
X-Inumbo-ID: 948e200f-1427-491f-a06a-69270b5356ee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610711808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jT53EcocOMnjONEC/b5Y4CAZpNopjZJ7l0M+COKZOpc=;
	b=U5+KvOvCsXlHfvykwmltRm3hoTenbVeO1BWxAsH1xQgsLdhpW/J+1SyB8C8TeHiJDYOtiw
	shrWoYKA9lg9jaDULX8ERVCVOtGjAZHND/uC+hb1v8kVYSP76zbLGtlcQPMID/qMJ2hIA9
	ne1E/d+lN/9ur/ax9dw0PT4AZw0bGEs=
Subject: Re: [PATCH v3 1/7] xen/gnttab: Rework resource acquisition
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6321bce7-1826-be38-622e-088d492fb0c9@suse.com>
Date: Fri, 15 Jan 2021 12:56:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210112194841.1537-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 20:48, Andrew Cooper wrote:
> The existing logic doesn't function in the general case for mapping a guests
> grant table, due to arbitrary 32 frame limit, and the default grant table
> limit being 64.
> 
> In order to start addressing this, rework the existing grant table logic by
> implementing a single gnttab_acquire_resource().  This is far more efficient
> than the previous acquire_grant_table() in memory.c because it doesn't take
> the grant table write lock, and attempt to grow the table, for every single
> frame.
> 
> The new gnttab_acquire_resource() function subsumes the previous two
> gnttab_get_{shared,status}_frame() helpers.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm sorry, but I have to withdraw the R-b given a few minutes ago.

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4013,6 +4013,59 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>      return 0;
>  }
>  
> +int gnttab_acquire_resource(
> +    struct domain *d, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
> +{
> +    struct grant_table *gt = d->grant_table;
> +    unsigned int i = nr_frames, tot_frames;
> +    mfn_t tmp;
> +    void **vaddrs;
> +    int rc;
> +
> +    /* Overflow checks */
> +    if ( frame + nr_frames < frame )
> +        return -EINVAL;
> +
> +    tot_frames = frame + nr_frames;
> +    if ( tot_frames != frame + nr_frames )
> +        return -EINVAL;

While you did remove the explicit returning of an error when
nr_frames is zero, ...

> +    /* Grow table if necessary. */
> +    grant_write_lock(gt);
> +    rc = -EINVAL;
> +    switch ( id )
> +    {
> +    case XENMEM_resource_grant_table_id_shared:
> +        vaddrs = gt->shared_raw;
> +        rc = gnttab_get_shared_frame_mfn(d, tot_frames - 1, &tmp);

... this will degenerate (and still cause an error) when frame
is also zero, and will cause undue growing of the table when
frame is non-zero yet not overly large.

As indicated before, I'm of the clear opinion that here - like
elsewhere - a number of zero frames requested means that no
action be taken at all, and success be returned.

> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        if ( gt->gt_version != 2 )
> +            break;

As per various other places in this file I think you want to
wrap this in evaluate_nospec().

Jan

