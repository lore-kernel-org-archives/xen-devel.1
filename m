Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9A1C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 14:55:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414838.1644531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gB5-0004y5-EH; Thu, 10 Sep 2026 14:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414838.1644531; Thu, 10 Sep 2026 14:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gB5-0004xy-Al; Thu, 10 Sep 2026 14:55:03 +0000
Received: by outflank-mailman (input) for mailman id 1414838;
 Thu, 10 Sep 2026 14:55:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4gB3-0004xs-UV
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 14:55:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4gB3-0013j2-2O
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 16:55:01 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2c4af-e002-0a2a0a5209dd-0a2a450cb8d0-32
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 16:55:00 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2c4c1-f479-0a2a450c0019-4a7de18cbff1-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 16:54:57 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so13271395e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 07:54:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49db038401fsm51458155e9.13.2026.09.10.07.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 07:54:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1789052096; x=1789656896; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rg9VvSCiSky1Aa1edsln0MYc8zxkyfgdBVKR74he1+c=;
        b=DlQlKOLIV1NsO0hvvH54Kt/bfSp+DotuA8a7Qks4gvtxuydzhCV6Kjm8GBs1FivLnV
         iRxvfC99zEcSrYnS105Ult4CUPlVjmHEaOSuIQvakfCYPc9csBpQP+MnqaNssCtIX75o
         0pdmvr6HZ6t1lyx4Mle5JklKxugMq3ORzvMiaurJxWuHOhjOveHIcgLRZ7qbnKxu+ZHG
         4ZiQoxjIoQbddU+54d1ZiCc7+uy4wPzkFRL54CaFQnWSyNxIlAQ/QXzNH0B98Z5PajXX
         70cgkn1aFb/bUzPp9yLc97x9lU1wWDkhYkVtzvcMvFKT9ya3uYD3cDoFfwTxmgrsCHuh
         r1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052096; x=1789656896;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rg9VvSCiSky1Aa1edsln0MYc8zxkyfgdBVKR74he1+c=;
        b=UzbsdRp8FH411rpIaN88/B4TaP7PgR0ciaXg+yWpa4OEObbTJkGJCc+ZP/zWZRDmdn
         Q4C355iFPMmqZx2JBSZmF1bXJCtooocNJpk/pTPChgCnZzjZ55fWVjZ3trAcHmTDRmih
         bSI7v2GGSKxBjqazmtFIrbF2mJzynHJJZ5rxsoS5Uh6ERHPnBNvsExbhqVQ2xEIQBkdz
         +TscxLmvh+5MTf7I5MafxxxoUErffX6YaAp+ll28/wSyG6sARSYVHE4x5R2oOJ865a41
         d9+neRxBmqQmjfX9too4m8gX0yzUmTSDYhb74NzW2T+C0D77Ku70ezoxGB0pNEiYFqAQ
         2/hQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqviRD4T9FOH9df/TaxALa1fRdzkROqCYLPp1M4E+CuvN50kidyzaJQFWi7MJH8zTWNV0Qrr+eopA=@lists.xenproject.org
X-Gm-Message-State: AFuF++mybli6ovuubNNBAlAQaqcTCOeztTch/X0J1lBuiUIb8cHw5U9o
	5DJdG84GrkGVpIqfiCqx+jzshkrpae05v8o0JichMS0aRKnQezrnewqN8cDKiCrl1A==
X-Gm-Gg: AYBFou1xWwnCsDSCAB+cEz8us0pPUXZ5zS3COLoUzUrhcXursCnJZ1dzSpSoGc/3jy9
	vZ9j4351EdwsFZi3HoH39zWUg1vjuqjIEy2uY1GE4Ufxka8B5IDg0RtSG4/OGa0et4qvKf/0lth
	sprQ2E6oXPp5RlOFnqvhRJ7hOWXixLEhViTB5fh1lOhFSRvPNhEDB+z1FPvBrI5BTh8p0bURNfT
	XG+mHlBMliaFOX+peHrJIQgN5uqk66l25VbGGtkdne2PLG13WdHEfhS+qpd1ShyH1PUHJ26IduT
	2E/nTdHVI+V0XyVYR3t3kGJ7qOGzAEQcfgTw+G4dYCTjqAOZ3n3HCO/8pugv7Sv17l6Jwom8TM8
	ha3qSPU4FB7hz24DE5zU4cd7S+JVl82FGD82+VTfq9edN9/TszE3JLCA0Hj9Ur3TcCuTDfXnmkZ
	gVR7Kd7n7tjOGkMCgkqg6ARxKHO3OPPjAdI9W3p7LCqyNfpAR6a+6fckXg4Rm8Lml4fuTt7Vtnb
	lCBvUAuXBnAhXSgwdJi0Jloe7/PcXo99jwq3Ta4GkfnnZ9fsTBirBs1Me6yFbQ=
X-Received: by 2002:a05:600c:3f05:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49d1f223e83mr255035935e9.4.1789052096555;
        Thu, 10 Sep 2026 07:54:56 -0700 (PDT)
Message-ID: <b7db109b-519d-4359-9a7b-c74f5d9d770a@suse.com>
Date: Thu, 10 Sep 2026 16:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/39] xen/riscv: introduce
 vintc_ctxt_switch_{from,to}()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <678236568970b18a1924a76588c4c50f9bf0c659.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <678236568970b18a1924a76588c4c50f9bf0c659.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1789052097-006CEA5B-77C1E818/10/73395122804
X-purgate-type: spam
X-purgate-size: 932

On 27.08.2026 17:20, Oleksii Kurochko wrote:
> Virtual interrupt controller state must be preserved across vCPU context
> switches.
> 
> Introduce vintc_ctxt_switch_{from,to}() wrappers around new
> ctxt_switch_{from,to}() hooks in struct vintc_ops, and call them from the
> context switch path, so that this state can be saved/restored without
> knowing which vINTC variant a domain uses.
> 
> No vINTC variant implements the hooks yet: the vAPLIC implementation is
> added separately.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Also in case you decide to ...

> ---
> Changes in v2:
>  - Update the commit message.
>  - s/vintc_state_{save,restore}/vintc_ctxt_switch_{to,from}.
>  - s/{re}store_state/ctxt_switch_{to,from} for vintc_ops.
>  - s/vcpu/v for vintc_ctxt_switch_{to,from}() arguments.

... rename them again to n / p.

Jan

