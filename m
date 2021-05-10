Return-Path: <SRS0=a6zz=KF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471C3C433ED
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 12:20:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF74C61424
	for <xen-devel@archiver.kernel.org>; Mon, 10 May 2021 12:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF74C61424
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=apertussolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.125189.235653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg4tN-0007SY-38; Mon, 10 May 2021 12:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125189.235653; Mon, 10 May 2021 12:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg4tN-0007SR-0D; Mon, 10 May 2021 12:20:09 +0000
Received: by outflank-mailman (input) for mailman id 125189;
 Mon, 10 May 2021 12:20:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Mbt=KF=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lg4tL-0007SL-Lt
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 12:20:07 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adf97eb2-566c-489a-8a76-eb3501f7d8dc;
 Mon, 10 May 2021 12:20:06 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1620649201249296.6079821401013;
 Mon, 10 May 2021 05:20:01 -0700 (PDT)
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
X-Inumbo-ID: adf97eb2-566c-489a-8a76-eb3501f7d8dc
ARC-Seal: i=1; a=rsa-sha256; t=1620649203; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=houLbPScNXHc8ZZFQn6nuIWLU0m/G45nABZX3bZI81EZ4hyVPCq629AKhQJEooX9BwBvE+UWAaoz2uwOmTEpLu+uilV4pjsHr3O6ZVm71LOGhYF5Z39RnnxwdBJOkHhHSKhacyRyCjFEhGdWtTARKOktW3oquhibJI9Y5aeHurI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1620649203; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=b5QIqmH34lMWwx9hU1HX9D4DAzXxa8mXB2e28YFf4PQ=; 
	b=Xtw7mNBaC1gZwZppKmd5ytTPtf5wHU6moHCvBTXYLhKEbG1exG3BVtfiKwOZ368Wd8ChbMvy8brjCCwisgDTK2djiDL3GNuKF6TSRtiQB1YZygdYV/L7CnHQMHAY+IFdEQb7mRqJafiLP0aJQvSBnGvaFfA12AC6UJOMRwfwdJM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1620649203;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=b5QIqmH34lMWwx9hU1HX9D4DAzXxa8mXB2e28YFf4PQ=;
	b=J+dEvSCsIT2jRFNQPhWvse1HtTxTsbVlSsgVd1JWA/Jmrni87Bf+G1UnT1PnsjCE
	gjxmrxZPJobbTKsEeZNanDR2LjZlYtzagiVhYy6HU1zH3wzurj49fpMmwrEHFuUvcLd
	deeHT/OiZHsJlHhsA5WTDpZ8ag042hs454jjNTJk=
Subject: Re: [PATCH v2 07/13] vtpmmgr: Flush all transient keys
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-8-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <389c8617-1944-b570-2e68-57dbb45c94b0@apertussolutions.com>
Date: Mon, 10 May 2021 08:19:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506135923.161427-8-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/6/21 9:59 AM, Jason Andryuk wrote:
> We're only flushing 2 transients, but there are 3 handles.  Use <= to also
> flush the third handle since TRANSIENT_LAST is inclusive
> 
> The number of transient handles/keys is hardware dependent, so this
> should query for the limit.  And assignment of handles is assumed to be
> sequential from the minimum.  That may not be guaranteed, but seems okay
> with my tpm2.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> ---
> v2 add "since TRANSIENT_LAST is inclusive" to commit message.
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

>  stubdom/vtpmmgr/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
> index 56b4be85b3..4ae34a4fcb 100644
> --- a/stubdom/vtpmmgr/init.c
> +++ b/stubdom/vtpmmgr/init.c
> @@ -656,7 +656,7 @@ static TPM_RC flush_tpm2(void)
>  {
>      int i;
>  
> -    for (i = TRANSIENT_FIRST; i < TRANSIENT_LAST; i++)
> +    for (i = TRANSIENT_FIRST; i <= TRANSIENT_LAST; i++)
>           TPM2_FlushContext(i);
>  
>      return TPM_SUCCESS;
> 


