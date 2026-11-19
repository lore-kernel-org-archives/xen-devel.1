Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698B1606A324
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=D6ynb8G+
Received: from list by lists.xenproject.org with outflank-mailman.1496564.1695041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU44N-0007EW-Sb; Thu, 19 Nov 2026 15:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496564.1695041; Thu, 19 Nov 2026 15:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU44N-0007EO-O8; Thu, 19 Nov 2026 15:29:03 +0000
Received: by outflank-mailman (input) for mailman id 1496564;
 Thu, 19 Nov 2026 15:29:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f46cd871000183d@swg.vates.tech>)
 id 1xU44L-0007EI-AU
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 15:29:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU44K-002T1o-1e
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 16:29:00 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f46cd871000183d@swg.vates.tech>)
 id 6aff15b9-bab6-0a2a0a5309dd-0a2a4501a4b2-26
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 16:28:59 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1f46cd871000183d@swg.vates.tech>)
 id 6aff15bb-5bcc-0a2a45010019-b9ff1c1287e1-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 16:28:59 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1f46cd871000183d.009 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Nov 2026 15:28:56 +0000
Received: from [192.168.1.37] (lfbn-gre-1-56-253.w92-157.abo.wanadoo.fr
 [92.157.33.253]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6EEFE82C97;
 Thu, 19 Nov 2026 16:28:55 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=rtncYxiK54RZ5zbe0XciKHv4DbLEQPKj9Qb/z8Qn+ZM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=D6ynb8G+ntsswsEO8tkvq5hJKyGDHl/rkmwF/dvpjfNJxotWOjaf1gttXKSnnAU2+sy8Zs0hb
 diEyEmFqZ2P71h19SeQ2om6mzyNfW/5xl2TnXUwB5CdQGYcvWct5jISwwM3OhUn0fR9HL5cfQLe
 +RM6aqMW0JketQhvOZjR80pWxrgbigYaZlkX+xVa3a+F5CPa8HNCGBXjtgtA3Py7+Q2/jqY1lUi
 kzzF13QqJTbwE0aJSYiEhuE4e/UzXuH+hM83sc8fB7WHXLs4lOVG4Eki0z++8w+fGbEkEkVz6yC
 3kRnLHtirrLKnaNhaAAOKQmPho4m2g+G5g7cgBLmi5sg==
X-Zone-Loop: 76082757c569f2ad3ee195e3edf52dd9f92ef711381a
x-campaign-type: default
x-transaction-id: a50c9bed-ccd0-4bd5-ba1c-ca7802f5968d
x-swg-uid: 01-8790403a-521e-4209-89f3-b1a66701962b
X-Mailer: Sweego
Message-ID:
 <1795102136.8631fc262581453bbf619ec5b2062170.1a1f46cd871000183d@vates.tech>
x-swg-bid: 1795102136.8631fc262581453bbf619ec5b2062170.1a1f46cd871000183d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Thu, 19 Nov 2026 16:28:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] CI: add a Debian 13 riscv64 QTB container
To: Hiago De Franco <hfranco@baylibre.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
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
 <k4hxivkhib6yi7onicgs4ws2earwcawmds3bmp5nefjrw525qo@w6wxrkpdhoru>
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
In-Reply-To: <k4hxivkhib6yi7onicgs4ws2earwcawmds3bmp5nefjrw525qo@w6wxrkpdhoru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795102135647
X-purgate-ID: tlsNG-d62444/1795102139-4FB4E5FD-818DEF73/0/0
X-purgate-type: clean
X-purgate-size: 1192
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Hiago,
Thanks for reviewing this patch series!
Next time, could you please follow Xen's convention for sending emails:
the recipient (To:) should be xen-devel and the others in CC, as
specified in the "## Recipients of the patch" section of
sending-patches.adoc. If you are using b4 (it seems to be the case from
the formatting), there is a .b4-config at the root of the tree.

>> +ARG QEMU_REPO=https://gitlab.com/xen-project/people/amd/qemu.git
>> +# Tip of the safety branch

> Maybe add a TODO comment here to change this QEMU_COMMIT and switch to
> upstream QEMU once it gets merged? Just a suggestiong, not sure how
> others feel about it, so feel free to ignore as well.
I'm fine with that, something like:
     # TODO: drop once QTB is merged into upstream QEMU
> 
> Anyway I think the commit message should mention this, that the image
> has to be rebuilt and pushed before the job in patch 5 can run.
Yes, the image has to be rebuilt and pushed to xen-project's registry,
but as I'm not a maintainer I can't do it, and it wouldn't make sense
before the patch is acked anyway. Still, you're right, it's worth
mentioning below the --- of the commit message.

