Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25356606A331
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 07:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=S5IeQo0B
Received: from list by lists.xenproject.org with outflank-mailman.1500245.1696479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVOlM-0005AK-BJ; Mon, 23 Nov 2026 07:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500245.1696479; Mon, 23 Nov 2026 07:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVOlM-0005AC-7p; Mon, 23 Nov 2026 07:46:56 +0000
Received: by outflank-mailman (input) for mailman id 1500245;
 Mon, 23 Nov 2026 07:46:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVOlK-0005A2-4P
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 07:46:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVOlJ-0043e7-6F
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 08:46:53 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b03ef65-2eae-0a2a0a5409dd-0a2a450ab232-24
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 08:46:53 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b03ef6c-f2d2-0a2a450a0019-d155802eed90-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 08:46:52 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4bb85e07aadso35427555e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 22 Nov 2026 23:46:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb905f0f1csm141768565e9.0.2026.11.22.23.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2026 23:46:52 -0800 (PST)
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
        d=suse.com; s=google; t=1795420012; x=1796024812; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bx5NiEtuTuz+JJMZ7z4EjIPNaKxhPhKorkWBeontews=;
        b=S5IeQo0BRBpDpNj60/YrsKrfGFEdKN0aj5PSj+VQ5Lcctq8a38rNjDl7FpINi2b9GK
         MUZTstf0GQsL2S195C1omtMQIV92OSA+jJcpwFnLpaxtsZzrtwppMHIwAgulTQoOJQN2
         3/XKfYi3xVLiMhYuK9lwd92SDhN8FkicNZr2Np6WYnlSMFHFFGAlZtlPkWwPNec6GEwE
         bfvFXipUfwy4u+eriat4kf93OV+TgnxchTDMzV/QWviBmVE9hbdGDskRtv1Fw5kX+pOe
         MZPRkN3swoGPa4bE13FPakZSR7P4KJWD5ffuOkMP26Q4/QlbsZdEnw+TLX1r77Zr93cp
         /j/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795420012; x=1796024812;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bx5NiEtuTuz+JJMZ7z4EjIPNaKxhPhKorkWBeontews=;
        b=tm8BrlEwTlToXPKBENO3G9/csbbuieAM27EhkWgHIehKcMKbGfCZHxRmeGlPXuGAAE
         GZJScC7wOBqTvlfaZmF87bvvVACQZEXo8MQrdXdzECz3/jjwaTuAvDClQd9zA80O2Ids
         WjPHmSbVXeZypF+wNuyxCGBJ1nOqMhhF3YqnRT6e2Ngr/vLRARlw7yC5B/G5/kNW4wMs
         sZ5Ts9vR5COi3jh19k2guGmoaSx0DhuS0QTCScATrnPIsMEnVKDpNaF3zT4Kx2mPTb6b
         5swph5rd2iNFxA85tMB8kSNlqV/ayXo5BYwg4pixuNqxl+IcE0UjZZN9ytCOv1fRajUX
         526Q==
X-Forwarded-Encrypted: i=1; AL+hErEfyB2m/oubEpuAPewv8s27H2qVxvqzeSORb2rSl0Qgzs0+63Yl+076jfN9YB3dn/IMCtpZP4YHTOA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z//EHUO6pfg5BFUv0abfxX2j1eiN4MsLajh0gGv2xsPdyKkkXw3
	DxB3zJ+/o9dGx4rs6FU7gwE+W2MQkEN10lyhIyWa3UaMtuxJ9EZkOCCFDVYeggQTKQ==
X-Gm-Gg: AZFdTZfMrwmeEzzctljfNUMKKErlRD8piQPzYTDhtVASUHWnV/EscV5QHSU9poRQZpB
	A7EsLoeQQC4Zg1Gg7Qc7Hd3yAoscsP5rVglIbgqkNaBsTxj5uBhJdIHuAR1h3GyNp48HU36ZvzE
	3cCunuVy83JwaYqYvQf4G87COLmspE2fW1b40mYRgYYfoZsd9R8GT5q+QwLPwZsriz644rP1gXy
	FuAQw+s94rKdukHhVXQOZdv1WBbTO0bQixMT+Btorx3iEr6xT8YpbLVgaBov9h3GYk1tivk7Jw5
	Q6cLgrBTuwwnbc1OVvhjHadRIPtaIxifUH5C8dLd5bJ1g2irCjSgxxxATVtnam0yc9ysej2cB2M
	WbQ9P5lC6nokOFmRZiGjskxPeksXkb50utkW9iVh4o8r9B1kiOEZ5soSQXPzMYmI0Kg7/8yJ1WW
	cK8LkCsjOURh1qWDxBaf7BwybwBSqoM16BYR0jp753LqlhslVXoz+6yd3ElPZBORt/8g09FvOQD
	i9vZDc8vaK1zL0UCdD13+RRdZ3gT8BE/VugZDxmWUYyWqzibJtovU01dWhXd0WaJYcn5iEBjDQ8
	bmaNFJLLIniwZ4S6rMkPvbLS3mQtcfnXxvhQkiDBD3tqMe/XJiyWZHAE1lINgxnt6fwNMw8OMTW
	farIHpixy/TO0ro5P6Q==
X-Received: by 2002:a05:600c:8486:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4bb8880606fmr216421555e9.12.1795420012397;
        Sun, 22 Nov 2026 23:46:52 -0800 (PST)
Message-ID: <4170e001-011c-44a6-8cae-8be277511081@suse.com>
Date: Mon, 23 Nov 2026 08:46:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/vlapic: size the all-ones broadcast by the
 sender's mode
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261119220003.38517-1-stefano.stabellini@amd.com>
 <6c0f9314-05ea-413d-89d2-5e63d0182065@suse.com>
 <63acd724-1eb6-e1da-a986-c8fdaf3e955b@kernel.org>
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
In-Reply-To: <63acd724-1eb6-e1da-a986-c8fdaf3e955b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1795420013-583CCCFC-639FA004/10/78276251493
X-purgate-type: spam
X-purgate-size: 1970
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20.11.2026 22:55, Stefano Stabellini wrote:
> On Fri, 20 Nov 2026, Jan Beulich wrote:
>> On 19.11.2026 23:00, Stefano Stabellini wrote:
>>> vlapic_match_dest() detects a broadcast by comparing the destination
>>> with all ones in the target's mode, but an IPI's destination has the
>>> width of the sender's mode.
>>>
>>> Use the sender's mode when there is one, as is_multicast_dest() does:
>>> whether a destination is a broadcast is decided by the sender. vIO-APIC
>>> and MSI destinations have no sender and are still compared in the
>>> target's mode.
>>
>> But that isn't right: Those simply cannot express wide target IDs. Aiui
>> 0xff is uniformly "broadcast" there. (Or alternatively 0xff cannot
>> validly be used in x2APIC mode, or even at all. I fear different sources
>> say different things as to the validity of this.)
>>
>> The situation is perhaps yet more fuzzy there with the 15-bit ID extension,
>> for which patches are floating around. All we've got in the tree so far is
>> XEN_HVM_CPUID_EXT_DEST_ID afaics.
>>
>> Overall with no sender it may be best to simply skip the broadcast check.
> 
> Is this what you are thinking?
> 
> if ( source && dest == _VLAPIC_ID(source, 0xffffffffU) )
>     return true;

Yes and ...

> Note that this also drops the physical 0xff broadcast from IO-APIC/MSI
> to xAPIC-mode vLAPICs.

... yes. As said, I don't think I can establish, from the source I found,
whether the above, ...

> If 0xff is uniformly a broadcast for IO-APIC/MSI, the alternative is to
> accept a physical 0xff from them for every vLAPIC, independent of the
> target's mode:
> 
> case APIC_DEST_NOSHORT:
>     if ( source ? dest == _VLAPIC_ID(source, 0xffffffffU)
>                 : !dest_mode && dest == 0xff )
>         return true;

... this, or yet something else is how hardware behaves (or at least is
supposed to behave). You may be in a better position to find out than I
am.

Jan

