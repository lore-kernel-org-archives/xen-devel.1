Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F28606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=T7ceZ322
Received: from list by lists.xenproject.org with outflank-mailman.1461195.1672158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJe3-0006Ye-Vk; Mon, 26 Oct 2026 12:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461195.1672158; Mon, 26 Oct 2026 12:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJe3-0006YX-Rj; Mon, 26 Oct 2026 12:17:43 +0000
Received: by outflank-mailman (input) for mailman id 1461195;
 Mon, 26 Oct 2026 12:17:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLJe2-0006XM-Es
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:17:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJe1-000c4v-Ni
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:17:41 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf44dc-e002-0a2a0a5209dd-0a2a45079fe6-36
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:17:41 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf44e5-b4ea-0a2a45070019-d1558033e807-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:17:41 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so20053605e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 05:17:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a033702sm155233405e9.2.2026.10.26.05.17.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 05:17:40 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793017061; x=1793621861; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+W6PeX4GmvRkkb4eOw+rF2gvfiA8AP/aK0Rnf/ufRI=;
        b=T7ceZ322/Om+bm2iJR/EL/X2oMsMDIDUVIo8MNlfoQu+nF/4nPODRhmuZRhi6zjYIm
         0dDYGybAMH70qOVuOYmFqsw6bBdCkgX61FKqaivktS8Tw4WxNpKZAR4OU+PSaI8wDOLr
         1+R0uwHH5e0ZMNBJjtoehcay5XWtPXRv++Q+dYraTqWW7vWZ93fsQ4UWOnAngdpTIz0S
         oWyNI/TkJDoAp4D9b96Yd3C9AZ3P9Mqjn13l0erBfMaxxKRAQRPN2xnES7JfytXkEY0N
         sw1op9g8IGLheov8VdEisZnswf+r+y8pPN8Nh57myTmUROjPTJDkQUGV9in+zA+oJlOS
         lX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017061; x=1793621861;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+W6PeX4GmvRkkb4eOw+rF2gvfiA8AP/aK0Rnf/ufRI=;
        b=pF9I38rIhPN6CY2e/MnTd3E0Ory5hLVYBvpU+oI/noc3RNr0Fa8WmQmaYEsOgPKlzb
         USVnAp8yaH8QWcoRBQswcH/OlBvnPC5+1gLusERhaBM1pTrogeDPuwQL4muQ9VCMPlYS
         d5nDZAjCILTONzwxpyCwgJBLIvoBF7pnzQXpIJYIQLNxrt/Bd4qd22WzZ+UPdlxAedI3
         hh0DtYhm9WUlSP54x1zSNn1ts8uZqpZRb7meVOAU5MggVy55Mxoz/EFwparTJGZiOBy0
         IrZ36L9Bdk4+ield79xsoUn89eCNwyxVqSi3CCUuIcc2wsXavjaKmEk73m6IM3xqIpVB
         vhfQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3G4f8V8FMIq4XkenqPLbacp5diwFq8qKrRUiSwZQfXlTXkjtUmG7o4CgAZdOKSkiW1G77Dt109/E=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL7occENmfgYF2vLs8hkR6kZU4gZvjOtG7VZc6AL+gpkQsMHXUB
	K9WKBbxxgGyfTBT6QgnteqSG9ljaV9KLK/1fsLj6abF7nlBB8drdDLI2BrgROMgFYQ==
X-Gm-Gg: AYBFou2KajWCx8UreXsAPD4xnoAgHe4I3nlGl8vQBYZHag9UwJRD+Mp5pJOu56Cs30g
	qcUSiVawhYSlJHpWrFyqEgDZ87OTiV/pIosTlFiPSZBfAPOvBlE8pryTIHE9Ltssrl+cB4l88Np
	ybBwBidlajbbBtp5gAkTUXCkr2KTBBPd88LVrBAzyUIXbREK18t9b7t+u81QK5/uyveFRfWoONJ
	CBxuQcO4K6McBw16OA985VMjM3OFIeSqz2Ars9UegYg7zER0wcOHuPNKWSBM357MqkuCJPBjgMf
	8irVCc6pzDmzZkkxBXtKV+s7VjN9fu/m9WPbB34lqIiUNFkGdmUFp6ln705zg+hJbafOfCl2x+Q
	Wp3//mZb6FrPaXlgzNWvpco9xYt8rchVCJjZywCDznn4S/DvvrHfMq0dN4kU6ws+IJ+2i7hxcaF
	SpyhfmYGJIjJL6U00d+QaXT1wtbYZ6CV1HD4DSR/tYeaR1unxX8KMAIfcHmL4vOIfZ6bkAMmmvA
	UXvBnYmQK5nB4ZkuPSg5PsAybLwYNuEw0xl0pX+NTuGaP+M7rQlR31uNNfwOe5jxJuiSvYvs4Id
	OQLFUJTqhLeitRWaCMD3XLogIfQ0j6rCW7cKmG2zSn0ORxQC798Xjs4sAVKi2I0b
X-Received: by 2002:a05:600c:1c0b:b0:4a1:d10c:7170 with SMTP id 5b1f17b1804b1-4a35acbf94amr166524585e9.31.1793017061004;
        Mon, 26 Oct 2026 05:17:41 -0700 (PDT)
Message-ID: <061c669b-e130-4b73-a748-46d58432e49f@suse.com>
Date: Mon, 26 Oct 2026 13:17:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/nestedhvm: Inline nestedhvm_vcpu_in_guestmode()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <1792515236.8631fc262581453bbf619ec5b2062170.1a15a3be15b000f79f@vates.tech>
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
In-Reply-To: <1792515236.8631fc262581453bbf619ec5b2062170.1a15a3be15b000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1793017061-35EC6AE4-912AD6AD/10/78276251493
X-purgate-type: spam
X-purgate-size: 533
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20.10.2026 18:53, Teddy Astie wrote:
> --- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
> +++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> @@ -28,11 +28,15 @@ static inline bool nestedhvm_enabled(const struct domain *d)
>      return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
>  }
>  
> +static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v)
> +{
> +    return vcpu_nestedhvm(v).nv_guestmode;
> +}

While converting the function, can't its parameter also be pointer-to-const?

Jan

