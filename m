Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2925606A328
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=LCtTCX60
Received: from list by lists.xenproject.org with outflank-mailman.1460958.1671849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGrG-0000jY-PW; Mon, 26 Oct 2026 09:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460958.1671849; Mon, 26 Oct 2026 09:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGrG-0000jR-Ml; Mon, 26 Oct 2026 09:19:10 +0000
Received: by outflank-mailman (input) for mailman id 1460958;
 Mon, 26 Oct 2026 09:19:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1778197af000f79f@swg.vates.tech>)
 id 1xLGrF-0000iz-2V
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:19:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGrE-00FxYX-FR
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:19:08 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1778197af000f79f@swg.vates.tech>)
 id 6adf1b01-e002-0a2a0a5209dd-0a2a45088bf6-38
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:19:08 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1778197af000f79f@swg.vates.tech>)
 id 6adf1b0b-f659-0a2a45080019-b9ff1c229f55-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:19:08 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1778197af000f79f.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 09:19:04 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 56EB982E11
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:19:03 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=vwL6ftjvVCFatnUdYp6455+bimafOORok6hd2b8tj9o=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=LCtTCX60LPCPDB5Q0gPTHqWB16J+/URvYIcMzdncCuLG2uW9HYPB3EyGrL9oNFMmjR8iMFnN+
 hcBy3Q5/Se5z57hWvi/Yp3aEbjLfiRAtKakbDduweELHgxCQnUdKihudryKe+A6cfC+1yU82KbK
 NAVMxaLp2ZuLxCIwHEPQDEQCL6sggT6UOtQcvS+Yh9rwda/STQpBibPaW1njYmopxm+to33bkNh
 ujmW06sjf5ZlflF2KzlCrQdpBFh4kNdqJmXSPJbQxyKHDpugdckdMlBcsCAEoEy2MXTut46TImJ
 ExtI+hliHbZ2xl2/5Thha4YH7Cg/j6C1pPnAHjEU6urw==
X-Zone-Loop: 17cd69dfe47890628f903a01c8e32b3a2c6cb7391704
x-campaign-type: default
x-transaction-id: d4ec5ffa-4673-42c0-bf15-ca13758c7367
x-swg-uid: 01-3343c12f-4795-47de-b4fc-b7599556818b
X-Mailer: Sweego
Message-ID:
 <1793006344.8631fc262581453bbf619ec5b2062170.1a1778197af000f79f@vates.tech>
x-swg-bid: 1793006344.8631fc262581453bbf619ec5b2062170.1a1778197af000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 26 Oct 2026 10:19:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] tools/libxenstat: small fixes in the Linux network
 collector
To: xen-devel@lists.xenproject.org
References: <1792831909.8631fc262581453bbf619ec5b2062170.1a16d1bed9a000f79f@vates.tech>
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
In-Reply-To: <1792831909.8631fc262581453bbf619ec5b2062170.1a16d1bed9a000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793006343400
X-purgate-ID: tlsNG-c1860d/1793006348-D614687B-2E02210C/0/0
X-purgate-type: clean
X-purgate-size: 1752
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I might be wrong but it seems the v2 patches have not been sent
On 10/24/26 10:56 AM, Olivier Lambert wrote:
> While looking at xenstat_collect_networks() for commit 0c53660c1cf3
> ("tools/libxenstat: don't lose all VIFs when dom0 has no Linux bridge"),
> I noticed a few more issues in xenstat_linux.c:
> 
> - getBridge() dereferences NULL when /sys/class/net can't be opened,
> - after a failed /proc/net/dev header check, the next call skips the
>    check and parses the file anyway,
> - parseNetDevLine() doesn't initialise all of its outputs (cleanup, no
>    functional change intended).
> 
> Patches 1 and 2 may be worth backporting. If so, patch 1 should go along
> with 0c53660c1cf3: without it, the empty bridge name would make every
> VIF disappear instead.
> 
> Testing: libxenstat builds with the usual tools CFLAGS (including
> -Werror). I also tested the series on an XCP-ng 8.3 host (Xen 4.17.7,
> Open vSwitch), applied with 0c53660c1cf3 on top of its libxenstat and
> loaded via LD_LIBRARY_PATH:
> - xentop reports the same networks and counters with and without the
>    series,
> - with /sys/class/net made unavailable in a private mount namespace,
>    xentop no longer segfaults in readdir() called from
>    xenstat_collect_networks(),
> - with an invalid /proc/net/dev bind-mounted over the real one, a second
>    xenstat_get_node() call fails again instead of parsing the file.
> 
> Changes in v2:
> - Patch 3: drop "fix" from the subject and add an Amends: tag, as it
>    changes no behaviour (Baptiste Le Duc).
> - Collect Baptiste's Reviewed-by on patches 1 and 2.
> 
> v1: https://lore.kernel.org/xen-devel/1792142033.8631fc262581453bbf619ec5b2062170.1a143fd43ef0008425@vates.tech/
> 

