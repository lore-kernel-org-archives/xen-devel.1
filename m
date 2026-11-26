Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345EA606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 12:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Fz5klq29
Received: from list by lists.xenproject.org with outflank-mailman.1503372.1699107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWYtX-0002Sf-5A; Thu, 26 Nov 2026 12:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503372.1699107; Thu, 26 Nov 2026 12:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWYtX-0002SY-1V; Thu, 26 Nov 2026 12:48:11 +0000
Received: by outflank-mailman (input) for mailman id 1503372;
 Thu, 26 Nov 2026 12:48:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWYtV-0002SS-5H
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 12:48:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWYtU-00FlRY-6b
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:48:08 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b082a85-e002-0a2a0a5209dd-0a2a450ae986-32
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 13:48:08 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b082a87-f2d2-0a2a450a0019-d155dd31bd4a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 13:48:07 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso3179193f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 04:48:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b8b7888sm40242422f8f.42.2026.11.26.04.48.07
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 04:48:07 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795697287; x=1796302087; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=69SZBAv48g1k4iFmcTcXOpGL4zomUx6ioiex6M4PLBU=;
        b=Fz5klq29gxOGrK/+26rEujgZxvACq0FoZDHxsNuK6z9t2nOhy20WUHpoeQu0It8lpa
         WfAGLYsi4laOy8KZ9NFosSSVqYOZ2IDz0TjNng5JdGL9fA5Psy6f/5z+foBu2K4sWn9o
         C+QIvEcLCygA1ymkZ/a9x5BpvJRA52q2WPZk403SMlT+U/k1koSZN3IqLv/9tw3x2CAv
         nnTRdfw3CEh2CKvluxuzQWbuLOLoFY6iX+oGd/HxiQNiKXs9nuLeXfnYB2A3q1c+aM0H
         sFTaHs7pngEZylfTjQoJ6Zk+JUxQX9wop1WPabMmjYA/keFovOlNlcU2rI/qfLKE8T7C
         riDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697287; x=1796302087;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69SZBAv48g1k4iFmcTcXOpGL4zomUx6ioiex6M4PLBU=;
        b=vu9c2ckMeLvdbdxR8g9NhY9caj0BYChS4hP3NQqLVBXPfHD507cXeeFnb+vyQnUNoq
         BwCZmHRjD50nnOB/E27wSFYgs8bd5R9AiMiEu29it+NHkYe1LNSjGynATlBLyW9QzV2T
         dNp4F42+Vryv4E+O3TgZGyjwXlfHyhYJkLw27mQqYFPFVTt2KS/rR8+HV6AkXzetZKSK
         oZ4rS1OL7lhdCYTyEKb6IJgM6UATfSCAYvu/nmpeiqKR0tvPqBy+xt1SdZvsYAqu4Plz
         FZD0Jy321rbllIIC2MbaPwjp6gQuwFz3WtcQMb0v864XqTTr1dzAYS8glmH3pdv3f/6C
         hL4Q==
X-Gm-Message-State: APuU4Z/TE3qQ6r3KYoiIRgcxg4rHfQ2mn8uCoOqedHNTSzMqDvL5DXuZ
	hcBhAt/IF1jMbjAazGpaI35K5FcZsNt5PYzNgmp9FNscwTh2EtJI1ykHhnALZ+if7yPpxdxSWjy
	3cWGgIA==
X-Gm-Gg: AZFdTZdxLWewtD3Ge2iSWdiwhxOTIgfq8y4NUvi5XVu9yj2JwmLesYBFIKkWSt1HZa1
	9SrKx8OBbUwBhWZj0vBMdqGVbxuZkHz/MT8Q28eNlifjU5GUVqRBPChw3lOzSn1SwUlc6bkyLoN
	+HZ19Y7MR9vNmyGqXf9dXcg7FcIPo8QyggC8bTYf8wwNM4A2i/SgiDI2/tcI2ZKvVK92TMEXAFm
	5tKseJ6XaUA6szSx+o2NgcANBaqQo0Hu/3fRQ4jv93mFLZsOTnifrgtHa2BSvibFYg8xzt/P6DR
	mj9aGv1OfnxX3BZVIHdS6TAtYBVe9vyucHzGOVbk9OTPqgOXtS9IYy2DtQITbO7QSpB/uH15JsB
	7I7VDlux5oKFOXdIfUYytJpnvcHKHB2h3vnW7dVbaGy2V/h7t2zsBHxzl3a1cM/nyHd7uo3cShZ
	/3jj32b9R72gFePKMzsVk19iR8+0SUwuQ11yIsl8lmVWV7WevnZpFjTi8Rx+U99YDv3readJVKO
	4ItwGKMPxIHA1wyiS2bovH4nGorH06Ty8k9Mf1SBeun6dn37ukJRagIRW8UPyixeeABQTk9JeS4
	rVdyxihb4uzgwNvu/fgj5kuDPSeqSyLBdDpKlgn1l2T14e/1AO3ykj1NYP3H21WwkIMC1DiSX1G
	Q4YoROWz8ayMCvcPINg==
X-Received: by 2002:a05:6000:2602:b0:48d:f470:6b3e with SMTP id ffacd0b85a97d-4abb3b42d6amr40886409f8f.13.1795697287473;
        Thu, 26 Nov 2026 04:48:07 -0800 (PST)
Message-ID: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Date: Thu, 26 Nov 2026 13:48:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/13] make better use of domain_vcpu()
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
X-purgate-ID: tlsNG-4011c0/1795697288-516C6CFC-9BA83E37/10/78276251493
X-purgate-type: spam
X-purgate-size: 858
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I.e. reduce the number of instances where we access d->vcpu[] directly.
The series doesn't cover all cases, just a fair part. I think there are
no inter-dependencies between the individual patches.

01: x86/gdbsx: don't blindly assume vCPU 0 exists
02: x86/passthrough: don't blindly assume vCPU-s exist
03: x86/altp2m: don't blindly assume vCPU-s exist
04: domctl: use domain_vcpu() in XEN_DOMCTL_{g,s}etvcpucontext handling
05: vm-event: use domain_vcpu() in domctl handling
06: numa: use domain_vcpu() in domain_to_node()
07: x86/time: use domain_vcpu() in tsc_set_info()
08: x86/paging: use domain_vcpu() in paging_domctl()
09: x86/dm: use domain_vcpu()
10: x86/HVM/MTRR: use domain_vcpu()
11: x86/HVM: introduce hvm_load_vcpu_instance()
12: x86/vPMU: use domain_vcpu()
13: x86/domctl: use domain_vcpu() to handle various sub-ops

Jan

