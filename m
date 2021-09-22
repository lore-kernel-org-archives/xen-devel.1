Return-Path: <SRS0=cgBe=OM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE26C433EF
	for <xen-devel@archiver.kernel.org>; Wed, 22 Sep 2021 23:45:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9321B61131
	for <xen-devel@archiver.kernel.org>; Wed, 22 Sep 2021 23:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9321B61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.193187.344090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTBut-0004Ez-Qs; Wed, 22 Sep 2021 23:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193187.344090; Wed, 22 Sep 2021 23:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTBut-0004Es-NE; Wed, 22 Sep 2021 23:44:43 +0000
Received: by outflank-mailman (input) for mailman id 193187;
 Wed, 22 Sep 2021 23:44:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTBut-0004Em-3Q
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 23:44:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fa8aa3c-b181-4f1f-83f6-68f45072fc17;
 Wed, 22 Sep 2021 23:44:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5A8860F6B;
 Wed, 22 Sep 2021 23:44:40 +0000 (UTC)
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
X-Inumbo-ID: 6fa8aa3c-b181-4f1f-83f6-68f45072fc17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632354281;
	bh=2yTFJatK4dcvuO+FzHRx0aWMeKEun7B2AeCN7fYwW5c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j5haLBwlTJPO7TKipXfqXqk5XFbBow2zopf9SDZmVV4v4X9SHMv3GmzlEO1adn2zS
	 l2gwFV26rbTH5lJ6uLD/QB+S3S28lKvTkn7Bjm6cga/40ixYDJoXzfLKRw5jaPI2uu
	 oSQ3+hqxDF0jTGZRQIIIfsQBkwEXRyaynl7rP7ImpSme/V0RpLSFqjXoCxLc8gc2WW
	 KNubZ5w+SF3CsRQkzdtyPPmjhEfkf0RH6nlx9ZAO8Cp10nGAzwvam+SO5wqKY/pVgC
	 gerr7f1Gvxj+FGnlZAA07V149/NAAfQIwKtZcm1A/ZRFZFO84+zhbcN4D7sxqVzrGu
	 ONanYY9Mp2/Fg==
Date: Wed, 22 Sep 2021 16:44:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 07/17] xen/device-tree: Add dt_property_read_u32_array
 helper
In-Reply-To: <852610e258d4c36888b68771061afdc0df95e401.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221644150.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <852610e258d4c36888b68771061afdc0df95e401.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Rahul Singh wrote:
> Based on tag Linux v5.14.2 commit bbdd3de144fc142f2f4b9834c9241cc4e7f3d3fc

Please use a commit it from Linux upstream, not stable


> Import the Linux helper of_property_read_u32_array. This function find
> and read an array of 32 bit integers from a property.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Change in v2: Patch introduced in v2
> ---
>  xen/include/xen/device_tree.h | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 1693fb8e8c..497144b8a7 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -366,7 +366,6 @@ bool_t dt_property_read_u32(const struct dt_device_node *np,
>  bool_t dt_property_read_u64(const struct dt_device_node *np,
>                              const char *name, u64 *out_value);
>  
> -
>  /**
>   * dt_property_read_variable_u32_array - Find and read an array of 32 bit
>   * integers from a property, with bounds on the minimum and maximum array size.

Spurious change


> @@ -392,6 +391,36 @@ int dt_property_read_variable_u32_array(const struct dt_device_node *np,
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

