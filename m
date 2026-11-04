Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889FD606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 11:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dfTriTCK
Received: from list by lists.xenproject.org with outflank-mailman.1471733.1679956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOZN7-0007OJ-9k; Wed, 04 Nov 2026 11:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471733.1679956; Wed, 04 Nov 2026 11:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOZN7-0007OC-6t; Wed, 04 Nov 2026 11:41:41 +0000
Received: by outflank-mailman (input) for mailman id 1471733;
 Wed, 04 Nov 2026 11:41:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOZN5-0007O6-7S
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 11:41:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOZN4-006oUD-KY
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 12:41:38 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb19e9-8faa-0a2a0a5109dd-0a2a4504e6ae-22
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:41:38 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb19f2-b57f-0a2a45040019-d155802fc5f6-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:41:38 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso4211665e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:41:38 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-146-71.play-internet.pl.
 [109.243.146.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed5538basm3246056f8f.44.2026.11.04.03.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 03:41:33 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792498; x=1794397298; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adNm7kEBtahaDnpiW3zrayP8SQn/LsbQiKyz3cypDyM=;
        b=dfTriTCKj7IXlddR6AhADE6rVoC0eetKz/Mnywtbe7/5Oh4iN/tgRU8AZFyZ6tdQKD
         Owh1xV1XiY+Ci+ztyYRPMneFAIBqMGY5YDlJ93WJpJ8qclrRxQVZ/3t+qqEHp3ilrTXv
         aLkSieM9hNNWEJ9ieeUhZIkVz7DLZ3nUb1jHRHxg6sh0LmeA5aJXc8UzlIg9hJ1apOKL
         uNn7ALl2BU6iz8Eb/CDif+KImUd1+3y0YLrlbKpVc3GjmHsFbyqkljNjXkmQ2hiMZYGL
         tN4SyiuTLko8s7MgczhZwRC2qLqHciEEtgHkJUntqEHb8w0WzhbgQ4XOy/hzLjdRrycN
         VgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792498; x=1794397298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adNm7kEBtahaDnpiW3zrayP8SQn/LsbQiKyz3cypDyM=;
        b=mdK4ROWSkkgnLuFRRPTImYIgoqHSms5M+AsIrMnB8S3m6oBchlt1wSykKWKnl7MOxk
         7mFkvL+quT+BhWnAZK+2v1qaK1Mp2Tsj7URETGpLOOLHC7nb+HCExNp8OSkBEX9Zk9/N
         fcRVt85bKIwmFaupGBLTxU+QEPUKH2N3VyoYsPPtAlmdBBWV+fB4NAFjuuA6MP8grLQL
         fA1wzpK3gr+Uxp9R8njbRMgFju/AJxX6s6xaHVyyLNEfcyJuzMgOY2M2xXRdD87s0vZv
         YOeafH/CT+PbSkmoYEdohNNIElE+nGz/PlhcpnDybNSncnz9cGTyyCd276oIQtW/MVNK
         Gg1w==
X-Gm-Message-State: APuU4Z+Ti75zT8bsNUZV03cHh+aJSfP71Ywi/vW4Nwhw0eDDf3RvAKb3
	enb9LkRxUdOI8BkQ4Vq1DmO0QDlIdNd6WZrFR1pQ4QZp6zJQog4IbRzc
X-Gm-Gg: AYBFou0zXNOsHK/AfGwkZJwmQl0TPedADQFMaxshdnhliQuHt/DDmsFCB+99yibfMWJ
	AC3J8msxsQ8LKNx6MpUqwNUBNxtnpAI++B9ABx1YsnJNe3QM0fqB7W5Rl/TZxFZIWoKVBQ8+Kik
	kywOsiw4Cdfec5g79+IRcYWHzyxhsl6bir1K/FAAG3ovFwJc7zFUwjYYR0IIbwGL3R3v3Inq5oY
	xSusVAkGEMLSopzDB+llZmsHpJDVgw8KTY5/n0wbGkYF9cHP18Ut49NsnTc1Uyik4qoNkKG9O5v
	GwLRbx/YneOy2x5kndIgP2abMm6YEzZ6tkSO2kWA1bh5c+VNdZJu7dVNQnYfTR/jyikwYD7eqbh
	dZaWSAxznlrzq6FSTkm0kOUvc99erdn6bNKA+ql9/jEoD0LerII0N8+xuFeBcQGoeISzYZJrgWU
	EcnXcfirQY7mHberZ/VO2+ixDmBGeVcv8WisaY4VRsdS7ce9JDRgZfN9zJnNP66kdQuQEUxzzfQ
	KKHPPI1usOsRGOIIothF6/93Iflf5fE8fRshR4dATMF68cX0U7n2V75obAGGHvXccsXhMGosIyU
	3dU7ZpzvLeYi4Q8iBj7bXGeSG5ZHsS7uqIrT6A4gBdwhD7XVNFRZA1rv7DSwxsWbmxEZTeLyi2f
	SPk4=
X-Received: by 2002:a05:600c:83c5:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4ac17191074mr325681235e9.5.1793792497976;
        Wed, 04 Nov 2026 03:41:37 -0800 (PST)
Message-ID: <8d0df627-236e-4fa0-b3bd-b803305f6fc3@gmail.com>
Date: Wed, 4 Nov 2026 12:41:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/39] xen/riscv: implement trap redirection to a guest
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <109f3a920a2f5e58de5889ac2bcb834cc7ce967a.1790779209.git.oleksii.kurochko@gmail.com>
 <179250973602.489973.14893581320042795275.b4-review@b4>
 <1792509935.8631fc262581453bbf619ec5b2062170.1a159eafd67000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792509935.8631fc262581453bbf619ec5b2062170.1a159eafd67000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1793792498-520D5B50-D842B6E2/10/73395122804
X-purgate-type: spam
X-purgate-size: 850
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/20/26 5:25 PM, Baptiste Le Duc wrote:
> 
> 
> On 10/20/26 5:22 PM, Baptiste Le Duc wrote:
>>> [ ... 54 lines skipped ... ]
>>> @@ -107,6 +107,11 @@
>>>   #define SIP_SSIP            MIP_SSIP
>>>   #define SIP_STIP            MIP_STIP
>>> +/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
>>> +#define STVEC_MODE_MASK        _UL(0x3)
>>> +#define STVEC_MODE_DIRECT        _UL(0x0)
>>> +#define STVEC_MODE_VECTORED        _UL(0x1)
>>
>> Nit: STVEC_MODE_MASK needs a third tab for its value to line up with the
>> other two (and with the surrounding #define-s).
>>
> Instead of this small Nit, everything LGTM:

I suppose here you meant "Except of ...". I will apply your Nit.

> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>

Thanks!

~ Oleksii

