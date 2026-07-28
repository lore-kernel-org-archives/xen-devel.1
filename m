Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7646BC54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:52:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374276.1621316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiEM-0008LH-0e; Tue, 28 Jul 2026 13:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374276.1621316; Tue, 28 Jul 2026 13:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woiEL-0008LA-U8; Tue, 28 Jul 2026 13:52:25 +0000
Received: by outflank-mailman (input) for mailman id 1374276;
 Tue, 28 Jul 2026 13:52:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woiEK-0008Kr-Dx
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:52:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woiEJ-00EYkd-Qe
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:52:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b404-bab6-0a2a0a5309dd-0a2a4503b880-48
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:52:23 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68b417-fae8-0a2a45030019-d155dd33a4c1-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:52:23 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso933323f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:52:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bb5127sm55034291f8f.10.2026.07.28.06.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:52:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785246743; x=1785851543; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sjq1+NwUBvPK4RcSVOHsjrwrht1DWC2Q5O4CPfABIqM=;
        b=SI24Np5LbKlGkAOBvdOjHPyut1L+LTj+lwci/uT4FXx1Mnot569uAQDKVtbhxg1I+E
         UESOCeVLPdUYkR6zClhQkaDMCa4HCoG1F4sWs1mR+ova2p5gzxNqmjMb2zleGk+DR5lK
         352DtF7tLd2aSShooPHmfX7GI8Xig+YiEyJ9konI24lhPXChVPFJs14se4BdWJRK5nJf
         lTFO7FpgK84j9lRf5AP7nRS+ARoDYmgEH7DyKgDeE9TE828Sqjhwd6eC8jmBAoAZRfri
         KgsVA4B//qNML7pUgwcbldks2HZkWttROlV/hs8DhVEMicRmXSN8qNlcVDsDSaOlIWiI
         x3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246743; x=1785851543;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sjq1+NwUBvPK4RcSVOHsjrwrht1DWC2Q5O4CPfABIqM=;
        b=nn3S87g/JNj8W4DGU3lO3MKJbTmWORa9lxLLcUoRZi1fAI1fA65xkqbz2prI4FsB3V
         gZ2FOy5yZyWZLyPSWYr4yRZHfbTXbQdQD/bitdLR6h9F0J1M6dNeVDWp4O8Zj+lOesIf
         QIiDoCynu41tq5+KgS9xZtfkc19K5b7GuILn3UJG/Rj8Yqq5ZXCcEe8MKD9id42UaumZ
         u5uN18tn8clZXKb8wID5qfsH+RpN150CqWM6dIfmvmGg7LC79TT78g0OJ14dlRAprFCp
         ++xY976qDt15F0W9HACbdQfmoRDbNEMPaubBQVoe5QihoNHQ9ekhUaym6qXefxqVlbei
         hUFA==
X-Gm-Message-State: AOJu0YygVgnW6fWpTwuUqjJ/+/mwvt9QwgG2oRmXETa0zW2h/yYDy+o6
	6qzeUImv3BkgkcYu7NJh8QVCm4O9BZRXzdFg3E8dbaC8fbI78YmrDNGn3KSrI0GPuxmm4bRGew/
	Q/bpheA==
X-Gm-Gg: AR+sD110HPKcig49NX3hHHy8skT4hCPZfZHPWqQj16ERunzY+4+QWXI66m2g/1KQREV
	NhLv+G5TNL8GxPa8LxyZT5kLqPK7aouQ1WCoSj8hi7m97cSBZQptT7dbrFZqvjDOxKn8C6X47qC
	ES6MGqJUNPwRntWj6a3/J57Jm0wNg4auSCVQ9YLg3mFZYQVx9z5aq4ALhks6rdoLZJUpKfGbcBq
	LtYOXCRkVZA36EPDtR6gGt9DcaID1TOPGMVLzJfPB8jqtPXT3KNCt1sjdhLmVbw7fCiBc71ysgA
	SqkA75D82WMjogmhHZglMKzojJ0gY8ChQ88WrBRB5tLzHGnVgPRViru8qVSwKol3R+N/bQLfRoi
	8jyjH5jtuCqN8vgiOiMvtqGdG7F0K+yHsP4T6zbZqVAjtwHXSJ0UdFRS/jmya8yVhYibISIhpX1
	fJdsxaLOR8PaVSVZCyE6SrnN3z5c4f1nIaVoDJNIyXeopTIUej/m/CauvTzX1OozSH3Q==
X-Received: by 2002:a05:6000:41ed:b0:47f:8cd3:4bed with SMTP id ffacd0b85a97d-47fb1e8547cmr3258724f8f.5.1785246743193;
        Tue, 28 Jul 2026 06:52:23 -0700 (PDT)
Message-ID: <06d74bd4-86f1-4c25-a6f7-f4e1c9de199f@suse.com>
Date: Tue, 28 Jul 2026 15:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/7] gnttab: rename a parameter of
 gnttab_populate_status_frames()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
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
In-Reply-To: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1785246743-6F6C64E9-1CE03113/0/0
X-purgate-type: clean
X-purgate-size: 1078

In a function of this name, "nr" (and hence req_nr_frames) is, at the
first and second glance, the number of frames to populate. That's
misleading, and it's also only what one of the two callers
(gnttab_grow_table()) actually passes in; the other (gnttab_set_version())
passes the number of grant frames already in place.

Fold declarations while at it, and convert the assignment to an
initializer.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1807,12 +1807,9 @@ fault:
 
 static int
 gnttab_populate_status_frames(struct domain *d, struct grant_table *gt,
-                              unsigned int req_nr_frames)
+                              unsigned int grant_frames)
 {
-    unsigned int i;
-    unsigned int req_status_frames;
-
-    req_status_frames = grant_to_status_frames(req_nr_frames);
+    unsigned int i, req_status_frames = grant_to_status_frames(grant_frames);
 
     /* Make sure, prior version checks are architectural visible */
     block_speculation();


