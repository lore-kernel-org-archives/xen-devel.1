Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547D8606A326
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 16:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ss8p33iD
Received: from list by lists.xenproject.org with outflank-mailman.1472256.1680212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOeCp-0002y2-KT; Wed, 04 Nov 2026 16:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472256.1680212; Wed, 04 Nov 2026 16:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOeCp-0002xv-Hh; Wed, 04 Nov 2026 16:51:23 +0000
Received: by outflank-mailman (input) for mailman id 1472256;
 Wed, 04 Nov 2026 16:51:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOeCn-0002xp-SR
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 16:51:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOeCl-00FBkI-Q4
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 17:51:19 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb6278-2eae-0a2a0a5409dd-0a2a4501c6ee-38
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:51:19 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aeb6287-5984-0a2a45010019-d1558030a5ae-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:51:19 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so9223835e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 08:51:19 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-146-71.play-internet.pl.
 [109.243.146.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fecac2772sm4644595f8f.18.2026.11.04.08.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 08:51:18 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1793811079; x=1794415879; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MCZLJXtxRcTXjBlxoOYfqF5W8tL36EU8/bZoI0OaAw=;
        b=Ss8p33iD9QgUvjsy9P9qwX4BA5dWx4o0GzvLcYQXJc1NhIRz/+2/e/ayhX/jrjZQIz
         bDaZ3Z+MDO8vVuWjlfXofDqCAeHU8sy/sVDww0omIDZ8HArlMkLNA6W/OuIPP05duMj8
         0Aw0URWDat/UXSeKzmDjWHTBmgIB9TS9gcqPD/0IpRxD/q8nAtxpqmr2jk+w/OM/cgOX
         /1QfUueJh1Fctgz1W0xJTDOgy01i+d762hQlrF/9N7zcVcNNXBnS9rPnKYYlj3OQRbJm
         ZINBJ0GpJMe2yiThWPF4lf7/jUewqlcQLgNMiAlpkSXhnukWxkt2yjg7kv9vvC92sDG7
         +7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811079; x=1794415879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MCZLJXtxRcTXjBlxoOYfqF5W8tL36EU8/bZoI0OaAw=;
        b=DIdVn4aPn6PIBLlo1k3N8UMMw6vK5ddwu99Va4s4gwLCKYgnC5Jr3PNBgOg6d8i9OF
         eCBNsj3gv+iu/pXzfWBDB0nyv1cS7mE4JKt0gTNghuCw9Wc9xhNr9DoJuhq9glqQPNik
         dDx8VM3C3TBvYU2dsx87UP4R1czkIV6n+Hi6c/p94mSoF3uo4MLGXk7Hh2SwX38L3zdN
         ibyrUgkGvHlrTlvyu7yodim73XWGMlN2aFsbv/Ky1ZGE+oLrAcOoZWRNGZQdm+Lgdxch
         LhcUyRb1gIJTq7IpGwUQtwEPBhKhzuvVCMJyI7t93HtYAZQ56wOk8hBRRZ6MzxAmrDYW
         BJ3g==
X-Gm-Message-State: APuU4Z+Poc/0OL9KWlpxZFvpMup7v95ifadTsiZd4jjS2XIukJL/SrO6
	vKbYrqtVks6depekRYlK0pKO0KoQwZZG97KcNnnhXIwIc/LSDMjmGFPD
X-Gm-Gg: AYBFou2pFftBxfUgGlmBzE9kiSmY7fiZ4OHJ/7TqIyhI1bj1QVKw6M/FouXh9uzGegj
	UIMwrZdJOhMN0iQrDfaDTuHZZ60YQ2YSW8oeujIS7DzJJ/aeaVA+eFciAdjuqojCjbQ6IlnOjjr
	a2UkQ6VewO06gOv/B9eaafqDonB7kon8lg7MV6h7eepx8HaGOj+bf40fT4nlZhxMJyKKfsuDHTl
	QkR1d2o/3epb+hFpoy/tSyuktKZCIRLZFhlvX9GhcERFw1hJPPm1YzhXPGY2br3a5o9V2IaoR3Z
	aN+9lTCwhkmKgD5a8mkJovfCsWf4FDGCTaN26LmlKICnCShML/x9IX/w8DMetDRdHBmFy60a/kY
	rQ43facWvROvvRTfPRGf8SbHvO6L6AQi7lNjZ+nnd1dHz+B8pSjKXFNjPfoMvSbi2hyp0gF3J4w
	ECpmJ+51hzRd+e6DpfGbq9N91zx6rEUqTRqANPOXPgTCRfGsztsFa+Oyr4Ceg12xsRgCtuev8ES
	vHTGCMrDstBTB1XYn7ix2azWAd2jIgVm14QsXcCN8TTiI9+zbdy4PBbzjFpdyU9Y5rTovzYO+t9
	0fK6d1/PS6NzGkN52CmlauAaj1amRm+0UoP4Qoaw7gLtMY+5xPVASXT3IwMkJsaiYEGVazxm8Rm
	7MeA=
X-Received: by 2002:a05:600c:a111:b0:4a2:c41:d85b with SMTP id 5b1f17b1804b1-4b56135a436mr353325e9.17.1793811079145;
        Wed, 04 Nov 2026 08:51:19 -0800 (PST)
Message-ID: <8b64f6d6-096c-41f7-9ea2-8429be44582b@gmail.com>
Date: Wed, 4 Nov 2026 17:51:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 25/39] xen/riscv: add guest store emulation for trapped
 MMIO accesses
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
 <ee4611cd5d3388eda12c611eeebec6b354a49681.1790779209.git.oleksii.kurochko@gmail.com>
 <1792672657.8631fc262581453bbf619ec5b2062170.1a1639df031000f79f@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1792672657.8631fc262581453bbf619ec5b2062170.1a1639df031000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793811079-C495A757-5E130CA5/10/73395122804
X-purgate-type: spam
X-purgate-size: 1182
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/22/26 2:37 PM, Baptiste Le Duc wrote:
>> Extend the guest page fault handler with store emulation to support MMIO
>> write accesses.
>>
>> Like emulate_load(), emulate_store() obtains the trapped instruction with
>> insn_fetch_faulted(), which also deals with a fault taken while re-reading
>> it, and decodes it with decode_ldst_insn(). As with the load path, the
>> access is completed synchronously through do_mmio().
>>
>> At the moment only virtual interrupt controller (vINTC) traps are expected
>> to occur, since it is currently the only backend registered with the MMIO
>> handler dispatch, so in practice the store is emulated via the vINTC
>> backend.
> Nit: the wording is unclear because "emulated via the vINTC backend" sounds
> like the vINTC does the decoding, I'd suggest:
> ```
>      At the moment the only MMIO handler registered is the vAPLIC one, so in
>      practice every trapped guest store ends up in vaplic_mmio_ops' write
>      handler.
> ```
> Instead of that, 

Good suggestion, it is really better!

> everything LGTM, so:
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 

Thanks!

~ Oleksii


