Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FF0CA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 14:51:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437410.1656306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBveU-0008CB-LL; Wed, 30 Sep 2026 14:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437410.1656306; Wed, 30 Sep 2026 14:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBveU-0008C4-I0; Wed, 30 Sep 2026 14:51:22 +0000
Received: by outflank-mailman (input) for mailman id 1437410;
 Wed, 30 Sep 2026 14:51:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBveT-0008By-Gl
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 14:51:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBveS-00HXD7-QL
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:51:20 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd21d6-e002-0a2a0a5209dd-0a2a4507b374-28
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:51:20 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd21e8-b4ea-0a2a45070019-4a7de14ca600-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 16:51:20 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f63546c3so4280109f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 07:51:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029f3b1fsm3726358f8f.26.2026.09.30.07.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 07:51:19 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790779880; x=1791384680; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+3zvmkMCZKNyD04eOrufTq9qcC+82Dl28gqa4+duUk=;
        b=EbBJqf6biuayPXEgT262WEI28vqikuXq2gEXVGVdWT0UoekzpW9J8utAg/IeT1oHh1
         JthHfvKCjzvC7WTnhCvGd+uuf7XHkCjzcesTiwNFaIAMlw1R6oijCyaKmZ2Ko3Me0w31
         Kvdtj/Chu36bvH+P+KGE9EX/2poCKkrbR73WmWZbw5n58J0p4MLEJMlEtY3Wgh/n1Sm2
         vXBt8otNx1EvPkShpOVZ3uAMySDXQyV7liLSRjArSWP0CncFkKe4ILpdkDUZtjnUMfjy
         oc8Zc4AT8ZtQgMNaDUBrVwrnmkJaTWHsrkxhb0ct1BaQ8Ev0GjH9Au+B8IrUpcJlwkaz
         Oe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779880; x=1791384680;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+3zvmkMCZKNyD04eOrufTq9qcC+82Dl28gqa4+duUk=;
        b=XRM3M/pFkz7SQVB4mu+WqaGpDwgGsm4XYZFlGFi7EV1KMP/VrKHaYEuw7p9+V0qzU7
         HnfhTIcep5lIJFY/P4NoiRaX3d48XdvVv/E8SFOanaGDQjWPQvCzhxXj9/5iRIFnBKFC
         q3iCPrez1AblC+A1VUhXZuWqetVj4UMDC3TUG5WZlWdDE0i5LxCqBfOTHL0GjEkvXBCr
         pFl8XYau89/m7VlVkw+ypn3LMfC/OZyHY7Ru2QuLiJs1KweMD3FWJ5opkCkOcXt+GnZ/
         bLcvSwLa+L96IjBIG6VHDVlJf4BPeTImZedS/RQsBk6xGTpmm2LW3eegxkvAhEHEFojv
         /llA==
X-Forwarded-Encrypted: i=1; AKwUvByoc/AtMOF6GXvFpzfkuJ8oPXHEL0L/WmBRxz4lybviSHLuVx6qnEeyQVFOb6FHimPY6rj+u4zLLnA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIag4dcx0u6Ty9lkv7OvCZ+NdmRmjAdeIrYQ02fPCRj4X0Ya2hS
	0OefJRPJAMBQKQLmq3RJuYoYJoQfJPwBOrv0TxNELZQPMCMSV3oSq3ljihA0rfQXPg==
X-Gm-Gg: AYBFou1UfWW7Tqpm436jmAAX4jkEb8GxJ0zjggyrj1x2fnZcBFTOQ+eQ72RQ+dHgySf
	WM0XynzpaTw7hoBGR0g3kr+eLm9vhT6fYMS90BK+VazW+gnkG1n43uTWgs/cRFyce7V1p8VnZko
	vcEBBnzMHrDaVEZuYniPjmSWhWI87hE/myFmA0hJj6cW8EfifdJr9I+HzqJ+iF0A2/ILdJp8okG
	bogl1hbBpdbF+FoykDCW9Nm+3MaoIdLfjA8blbnnqQJrFPNkZc332Dmm7x8fyvy3Q4gzETMDxRn
	vFsDTyXAn1vzVwjzTRWGd3j5PgrdOiw44FONACW7d0W7djNsttWivN7cSKlIZ8ikn2DK/D3CQTQ
	QR40uFBe40dGJe6oSzWb5VtSH1tT5VKFo0rfFG8yJ1s3U2tKbeqkzaQ1rW+8WL2pfS6GkZrQ3e4
	qMtdkrSQpcS/qe7lWMY7oHVUBvyoSzLTGi3MBR8jFaPN1D5Vn4B1yuChL58KzOMvtzttdiRpcL5
	CaULHQnkY6paPjMElOgbrwnKyUPJlkAoGLdLQa4RvafQ3clWyi9WlBAxESKzQ==
X-Received: by 2002:a05:6000:4553:b0:487:73c:3f9 with SMTP id ffacd0b85a97d-48b02597fffmr2226994f8f.22.1790779879798;
        Wed, 30 Sep 2026 07:51:19 -0700 (PDT)
Message-ID: <08c87a8b-6b30-4ac4-a65c-57f3d96079f3@suse.com>
Date: Wed, 30 Sep 2026 16:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] x86/passthrough: Extract pt_irq_dpci_setup()
 from pt_irq_create_bind()
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Teddy Astie <teddy.astie@vates.tech>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
 <1788444857.8631fc262581453bbf619ec5b2062170.1a0679ed4c6000c4f3@vates.tech>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <1788444857.8631fc262581453bbf619ec5b2062170.1a0679ed4c6000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1790779880-A58C1AE4-8FE5B80B/10/78276251493
X-purgate-type: spam
X-purgate-size: 970

On 03.09.2026 16:14, Julian Vetter wrote:
> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -217,16 +217,14 @@ static struct vcpu *vector_hashing_dest(const struct domain *d,
>      return dest;
>  }
>  
> -int pt_irq_create_bind(
> -    struct domain *d, const struct xen_domctl_bind_pt_irq *pt_irq_bind)
> +static int pt_irq_dpci_setup(struct domain *d, unsigned int pirq,
> +                             struct hvm_irq_dpci **hvm_irq_dpci_out,
> +                             struct hvm_pirq_dpci **pirq_dpci_out,
> +                             struct pirq **info_out)

This is a little ugly. Can we perhaps reduce ugliness by a third through
omitting pirq_dpci_out here? The caller can trivially compute it from
*info_out.

An option to reduce ugliness by another third would be to have the
function return e.g. struct hvm_irq_dpci *, encoding error indicators
by the macros supplied by xen/err.h.

Jan

