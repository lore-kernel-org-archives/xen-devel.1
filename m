Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FFBC61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:35:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405103.1638658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eZ0-0006s9-KL; Wed, 02 Sep 2026 06:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405103.1638658; Wed, 02 Sep 2026 06:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eZ0-0006s2-He; Wed, 02 Sep 2026 06:35:14 +0000
Received: by outflank-mailman (input) for mailman id 1405103;
 Wed, 02 Sep 2026 06:35:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eYz-0006nC-7i
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:35:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eYy-00AOxg-Ka
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:35:12 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c36c-8faa-0a2a0a5109dd-0a2a4502edac-34
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:35:12 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c3a0-6ca4-0a2a45020019-d155dd29f1d0-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:35:12 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-482dd6ee390so675660f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:35:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed30c0sm4313104f8f.24.2026.09.01.23.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:35:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1788330912; x=1788935712; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=boxk4p0eJVFYzZBGyHEQSWRcZFC+UVjv0HIaDcDz8xY=;
        b=CRqqb0fb89JAfPVPLS1KrLrdJRkATtJxDzN6/J0uhmkRy7qwWXFgwSw1ic5gumqSzZ
         IXrszCF3LbUZn3G+bTj7vO3sXKCJdTvo2zE4OCzN2psdQjSGk9HqSOLJQ6HqMhYhisW0
         P+xjGMsQEB1FW9+C8oe4D+9RCELQBpvMd6n5h5wPPW7RVCEX7KtRhGIYgOerq6x3BtKb
         TZjbGcnyg37fMAJUimAWd7KqvLLOYNYpP7HWI3L78A9jyPSDTYdCk+8kJyfOlapSv+RO
         xIMAfZgKbqiLRTEo4Ufmty2u3ETjQhfykUbCitxXxLV9Pddiipr5+ton73wxq3C1x/lg
         9lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330912; x=1788935712;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=boxk4p0eJVFYzZBGyHEQSWRcZFC+UVjv0HIaDcDz8xY=;
        b=BTk7AEed7Cs1SS7rwQ7evqm630t3Pc0hgFEiEFBcgWVOf/9LrWyP1+nfRv+F4eW91h
         xBFj4k/IE3Rujc5pvAoDYuTxI5aEU3eVP47pF91g9on6IVJ4F1rHEJp3b/oe5Z5y1nBc
         O6md+Jx+Z3JtbRwbO+W5Nkgo5WVVYPv699kFc1uAlmw3VLPW3AvAJ1QthZSLtroCWD39
         7j4iCfg8iQAcwkaPW/sRInsQaSEYVc8j68ixwg9ELh+lZDnF7uje4t0Eb11amBz6zzwT
         vc6JIGtiZITYONqEz777X+h82XqqG+k5H17ua1PoPIcFCry2XsPES8uws+slSpW+pVED
         RTGQ==
X-Gm-Message-State: AFuF++kwBXPlitypD1oFyJfxtNPVgQjw0QvxcA4zQiAgXwlpWXWWA5r9
	xUQnYbL2s2+UTaRpfRQlBspqhgXCDVfb4UXsffHlkOt5nv7oWn75cS4AZ0onuEKRXlG79S/ceTl
	SIdHvBA==
X-Gm-Gg: AYBFou2dIIKLVU1Ldyqbg83MDfm/kNowTPpkRbIShtsJZU6RkwC+ldtyZFporLKS6Sn
	7PnDmjb7SO1p29Y7yn10T3NVJF4uMRy+DMrXe4SQ/BDEgoVW70G/ECRM30dTiQVZOqK0Ik/0Pis
	fwP3GafMhstfLZeHhwCzVD30aQrEUgEUNXaY5b00QV1KnU9mTBPhcB8OLupSFZW+KlovXy30wwY
	7ec3RA6UyqlNaYsv8rwcLCwP2daGAEH7KdLXsHEbWQlDHI9yEnGk/Gj04yY2iTZ7zwbuYQOHXVe
	OGMx1bqUtUkz5KUYsWRPR0ez3/PPY8NLOV2y9cEn/aCTGSk+Ve/VCTfoj+BfODFiNHjEqIXxxvA
	39LDnyy23ITLV/FJd2BHcZHGYXw0TI5gFNMUjGy12YxUgHGgOZAZTaVBEpprXs8QGfrJC8ZLU45
	KylCXZ/woRe5Iglqpb7hjvdjFg+csCDdhaNlaYJxyvyDT5brUjhmjgOl38pZzJcxU+JHNNlF4y3
	U0aRKnJFithRSoZK37trxR0T5gHSkqJew2XuyImvw22dSQzURZw
X-Received: by 2002:a05:6000:40cc:b0:484:4880:449d with SMTP id ffacd0b85a97d-48488dee57bmr3688988f8f.3.1788330911990;
        Tue, 01 Sep 2026 23:35:11 -0700 (PDT)
Message-ID: <1faace7c-2425-4691-b23b-3ffe033e5bc2@suse.com>
Date: Wed, 2 Sep 2026 08:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 11/14] crypto/vmac: don't cast away const-ness in
 aes_key_setup()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
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
In-Reply-To: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788330912-315CD2AC-90AEB312/0/0
X-purgate-type: clean
X-purgate-size: 755

vmac_set_key() passes in a pointer-to-const, which has const-ness removed
despite rijndaelKeySetupEnc() properly taking pointer-to-const.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was wondering whether I shouldn't adjust the adjacent aes_encryption()
right away as well.

--- a/xen/include/crypto/vmac.h
+++ b/xen/include/crypto/vmac.h
@@ -69,7 +69,7 @@ typedef u32 aes_int_key[4*(VMAC_KEY_LEN/
 	    				    (u8 *)(in), (u8 *)(out))
 #define aes_key_setup(user_key,int_key)                 \
 	    	rijndaelKeySetupEnc((u32 *)(int_key),       \
-	    	                    (u8 *)(user_key), \
+	    	                    (const u8 *)(user_key), \
 	    	                    VMAC_KEY_LEN)
 #endif
 


