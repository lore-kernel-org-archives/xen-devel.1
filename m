Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93652D35162
	for <xen-devel@archiver.kernel.org>; Wed,  1 Apr 2026 12:04:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1270156.1558904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7uIP-0004xW-U4; Wed, 01 Apr 2026 12:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270156.1558904; Wed, 01 Apr 2026 12:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7uIP-0004xP-RR; Wed, 01 Apr 2026 12:03:41 +0000
Received: by outflank-mailman (input) for mailman id 1270156;
 Wed, 01 Apr 2026 12:03:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7uIO-0004wz-Kq
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 12:03:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7uIO-00BHgK-0Y
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:03:40 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd0999-e002-0a2a0a5209dd-0a2a4502e3f0-8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:03:39 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd099b-42fa-0a2a45020019-d155802ed0a6-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:03:39 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48702d51cd0so80262575e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 05:03:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e93c014sm129593595e9.10.2026.04.01.05.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 05:03:39 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775045019; x=1775649819; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ncQ7EwCCia3SUh+upWdtn/VSemhWNEj5HdIH6WAMNTQ=;
        b=atBge1e+2Iifj6pIjBIMveQdPU341FG78zKUHoDAM4SJ+he+cTgZRW7+FDeldx3vQf
         iZQBgPXsI3N+INo81NdODPuxMtHOCuKhJXE9dtFKuJL/WqQq46YNYs+jky3q5QutPOZB
         DzzPmTELixdKEGDL8I1OerpR32F2Znwj01PcGqH1Wvdz9jDRsCaARS+aRB6dDk74qk87
         6E4PW8sBsZFSR686zzAMasNHpqO44h3vq3qJ843vyt38+eGt/zh9dXECapEDFq4Esr2O
         1eA+yU4MsPdtM8d1442cCB4eXGGqt7B9xyMceqQbgPZLiNLfWRF4wfN6HFDx5Qoxnhwa
         i+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775045019; x=1775649819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncQ7EwCCia3SUh+upWdtn/VSemhWNEj5HdIH6WAMNTQ=;
        b=Vg8ks3H8VNLGvMZTBv3glH4khjAwsn5c4Fh7+Jeu56xmsSf7/roHRdL5DJurEJhDLo
         YOKbqaipBSj7DGmRrHsNBOJcVWXyug9FXDKx6aWafszmZNAJ3QkLF4SMBgig/UzRQQck
         pUJhKoN+40Z9e+k0nlbAnj9sDZbQ0sJ6nNXV16891mFm0rFtzWzxrnRDA6RnXjEFbO8J
         6mLcc5P7iksEjmeyTJuMNRD4lwfdha+Cs0N+e//g9KKrqRokpffrHh3AFt5SiFk+qtXh
         WsKwhVj4ihDFLLfdKNpAFbT06r7Gsblnn1RrHBY//2wcS1LiNWUht99SgqxRrkUIAty+
         Kjag==
X-Forwarded-Encrypted: i=1; AJvYcCW4PYnq0WkqA/7TcvptBZPktzXwq8NaAK/Nv9gv1it4svfO4yIRb4ZXwALfhtKNQ2VWLEgWkEFfJ/4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnfW49vSjRUTpsanYrbJJHJBAXuNdWSCluhn1frtqJ7zD/jNuZ
	6G6LwUqW+CNVcraYt3smVt1bfudhqoci9cQulWMOsGBHqizc2I2w07Tvgnp5OACbjA==
X-Gm-Gg: ATEYQzwkRrUrKkhy1bP8LV0JHi7pOUKDXc4QNkfRKzlgU6QOM8VafogOf4OeghPxiya
	i9GXFeQ8rMTEzinmzGXkztd5OtXXcwB6VtKQuK7SVvTxTS5toaaqBC9KpbRgUcxr2zNSZhTi/Lp
	bdVUlLnPiTBoJZ6IhpX5oFHA2qSeM5M4xg8M6v2FnmPCOTWEH0FGTBnzE7+jM2Xck6b/rt2Y5+a
	mBm1HQGCZ0ENyEH0bvraz9sSmpuIZOcVkFFNdz3zzPK6dOYvUbPzWyh9hg7umrpk4TRlD6OSDW9
	7PrjTpBozK4XYXVYPkgx4i+HX+A5/sWWnMl8/oFpdZuz7zfZxTWLRaLItfAcyz5fyJAni9/05ck
	w+EysvQtkN4ZiZxXn11UTlnVB9ORpDZRP7m9PR1FQR4KKufMSHCfUJMClJUypIQdC8pYbbDNGS8
	hltq39CNcug42w+rUye/Fb/p4uCsb13jwNXrL2Zn6FM8Alpbo1k9qdHqlNBQE2IQFXJCFJbTYZk
	xh8DX83OWkCrlk=
X-Received: by 2002:a05:600c:34d0:b0:487:2651:dd6b with SMTP id 5b1f17b1804b1-4888359ac5bmr58215705e9.29.1775045019310;
        Wed, 01 Apr 2026 05:03:39 -0700 (PDT)
Message-ID: <87ba5427-ff89-44f9-aa4d-35f9ac05081a@suse.com>
Date: Wed, 1 Apr 2026 14:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: rtds: prevent extratime priority_level
 wraparound
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b6e65a9fb94d581a31e1d06b241522c17a7863cc.1774943670.git.oleksii_moisieiev@epam.com>
 <5b1e5de7-b2b0-4dae-bbe6-03809637d239@suse.com>
 <2e6e0203-da8b-4261-8817-f4590350f8c9@epam.com>
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
In-Reply-To: <2e6e0203-da8b-4261-8817-f4590350f8c9@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1775045019-4792ECD1-649FF7FD/0/0
X-purgate-type: clean
X-purgate-size: 341

On 01.04.2026 12:42, Oleksii Moisieiev wrote:
> I have an R-b from Juergen. Should I post another version with "Fixes:"
> 
> or it could be added to the commit message during merge?

It can be folded in while committing, sure, but first you need to collect
a maintainer ack. See also "The meaning of nesting" in ./MAINTAINERS.

Jan

