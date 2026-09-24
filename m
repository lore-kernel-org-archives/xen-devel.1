Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987DFC98321
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 15:02:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432503.1653746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9kwy-000139-MV; Thu, 24 Sep 2026 15:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432503.1653746; Thu, 24 Sep 2026 15:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9kwy-000132-Jo; Thu, 24 Sep 2026 15:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1432503;
 Thu, 24 Sep 2026 15:01:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x9kwx-00012d-Mk
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 15:01:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9kwx-005rPT-3I
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 17:01:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab53b40-bab6-0a2a0a5309dd-0a2a450cc5d4-28
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:01:27 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab53b46-f479-0a2a450c0019-4a7de18d8a9f-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 17:01:26 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e6b885ef8so12625575e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 08:01:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdf9691e2sm148828515e9.1.2026.09.24.08.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2026 08:01:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1790262085; x=1790866885; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fo/K6E6my/zZjyksIY1zyo7gKRSPCXkbVyYhlm4zKE=;
        b=OzrnFD0Wvya+zk/ZSy2sotzkyIymHaJ3UZn39Q/R/8U+ngFAeRhUg8UH6QwssROta8
         InzA01oCoPpsTrA5JO6hqqLmpfZ/MGaCSLNrqEmNj6tYObu6mXgdGwAON373lRBZgqOf
         j44aoK2lr/2qyd0ScLa6m5ivKnF3lZsOZjWkbc+HP8Q7L9qcBT5gGRWgjfW7nlG5Zp6y
         TUJGMzUqAakatsi+fXPkxug2KVUkxY+hEM3EBFKGQ7YXyB1oAuZmt06yHkO1DtM/irU4
         7RV6yCkTaTCGyevNzqSN9glnmJz4puqAsXRrw5HcFXre6FKrO1tvLPG5Cc22fvVcddZS
         N2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262085; x=1790866885;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2fo/K6E6my/zZjyksIY1zyo7gKRSPCXkbVyYhlm4zKE=;
        b=VMXLkV0H37HQb5NwIHTtNB19tXyzK4lblmjRftpeiDbGNoHLKT4LbPaRykgaPRkqso
         EpPo/9nA5sZLaaoqvY9GRpZ7IdV/QO7Bwj48r3L+ro46++pEviQIn5cwLae8qdCYUCFC
         MMhB+9BzAA8bQfVY00FW0Hq3nRiugE7o1HrW1uLiWRFWW5UecTOyfud306I1J8Rc8fVw
         AsuELdV4Ys7JRVQqmBkFqs/EZ3xaGBqEvDlx+rHP3lXFZNjOhYpPNjj2Qh0uSGGWlmyt
         WLHJQR9pLJz/9l6KYDbQexTM0SRS29rNtAeekE3zSNVprWovW1+fdc+fm06V73mNWlTH
         LIJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLRkB0n4ElRZFuZ7EU6nFCSDS8vYGTLAigyh5hughxtG9BiiOquaOYuZ9h8PlQeiO7fYOdtGYujww=@lists.xenproject.org
X-Gm-Message-State: AFuF++nryDQ4YqBOvBlEDq1sqLZDqwIUlkcZMe8UXHw/vZanNGrU2QFI
	oTg9hblsw3+/JBGE7yfTDb9vpbdI1OPikr+hjgUYEMkJX+DgEQeyzeGyTzZ5vf+/dQ==
X-Gm-Gg: AYBFou3z/6CedAEMzOXCn6ohMBdRKl4fuCK5sG7XqLJXxl2u/crmqj0MFhH7nBbfQsp
	bUAEHnNYpHNfKbTjEya0zhSPu9aym6MAoAE8bYvEWkgtfFM/T1Jmd2bSrGzXYLtSmVtDlNYmXwA
	Wkwdkh48Aw5t0NyBZYpNNgWV65sVLHJHa03rcl+NaNjCfgRCMBzvNFbAnT67gq3gFXi5JK8x/1k
	TLjxiKu49CBXT/LrIi/P6f4YAjNt+AXt5DmlKIQ2J8vEcnzEIPUI6Xlg5VwLpncw2zB8yfl2DOl
	ONJaffeKXsxCsW38zjfwD5SGn/Oc1DeyLd2iMsHjUb8flFiNof0rET2mNE3SAZWN/K8XqTaKIOE
	D2qglYd78PCRUM+2Q/N+xe3nIfH040vGUBQCNku1Y6RFFhF7vk5Ybb0rydGr+oV2mWvP6F+nTrp
	07DrT5i8wf7532YVTv7kl0isMWepjceIKFIGOibYI9XTxx4HBvKJ1572JSJ/iqyKB1K0mgG43hg
	AZDm7zrgqZOD1lqUKk1wcJHRxkXQKFBCgwtvgGvLMjzj98mYhGK+gU86zqN1w==
X-Received: by 2002:a05:600c:314a:b0:49e:6778:c2bd with SMTP id 5b1f17b1804b1-49fe66c86bcmr51828755e9.6.1790262085556;
        Thu, 24 Sep 2026 08:01:25 -0700 (PDT)
Message-ID: <711e6af5-beca-4b71-a2cb-75cb1ed93689@suse.com>
Date: Thu, 24 Sep 2026 17:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nSVM: Save L2's CR4 on #VMEXIT, not Xen's
To: Ross Lagerwall <ross.lagerwall@citrix.com>, Lin Liu <lin.liu01@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <a5702b9bc1d354dac5778deacbc397e76530408a.1790069475.git.lin.liu01@citrix.com>
 <38c41bfb-48c6-4408-8da1-2b7d730a6c9e@citrix.com>
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
In-Reply-To: <38c41bfb-48c6-4408-8da1-2b7d730a6c9e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790262086-002F0A5B-05CE255F/0/0
X-purgate-type: clean
X-purgate-size: 1666

On 23.09.2026 13:16, Ross Lagerwall wrote:
> On 9/23/26 10:51 AM, Lin Liu wrote:
>> Xen leaks the host's CR4 bits to L1.
>>
>> nsvm_vmcb_prepare4vmrun() constructs the shadow VMCB's CR4 via
>> hvm_set_cr4(), and svm_update_guest_cr() ORs in HVM_CR4_HOST_MASK.
>> nsvm_vmcb_prepare4vmexit() then copies CR4 back out of the shadow VMCB
>> instead of the value kept in v->arch.hvm.guest_cr[4], so L1 reads back
>> Xen's bits - under HAP, CR4.MCE.
>>
>> Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Lin Liu <lin.liu01@citrix.com>
>> ---
>>   xen/arch/x86/hvm/svm/nestedsvm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
>> index a8b15d6eae..8d99b0affc 100644
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -1082,7 +1082,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>       ns_vmcb->_efer = n2vmcb->_efer;
>>   
>>       /* CRn */
>> -    ns_vmcb->_cr4 = n2vmcb->_cr4;
>> +    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
>>       ns_vmcb->_cr0 = n2vmcb->_cr0;
>>   
>>       /* DRn */
> 
> Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Did you consider addressing similar issues with the other state copied from
> n2vmcb as well? i.e. I think something similar would apply to CR0, EFER, etc.

But (assuming the above code change is indeed correct) wouldn't we better deal
with CR0 then right away, rather that leaving things even visually inconsistent?

Jan

