Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10836FCE07F
	for <xen-devel@archiver.kernel.org>; Thu, 26 Feb 2026 13:40:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1241769.1542684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvbaq-0004Mm-1x; Thu, 26 Feb 2026 13:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241769.1542684; Thu, 26 Feb 2026 13:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvbap-0004Mf-VT; Thu, 26 Feb 2026 13:39:51 +0000
Received: by outflank-mailman (input) for mailman id 1241769;
 Thu, 26 Feb 2026 13:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvbao-0004MX-UL
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 13:39:50 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e6a4220-1318-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 14:39:48 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so8341725e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 05:39:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970bf9fb2sm41843733f8f.1.2026.02.26.05.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 05:39:47 -0800 (PST)
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
X-Inumbo-ID: 9e6a4220-1318-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772113188; x=1772717988; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJvuIydzZguqI9aKrwgZGmtnJxEcfn+qpOQL0iOCWkE=;
        b=VKNmm+KO9XK4FJmQZ9qoFVoxypfsirXszUkZsSpWvC7L9lc04j8NNEEqgPtlwheUuj
         PUEC23faRLl4nku0/q5it2R2kJKJjJmFUgGExIEq8eRj+50LuydWVABmKyC19o490p6J
         h4h86BT7aWyhtYziUjsdm955vleASVKCmCizvDrdRYcjP0LokVQnjJQGSlp0NdpAyWet
         4fBgN7ubShADgMl713FIn/WgGRhNUljQvafv6efCqrb2wUfUbUmB5Dgefjs6rqaGTu6c
         fxctlfC9E2R956pemQI61Y4x8SGnAS/NSsD3w/I55Uqi9fBicUatjnrfXajr+WpCgGQ9
         SRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772113188; x=1772717988;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJvuIydzZguqI9aKrwgZGmtnJxEcfn+qpOQL0iOCWkE=;
        b=ooqDCnScSJ8pSZec8HGMqpB029S5w0ke9Ghd12/e2Mer2Au9AE3uQIqIYrZekcd7LJ
         /LnBtUjC5nu6EXttkXkmmwJ9aEQ28rQUfyEZwgjuNI79ni9rNS1r4NZxKjQh2ahUcjIj
         ercGcqjX8xRikxVqNJzgQfodD+WxAHcDb0GovEAzIR2+GTlE/pumZjqkQBvsxmGDA/tZ
         yFGAS5tnvGfkpqI14eGQ5mOi1Kx6G8cxme/yRXqGZ5Qjt662jKXug9fxtbRQsDiAozEl
         PNkH6AwiE7zLCbwaE/m/GYahch1NZQA0yHjRaFCTZC1M1Yb+OXwvI4zIWIjI3GE+gGWl
         19vA==
X-Forwarded-Encrypted: i=1; AJvYcCVMtvrVGQ7bjCbhmGv31pn5M/32nm+GcTGk/RX/FvOdD7VImDgXw9HcenY9U6+LrpPrIlUXf8HWEzw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWf2ebsEfy59EHAI8Tfcb7YuIMMZL8++Ekuma6xrle4AYEUVy0
	C6Tz2WySl+CdO9Bkx5XjyPqfn59OF9J55mC9x3Yx8f1yz+T57t31C11JN6TQWAyICg==
X-Gm-Gg: ATEYQzwQXl3BeS7sM4ddr8cLUfqQzews3bSXD6lfgG3UYIwPb9nG3Dd/w/pNr8Yvt4q
	Qfgn01now23IO3AC9hNjb1dB9iD5UEth7bSXCI4L0ySG56Tw5qWYfv2jGNyO45g3y7RtMQduJ6v
	exGQ4l55dwVL9bVP6c9H1kvBIkI1yzG7haO1SzVlUuutDM7N9pjdgsN7/Trj7+GiEhd+Ie/GSUV
	wzx2RV5yJVNhdAM4cc6/Y1nZVQ8Y7fBTMUL29irtl0PPjJC1FYYI3lm6iCDVWiuGyA9L8/PHk6H
	ZpQUm50F+7vHdpWOGFFiAviWXQEq2BGg7E9abiIl3pa6u9nm62Z/C4F5yUWdf9w+mst4vFGtqop
	K7P9FtrFIGCoCXOLy0mtCBvuOnZ84KDDqCU8mvb4C9uaHF8Ny+dlu2Ae5Yfi/ab5QFSshrW1QCq
	8Y23s9xBsYVD6GRmelSuF1V5gAbkfXm8iFEIN0O4B8X4CSd3ZzaIdDc7qlMEUWw5YQd/xez+LiW
	KtbaZfU0gUFo6U=
X-Received: by 2002:a05:600c:a49:b0:483:7631:befa with SMTP id 5b1f17b1804b1-483a95eb5e6mr378620455e9.5.1772113187855;
        Thu, 26 Feb 2026 05:39:47 -0800 (PST)
Message-ID: <417d3b12-91f3-405c-aad7-d74bedb67a80@suse.com>
Date: Thu, 26 Feb 2026 14:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] x86/svm: Add Enumerations for the SVM virtual NMI
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: roger.pau@citrix.com, teddy.astie@vates.tech, jason.andryuk@amd.com,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
References: <cover.1772105933.git.abdelkareem.abdelsaamad@citrix.com>
 <a3dd02ed3a01c5aaae804bc69f494de2a47a75f0.1772105933.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <a3dd02ed3a01c5aaae804bc69f494de2a47a75f0.1772105933.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2026 14:20, Abdelkareem Abdelsaamad wrote:
> Introduce the cpuid bit for the SVM vNMI feature support for the x86\AMD
> platforms. The feature support is indicated by the CPUID
> Fn8000_000A_EDX[25] = 1.
> 
> Add defines for the three SVM's Virtual NMI (vNMI) managements bits in the
> VMCB structure's vintr_t:
> 
> vintr_t(11) - Virtual NMI is pending.
> vintr_t(12) - Virtual NMI is masked.
> vintr_t(26) - Enable NMI virtualization.
> 
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
> Acked-by: Jan Beulich <jbeulich@suse.com>

This was committed already; please post only patches applicable to the tip
of staging.

Jan

