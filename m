Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815F0C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:47:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374235.1621262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woi9P-00041H-48; Tue, 28 Jul 2026 13:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374235.1621262; Tue, 28 Jul 2026 13:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woi9P-00041A-1H; Tue, 28 Jul 2026 13:47:19 +0000
Received: by outflank-mailman (input) for mailman id 1374235;
 Tue, 28 Jul 2026 13:47:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woi9O-000414-7k
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:47:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woi9N-00BXP9-Dp
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:47:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b2e4-e002-0a2a0a5209dd-0a2a450b8302-16
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:47:17 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b2e4-b7e8-0a2a450b0019-d155802bb8c3-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:47:17 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so23571595e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:47:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c4443396sm90492335e9.0.2026.07.28.06.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:47:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785246436; x=1785851236; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nC5fGrFxn8XHaZsl2HYHhAUT5r8iSh+dM0PJcAyEv+8=;
        b=VTFMuB792AjNmko9ed3jg8RU6fYa9br0ykePO10YF3byWHLv6ilbJ8JjRiCI9SHhi0
         HQb5wQmJqeu398cyLyAnwF08L+TTiVCRMHjRGLDRslcBpgMDcNtQ71y3GAshsKYhvXI/
         yFqKO2REM08sH4cedBiYLBvifnoKFZrD+AQudfKMTjMV1ZVz3N6GXXGsqt7Quq+zuLZH
         ZUsnL3LPBHt3rcyrj+li6953tQBWxWYmIg+M7/SMD3etdyXP+4S52E/dqrvYq8/QRHdX
         YtBM2VRU+PGH/mQclp758I37e1oDp/hLfOyWRY44c+vnTgpOAw8UoWi6mocZBlG5S0Ac
         8TyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246436; x=1785851236;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nC5fGrFxn8XHaZsl2HYHhAUT5r8iSh+dM0PJcAyEv+8=;
        b=Hlj55wxT2ztG3Cpr2PtaqovM/6B2tgzk0cgR2VSfqmTg45yJTg+MhYbrkHDOfAUagy
         deNCw8Xj8igRQLqqy/z9CwHbR1p5cgeGxN8bFyB7Sunv9J/pNYbBYRVsNIsFMAAfomC9
         Zp8YFUwVDiV5uhpDdy/v2Q9jRToumbVy3VamzfB5xmoTpEARFYZSURhu4ANi9pkXs/lH
         SLQc2YHvtkpnPunsgypexnRowsGJNKLBhMlOfT/uonh7HvD/u+JqD+L0WySNGbuLEoLR
         bgze42z7O5CLsEojEsLha82UZhvcTTHE7XJcMvplAr+rxdQHvUPkn1ELB7ukZYOEcyCQ
         ZNpA==
X-Gm-Message-State: AOJu0YwGhriuTaNPaNnBo20Cv9VhW8uVqJFlsxO9tikNBKIooUMAxVd/
	Glsa4dPlvbsUmAw0ewsDpNBnnpneCnbytH9FKqz9VvOQeYdzQP6hGdnT3o4VCAsHCCBkG1X1jeI
	OLB975w==
X-Gm-Gg: AR+sD12b7EsKeCVOV7Fu1rUAsrNJ0Vhn/XM6XBx0lcBABUTHMTUjey37hvvcCuHzRqt
	6YYUqBDtyffw6Q/iTby54rV25hs1QtTvYx8IbugM0Jojy355dF5PXVu3pAf/+8XlJjQDWVi2Jkc
	UULwiJdocYobmhSblTun3TJMWWW1iPJ23oVR0r1P/IWQNFNb8CgnpNnmUKZl0CsHY2VWKW8fne8
	XgaItxUNrk4SWrRUpFZ/yzjq2ibrsRHcAIxJauWjCHeN2JldeYBgEGNkbEyCIEIefc1yuU3VMDR
	zsH0jZ8PV+20uuMaI+xh1bEYTibh/zA0F0ibWhmwulA9gDipaIvvMJrNMqIxSKCc6kdJgnn0oIK
	d7z9bTemnp06em0SldUlpsnKpARSjs9K0bAEwetVmDL4gM6401ou87GLJqUXBV6W7912rqGVb88
	TaH2YfaDxZkLHnoIYD+V8LQijXflvlS+RZrBJhwLnI5PG1cVskeqYd8YUOrYR5YAv7D/ueQRDQ2
	TgA
X-Received: by 2002:a05:600c:4714:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-496c642c8d1mr31946465e9.12.1785246436415;
        Tue, 28 Jul 2026 06:47:16 -0700 (PDT)
Message-ID: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
Date: Tue, 28 Jul 2026 15:47:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/7] gnttab: follow-on to XSAs 500 and 501
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
X-purgate-ID: tlsNG-42698a/1785246437-1B4D39EA-10E36FD5/0/0
X-purgate-type: clean
X-purgate-size: 408

1: add another compiler barrier to acquire_grant_for_copy()
2: limit scope of transitive-only variables in acquire_grant_for_copy()
3: fold redundant error code paths in acquire_grant_for_copy()
4: use available local var in map_grant_ref()
5: drop local "ld" from unmap_common_complete()
6: rename a parameter of gnttab_populate_status_frames()
7: unreachable code when GNTTAB_MAX_VERSION < 2

Jan

