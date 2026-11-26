Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD8C606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=EevYL8FM
Received: from list by lists.xenproject.org with outflank-mailman.1503494.1699215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZjr-000850-GN; Thu, 26 Nov 2026 13:42:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503494.1699215; Thu, 26 Nov 2026 13:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZjr-00084t-DF; Thu, 26 Nov 2026 13:42:15 +0000
Received: by outflank-mailman (input) for mailman id 1503494;
 Thu, 26 Nov 2026 13:42:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZjr-00084X-4B
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:42:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZjq-00FwPt-GP
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:42:14 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b08372e-8faa-0a2a0a5109dd-0a2a4503cd28-38
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:42:14 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083736-fae8-0a2a45030019-d155dd30c9e3-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:42:14 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4ac109a8a12so4152276f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:42:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c61e53asm43638885f8f.59.2026.11.26.05.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:42:13 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Cc:Content-Language:References:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795700534; x=1796305334; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCIylsShBT6FVIVD44wPVZkTNobrfLKsS5wgI+gfr3k=;
        b=EevYL8FMW/27F9AS/E3lMnxZtLMn1DDu7jf8fNEfiWAlWjLmiD55WvLXd1rcC0Ri25
         vYO/EMCb8Lr+nXjG5oa034b9O9/q61Y8flHEa9U8fRvSMRWlRJszQwppBNdpBwn5faTB
         YIJyAEjoIunzfB8Ty6Cw9SLN7gvYmzlhFrHxkW1JyppOLeSubTuYfqJbIU4Q9d0YzPgQ
         IsWcJzoq/be3wxgMpMh8w26ujYDPXkPEV5J6uw2eJAL0jCB2w3Rf4Iln9TlrlFDo8Mct
         Tgyeo0aurXkwk+GXPBYN1GdqQuuT05GV+W0+UKR4JyZ0g5lqAosNT0F5RVaibR12UwF7
         fTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700534; x=1796305334;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCIylsShBT6FVIVD44wPVZkTNobrfLKsS5wgI+gfr3k=;
        b=ZPV+j+AGSSFpBQQFimhCx3eBXwgIGIzrnJaS5zdFvg1P2g1nTkCcIEEeBrN6kYnozk
         JZNcPcRkfNiTk5kgDm82oSpesSES70G7fLfUwYjYJ0GNoGnhgOxt19QAW8grGAtXl/zh
         ePq6cfAVihO9DKg88aoaHGOYkDrx3kHFrvBxkZAlLFOWpyd9gTpyakM/WTq48t6XnKUy
         c1w3XMD5XNg4HK0BS13SpOkVVsGIHISEnNd+AehRhtSzzm77J2Gqsvyi3Da+rtAAwhk9
         ZpnO0SGg+yLhNl4jAelYXFXdRO8p1r5rVqnCPhfTJvpmnTnx5x9PxUXwYPzU3U+DxYph
         2cNA==
X-Gm-Message-State: APuU4Z/N/GBARYbnR6vnya5AIdF48AJmzwqJ9mgprWLsKwWe3Z7NEs5L
	htVKpuhsGTQJtMVlrWj77EeNjQjL8alWzq2KSt3i5fhsJ33q992Np3khndlXG2so9LRhK9e9oF+
	6Iu9yFQ==
X-Gm-Gg: AZFdTZeA1htkhwkRew4rzHjDpGWkoj0lc0vyrxmvaKfUzo1AngGY2Afukc54nHi68t5
	bwE9mj756VJVan7VuKADsoIhYsyegkx8jjj2OiHo8Y2QYgMFQJRN1oz32fUQQmNiVWlz+656NAh
	ulA1KcrWoNeU8w1q3sz9+sUZeVWBOfWeAJxzXeK8FXxhIkUY52hCAKIgwHzV3VdgVO0lmlQfrQu
	g1ZABa51Zg5O1IXfiDZJkm9mMTfylSpCPDa7DJZ2UXiui6PuneWMa+igOtFpra2hPdPfHhjW5/d
	KTevJIMGSNQ2G2fYA+uZIcojBnWeWAsJTSfWWiCWVBIWqctAVSN0FU2tw3Uu17cl7ign/QAiLtf
	SZGIZScgxboUfuwKcSCZ8oSIGN3FE8OVFqnT6JrfU25iF0m2aN/F4AhfYRdvBcQSYLANJeClpuS
	fN5JJxhFUx8P1cv7OfEOGc/KDHlWWPwt+YnvM20ZoJJITJriKx4qC4kmciqFBkMYsZ19fo7/h2P
	9OKmD36Yuep7XEUVEeDLAOcZYlYMz5/wE1Hnp/p2c04SPUdrfOyRatMZhXIRP4ZUciIUf57TtiW
	ptzAfvBTzqRDCW6MjSHWJN1vppsDugwP3mx8r+Vryl7HZsfuwPN9TN5ktg3Y5XKE+T0EkPZIyIL
	I3kSbKV8Y4Ck7ISfTO6aTk6TfIT6HtSCHAQM0pQ==
X-Received: by 2002:a05:6000:27c1:b0:4a5:26ff:13d0 with SMTP id ffacd0b85a97d-4abb0f3b5bdmr27188864f8f.14.1795700533755;
        Thu, 26 Nov 2026 05:42:13 -0800 (PST)
Message-ID: <1a742707-484c-4129-8a67-41abfbb892e3@suse.com>
Date: Thu, 26 Nov 2026 14:42:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 12/13] x86/vPMU: use domain_vcpu()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
In-Reply-To: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1795700534-762FD4E9-E5A2ABD9/10/78276251493
X-purgate-type: spam
X-purgate-size: 1180
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If for nothing else, then to reduce the number of open-coded d->vcpu[]
accesses.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -564,15 +564,14 @@ void vpmu_destroy(struct vcpu *v)
 
 static int pvpmu_init(struct domain *d, xen_pmu_params_t *params)
 {
-    struct vcpu *v;
+    struct vcpu *v = domain_vcpu(d, params->vcpu);
     struct vpmu_struct *vpmu;
     struct page_info *page;
     uint64_t gfn = params->val;
 
-    if ( (params->vcpu >= d->max_vcpus) || (d->vcpu[params->vcpu] == NULL) )
+    if ( !v )
         return -EINVAL;
 
-    v = d->vcpu[params->vcpu];
     vpmu = vcpu_vpmu(v);
 
     if ( !vpmu_available(v) )
@@ -615,12 +614,11 @@ static int pvpmu_init(struct domain *d,
 
 static void pvpmu_finish(struct domain *d, xen_pmu_params_t *params)
 {
-    struct vcpu *v;
+    struct vcpu *v = domain_vcpu(d, params->vcpu);
 
-    if ( (params->vcpu >= d->max_vcpus) || (d->vcpu[params->vcpu] == NULL) )
+    if ( !v )
         return;
 
-    v = d->vcpu[params->vcpu];
     if ( v != current )
         vcpu_pause(v);
 


