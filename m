Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C74CA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 15:04:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441581.1659179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE6hv-0006E3-Mo; Tue, 06 Oct 2026 15:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441581.1659179; Tue, 06 Oct 2026 15:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE6hv-0006Dw-Jz; Tue, 06 Oct 2026 15:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1441581;
 Tue, 06 Oct 2026 15:03:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE6hu-0006Do-81
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 15:03:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE6ht-00Er7J-KC
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 17:03:53 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac50dd0-8faa-0a2a0a5109dd-0a2a45039b50-28
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 17:03:53 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac50dd9-fae8-0a2a45030019-d155802fb97d-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 17:03:53 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a0e1b0681bso6466395e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 08:03:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178c49c35sm85164955e9.9.2026.10.06.08.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 08:03:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1791299033; x=1791903833; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CasQ129JnTi1hA4u0R+Ibd5/V27+WKUsP8JrxJJeiTA=;
        b=MkpMIRWPP9mxbhoSfYQ1ZhsTFlmAJLLSub+v6FITtX9tIlY2eBaIivaCCJ/mtdcJF1
         y7Qyca/jQdRcpN3WloBBtI7rfRvRCbZW6zY7uohKmgApiAlOaxMWoxc7zsYnaLHjfos0
         e8BGU9lHYGL9vzlOaHlFwDqhVhRP0UF50Dk+UIOlwGpmolHhnfxJdBnjRJXEJN5+JxBv
         IH15PW5SKctnj31Qlbv8EG0S7TA2QhMM4jzxSyH3NH4tuC1M62ShFPIYHATs2brWx8tX
         aj8pyteEG5aDxTPHqG8/pXTVlIfdyLnqItFy3utq4sKbGmfNv+5WHEd1ioWAgD1fqjp5
         99TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299033; x=1791903833;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CasQ129JnTi1hA4u0R+Ibd5/V27+WKUsP8JrxJJeiTA=;
        b=S71uz8Lj6VHhJMrPClK2IvPW4QXEy9zFVr+7yZmPnf8rW9qyy3KMCUXdWwmBd2s5Ox
         V1m7HA+Yk67T9/zHgyLxsuOYadm4+wXFhy9PJQaKaORxxLxItejTy1GWOu9T6u+Bzs92
         fltvfLEN9V4RAg+XHL0muSpsmsAYQWk/ww96trbzCBYQ7V4p+uBao2QC2L3Fh3oXpeh/
         0gRnC9dpDRFpcg3YNpzyHC8QUCn3aLGtVTka8l/XCB9nV2GzQQgDlAc9bipXB2tpjC/g
         PUNoxcPiSGFbEn/Ib08U9nbe87B476e9HEl/+Rh9eEDLtnIpbw7CTOLRVTF9xNux6b3d
         l97A==
X-Forwarded-Encrypted: i=1; AKwUvBzabGvjdCF0uu0HGw6fQGGzF3hqJzxNtH4Rs8EqM98Z9xSuJwUP7thVXpQ8cyrDTtom0eJ2K5aflTk=@lists.xenproject.org
X-Gm-Message-State: AFuF++kxFI3ztY8fIL9FQ+ZmTkak3tc9VHx1qa27vWvyxiUt2AvWE6Aj
	nzyigkjzXPTFi7F1dWje29AB6eGdolVYg+IESDJKXbQdYJ94EHC6n8I0fR+M28hFNgPKAEhZRYl
	+lR789g==
X-Gm-Gg: AYBFou3mBoE8ulVTTrKRg4ZvSpK/jfXa65IiNl8WWEmj5jJzxZ6YllZgFBLHYCkUJMA
	P8gP3d0Y4r3q3uWUa4DR0B1PRa80t9aFF8940XY3PLeySYK68P61H9AdHdIk+ZwAOWm3NsXPCUr
	W/vAJMT/HXjFwMApnjw76TNa43EiU+4DinwKwWNg0DuIgjra3TdT1cRO7fiyM11wtnz7xZFu2W9
	rNS/KDNjWbYcjGRAayW7YDQq2RTRtAVDwwGjvVf0pSxV1fEjYOCQNR5j6GD8+HFnMYYyB44YhjH
	IiVhybalsHUjLYaXu5uyzOE6Pw9CF5XNxmvBcc0VOAivz3cTuwwdpBSyFiTbhZUJe5FrQO0UC4j
	iEmqq054/A3FetySMkqBqvIO8OT2ytayk3mu8kuQQapb/LBza9T0VCSDwDzlkErRXGfwSIKeeqd
	G2+WfETnk+1GrkqDeV9V2PtETT8/POs7/5dw/PCNU8imc46nEU/tTmqcYJa82f1dZl9f4X18C23
	U8yAqbNLDz/aZripRnjQ/lyhfXEV1q1OX/KrZuQHSE7Q5+FbM4JLSpxDMAEKw==
X-Received: by 2002:a05:600c:6592:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a17b5523f2mr31249255e9.30.1791299032616;
        Tue, 06 Oct 2026 08:03:52 -0700 (PDT)
Message-ID: <03338d69-cbde-4918-8ffd-c309230d337f@suse.com>
Date: Tue, 6 Oct 2026 17:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Eclair: scan the last xen-syms linking pass on Arm
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2f67ef7c4593d3ab94b75b5b819e7e046e055796.1791293680.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <2f67ef7c4593d3ab94b75b5b819e7e046e055796.1791293680.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1791299033-778F24E9-0C083398/10/78276251493
X-purgate-type: spam
X-purgate-size: 1112

On 06.10.2026 16:23, Dmytro Prokopchuk1 wrote:
> Hiding .xen-syms.[013] assumed the almost-final image is always pass 2.
> On x86 LAST_LINKING_PASS is 2, so .xen-syms.2 stays visible. On Arm
> LAST_LINKING_PASS is 3 and the final image is .xen-syms.3, which was
> hidden. Pass 2 is usually only a symlink, so Eclair saw no program link
> and reported every translation unit as unreachable.

When I did that work, rule 2.1 ended up clean for both ARM64-* analysis
jobs (iirc). Upon re-checking I now see that ARM64-amd has 177 violations
(apparently that's what you talk about above), but ARM64-allcode has none
(https://gitlab.com/xen-project/hardware/xen/-/pipelines/2916569232).

> Stop hiding pass 3. Passes 0 and 1 remain excluded.

This will cause scanning of both passes 2 and 3, i.e. consume more time
and report duplicate violations when both passes are real linking steps.
I think we want to be smarter than that, to really scan exactly once. I
don't have a good idea just yet how to achieve that, though (and I was
wondering already when putting together the original patch).

Jan

