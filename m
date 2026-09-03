Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6CEC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:54:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407008.1640183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x261O-0000bt-Tj; Thu, 03 Sep 2026 11:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407008.1640183; Thu, 03 Sep 2026 11:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x261O-0000bm-Ql; Thu, 03 Sep 2026 11:54:22 +0000
Received: by outflank-mailman (input) for mailman id 1407008;
 Thu, 03 Sep 2026 11:54:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x261M-0000aF-Uc
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:54:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x261L-003YQI-T8
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:54:19 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995fe2-e002-0a2a0a5209dd-0a2a450cc452-28
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:54:19 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995feb-f479-0a2a450c0019-d155dd2ea927-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:54:19 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-48442ea8f59so684489f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:54:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf5135353sm9405235e9.2.2026.09.03.04.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:54:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1788436459; x=1789041259; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l2RayKkAWwog2AMYT8SbLHsD8Cx1SeVefikMrauC6CU=;
        b=TxOMqNHwCvvIzrBjBCNoqMlQPp8iABIo0C+Wahuo+H9mBrKLoYXYLRq9txu6g+ckrQ
         kk1VXfvKoI/251cZThUBAjpH9a5cntjlsYBl0GfM5eNCUzwV11IH9McXqRbPrdSjUgP5
         BQx9BN1rguVVqlzPMJix0DipWCSNXVnqCs3mdbDHDIe1lpO05rxzOIkrq37BW6q2GsQ4
         xyCfid2tpJelxvZ7kYDXmc7w3IaIL8yf4xJEpEJMt68tx1PHi5t7a3teKANPJ0M4FAWK
         PQwfqj6L24PH1v9x1jj0Xw6e8H13u+634p5hZhYdIhkhTc/tV/TJ7zv3SiFehi3XFPm5
         ew9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436459; x=1789041259;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l2RayKkAWwog2AMYT8SbLHsD8Cx1SeVefikMrauC6CU=;
        b=gyT5Et8YWMNl84bJC0KU2h4fm08ZY3mKCJDSF8RrcACuP34nd6qenhU3T76POLan1L
         6lbEj9fsvTqC2/E2YFdO3hDPBy864y6indaoE1Wlj+jWbkC+QjErnjpWoPUzvV+MZ1oh
         m6SSllSlAXjvhYEzhWgZUOFJno9FY1hoDdNcUDpd3f1tB/EYIwAnkg4x/SY+bib6uwrY
         XyVbSI4Ld9KK3BzswvF02HPcVkwkL5B3M3neP/LBalECYwXvJ7Jsbt9ikndkGmzeUzim
         AvjmPiS51TzrKoQWC3d0m07g5dlBMU4ogpHQ9rBNk3m0T3LDGYhIZw7zdedF+yyrHjuO
         NWrQ==
X-Gm-Message-State: AFuF++nmUeMJwAc0MpAYtB9mcuOKgz7iMJaW5BQw3gmglKdOfGfAH6ft
	L5+nVECaciIoJEia5hKHcf/j9xoSoTJ2kxtVgt3kjurxIpm6eGQH9MlYH0hJVMQUuPWeqf0uft6
	HOUoKng==
X-Gm-Gg: AYBFou3I61E581Y6+F9s4/j4Jm6scet7aqAGDjr4xiFkS6Gs0Cd+dzWLsF9oNBaAA4C
	qSf7Wb6kBQVusfVtaUn+U56qpGXkWfL+F4HmRSibjSyrfFQmWv3PAEsk9ab/RLlhgQHXoENWdIm
	7YeuAH9vNaRkytVr4g39bJoGyAPxsgrzKodX8DsiQcxoXANgVcF2e6Y1mmFPCkrSk8NdR+o2jHC
	hCokuvfC+5CNv5W32aUGoQAIFQe4dh7G4LTTHv07mro0RSZ4D3R6yqYQI/r5kQQFyh5/348wOb4
	/Ot07hBjvRBApTMVZQtXoryL9VTI3Fdsc3KqhQeh4xQnqmrWJ/8PzTheL3n5kG7F5DlTSHFhZcp
	5bXBFFJYP3VJHtTj7LPknNavO8Q3VlNo10NyOZBzS/5SC4BeQiJ86v/vg6iaLxO1J6GqDhrigvU
	jGZ+kumvOyFX6B1bCyfJYiCT+irSw8qNy0zEvMEZ008QpX2nIomo8WOuWyhkjcpzNefBPMriiaS
	BAoVl4yX2pzJ33zMYi9b4yPwxJNEoKGLS4W4FL96br0SpgsEm1b
X-Received: by 2002:a05:600d:4445:20b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49cf1577d23mr25009095e9.1.1788436459066;
        Thu, 03 Sep 2026 04:54:19 -0700 (PDT)
Message-ID: <4952eacf-06ad-433e-8d0a-14b704888d21@suse.com>
Date: Thu, 3 Sep 2026 13:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] automation/Eclair: tag rule 13.1 as clean
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
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
In-Reply-To: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1788436459-03AD4A5B-2D375781/0/0
X-purgate-type: clean
X-purgate-size: 343

Remaining violations were addressed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -66,6 +66,7 @@ MC3A2.R11.7||
 MC3A2.R11.9||
 MC3A2.R12.2||
 MC3A2.R12.5||
+MC3A2.R13.1||
 MC3A2.R13.2||
 MC3A2.R13.6||
 MC3A2.R14.1||


