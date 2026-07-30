Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053AFC54FDF
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 10:39:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1377478.1623528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpOAi-0006DK-QU; Thu, 30 Jul 2026 10:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1377478.1623528; Thu, 30 Jul 2026 10:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpOAi-0006DD-Nb; Thu, 30 Jul 2026 10:39:28 +0000
Received: by outflank-mailman (input) for mailman id 1377478;
 Thu, 30 Jul 2026 10:39:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpOAh-0006D0-22
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 10:39:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpOAg-002qvF-CR
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 12:39:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b29d7-2eae-0a2a0a5409dd-0a2a4506dd7e-18
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 12:39:26 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b29dd-195a-0a2a45060019-d155802cc1ba-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 12:39:26 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so18075475e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 03:39:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4980120b64asm52734815e9.12.2026.07.30.03.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 03:39:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785407965; x=1786012765; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dbsNaiBH5RjnqoFfh9A1KghoSK6BqeERtvAFvq1prgw=;
        b=AEYCMo1+Ol3d4lP0/WOYU8GAZDgXtN3oI/NRw/thxps8p2t6zfsRSSVY0Fxd2B1T2L
         Pj9p8iekjSNeOrclmo64oA6u2UIQNtxQMMH8mLtz4YztlXRO8yDP6e2dIHhchzI4xVPB
         9DBdR1waCmwMTKvSNQNYed29bFnpf+/XY55VuiD7At6L2udo6VeWUdGkTYpC6F636Ko8
         UyGqWguSJEv8/6mVI3EC9VlU8BjWYZh7CrOvUysRMYZaZw6yYFv50g3H3G25omxdYxo/
         jgCa+hj9co28HRtdxC0rmlour/wCgwDEfOJXAoT2byoZzAv2WjFfWxtAf0okkQXF76G0
         NryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407965; x=1786012765;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dbsNaiBH5RjnqoFfh9A1KghoSK6BqeERtvAFvq1prgw=;
        b=kU4pIafv63IFTTDVQj5U+r/qKpEAycGSclMrk/nY5UfHf+wIdmoRfoAdf3h9H/E6DW
         5ILD5TMn14bq1Hznboln9MDaDlhym+QKhF3Ml6mQB+7SbfA6u9cuOk7MPh2Y0URRy7kw
         Km0pRf6/Q6CNf9lYVOza/eINHeG9itrx4JyRF3AeCl/C54/Yw3evM8kkeUS6LptdfAtf
         eCg6FAhgQJuaQG3nKhOr7xuPDcQXOMU214qeeeWY2XgaawmypzENIo7z06LOHDUredY1
         qbwdOnmFBCHf9HZ+AqzJ9LNyNIpwB3nbuqW5SVgHCpKJlWilskBDg+lG0D8gfp8P9Yyn
         k7dQ==
X-Gm-Message-State: AOJu0YzZWD6PMHQTJHa0YnQcFqR0XNWZPalBUT1LCEl26v0hLBYFU7BQ
	KnvRgfuBEJb6dwgnlUhFzZ0PXown7Sx7LkAWyB7zkBag3eeNdO+II5qrY6IxLnBYclLT0DlPGdf
	OvZFTig==
X-Gm-Gg: AR+sD11F+0a3Uwh5+SuQWDJ0S0a7eNtZjjuja1/beyeHpBLrX086r/K7LnpjGbwtNUY
	w+BcDPaxckSRanr+79rzVOZVONOGoMKNt0eK0jkK5Qa7VJofKbrXToYD4q3i/KLjyEvAMRysBiB
	Ssp9HQDFURWbjJyAOnWQtC3LvyPGKXaq1CU5bE7Y1+Qp53doeBJJkWiVr/fpkwi3F5uTbzZbPMd
	3XaraMJ5SS75+7Kk/F+II0+cKNaV/iRqbshkglxoFrIky1IUN8Am+jaRfXHdB2oXiB5KE4fb+Vf
	dQueYx09MnBvLr2rroygEupSu5o4pKGM3T5xki5j+HGhepF5GtPrkv1vldqoCK0TvSPfwLZoyPa
	pIWVRWzK6ByMeNddfqlebPs+aghKVaarb0mKWUTxDO57YEvi+T1wGX3AR0SthkRJPmB21VRzemz
	Fx5Gw5WwB1iB4hQINf9M3s8Sm3FvBasCj64VtqVzbwEcnMJOlWhirq+5nWf8U6pGB44knXVU6dx
	zT3jEdayJGzy2VWOIXZZq4VwLqPob7rcqqdgRWlRmpfvIWW/oIM
X-Received: by 2002:a05:600c:5395:b0:495:5943:b76c with SMTP id 5b1f17b1804b1-49800eb98c2mr27484495e9.34.1785407965451;
        Thu, 30 Jul 2026 03:39:25 -0700 (PDT)
Message-ID: <b97b97f2-70f0-4137-b409-eed3289b10d7@suse.com>
Date: Thu, 30 Jul 2026 12:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.21.2, 4.20.4, and more released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1785407966-FCC0777B-162DB4B1/0/0
X-purgate-type: clean
X-purgate-size: 1466

All,

we're pleased to announce the release of further bug fixing Xen versions,
including ones from branches in security-only support state: 4.19.6, 4.18.6,
and 4.17.7.

Xen 4.21.2 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.21
(tag RELEASE-4.21.2) or from the XenProject download page
https://xenproject.org/resources/downloads/.

Xen 4.20.4 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.20
(tag RELEASE-4.20.4) or from the XenProject download page
https://xenproject.org/resources/downloads/.

Xen 4.19.6 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.19
(tag RELEASE-4.19.6) or from the XenProject download page
https://xenproject.org/resources/downloads/.

Xen 4.18.6 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.18
(tag RELEASE-4.18.6) or from the XenProject download page
https://xenproject.org/resources/downloads/.

Xen 4.17.7 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.17
(tag RELEASE-4.17.7) or from the XenProject download page
https://xenproject.org/resources/downloads/.

We recommend all users of the respective stable series to update to the
corresponding point releases.

Regards, Jan

