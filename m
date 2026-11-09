Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D89606A33E
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=ZRuJUOh/
Received: from list by lists.xenproject.org with outflank-mailman.1480261.1684223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQRCb-0004VU-4B; Mon, 09 Nov 2026 15:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480261.1684223; Mon, 09 Nov 2026 15:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQRCb-0004VN-1J; Mon, 09 Nov 2026 15:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1480261;
 Mon, 09 Nov 2026 15:22:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0e75539000403d@swg.vates.tech>)
 id 1xQRCa-0004VH-7i
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:22:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQRCZ-009yBA-39
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 16:22:31 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0e75539000403d@swg.vates.tech>)
 id 6af1e537-bab6-0a2a0a5309dd-0a2a4506ca42-0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:22:31 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1c0e75539000403d@swg.vates.tech>)
 id 6af1e536-195a-0a2a45060019-b9ff1c23911b-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:22:30 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1c0e75539000403d.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Nov 2026 15:22:28 +0000
Received: from [192.168.1.52] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 00F0581CDC
 for <xen-devel@lists.xenproject.org>; Mon,  9 Nov 2026 16:22:27 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=uSMBe9Lg5LmrTKUirt02A7ljUKbmyPQudO3IPhv1/so=;
 h=from:subject:date:message-id:to:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=ZRuJUOh/Tgje65dbUxGxJOIZwo77JtBzCA6kHhQXjbm/zlqcL92LAkp/FfCoi36HWQqN8WH2I
 ozC81/SYkFcK254jCxJcIdORoNM1aLzFEaD0okdX+oVH1a3RX+XefyBIDrY0q6P1MMYDDGiBrVF
 Tx6a5baQloyLx+MH41yZM7uswVd06jFajjIN89XeCGoYqIGm62Ui+eeo7dttzlkONnBgigi+6eD
 QrRtcNzQercp88aUVHPJFmHM/pAu2v0Hokf2axIVHM1cDu3mahHynGfbT8i4W5ogvl4acltUdOV
 m4wpKBljza31DqUNn0N2h8PfwaCPhIOF0dqCg6KNd2uA==
X-Zone-Loop: 601e8cda1237830f3f1ba8a86f5e38b9a4eb334eb061
x-campaign-type: default
x-transaction-id: 863fa99b-d75d-4945-a06f-2ba01fb28e77
x-swg-uid: 01-7e290151-fc1a-4c92-b9c2-758640ad2f0a
X-Mailer: Sweego
Message-ID:
 <1794237748.8631fc262581453bbf619ec5b2062170.1a1c0e75539000403d@vates.tech>
x-swg-bid: 1794237748.8631fc262581453bbf619ec5b2062170.1a1c0e75539000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 9 Nov 2026 16:22:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/39] xen/riscv: remap interrupts to new IMSIC VS-file
To: xen-devel@lists.xenproject.org
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <45011daea86267b8f4b707bc7de6357b0712fb08.1790779209.git.oleksii.kurochko@gmail.com>
 <1793023599.8631fc262581453bbf619ec5b2062170.1a17888e252000f79f@vates.tech>
 <d272b357-b5cc-42e6-9a84-753f361ad278@gmail.com>
 <1793971568.8631fc262581453bbf619ec5b2062170.1a1b109bd79000403d@vates.tech>
 <294b2a3f-ba42-4e04-afa1-ee56ffe7133b@gmail.com>
 <17fe3d2b-8d48-4926-ae4c-14fedf74ea8a@gmail.com>
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
In-Reply-To: <17fe3d2b-8d48-4926-ae4c-14fedf74ea8a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1794237748043
X-purgate-ID: tlsNG-16d1c6/1794237751-F687577B-C300925B/0/0
X-purgate-type: clean
X-purgate-size: 639
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/9/26 4:02 PM, Oleksii Kurochko wrote:
> Would you be okay with such explanation:
> 
> vgein_release() takes the pCPU the VGEIN belongs to explicitly rather
> than relying on v->processor, as the two may differ: a vCPU moved to
> another pCPU has to release the VGEIN of the pCPU it leaves, while
> v->processor already names the new one. As the bitmap of a pCPU may thus
> be changed from another pCPU, it is protected by a lock.
> 
> I tried to write in the way as it is requirement to API rather than a 
> description of the code which will be introduced later somewhere in "=== 
> migration"
LGTM!
> ~ Oleksii


