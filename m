Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA23C98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 16:03:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429228.1652161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92x7-0001GU-7I; Tue, 22 Sep 2026 16:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429228.1652161; Tue, 22 Sep 2026 16:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92x7-0001GN-3m; Tue, 22 Sep 2026 16:02:41 +0000
Received: by outflank-mailman (input) for mailman id 1429228;
 Tue, 22 Sep 2026 16:02:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x92x5-0001G7-VZ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 16:02:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92x5-00H4Tu-Ca
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 18:02:39 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab2a69a-bab6-0a2a0a5309dd-0a2a4508d2ca-22
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 18:02:39 +0200
Received: from [74.125.225.81] (helo=mail-wr2-f17.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab2a69f-f659-0a2a45080019-4a7de15180e1-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 18:02:39 +0200
Received: by mail-wr2-f17.google.com with SMTP id
 ffacd0b85a97d-484366874b0so65019f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:02:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4886277df46sm6161763f8f.17.2026.09.22.09.02.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 09:02:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1790092959; x=1790697759; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S5WBgZIOIhe27nk6Ohz6bOfdZS/bVYn3SfLmOOimSlo=;
        b=RreWde7uPLbreQGUi3/8A+sQttLVjxn1MOzyuwqSjJ+LZ27WlH3lia0buVTjQfa4px
         EwbCguxaC0B0jvbsiIoRe33qPYWaOncpLwzwFtDRk+YSds4eTZtMsfe952eZENUMq79K
         mrQG3EZh6sxokO014pYFfVeaZRzS1I2/n50jA5kznVeAvlQ4+dY0AZav1SelPh7yUUpj
         vbj+fMW0V7iLMVKnE55cTGr0651ASQMH3SATiYFXke+MKl/lS8GqjbHu3AFBqQO0Hpq+
         QI6i3pTfcbuscfSZMRNbv9c2GKE9PQer2mQTrPxrs1MBacyH1qdwnzFVqtQ/2Rae5XXe
         FW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092959; x=1790697759;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5WBgZIOIhe27nk6Ohz6bOfdZS/bVYn3SfLmOOimSlo=;
        b=ewgypBCD9Mtsy60lTX5ZPUQJ52Ihm8LF6BdXE5Te3hV7OHTXZofwARjJqjfQqWLVTZ
         muxZQXYoyEb13Ov+6+cimVW2rQMuElCHjQJjtlO9DUJE0RCZtd0oMny47aBAjZFvib+K
         4/HEt0uOGN5xzAHrhA4QCAUCM+YwuhSgScyZTKQ2ioS0fiJ9l9TYHVOtUOzX3l8KLCp9
         Xbxo4448eC7p/HxinuNXKNXLYG3AVZ+02nDNsqKrh33fSzpLdPvtI9gkDFySIrp6bdga
         Fz/K5gX9xtZNSbF/jBRKQ4Bjy1lMdeCtYckjJqzwj5Y18n5ie5f4CQvjK2SWEQCfu6Bp
         o+kA==
X-Forwarded-Encrypted: i=1; AKwUvBzNK7vQVwGTiplZmM+TY9oGGkbUx3IC5/2vOdFhAuNV/t6jC/7tKb6vI6O6tB9biY/196oJ1s5vaRw=@lists.xenproject.org
X-Gm-Message-State: AFuF++lloDMIE/mawOiCsf1YcT5lUdztdkKAIV7xJPZIlolxD6deRQOT
	d5XgVxD+fszjrlGg1G6stSasmEIyhSdtV0o0H/icFPwh+5vGEK145+U0DfC62EgwFA==
X-Gm-Gg: AYBFou0nMcjRb9voE5K64kE/f7b+oS7C5ibeNoPTnJd65+zWusgGU4RlB+RyES5lC3U
	f+i6oS/zGRmmyiexqf2MICUvxg5OZlUud9LZEJpisxd0lG23BaJPYrJlDyZof3hfHKeNZ9s1509
	LsTEZAdi2OU0tK2JIw7rxIRkeA6G8PCYKIhvKBCmacNt/6H5qJh4wjVjMs6KTuKthG1T9V4ubkt
	PZqdCufkQCL8NgrFXe1r46v3OnSG4z2Tl1Vacjj8PwhcAQDiV3lVUOHtcryrtJLpcYHZdXR+PNy
	1sbFME2cAsiKmtqDPj1nigUsSDOsLfICiNnzJBdvb03v8nxxGAgXwoJdXX+o00RQiO5SAAEUI+K
	dq9/SdGYXGjf8tBQEyQ018YzQPo9Tg5ZO5reGUz5oSFu3Xz5f+O+k0jjp/SMEwGpmWAELiij04b
	blbPKl1PGtJa4M9jz2WogE5G8gaqswifwJOg8Tj+SKlhuT12LhZkcZCz4/aWXrk8LZpGq0aha42
	3BM9xS6Y3Xgg6uGM0+j8K80/vQfcX7d1Vjv9vu8a3yJseW/YRArVQsHhe0QBQ==
X-Received: by 2002:a05:6000:25f1:b0:487:27f6:a4e5 with SMTP id ffacd0b85a97d-4886709ea7dmr41521f8f.53.1790092958696;
        Tue, 22 Sep 2026 09:02:38 -0700 (PDT)
Message-ID: <3f84e5f8-473d-4d4d-b4ae-b83dd0c0f997@suse.com>
Date: Tue, 22 Sep 2026 18:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] x86: restrict PHYSDEVOP_* when PV=n
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
 <664d2a63-2745-4c33-9748-283aefce2433@suse.com>
 <290d1ac5-a9b8-4576-9e9e-2b44d377a76a@citrix.com>
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
In-Reply-To: <290d1ac5-a9b8-4576-9e9e-2b44d377a76a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790092959-D654487B-633593BA/0/0
X-purgate-type: clean
X-purgate-size: 612

On 22.09.2026 17:21, Andrew Cooper wrote:
> On 17/08/2026 9:52 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/physdev.c
>> +++ b/xen/arch/x86/physdev.c
>> @@ -233,6 +233,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>>          break;
>>      }
>>  
>> +#ifdef CONFIG_PV
> 
> I think this needs to have /* See hvm_physdev_op(). */
> 
> Most of these ops are not inherently PV; they're only PV because we've
> not cared to expose them to HVM guests, and that's a different meaning
> to what CONFIG_PV normally means in code.

Hmm, yes, added locally. May I infer "A-b with this adjustment"?

Jan

