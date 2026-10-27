Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655D5606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnwE3imB
Received: from list by lists.xenproject.org with outflank-mailman.1462342.1673323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlDz-0004DQ-2B; Tue, 27 Oct 2026 17:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462342.1673323; Tue, 27 Oct 2026 17:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLlDy-0004DJ-Ve; Tue, 27 Oct 2026 17:44:38 +0000
Received: by outflank-mailman (input) for mailman id 1462342;
 Tue, 27 Oct 2026 17:44:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLlDy-0004DD-9a
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 17:44:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLlDx-007Uhr-Im
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 18:44:37 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae0e2ff-2eae-0a2a0a5409dd-0a2a450187c6-20
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:44:37 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ae0e305-5984-0a2a45010019-d1558034c093-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 18:44:37 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so973615e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 10:44:37 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a92b8812c5sm5417535e9.10.2026.10.27.10.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 10:44:36 -0700 (PDT)
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
        d=gmail.com; s=20260707; t=1793123077; x=1793727877; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UzKo6N7xpNZSBsrrRX7mBe8GZGHcmawe26oyD0gzeeI=;
        b=BnwE3imBlNFTjMBGgDTzs+26J5m+XeyyIKBbief/YN38z2hn9873bDUWMINeksbU3i
         NrM4LOQoBDYvptR+Vj07AvR6s7UrvtUP+XEHzLJMuHWyoc9bxDe5x43cjO8cfCB1gQCB
         garfCt70nHuaJ9Uw/Pfxgd/0PIMQD+a9ARE34gyz0ShkvrDwVsA+w6VU0m45FT7y8jX5
         a5GjSnA9FrMkgEMs4Xk6wU4yoDnIZbfQMI8t2oY32gAIgLvUn+puZM0lkliDiSHpcswc
         oG11SGQrAEoH6+mD/CeHWg743dNi8kTsbVRbrdjZ2tCYnMJ/jniz7hOtuO10rGhYvB8R
         zsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123077; x=1793727877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UzKo6N7xpNZSBsrrRX7mBe8GZGHcmawe26oyD0gzeeI=;
        b=wX45Pyocggti1FXMut3xV+TOb/F+o1z5th7aZkwtuwX99kDUs+onAsRFbFQpVpsE3z
         GC2svCvboVJptSF1vuCgQWjnBirmb5xl99E4FJ5gC7GJVjAcMDQWRlTV6j/TQUKi1i7p
         igfBlM7Dw0yAApP9AYYH4jYvbVpOdJHFxTGRdo/Zq1L7HmFwzqNGm5GCIhxRklKdGmon
         rhqKUZJDdhJ+/8jiuaLZMcUI3U/GWwsV5PvpwOPA1oGgezWiQUGtE8aqQ60KsycrA6Sv
         Z9+wNqYl9yfIwMBXd/oLXnHvA9gA0j0OgQKwuEzf9GYGGObWl86e4fW+35nN7I9h7wRZ
         FTtg==
X-Forwarded-Encrypted: i=1; AKwUvBzImfwASJhi4R3f/SpMh7IHvzPfajLBr/jqSLmHJNvMePhLGYJvz9VVEJ+cTVXI/MP+SjEDnKAkpKU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYICoaVvFGXcMI/6/h9Pq/oRAxM2FN20euWNGUVR2vdT1zc/b9R0
	foxrarQiZWSZ1ya79TMU4vAwwACFDaFDNE0FSC59wCvPEggyFk/hTaLB
X-Gm-Gg: AYBFou2l5HbWXsplQVFwbYOJfyE6nIQZLVymi9slsWA9jeDRZV2xwUXRchQ+9l86iCB
	Qx3tKE/Anz9tNgamiyACVxl6R+OJfXBog3KGoAYry9Qrh6X0jXc+/bX51i/0ocy5W54DYiTQHHS
	2opyb9UsBUqPnjElatO1V+1IoRL8/Y9h3jJq6+3Uawq61n2UgJtVyCWpRw1RF5KFOy0fIKTNZKQ
	E3eSF6ZUiZtjQ+PtqWvwac8x0XobT/Qvudy8DLBrJs7cF6NsfWjAX5sNuIDqnP+iOAWGkAzUXtv
	me3e2YxtKbox07CqHeZje/EsiZmVY4G6e07MTTXu/4+C0Ag43xyWFrPkWf/MbE+P/RRP0Sd2Ivf
	a7ubqup87pyu7msez6sLoAL1FgIhP442GXCbUibcmuSx7PzIRP+c0uiJbdUgAB42AOD2NwvLIMN
	qIXsiibu8W+5KnFTRZg9t64gI1MYhDDMK8fsrTjQzDCIo1mCOx66WptPwScMR/x+CsDJ+GBMtOu
	RDSAjkJ/T1oPFyKb8f/7PWxHibQzkQ7G4IcSr210dzWQBA+qLxjMA4q1PZKmZhmS+33Qdt4sjp3
	dTIlc7IE9RD8XwHCXv30MgS0lHGO
X-Received: by 2002:a05:600c:c091:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4a5015ef800mr140944135e9.24.1793123076950;
        Tue, 27 Oct 2026 10:44:36 -0700 (PDT)
Message-ID: <be1ade40-65a4-46da-b44a-349d50d23a8a@gmail.com>
Date: Tue, 27 Oct 2026 18:44:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] CI: run the riscv64 smoke test via QTB framework
 console-test
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1787823789.8631fc262581453bbf619ec5b2062170.1a0429a155d000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1793123077-1FE68757-E2D33FC3/10/73395122804
X-purgate-type: spam
X-purgate-size: 897
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 8/27/26 11:42 AM, Baptiste Le Duc wrote:

> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 61adc1baff..e9dd147380 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -72,14 +72,21 @@
>       TEST_TIMEOUT_OVERRIDE: 120
>   
>   .qemu-riscv64:
> +  image: ${ARTIFACTS_REGISTRY}/${CONTAINER}

See my reply to patch 1: if the container lives in automation/build/,
this override and ARTIFACTS_REGISTRY aren't needed.

>     extends: .test-jobs-common
>     variables:
> -    CONTAINER: debian:13-riscv64
> -    LOGFILE: qemu-smoke-riscv64.log
> +    CONTAINER: debian:13-qtb-riscv64
> +    QTB_LOG_DIR: qtb-logs
> +    QTB_BINARIES_DIR: ${CI_PROJECT_DIR}/binaries

The same goes for this one if the framework defaults to binaries/ at
the top of the tree (see my reply to patch 3).

~ Oleksii

