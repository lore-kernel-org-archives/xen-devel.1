Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3CFC55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 13:56:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382183.1625554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrFcg-0003Sz-Gi; Tue, 04 Aug 2026 13:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382183.1625554; Tue, 04 Aug 2026 13:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrFcg-0003Ss-D9; Tue, 04 Aug 2026 13:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1382183;
 Tue, 04 Aug 2026 13:56:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrFce-0003Sm-CX
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 13:56:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrFca-00Box7-1L
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:55:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a71ef6a-e002-0a2a0a5209dd-0a2a45028796-10
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 15:55:55 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a71ef6b-6ca4-0a2a45020019-d155dd2dd0cd-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 15:55:55 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4799b3f7c83so3027752f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 06:55:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e2484sm45261033f8f.11.2026.08.04.06.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 06:55:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1785851755; x=1786456555; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9h9+fq6Jp77OyWF1yf/69cNg6J6mI+PxR6Z5EORHM/I=;
        b=A6DwsTGd+HY+bgcER38rKTb3mqFqy4B1SUT2vBjqc1s7KIBepArPAEuFmHczZJD/c7
         Dd5g2TBrnKpGi/F+ljRnIeII4+gwmxoFVkJy3g6gucuKlOyCP/ETCULht0IiUmidG0jR
         w4nyPinBtSgZ+lmfSF7vNdYsSi49JvdyTpAIWd58hLS3ob/4j0rY2wg1YIpzWEFLjZGY
         XLKzcQktBgZVYUWwBf5HH+q/JbJB85Sls8Y5BVhyO2JZdyOBS1pVB3QVP2Y42ych/ehB
         VasmNbstisrQ+FAKwO8T5wOTn3QhbhUpaq6YRlm3lSeDKbyTUiPk6vs57ljVE2Ee8e7T
         WRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851755; x=1786456555;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h9+fq6Jp77OyWF1yf/69cNg6J6mI+PxR6Z5EORHM/I=;
        b=TG4K0Mtc0xfoEwnit0Kv6gXkXfGQ57M/72TuL/YmIkmiyT8Gamg/E5FVgFLjWtMuTQ
         wPxnFQ30EAiEe5HggbtYRcUceGZkRv/wb8Tj9CVhOj7QstW2FWBZXs4jvEatbQJ9P59u
         N8IrY0p0vUFU6E6sqf6FeARft4nnS2C/DMV+fIBAcdwP9H69PTfkHjbH/p28EY9ElohH
         NxHBXKpM2G1v7C8dbza0uiIOHTRkYgbvpmlsAt782ZJZ/D/dCNY5O7MKLezfbF5NRSCE
         7d/sJeOW8bpXocmNxuW1RSq52r3ytWjKWZ4VwYvMu/G6Q7aPttVRSI2alcF4e/f2qOx6
         QP7g==
X-Forwarded-Encrypted: i=1; AHgh+Rrwrtpq96DvpN+k7nh0fYx0juU2E7BUNoqBJsxE4ul9IjyJNTewi2VL8XdF3TRrQ555yT3jaCYNP7Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxg27Qluu0/SHAXTHKkKClfSP9yGvE7Cb0ItdytH7/7aHAQ3cAx
	EWrgjIbbwttXxcA9U+SfpOEp4YDP5QdsvggUupdgOjqOQ/S2j5V93ZCecjhFTRungw==
X-Gm-Gg: AR+sD13rYj3EYIna8iuXLThwAUzFUUlo9oVEY6J/h0cmEx+GeCqWIXmVo9DSz2nwQFn
	UJ6hNgwmXlESDdiXIYaH/eh4xqcCIgUYM1YdVHP9QY4Yc+nosbbFbzXUV4mEW/5U6sPcjVdLfz5
	yDWV2fL732FHFv9Bef0FOJcdH8P1XlmKr6NrK7xZAfrDHEMnglCCKUV1z3giqLhgdJe2zF9I3oy
	U1E0q6VSTL06bylr3GZ12mwNDlcr4qFAotHE1Ax66uyYCUW6IWmFw00RREiBA3l5uhP6ajpppMB
	fCYaYCPIMl58ve4GBpdjzPmqSSmHfgwIH6vjfVthDOruy+ruMP2UnYru+m08tcxRE+0Pb4/NjAp
	aV0LEPHP0vI1tZKnWXtA5njV5rx6UJTbro5DaShmpNLIjrvU5aE4g0a2igyc40+7AD3zZurioXQ
	6MA5F24OShkPvLXCh5uTwr7/ReQOT+/y4dAgyjG4NiAQz5sH8aZ5IknWYVBr1q2/mbGUHLD/e/I
	c7X2kgTkm77eDSKNJjWL7xVvhZei+IeyjD8i7l5PN+MYdlWRrJu
X-Received: by 2002:a05:6000:40e1:b0:47f:8b1f:efa2 with SMTP id ffacd0b85a97d-47fd729e88bmr37834347f8f.8.1785851755310;
        Tue, 04 Aug 2026 06:55:55 -0700 (PDT)
Message-ID: <28d4e98a-2fd2-41fb-9f1c-c5f4768989f9@suse.com>
Date: Tue, 4 Aug 2026 15:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] radix-tree: drop radix_tree_init_maxindex()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25cf9c88-7589-4a5d-994d-45f488a3e00b@suse.com>
 <c00db623-82bc-4d7f-924f-25f35f8e057e@citrix.com>
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
In-Reply-To: <c00db623-82bc-4d7f-924f-25f35f8e057e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1785851755-F0AA52AC-0FF330C8/0/0
X-purgate-type: clean
X-purgate-size: 2864

On 04.08.2026 14:58, Andrew Cooper wrote:
> On 04/08/2026 1:30 pm, Jan Beulich wrote:
>> Radix trees are in principle usable as soon as memory allocation works.
>> (Radix trees with only index 0 populated are usable even earlier.) If only
>> there wasn't height_to_maxindex[], which is filled only by a pre-SMP
>> initcall. The benefit of this array is rather limited - the calculations
>> done by __maxindex() can as well be done by radix_tree_maxindex(); the
>> overhead isn't all this high.
> 
> It's quite possibly lower overhead.  Some simple integer arithmetic vs a
> memory read.
> 
> I think it's worth noting that this was found by UBSAN on a
> multi-segment system:
> 
> (XEN) UBSAN: Undefined behaviour in common/radix-tree.c:83:27
> (XEN) index 12 is out of range for type 'long unsigned int [12]'
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040323f9c>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd5
> (XEN)    [<ffff82d040324d91>] F __ubsan_handle_out_of_bounds+0x9d/0xd4
> (XEN)    [<ffff82d04029265a>] F radix_tree_insert+0x24d/0x570
> (XEN)    [<ffff82d04037ac3e>] F drivers/passthrough/pci.c#alloc_pseg+0xc4/0x165
> (XEN)    [<ffff82d040a3b526>] F pci_add_segment+0xc/0x1b
> (XEN)    [<ffff82d040a5ad1b>] F acpi_parse_mcfg+0x29b/0x344
> (XEN)    [<ffff82d040a3f612>] F acpi_table_parse+0x5d/0x92
> (XEN)    [<ffff82d040a5bf55>] F acpi_mmcfg_init+0x3a2/0x71d
> (XEN)    [<ffff82d040a71ba6>] F pci_setup+0x17/0x29
> (XEN)    [<ffff82d040a784d0>] F __start_xen+0x394c/0x4ed8
> (XEN)    [<ffff82d040423057>] F __high_start+0xb7/0xb8

Added in.

>> Fixes: 21844b0e32e7 ("PCI multi-seg: introduce notion of PCI segments")
>> Fixes: 8dc6738dbb3c ("Update radix-tree.[ch] from upstream Linux to gain RCU awareness")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> All the UBSAN violations are gone.

Good.

> FWIW, there are still issues on this box, even after the fix:
> 
> (XEN) setup 0000:fe:00.0 for d0 failed (-19)
> (XEN) setup 0000:fe:00.1 for d0 failed (-19)
> ...
> (XEN) setup 0000:ff:19.0 for d0 failed (-19)
> (XEN) setup 0000:ff:1a.0 for d0 failed (-19)
> (XEN) setup 0001:fe:00.0 for d0 failed (-19)
> (XEN) setup 0001:fe:00.1 for d0 failed (-19)
> ...
> (XEN) setup 0001:ff:19.0 for d0 failed (-19)
> (XEN) setup 0001:ff:1a.0 for d0 failed (-19)
> 
> These are the PCI devices for aspects of the uncore, mostly performance
> counters it seems.  Despite the lack of information, I think the
> complaint is about setting up the IOMMU context for them.

This looks vaguely familiar. Are these devices properly covered by the ACPI
DMAR table? (In the instance where I think I saw such before, they weren't.)

Jan

