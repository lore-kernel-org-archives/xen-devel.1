Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C262CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 12:55:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451809.1666666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHhSS-0008GF-Rn; Fri, 16 Oct 2026 12:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451809.1666666; Fri, 16 Oct 2026 12:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHhSS-0008G8-O0; Fri, 16 Oct 2026 12:54:48 +0000
Received: by outflank-mailman (input) for mailman id 1451809;
 Fri, 16 Oct 2026 12:54:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a144c773b70008425@swg.vates.tech>)
 id 1xHhSR-0008G2-LE
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 12:54:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHhSQ-00BGix-Qr
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 14:54:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a144c773b70008425@swg.vates.tech>)
 id 6ad21e92-8faa-0a2a0a5109dd-0a2a45039924-10
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 14:54:46 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a144c773b70008425@swg.vates.tech>)
 id 6ad21e96-fae8-0a2a45030019-b9ff1c2291c9-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 14:54:46 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a144c773b70008425.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 12:54:44 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7FB9C81C51
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 14:54:43 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=OFrjOydgbXbYmd2KfoPWBQuqOzqAk+vjEZYtPkE6yYk=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=QEQQ+/R2x9/OqItkW0lBrTEO0xSExxKxyupPXFChoQslFmtLf8mOizonkbO5qqsouBw1fohz4
 a5tnBX2ZPxPNf6IdnXdS8k8KZ5Bn8mTABW7JWgLNgCsd8ISZsYumCywuRXnl6g/b4LftC+7Cm71
 oyaXtX4FUsPwcDXRjtz9qFeJURSAJ8lK9yqMET/j67H+B7LEUwWyDoJDNLzxe/c5P/X4y0Z/Pvm
 QOHVW5yUusPCedURZPJRWlHXs+KKLE55YM3SRIMqWbu283wdfxr1dy2L0f6YZoQIrS1Nz3V8bwJ
 Wj6qTc5jgOXCXhSEiBtURj6hv7IzioItlr6JIp6Q435Q==
X-Zone-Loop: 02c6435009343f1a2306fc2243c04923f85cf971622e
x-campaign-type: default
x-transaction-id: 47ecea21-6ce2-4cba-a1a3-e505dad5c52d
x-swg-uid: 01-6d23d54f-4718-488b-9ae3-55576cbb96e7
X-Mailer: Sweego
Message-ID:
 <1792155284.8631fc262581453bbf619ec5b2062170.1a144c773b70008425@vates.tech>
x-swg-bid: 1792155284.8631fc262581453bbf619ec5b2062170.1a144c773b70008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 16 Oct 2026 14:54:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
To: xen-devel@lists.xenproject.org
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
 <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
 <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
 <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
 <81ad5bb7-2300-4ac2-a999-adbb39270ddf@gmail.com>
 <2f04c46d-f533-4eda-9bd1-8b8e100dff07@suse.com>
 <1792150520.8631fc262581453bbf619ec5b2062170.1a1447ec1cc0008425@vates.tech>
 <25337ffe-67fe-4db9-8407-2f227eebaf32@suse.com>
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Content-Language: en-US
Autocrypt: addr=baptiste.le-duc@vates.tech; keydata=
 xsBNBGoPSX8BCADSuTikqW3FD4mscQugY1thRaKlIhcJ2G9YCWYXAlp+xosvTlzfIftOZZim
 750MLvyKtLPkQzB6TZtFZBiexSraaF/MdDKRTT5DcVa3r7ZnHgqMclWlPa4ioysS4yFcJanL
 cyNOT7HUFvIdirMMqiViedfYtS0GORPBBPVISD6ClMz3ecHIxqllfq9CHYQn4amKEfHmh6tm
 Rufo4Gjl6x8cUFZZlRQf+aCmUzdSPA0P5u3sueYH1uEz4w/jbD53MlKqzCvxUeOsfS2swTQA
 6mS9jIgOjNadpUTOzKfDHMgFirtG+HFpm45Nwp6KQizxgDVOfTnOfVHm5Gwqm3ETl9y5ABEB
 AAHNPEJhcHRpc3RlIExlIER1YyAoVmF0ZXMgWXViaWtleSkgPGJhcHRpc3RlLmxlLWR1Y0B2
 YXRlcy50ZWNoPsLAjgQTAQoAOBYhBGiSJ6HgW88MgT/gfu2Cu2XL9M6QBQJqD0l/AhsDBQsJ
 CAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEO2Cu2XL9M6QuMcH/ihiy/Nrxp919AmY0ENnc0NK
 r/2LDvW/hrX4FfbpxAmrGmQ7MU1aQTk0JDbfcsG8OYH6wO5sqnXb1gz50YrEdpfVSbHz5YTZ
 EhDIxE4g7NrvJZh3Qc0m0CAyjYTNHen7J6olVaCMjrOH7uRHUYZ7Pl3am9mZosfLmez/aWJO
 a6ihQxBXHI75brlk1teIURkep2kP7P0Flmfl4cA//saREoTF7GXCtjOSQk/xg8PP0Sswqp5G
 TdJptn3FQn6lAzfz0eFSYqkaoX2c2k1MDa7o+UX9cfGPL8ybMKnYkasLxck6eOWGJWf+YTrm
 ga/r0kBaftmqNDgt5nI2jNTDwZcT9g3OwE0Eag9JfwEIAM6IWbuBSvz+erv27oGDDpo8M6Fp
 dGUvft7v+WceHUfxiXpYFx9qgIU6XGy6y+3lJMAvNcltS8DuhioqMlfKRSYGKZlpliY65dNP
 557IuM4ctVJ+I9CVclvv9eahARQKgF5auLJAAlvGSmU+ufNvlwTUmLIRcrPviTmB6X5jJYc+
 fiNeyI0HcsgcN21C0r62tUCypuZ+vgEJXw2bx1V8mVGZKxdGJPh58QF6kRK+xmd4kEComLGV
 BeM6BcVOtEjDcGNC0tLhXb0p9g1Ys55iA8sd6s4WacyolW2J6rwmcOkjiWexWw1caYgIWAV1
 004M3gwUaOz0dGq2i7HQ0AiVfVkAEQEAAcLAdgQYAQoAIBYhBGiSJ6HgW88MgT/gfu2Cu2XL
 9M6QBQJqD0l/AhsMAAoJEO2Cu2XL9M6QovYH/RjstyL5o/V5K74ylBtz0j5t3pLX5JKbwApi
 656rGgDdqElImyvvZppNMl/mgHNzvxmfFAhJXnSX9f1fqVEQKOGEhLUastnl/ssBiE5x7btM
 V0GAffxXbXJZbVv4b/DI+gVrOPc2YXlVwruapvTZNtD3hqPrkjrmq5WTtGR2loIVSe62hmh0
 BGD2Fy79b/hYWyBqhayPBEjwGW75u4/yn+Yqy1PgG3hIcvg7GSuT3akhHZSB2Mbguzcoyf9Q
 DJl6t33JxPRkkNrEdkPPmRlQCTSiUkVjKqMDF3jlINWsJ5t4jKFsNF91ksdw7aQgiX+tQIpE
 ugMC1NuNi5dDGip66bw=
In-Reply-To: <25337ffe-67fe-4db9-8407-2f227eebaf32@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792155283568
X-purgate-ID: tlsNG-33051d/1792155286-6F2C84E9-9213B6CE/0/0
X-purgate-type: clean
X-purgate-size: 2740



On 10/16/26 2:51 PM, Jan Beulich wrote:
> On 16.10.2026 13:35, Baptiste Le Duc wrote:
>> On 2026-10-15 18:04 +0200, Jan Beulich wrote:
>> Based on Andrew's answer to your question on GitHub [1], I see two options
>> for handling a DT that doesn't advertise the scheme in effect. Please
>> feel free to choose one.
>>
>> 1) Trust the probe and fix up riscv_isa on a mismatch. This avoids having
>> people edit their DTs, and is safe as, per Andrew, the spec has only ever
>> allowed these two schemes:
>>
>> /*
>>   * The privileged spec allows exactly two schemes for the PTE A and D bits:
>>   *  1) hardware sets them on access and on write.
>>   *  2) accessing a page whose A and/or D bit is clear raises a page fault,
>>   *     so that software can set them (ratified as Svade).
>>   *
>>   * Hence an implementation without Svade uses the hardware scheme (1), and one
>>   * that faults on clear A/D bits implements Svade, whether or not it says so.
>>   *
>>   * Rather than trusting the DTS alone, probe the scheme in effect with a write
>>   * through a PTE whose A and D bits are clear. If the DTS does not advertise
>>   * it, replace it by the probed scheme. As the spec has only ever allowed
>>   * these two schemes, this is safe even on implementations that predate Svade
>>   * and Svadu.
>>   */
>> static void __init check_ad_scheme(void)
>> {
>>      bool has_hw_scheme = probe_hw_ad_update();
>>      const char *scheme_name = has_hw_scheme ? "Svadu" : "Svade";
>>      enum riscv_isa_ext_id ext = has_hw_scheme ? RISCV_ISA_EXT_svadu
>>                                                : RISCV_ISA_EXT_svade;
>>
>>      /* Fix DTS in case of mismatch */
>>      if ( !riscv_isa_extension_available(NULL, ext) )
>>      {
>>          printk(XENLOG_WARNING
>>                 "CPU implements %s but the DTS does not advertise it\n",
>>                 scheme_name);
>>          __clear_bit(RISCV_ISA_EXT_svade, riscv_isa);
>>          __clear_bit(RISCV_ISA_EXT_svadu, riscv_isa);
>>          __set_bit(ext, riscv_isa);
>>      }
>>
>>      printk(XENLOG_DEBUG "CPU is using %s A/D bits scheme\n", scheme_name);
>> }
> 
> Yes, if the assumption is that this would be used only when neither extension
> is advertised, then I agree (taking Andrew's response into account). I'm sorry,
> this has been quite a bit of back and forth, but hopefully we're now all on the
> same page.
Ok thanks, great to hear. Just to not mistaken, when you said "would be 
used only when neither extension is advertised" it would means that in 
other cases where there would be a mismatch between what the DTS 
advertised and what the CPU actually support we should panic?

> 
> Jan


