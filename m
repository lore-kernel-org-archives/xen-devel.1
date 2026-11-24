Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AED606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=d0VYeUKP
Received: from list by lists.xenproject.org with outflank-mailman.1500927.1696969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqaE-0000ip-9i; Tue, 24 Nov 2026 13:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500927.1696969; Tue, 24 Nov 2026 13:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqaE-0000ii-6t; Tue, 24 Nov 2026 13:29:18 +0000
Received: by outflank-mailman (input) for mailman id 1500927;
 Tue, 24 Nov 2026 13:29:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVqaC-0000ib-E8
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:29:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVqaB-009ao7-G1
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:29:15 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b059124-bab6-0a2a0a5309dd-0a2a4504a1a2-28
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:29:15 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b05912b-b57f-0a2a45040019-d1558034f0ed-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:29:15 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so44347235e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 05:29:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a12acsm466193495e9.8.2026.11.24.05.29.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 05:29:14 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795526955; x=1796131755; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rwPS31ckqh1nJivsb+NAwv/ALVoZkp7iu/jxU0uI/vc=;
        b=d0VYeUKPCaClFLaTAVmPbi3fjQ3vGbn3h8i1bxJ4InKtKNcLpK1bEtrz6KHnP85Q6G
         zn72GiUFms7dLnbfHhruyiZSH+QdqYNVRweKtsHmnHqhzI2owqdmePAOrqc8xsFs9zvr
         R6kbwLIcSc5qRe6kXnUWQrJo5Jm7kepAlH4tU9JkTNJd87wouH75U7V6EjCTUpoahcfP
         b1haaSMXgz68YBVy/qkJCdxuekONnKrVcuVMznMcxRpNUY8o1X3uuTuJcgUnhepfi4ty
         4IM8zqGh+GOhzZPNeR37ZLhppdpp2rcZHl2Ny5CSLL6m1cD6LmsmPjro4KFqI4YVA/GW
         qc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526955; x=1796131755;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwPS31ckqh1nJivsb+NAwv/ALVoZkp7iu/jxU0uI/vc=;
        b=COrgTf6J9Nxz9LZXgNsYOEVMTe71h0K0WUo7+KE49rhlzc4HiTh1RUr6SOYG77kJzp
         AvBB4I422hhWBFfPBrCy1MHaFpgfKunTQssvID/Gn9+E/Gz9taw0gvHLBSbpw6HLPS9w
         J6QYu2Zt5U5C+zGS2SeLiEG2mRxOmt/zsTPajkc0ND+lK7t7PdMOyMyDvSZa44buC33m
         ANfMrVDtf60sKkfzBqhlfdNRgbFEcGNVYIUI5X9O4VMKX64AjNRQ0mRvxA2y97+s2f9W
         xkqwQTMrybuHMYOn7SlmG2hoFnIkT/C8l6a4FfivPGWNl6IxwFNW5QB/JODjAzWLW17E
         t/NQ==
X-Gm-Message-State: APuU4Z9deeTGnDSzBsSdCD24RV9RTTXJM3JhGfEzxt5dsJwavtBTyEkJ
	pqFWkMxNueTKj05BdaAssor38qkhEwxD4+36o4Y9SgjYmq76Oq7XyOK7eafHzl7oEEsl5CHGmDS
	7kge00g==
X-Gm-Gg: AZFdTZdM5KUMvmIBfoaw4wx+Vjmyfvp2HVedAIFBUsjsHL9nPr24kn5UWY5JRwdesvr
	l4BrgK4ngSqzXHsFzg+dtfzgLBtz4mHVQZ0CVsNPhrNl+sDiYB5aYSHxIM2h4Zs5ep0queRQKWF
	BBYEYBHQItAJhw9PO6dmrQUSaavkBAGPAk3G725ahAChivKh6do/jZarp3fBEM4Pxdbj2Dn8ZJ1
	zrOrzgMHyh9BZEjroPDqeC4O1rwb8oSVG/86HA9Ov4xwDtDwH28lr3CYB3WHqB5s81A61PTE96E
	4vlstdEJ+PDD+NAkr2LUuAv0pU0RHsvK/aGWQ5AXybEkTcW9e0oodPImEa664L+odQvNzGxSLF/
	5IRRObkTaW0iuz8BXXLyyGA6n1wZ/+v1B276VsWp2c7rt+4gO0ExZ0VyoqFv5dun6jklOi62JJw
	nTVXj4NGDj7DDMUfr5oBCBBdw9ubnMNEBtkLLPbNmP7gC2ZLI8vqxAL4m5UqDD1nJBRQgGBdwiJ
	OqG0t9zW41fyMTGIpnJ6TVgALS1GObmQ0+rssYToVxw5YdsIcGH5EMLpH7IrkQksR6ywZKazjO/
	q6C8XwJSOlEuWKpfgMJjOR4dW83zWqs0lSSjx+stTD73RxZm6VSdR1uesVw0myZQIblEAgUe4bl
	g/kIxhtU3YoS6RrxZF1tKjPUjgMnhTMIBXIjVjqQ=
X-Received: by 2002:a05:600c:820c:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb887c29b4mr265702135e9.1.1795526954845;
        Tue, 24 Nov 2026 05:29:14 -0800 (PST)
Message-ID: <ba2a2c31-24c4-4ca2-a2db-fa3745ce2fcb@suse.com>
Date: Tue, 24 Nov 2026 14:29:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/PV: descriptor read sanity checking
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1795526955-C18D1B50-D6C080D6/10/78276251493
X-purgate-type: spam
X-purgate-size: 91
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

1: correct descriptor read sanity check
2: modernize descriptor read sanity check

Jan

