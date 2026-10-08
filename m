Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE1FCA600A
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 07:48:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442998.1660364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEir5-0004lM-1i; Thu, 08 Oct 2026 07:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442998.1660364; Thu, 08 Oct 2026 07:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEir4-0004lF-VL; Thu, 08 Oct 2026 07:47:54 +0000
Received: by outflank-mailman (input) for mailman id 1442998;
 Thu, 08 Oct 2026 07:47:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEir3-0004l9-WD
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 07:47:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEir3-00G6VK-Cw
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 09:47:53 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac74a9e-8faa-0a2a0a5109dd-0a2a4502c620-24
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 09:47:53 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac74aa9-6ca4-0a2a45020019-d155dd2ae01b-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 09:47:53 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso2566912f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 00:47:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71bd7690sm9885060f8f.2.2026.10.08.00.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 00:47:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1791445673; x=1792050473; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NKF73/Dub3v+IFx5x7L7MHvvzVbzfSk1n1lIrqsiZIU=;
        b=R6Fo0Mh3hrz2INFT5begX9cb4V6NygDbcF7SqRjMmBQKnn/TXPMhBFlmlvMMyrwnsK
         0HJRSqq1we7Uxh7XAWufE0gwKRnriD3XQBU6e8WhCkSAtWRRnZ1wzoZMMnTH28rEdzQX
         n3ud9GflI4GKhwrnVxn+IX5rSCf7yveHHW7zimT6LomoqO1oj9Pn2WeDR3mC1uFWUV09
         YWL3QZYNd7Dp4DlJvHPNd6gFLvkF8/KmoyXJIL++BLFHKky/UA2DN3Xp4JX/XgLH7pXJ
         8iHqSCdVqro2QJM1z9nhD6MhYyTdylkJmA/VtCVOu/lilftxgkq4/tXeQ38nz1Ya8ZVl
         qIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791445673; x=1792050473;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKF73/Dub3v+IFx5x7L7MHvvzVbzfSk1n1lIrqsiZIU=;
        b=BJBP0qT7lHEB3yba099gqMCNfkDUekri2lOQ6ic8hpGJRgx2ZC+hq/jkmAc0sTZtOE
         ikOWAxKDTTHWkggcwZlKtXZa3X+P1c2eD4TDzTqbxSvprWhGwOpNaN1WVBnUyfiwg8A+
         u8+sDS9Hc1FUcRbibWGj7VHB75htMl9pYDXB8vz7SOSA7XcnKiAr1MIp8qxAqDjTK8TO
         jBYlMzkSmzISOOcxzgMMT72vBwXU4fHfwa8HKi39Sp1OWCw25+Ipwb4uvXWutciDVmfG
         OXW9GydC3hAyhNwBigfAOw8sN8gOHB0nXkYKDl1Pw7IiQueAhvWo1d14NhbHyjAHP5ge
         rYyw==
X-Forwarded-Encrypted: i=1; AKwUvBylGmgxiN/eXEco21e2KVON+JmHRCgQ0DQr45wjo/zf1mlx2CYBpBJMVeXAfjKqyDCa5u8mRRewgbE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLza4b0HmdLcWhKExTlwDBs/r2aJpnd2pux/+vO8+yUZQVtjl+R
	tjTJVJvcpeZUl4PhPXtHRogRW8O8BpcmJ/OkpK4kEevdDdbJmvE/QPg7RWzX/YcOlQ==
X-Gm-Gg: AYBFou0MsgbHjUcABq2x3dlLJqTC3pu3dAcrFunOy59pS33qDmm38FZ2biq8kIyuCYi
	oZo2uBqcWOvs15R/6j7O6eYIebGrYyBiabCPYyfixJqHGWN1V/7Jms4oXWKcWj0T/AzvBl1vmZK
	TYvfErDuey4aX+08VF9CwaYHJn9nS4wxod92QSSqZdzuVyoBfo/MHf70dtWwOuCym8ejyi1JMtt
	8+n1OEMLju9Bsv/B/W4254+dXiWO0B3W5v3YAzbWjydupdA1lXjmUdc1ZfR0YmUqCRnfGbBSMF1
	afrMKFvLA7BmmbFBlll8y75/WdLkTsje6uj7NhKH6yBmOohhVY/YGOlMqP1EURZs0c8RpBO54Dr
	myZH/IVGZbb36Vk7SQ3oQmVlj0BycAbIqKwDPK5XYdGkJVVyxBb7VXeslidF3u9eQ3DlERoUETK
	Yxp9zj5e8GxvqROILL+k531x7YHFo4cnVVQ/mVdkZlULbEw7bEI3kH+DeVAlZ7o1cx0Ymh7tuzm
	8mtPRhGVa9okWGkmCMSmKKzSlMxb1FUJANRnXClMubYkzoWT3nMpeKq4lY4Nk4=
X-Received: by 2002:a05:6000:29d5:b0:48b:948:c720 with SMTP id ffacd0b85a97d-48c7276a70fmr6191031f8f.11.1791445672573;
        Thu, 08 Oct 2026 00:47:52 -0700 (PDT)
Message-ID: <499a8e0f-b3e3-44b0-91fb-128a0a952482@suse.com>
Date: Thu, 8 Oct 2026 09:47:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7549daf9e0de3420198913f6f91c16c929a31834.1791404375.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <7549daf9e0de3420198913f6f91c16c929a31834.1791404375.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1791445673-317CA2AC-2427570D/10/78276251493
X-purgate-type: spam
X-purgate-size: 651

On 07.10.2026 22:39, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 10.1 states: "Operands shall not be of an inappropriate
> essential type".
> 
> bar_write() and guest_mem_bar_write() added the boolean 'hi' to a
> pointer difference when printing the ignored BAR index. These handlers
> are registered only for the memory BAR registers, so print
> (reg - PCI_BASE_ADDRESS_0) / 4 instead. The expression has type
> unsigned int, so use %u.
> 
> No functional changes.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


