Return-Path: <SRS0=3HPv=OT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B00C433EF
	for <xen-devel@archiver.kernel.org>; Wed, 29 Sep 2021 06:07:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27326613CD
	for <xen-devel@archiver.kernel.org>; Wed, 29 Sep 2021 06:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27326613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.198619.352191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSks-0002Sm-5q; Wed, 29 Sep 2021 06:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198619.352191; Wed, 29 Sep 2021 06:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSks-0002Sf-2w; Wed, 29 Sep 2021 06:07:46 +0000
Received: by outflank-mailman (input) for mailman id 198619;
 Wed, 29 Sep 2021 06:07:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVSkq-0002ST-CP
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 06:07:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48bc7a58-8a58-4a16-8f73-c60a89512a3c;
 Wed, 29 Sep 2021 06:07:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A5C46124B;
 Wed, 29 Sep 2021 06:07:43 +0000 (UTC)
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
X-Inumbo-ID: 48bc7a58-8a58-4a16-8f73-c60a89512a3c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632895663;
	bh=gi7yLRdXEuHiDcYD8QGkIxiima8qvnbL7FOBGGfTlwE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jzmINPKH6x37HfW0DNtB8JiZ1mHSAUtVd8yyg3qjka+NtJlf2bGuUU+mtuSs3VabA
	 zkPt2Qi/g6b1mDg6J1iU+BnYwArLX9/79N33sMwomFxJOUTK8qjysCI6Q4dt/CMdI+
	 SzVNOqBttPtscI1q/j8lQXHW2MWzADvnMIxfs0IQR4h0QwJoV3VjfvisnM+HT/mXTY
	 mPocivfLbEYwgQz1HYu6DMOvZyN/irGNsuy+CW8rjHjWmF2okq+asZtDkpb5iLYlIE
	 udAOdQzZ+Ikpq5sEW5K9AOtiQgruT7VqnLoqt9rVwM49fkU2O3H2RP0aV89R5y/lmr
	 LuoIwgyhYMPNg==
Date: Tue, 28 Sep 2021 23:07:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 07/17] xen/device-tree: Add dt_property_read_u32_array
 helper
In-Reply-To: <89788e202bc91e2bc7f9c3c33eb91ab7478381ee.1632847120.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109281618560.5022@sstabellini-ThinkPad-T480s>
References: <cover.1632847120.git.rahul.singh@arm.com> <89788e202bc91e2bc7f9c3c33eb91ab7478381ee.1632847120.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Rahul Singh wrote:
> Based Linux commit a67e9472da423ec47a3586920b526ebaedf25fc3
> 
> Import the Linux helper of_property_read_u32_array. This function find
> and read an array of 32 bit integers from a property.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v3:
> - Modify commit message to include upstream Linux commit-id not stable
>   Linux commit-id
> Change in v2: Patch introduced in v2
> ---
>  xen/include/xen/device_tree.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 1693fb8e8c..3ffe3eb3d2 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -392,6 +392,36 @@ int dt_property_read_variable_u32_array(const struct dt_device_node *np,
>                                          const char *propname, u32 *out_values,
>                                          size_t sz_min, size_t sz_max);
>  
> +/**
> + * dt_property_read_u32_array - Find and read an array of 32 bit integers
> + * from a property.
> + *
> + * @np:     device node from which the property value is to be read.
> + * @propname:   name of the property to be searched.
> + * @out_values: pointer to return value, modified only if return value is 0.
> + * @sz:     number of array elements to read
> + *
> + * Search for a property in a device node and read 32-bit value(s) from
> + * it.
> + *
> + * Return: 0 on success, -EINVAL if the property does not exist,
> + * -ENODATA if property does not have a value, and -EOVERFLOW if the
> + * property data isn't large enough.
> + *
> + * The out_values is modified only if a valid u32 value can be decoded.
> + */
> +static inline int dt_property_read_u32_array(const struct dt_device_node *np,
> +                                             const char *propname,
> +                                             u32 *out_values, size_t sz)
> +{
> +    int ret = dt_property_read_variable_u32_array(np, propname, out_values,
> +                              sz, 0);
> +    if ( ret >= 0 )
> +        return 0;
> +    else
> +        return ret;
> +}
> +
>  /**
>   * dt_property_read_bool - Check if a property exists
>   * @np: node to get the value
> -- 
> 2.17.1
> 

