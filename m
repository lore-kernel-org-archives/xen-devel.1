Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B137606A337
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=avhHecj8
Received: from list by lists.xenproject.org with outflank-mailman.1505191.1700068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWwzJ-0003ot-E4; Fri, 27 Nov 2026 14:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505191.1700068; Fri, 27 Nov 2026 14:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWwzJ-0003om-B1; Fri, 27 Nov 2026 14:31:45 +0000
Received: by outflank-mailman (input) for mailman id 1505191;
 Fri, 27 Nov 2026 14:31:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d6b400b0004767@swg.vates.tech>)
 id 1xWwzI-0003og-I4
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 14:31:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWwzH-00CBQv-UR
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 15:31:43 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d6b400b0004767@swg.vates.tech>)
 id 6b099445-e002-0a2a0a5209dd-0a2a4502bd7e-28
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:31:43 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d6b400b0004767@swg.vates.tech>)
 id 6b09944f-4900-0a2a45020019-b9ff1c238f25-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:31:43 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21d6b400b0004767.009 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 14:31:37 +0000
Received: from [192.168.1.72] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id DCF4981564;
 Fri, 27 Nov 2026 15:31:36 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=6cyRRaitK9su3cn1fGcQ+jhrTDCjaBfg9w+nOpGahaU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=avhHecj8oaNr3rsetas42r9glEUfaiVJ2nGNmNnE0ISL4rC2LyJ9BPFbpk96xdGWHo8bPRjIj
 dBzcQtA30UN+TTZPITrBzeeeJbincA0HBybCj3OUCwYfsGoPwSGOPKZRitNQZZruvmb8RtmC5R+
 uQOPwJ1WmUJmvSpdCVxp9jdHBhzuLQymArYiv/9V/mJ08bcR0Yhypg3mK9hzqWT6ICnl8qYOgzV
 qmPFyYW1+13nEUq1CJZ7Li6R6w9kmMw3Y+01VDUiH8GgzylyVjLXAx5wRchpuzFzpf06vd/a5pQ
 bxeFfaUe8P50W7ZUAVSH6Tq2TstKyW385h+OtZRYeeow==
X-Zone-Loop: 010ba2c38f2381efcb8743333191d246e585c9baf26b
x-campaign-type: default
x-transaction-id: 48a5d973-500c-4d20-8992-b63c09d02a3b
x-swg-uid: 01-fbe9305d-2c29-4944-b75a-8c2e11290790
X-Mailer: Sweego
Message-ID:
 <1795789897.8631fc262581453bbf619ec5b2062170.1a21d6b400b0004767@vates.tech>
x-swg-bid: 1795789897.8631fc262581453bbf619ec5b2062170.1a21d6b400b0004767
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Fri, 27 Nov 2026 15:31:36 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] CI: add a Debian 13 riscv64 QTB container
To: Hiago De Franco <hfranco@baylibre.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Zhang Zheng <zhangzheng@iscas.ac.cn>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
 <1793714905.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d@vates.tech>
 <dfbfm4zxihnq6lhmi62effapbrdkzqtsmz6fa2b3ekt5v3rjfs@v4i6o7jchwtv>
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
In-Reply-To: <dfbfm4zxihnq6lhmi62effapbrdkzqtsmz6fa2b3ekt5v3rjfs@v4i6o7jchwtv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795789897094
X-purgate-ID: tlsNG-720697/1795789903-F8B206C6-B5CF94D8/0/0
X-purgate-type: clean
X-purgate-size: 1949
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi Hiago,

Thanks for the review.

It seems your reply did not reach xen-devel, I cannot find it on lore.
AFAIR you already faced this problem. I am not a list admin, so I can
only guess: maybe your baylibre.com address is not subscribed and the
message is held for moderation, or maybe something in the mail format
causes it to be rejected, for example the References header of your mail
contains the lore URL suffix ("...@vates.tech/T/#u") instead of a plain
Message-ID, which could break threading. Could someone with access to the
list check?

>> QTB depends on pexpect, ptyprocess, pygdbmi and qemu.qmp. Rather than
>> fetching them from PyPI, install them from the wheels vendored in the
>> python/wheels/ directory of the same fork commit, with pip --no-index.
>>
>> [1] https://gitlab.com/xen-project/people/amd/qemu/-/tree/safety?ref_type=heads
> 
> If I understood correctly, the container is available through 'make -C
> automation/build debian/13-riscv64-qtb', but the CI pipeline on
> containers.yaml only builds Arch linux and openSUSE images, therefore
> the new Debian image will not be built or pushed automatically. The tag
> is currently missing on
> registry.gitlab.com/xen-project/xen/debian:13-riscv64-qtb. So in this
> case, if I did not miss anything, the container should be pushed before
> this patch is merged, right? Otherwise patch 5 will fail.
> 
> Anyway, apart from this question the patch LGTM.
You are right, containers.yaml only builds the
Arch Linux and openSUSE images, so debian:13-riscv64-qtb has to be built
and pushed to the registry by a maintainer before patch 5 is merged.
I will mention it in the cover letter of the next version.
>>
>> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
>> Assisted-by: Claude:claude-opus-5-5
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 
> Reviewed-by: Hiago De Franco <hfranco@baylibre.com>
Thanks!

