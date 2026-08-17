Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCD7C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 06:21:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392475.1631420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvqiF-0005kS-Vd; Mon, 17 Aug 2026 06:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392475.1631420; Mon, 17 Aug 2026 06:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvqiF-0005kL-T2; Mon, 17 Aug 2026 06:20:47 +0000
Received: by outflank-mailman (input) for mailman id 1392475;
 Mon, 17 Aug 2026 06:20:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvqiE-0005kF-0n
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 06:20:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvqiD-002O9N-D7
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:20:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82a83a-e002-0a2a0a5209dd-0a2a45028ec2-8
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 08:20:45 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82a83d-6ca4-0a2a45020019-d155802bdd57-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 08:20:45 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49802c418b5so31184125e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 16 Aug 2026 23:20:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d0876b8sm19008015e9.8.2026.08.16.23.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 23:20:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1786947645; x=1787552445; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoPRYGKOdrmTSJeGVeMsw3VubSe563rmLkb2pXYgk7Q=;
        b=NdmxHkpKc6Cav8tHQ8a0URxqNJF+4pyw8AlS6l6IyFFHFENPdxUPQO0Hq6KbHwDDsx
         KODxjudrOizKWOLK3xFmeChCv1Io+XacahetFolZBwhbW87DjwsmXI9RKeEvpdN7Vgbs
         vqHNAIW1PqCL3UquOi6hBA5ne4eL/j5OAURF4YAgNg3vr6wQ5Qc7ge/MI2TtFjd9IgfY
         n9K4v29RI9K3VRdfAQnzW/iRINL0WE9MUlM7WTGYZdKjbcgAte3yyBuHaxuEqo9Pmb9i
         aPHHOUNdVU0YOYeL6+oZjloUwLzQVwQQgu2TJfFA4R4rfhwLlG7UhpVq4mw1VQMvQ0qb
         aaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786947645; x=1787552445;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LoPRYGKOdrmTSJeGVeMsw3VubSe563rmLkb2pXYgk7Q=;
        b=TnlnaasF9dxZuik3pdWbyUyuWK4m8gO8WTtuKqAACMEkfjktXARzU8D5zhC8EWGfDl
         PS7VMoBpT1IJ4YrO0RqAJuaxXRX2b+N69GWIHaKnJxraOIjrAmYRGEG6ApkhCii1I+J8
         TkTYbZJt21KJaDAAg9/XKTUHQ4Q/AC2DiomJm+/tuPIVQmMLoCW944XjiOm56ADKC+Ub
         lSzSqOpuCfMCgeANQQd7oa254lcZvzV5KKNst67l9xGATGMcCToVCTfpeGHlTQwgs/y4
         z4F/wmeGqYJ8nf7IgWLL/D71kdvQevHnL7n+IhmfBw4fA4Sslp94I/wAB6mfl7GfDAsN
         3aKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqq/ViSXC72O6zHEuvLupPJi2STG+onJN+DSN660t+lWh1ZVR2ITnUEIAG1d3Q4gBzZt+jhvbllJKk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbWb1rVSNtqWsTyTacVH2g1CHtRkZ7RuhdUU6YpR0Ci98/MdwP
	3dqMEhAEqmb0yqXJMzQ5/ofglVqymbyV3gI0fT3V/ROwxylehfJhZPXt07GIr5PT0w==
X-Gm-Gg: AR+sD11o3fPNLHYdzWZuOdizuT1PRhoqAKeYll6xrwhDibNzg3/+NwP2oZeIIXiNi1t
	RnEr4y7c0KgQ0bsWfexII52ygBFGl8hLw/Geh+O37cAROem1GX5Z5HHuQoo5C646/1J/jEGsw/d
	hATMJSQVpNM6rvZeZRd9ZX/DwTeO8ALSFpbocPD5bHvz2M4Qzi/5Hdut+I0BdburGGeBYkxuzru
	AnBFsxHtXa9yUsCPO3ankNNcqmVV4H9NvV48p8jL4P05QHJ6Y0lVWFUeBETwcZ1/87QweBYhsB3
	lWanBWFcOdxsyQ07qGcg2dr0FC7I/ueUs/8bq2/zeqCNs6m3wBaIjzjFlAVXHTyy6mHCXTAOSEZ
	z2eO0S0pM4ZJFCE4ohH9iVCd9P5YK0X25GlXNn6KFQGhcedm6Ch2CkvaaUcWUPnAjiE2MNvvZFu
	OhXc0p6vebBn2uNDzj5/SB8fYS56PEzGi2Mb0qljxPfUd36tNmazfSdpRGXDx3GV4jKg2QzPYC3
	kKh8YBaQ6JUSi80wFxFD+EQSfRg2YD8V9hQnatECFssT6/1AdIB
X-Received: by 2002:a05:600c:4e0a:b0:496:c378:6420 with SMTP id 5b1f17b1804b1-49987956c76mr375518665e9.8.1786947643870;
        Sun, 16 Aug 2026 23:20:43 -0700 (PDT)
Message-ID: <35f89482-53f2-4010-9692-612092246393@suse.com>
Date: Mon, 17 Aug 2026 08:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/emul: Drop the union in x86_event had have a
 single data field
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260814185841.1757421-1-andrew.cooper3@citrix.com>
 <20260814185841.1757421-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260814185841.1757421-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1786947645-F32B12AC-6588FCB8/0/0
X-purgate-type: clean
X-purgate-size: 621

On 14.08.2026 20:58, Andrew Cooper wrote:
> FRED has formalised the event_data field.  It already has more uses than
> given (e.g. the NMI Source Bitmap), and further uses are expected in the
> future.
> 
> Collapse the union into a single field called 'data' as the struct has event
> in it's name, as well as 'event' being the common name for the variable.
> Refer to the FRED spec rather than keeping an out-of-date list of uses.
> 
> Adjust all users of the old names.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>


