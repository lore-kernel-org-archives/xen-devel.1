Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB72CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 12:03:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446209.1662278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGEkh-0001q0-UG; Mon, 12 Oct 2026 12:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446209.1662278; Mon, 12 Oct 2026 12:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGEkh-0001pt-RV; Mon, 12 Oct 2026 12:03:35 +0000
Received: by outflank-mailman (input) for mailman id 1446209;
 Mon, 12 Oct 2026 12:03:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGEkg-0001pn-U2
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 12:03:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGEkf-00BqU1-Ib
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 14:03:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acccc93-2eae-0a2a0a5409dd-0a2a4508c6f2-2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:03:33 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acccc95-f659-0a2a45080019-d155dd2be41f-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 14:03:33 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48b0ef9c76eso1496151f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 05:03:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9462ebcsm19780624f8f.8.2026.10.12.05.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 05:03:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1791806613; x=1792411413; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/5uWLhmc5giyZICWRpR/uieQ7PcO2wnmlPt6EKMsCk=;
        b=WOQbrp+A01aCK9M0yb2QKLsp6+g36cqjoReAgT2ihN0C9AF8z7738Mj7YKvEDLHz6k
         tposxIXuo61Gn/tFpBi8Eo592Ak7wqkBi8sPvT7zQfqVNZccelkG0jmagH/zoAtSDeqv
         skdbgMlbgQC/Dj0vZXQZLFALV/HRO2Q/nokCjOgSZHoWpgEvlMo83i1V6CP/mgwgHckW
         hTy5dLZZlRMn+7b2Pky4yNvbS8L3YvlMd2F0h664cx0w+MTFl9KHaN59LdYtf8Jrll4O
         Kfo5jNzK2vePfpfkJ7ZzEJAi3CUZk0tZkFP+HM175liS9q3J2abBsky7yr0V8VYgKOqK
         wcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806613; x=1792411413;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g/5uWLhmc5giyZICWRpR/uieQ7PcO2wnmlPt6EKMsCk=;
        b=dZtocQs0AwnPbpXtwGvfIElZiiEox9zFs6p0upRokAAE2nwwWYwNzEi/A2LYbOHqEw
         D+3cguxHwEjJ/14t1Z7uafhCOfSCBy6Y9X7zg7tVQIK9o0uzDWzLDILCWdtwCSDSOovh
         msWFucpyc0yDxXeJwWyCktrla19uoz2ddi2jY/aL3Mv0lZePO/20AsykwSgc+WWRfFEc
         oiIQLyekDa7SAHdAVXfinj1oJfGCIb1roKh9aeCawxOq66zeb0A5B1+6z8QOQv+vKvUX
         UY6DE/qtI3DCwWBaGCegX8i/gU2x/b65/JCuL4KS48bNSBSjs/wh5bMX4rUok/X4VS5G
         evmg==
X-Forwarded-Encrypted: i=1; AKwUvBxD+qe2XBQVEdh2P+oKDUAFkGtPEvv72Txptup1X1Mkv5MBPueFZ17t6fDkLKxukdDyZ69PSAZ5dqU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKSSH3bW4I3ddtF3UJHOKUhwM29PSVwEBQwUOXQtoQGoJwslF7U
	yqZRdzNRJq8qdGRThhcVRmgXdIN0vpO+54+bKCkA+M8SGqDvL+grTuO+++Yqy/PDRQ==
X-Gm-Gg: AYBFou2Fpn5sNQHQBzIabnlxxx3ms/8bePabfIcLdKNfMsX4BWYCfM+HgCckBAlm7yY
	h5abGKkipietXwuf2Qzsp2ut90lW74XQwULHbrYDPItnoG3yKkood4VTL5xEzNIqCxLTUbJbcbz
	2aUW3/xbEuZ7nWKIlgp+QxcENCzGjX87gYqp3yozv0gvi9vkIUTof9uszQqEtyOXEB7hnzoHxRS
	QZd12vynVhPmlwm0RlMPNQs7Do+KPwD8HePRZ/FzXF/M9jju9PPrtEK8OFu3K/rIQhNe67CP5xS
	YqaLoR6+sJwgdMohdLLXkhJeo+92wtsQ3LlLduAaE6pru7YCO8ebQmvZhKj20Q2ckM0vMKdYpd5
	bwDFLXMnMbd4In7mAhk53dfFx+xEzruCBtXHcGjYHvQ+rS8Wb2NO+XXRgf6qyZk0fFW8tMn02sp
	y0adBFPaiO8L2Q3NIQ5vdxr1VGaWexlnr+cgDQhZwZBCM/VNgZuJebymd3OEC7GJiZQBh9PEwrU
	Rklmg+fxP58WsXdxKyBsDK7H+tuq8L6m9XdVTipUf7wjLajUG0ws90QgYt+/A==
X-Received: by 2002:adf:d002:0:b0:48a:f11a:c34a with SMTP id ffacd0b85a97d-48dbaaecf8fmr13540892f8f.52.1791806612700;
        Mon, 12 Oct 2026 05:03:32 -0700 (PDT)
Message-ID: <b2158d78-9a43-4d18-a64e-b3dd88d13947@suse.com>
Date: Mon, 12 Oct 2026 14:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/svm: Sync nextrip during virtual VMRUN
To: chunjie.zhu@citrix.com
Cc: jason.andryuk@amd.com, roger@xenproject.org, ross.lagerwall@citrix.com,
 teddy.astie@vates.tech, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org
References: <0835710d-f67d-4678-ba39-4597b9c9c7f7@citrix.com>
 <20261010040502.96413-1-chunjie.zhu@citrix.com>
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
In-Reply-To: <20261010040502.96413-1-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1791806613-D654487B-C3ED9869/10/78276251493
X-purgate-type: spam
X-purgate-size: 967

On 10.10.2026 06:05, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> NextRIP is consumed on VMRUN as the return address pushed onto the
> stack for injected soft exceptions/interrupts.  nsvm_vmcb_prepare4vmrun()
> builds n2vmcb from the virtual VMCB on every entry to the L2 guest, but
> never copied this field, leaving n2vmcb->nextrip stale.  Injecting an
> event in this state can wedge the L2 vCPU, as the APM does not define
> behaviour for a VMRUN with a garbage NextRIP.
> 
> Nested virt is only offered on NRIPS-capable hardware, and NRIPS is
> required to be advertised to L1 (see start_nested_svm()), so the L1
> hypervisor is required to keep NextRIP correct.  Therefore no
> conditional logic is needed here; an unconditional sync suffices.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


