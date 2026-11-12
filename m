Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A50B606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=R9oKnAg9
Received: from list by lists.xenproject.org with outflank-mailman.1485368.1688590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRXB-0004FG-LG; Thu, 12 Nov 2026 09:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485368.1688590; Thu, 12 Nov 2026 09:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRRXB-0004F9-G4; Thu, 12 Nov 2026 09:55:57 +0000
Received: by outflank-mailman (input) for mailman id 1485368;
 Thu, 12 Nov 2026 09:55:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRRXA-0004F3-Mz
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 09:55:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRRXA-006F9G-2a
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 10:55:56 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af58d1b-2eae-0a2a0a5409dd-0a2a450bdd4c-32
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:55:56 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af58d2b-b7e8-0a2a450b0019-d155802cdcf7-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 10:55:55 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so49988805e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 01:55:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb51de7b91sm25348125e9.6.2026.11.12.01.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 01:55:55 -0800 (PST)
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
        d=suse.com; s=google; t=1794477355; x=1795082155; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMtgbvwOSwc2en+3aRDLSPIcqsvGN2d+qVVWpax/JDY=;
        b=R9oKnAg9y8ajoG9UhmwxxFtYfb7j1aGih3gllh8dc5fQX2da1bW/snBYT0nilCMKQv
         8vSfZshvmpYzwnfylahYd7oIwRJVfEipT83S8/3ze8qj9Dydt0o0YWfLuK8iz2RXTM7B
         5TKIWtJ5JDu1wIYsmhHPpEWPUsVij5u2YVBoWWCSKTU6NoP9tHBiGIN9/FHZxx2F/NbF
         xOajNsI67HSPfnzp9yEGU8wsaoGsWiYfhs3yqK4m2iBvQPabSvKFBARpJv74MIi9/scl
         +fR63prRiECg8h+MUvClBQRDZA2ovMqs4Zx7Gx+MOxlBl6wP4IYx5jOpbcv09+3icXqh
         cYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794477355; x=1795082155;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMtgbvwOSwc2en+3aRDLSPIcqsvGN2d+qVVWpax/JDY=;
        b=tFwXyzTfQcPc1Mzv4XiVY0tknK5zgkK7EP6In3xSBMwhD62S2QC421+SgUfVzaR0qR
         55zpr/boPSl98BGnm+1JUqfZfjdB4q7b/iJvG61gNGwWBZNsbc9TmNAYRX3DOBxOh+6d
         VryEj4lsKCXKbI6ijPqduynQtAtF8Pk/9OqSgRnTSojXZ83657KNHR/GnL4MVUjtwDyN
         NiOuOaSt6Fr/CiBtnoaqfFTvFzbbPi/4NrMAQyhA0cwqLtVw5BvF6RLMvfKij8M7Lq5F
         uauNviKz3fR31TN3T7fw++FsP6li0kt6WcF7g1EM/W2J1GLnZ44nAYargEBA5WHfE6To
         EIHw==
X-Forwarded-Encrypted: i=1; AL+hErHE1+bq+DPgsw27ilx2nkZUbNOZKDW5bukEbymdCjoeO6+whllZDuy5YBBppsMlpVAyJYou0udcNTw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+vsWXQjW1RP8w5PCyC0z4X0a++hcpRvK+YzEEI4zSPS2fJwhvc
	+6em7RSr+owc/37QgwpnPTFUaZeiAR6IH596NXbxBcej0YVS7FUlA3SwODbnwpJg7g==
X-Gm-Gg: AYBFou27IfCmmZ14vp1EYlCgHEhljd6I+wrz3e6a9KYlp9O0KBOOjfcfjsg7MqGMW1q
	fJBw56+DJnGdYsb7pNJR7VN+TwUS9U/YGya261p4f4zQbB8etOsyasZRlyMFFixcg7ISnbfIoqb
	zUP2ieUZz0HKde2lrdaMzwphmfmG2CZklHvDtLzHsupyZvLRuj7EmyTSLgHVntuXXFRaDei79N/
	QDM9GsehFZTAopD5egw3qHeRf4gakYcUqDFC6hxPhrIx6P4Td74tJqp0lYEJQJZLvh4nTWMOZus
	yvXLaFglHWMSmzHK+Wvm1Ryvtr3D7em0XCK87Vr6twC5sVBYD3w0vJpD23pq9sWM1JsI4PuW+0k
	5mtEEZsqqKZY7Um0vxskVtMEo3kPDAFEZfcM1WQS2bUDBJnvC/u0wSLfGqk3Qv8SE9CaUmilSWZ
	qlGNWOA9S7HTaKhU4zr/S431n6wJiCFFJLJnkGGCimuuX6hI2LoUwn8cFTlgJiU9JkNFbmSvECM
	nctVXJyI1NvOxDGoKjU+cZEqBx9UHiMDGzWKDlDFxCqOqxCxyREMDz0HLT6XtCpSqJJyspx6Gx9
	UTIejOvfS0tHod3UNSRBkKdZG349uqLsMeV+6oCXkrsDsQlnwdKu7RfyYO95XLqpDrPLDoUVYFP
	aMzoPSUqpDG6Qg1lW
X-Received: by 2002:a05:600c:8b24:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4ba0938a10dmr87173065e9.19.1794477355506;
        Thu, 12 Nov 2026 01:55:55 -0800 (PST)
Message-ID: <3bfdadf2-6e5a-4533-a3a1-d8c86b0bb9d7@suse.com>
Date: Thu, 12 Nov 2026 10:55:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/nestedhvm: process the MSR-load and MSR-store
 areas of L1's VMCS
To: Mahmoud Abumandour <ma.mandourr@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261112045230.1043334-1-ma.mandourr@gmail.com>
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
In-Reply-To: <20261112045230.1043334-1-ma.mandourr@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1794477356-AB8D19EA-596E9064/10/78276251493
X-purgate-type: spam
X-purgate-size: 898
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 05:52, Mahmoud Abumandour wrote:
> Nothing in vvmx.c reads the VM-entry MSR-load, VM-exit MSR-store or VM-exit
> MSR-load area of L1's VMCS, so L2 runs with the listed MSRs as the previous
> L2 or L1 left them, and L1 gets neither L2's values stored nor its own
> loaded back. Process each area where the SDM does, with the SDM's checks,
> an entry as a WRMSR or RDMSR at CPL 0 that L1 does not intercept. A bad
> VM-entry entry fails the VM entry with exit reason 34 and leaves the VMCS
> unlaunched, a bad VM-exit entry is a VMX abort, which crashes the domain,
> and IA32_VMX_MISC now recommends the 512 entries an area may hold.
> 
> Fixes: 9390642b7fa5 ("Nested VMX: Switch shadow/virtual VMCS between n1/n2 guests.")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


