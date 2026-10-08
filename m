Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72756CA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 08:24:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443035.1660404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjQm-00052k-Sa; Thu, 08 Oct 2026 08:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443035.1660404; Thu, 08 Oct 2026 08:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjQm-00052d-Ph; Thu, 08 Oct 2026 08:24:48 +0000
Received: by outflank-mailman (input) for mailman id 1443035;
 Thu, 08 Oct 2026 08:24:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEjQm-00052X-52
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 08:24:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEjQl-002ke0-8J
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 10:24:47 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7534f-2eae-0a2a0a5409dd-0a2a4505bde4-0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 10:24:47 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac7534e-4cb1-0a2a45050019-d155dd36b4ae-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 10:24:47 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48af27fe287so1999867f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 01:24:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c724b660fsm9450462f8f.18.2026.10.08.01.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 01:24:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1791447886; x=1792052686; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omuwir6pvuXtLUY7GTNBQtV9k9Tm1hms0wnsm7RbXJg=;
        b=AUMJ2hLN27jOCnJGBuAB731VbVX0RCG+nR9SKjpvtF39wcEITkWkqGa5MKG6fHWJol
         OZ2wgG+KcvauA08+9XoJ/d7HuFCBm/IS9bgzAvECmzErg76Yhwb6rgaY0zNT6XJj+tqb
         g560csIPmrpcbVagBTuBrylog13q6Px41ZPvO28ZmFyflOtVvRE3f4CShpjTsrFo8wGN
         I5j7VcjcNOZLL3nfjtZ+K2BsIh39kv/++ygz8IkZA41IvwPZN+lKpLN2ncGVopql9xEx
         1jPBrNfA7kSSnhMtZSWygdoMJyx74naYTr+uK+iKi4drjrA5C3Q2YaWRTDOKRT4l20X2
         Hp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791447886; x=1792052686;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=omuwir6pvuXtLUY7GTNBQtV9k9Tm1hms0wnsm7RbXJg=;
        b=wdexmZo5jZzCRlpBwHYZU46BzFa65GLrzOdYsL04DzOnx9vZ4U2//wKx/2YGpiZWYL
         nDNMx/iwOjNqWvtLVEYmMlvtJu1la2hOpP3dV6/fxgbiULe2Ab3lSuhs0oOioBUvy902
         VwHHvYZX71MpJH4sVbNXUUXO9sKeFVDkTLtzFBsr/hJ2XkTB2uovIs2erlJDclucmNuX
         JjSjlGc0fUu7XuhXoZKOUS7clyvi+CVTWhxjiHf9SFzl3MGgLXeu0lbeLvZM/VniTpKr
         TwVPJ+Fw+qUqojeqWuhtEWm2VNBH2bEPoD1beSzOw/owxy+uImcBtBs1v2U6WX0XIPyH
         /Tcw==
X-Forwarded-Encrypted: i=1; AKwUvBxT2VCLGVgkUTerIfFy80PC/u2X3HTRrARBQVIZsN1FgYBmdf6/We+miUA3AvZDDRD11b1+1lV9EIY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI2MwpVlRDxssSPEVBZv4qr4PGa4JWfhS82284VMJVligF7Tk7o
	cglxZ/AuyNTJ9O2ZqUDt27Zn9LlF9NznTfj4ofZBLc9yHb6vnBjnLo1q/St+hbYvQg==
X-Gm-Gg: AYBFou1DnFTZMWFIWuaGvOUMVt/wOCpbi4SPkVEcRXi5EtmvX1Dc2R/O+/hiTB+fMKt
	HT8N1HgULBwNZ5r2VIYgXJ8MG06hUXy6Mt4fsnDJvjXYwhGrifJ56E0NHqCP6F/A56A5QASwPQl
	PsRS3GLWndL80YkTht8WDPUBXi6Gk03Cuu046JsbuJTII3JhnCCtdoyVDlp3+on1UZyqF0bdjah
	JcASHxLGXXxc3KrvN1BE9in5ZCiIoIOxIuH5O00p/zP7e7aquM9OkODxurjr9qITPVR91ZxlLzp
	q5r55IHETy7/0wozwV/2FvHA6yiAbe52JAmm8ETYQPJmV7QTEyb+kZfzDyhozg2aGfG4+07wRNC
	Vp+F2nNhR0vyf95prya3RN0J6kVlCEAY8uJs9GMEZm3Ed+58WwKs7Dbfc2iiaKPr7knJgdb4Lvq
	/B4l3qa/90eEAPuxHMETKu+xaZhiR4gQFVRWQ5MDB4PWeC71YetwGZDxfPoGwFASuV1uYBLR5qC
	mJ5ND6p3jLXynEj9QlTpzdXT1sO1PgEneNx0obm1ctys82k9K2kQRg115QTMfc=
X-Received: by 2002:a05:6000:2002:b0:487:88b:4681 with SMTP id ffacd0b85a97d-48c7277925bmr8655375f8f.10.1791447886463;
        Thu, 08 Oct 2026 01:24:46 -0700 (PDT)
Message-ID: <3441a775-7081-43cf-aed9-56d51658c32e@suse.com>
Date: Thu, 8 Oct 2026 10:24:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/18] x86/spec-ctrl: introduce Address Space Isolation
 command line option
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-7-gwd@xenproject.org>
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
In-Reply-To: <20261007104051.48841-7-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791447887-71CA82A1-2AC0B57D/10/78276251493
X-purgate-type: spam
X-purgate-size: 2555

On 07.10.2026 12:40, George Dunlap wrote:
> --- a/xen/arch/x86/spec_ctrl.c
> +++ b/xen/arch/x86/spec_ctrl.c
> @@ -86,6 +86,13 @@ bool __ro_after_init opt_bp_spec_reduce = true;
>  
>  static bool __initdata opt_ibpb_alt;
>  
> +/*
> + * Give each vCPU of an HVM domain its own per-domain area (vCPU-PT).  Off by
> + * default until the feature is complete.
> + */
> +bool __ro_after_init opt_vcpu_pt_hvm;
> +bool __ro_after_init opt_vcpu_pt_hwdom;

I'm a little worried of this name, which doesn't distinguish PV and PVH. Yes,
the variable name is already long-ish, yet I think inserting "pvh" is going
to help.

> @@ -487,6 +494,62 @@ static int __init cf_check parse_pv_l1tf(const char *s)
>  }
>  custom_param("pv-l1tf", parse_pv_l1tf);
>  
> +static int __init cf_check parse_asi(const char *s)
> +{
> +    const char *ss;
> +    int val, rc = 0;
> +
> +    /* Interpret 'asi' alone in its positive boolean form. */
> +    if ( *s == '\0' )
> +        opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = true;
> +
> +    do {
> +        ss = strchr(s, ',');
> +        if ( !ss )
> +            ss = strchr(s, '\0');
> +
> +        val = parse_bool(s, ss);
> +        switch ( val )
> +        {
> +        case 0:
> +        case 1:
> +            opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
> +            break;
> +
> +        default:
> +            if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
> +                opt_vcpu_pt_hvm = val;
> +            else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
> +            {
> +                switch ( val )
> +                {
> +                case 1:
> +                case 0:
> +                    opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
> +                    break;
> +
> +                case -2:
> +                    s += strlen("vcpu-pt=");
> +                    if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
> +                        opt_vcpu_pt_hvm = val;
> +                    else
> +                default:
> +                        rc = -EINVAL;
> +                    break;

While personally I like the reduced redundancy from placing case labels
like the default: one here, Misra rule 16.2 wants us to not use such.
Note that as written there's no violation, yet iirc Andrew keeps asking
for figure braces in such constructs. I think we're better off not
introducing new instances (the rule is marked clean, so with the braces
added we simply can't, unless the file is excluded from scanning).

Jan

