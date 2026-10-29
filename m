Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D077B606A31F
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Bx8LgsQ/
Received: from list by lists.xenproject.org with outflank-mailman.1464749.1675613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMR2t-0007m7-Qj; Thu, 29 Oct 2026 14:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464749.1675613; Thu, 29 Oct 2026 14:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMR2t-0007m0-O2; Thu, 29 Oct 2026 14:23:59 +0000
Received: by outflank-mailman (input) for mailman id 1464749;
 Thu, 29 Oct 2026 14:23:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMR2s-0007lr-QE
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 14:23:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMR2r-00Ds5q-SS
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 15:23:57 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae356fc-e002-0a2a0a5209dd-0a2a450b9308-8
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:23:57 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae356fd-b7e8-0a2a450b0019-d1558036c13c-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:23:57 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a5036bbac7so14118835e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:23:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a96989ab11sm82364085e9.1.2026.10.29.07.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 07:23:56 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793283837; x=1793888637; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bZ36Ue2o7QdpI26tm3fbDKjPhI0zCZm7YgWfiKnDmR0=;
        b=Bx8LgsQ/fspTtyjJ9/ksT+G//jZzTn2JPLUfQGR1izQWrAtwmXzgnGXO2iwGAHcz6d
         3B+RydIaQ9rMjFrXGN3Cxwhb9vO2m/vnKTxeOQQCHrAvsjQ79DbMzSm7A22aHgXDgRnX
         5l8rplZfsVzha35OlSdco5KNitCvJm1gaSEXDcqfbKQtuP0/b234MOVi8GZifqT/qSo5
         Fr5EB4K8arNxedmmYZzMLj6dqR1f4l8jBp6BKf/ktLfjsPuWC35hAo8t2bqix7qFOnvq
         mYYDFDapmJT71GaMIGxT00eRNn39SKbf5O8a4Bv89Ezr6OgVor1g8Fj6tDw/U8uyKwmH
         VwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283837; x=1793888637;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bZ36Ue2o7QdpI26tm3fbDKjPhI0zCZm7YgWfiKnDmR0=;
        b=n9gTMtBYqnCDfBOGsy1xbhql3CWEEEuvcWmDJJhLSABaOgjA7DFNYtkUIS1QtQr0rC
         YYputRmN7Wr4vnRJuEWtCG5Vbn4era6XWpm83qwIAsdzI8qP7GXTjFpgFr57mp9iSiTi
         TZU4nBpdsBJ05XTgBmlkLTvmDy0ZcQ9bTb4JGP2wtkX/acipvqmi19DWtwWWmb6opifJ
         CO07htmY4FCHucuh4VwlQz9PWKPt54a7roliHOdUKirnYY+oAqZqgeAxInqtr1H25inr
         N8bslfGTV7O7KkBXmquKIddSDlfpOOv+5Hv9ZSxnBVZvBF608Kt2bRvhyfPqa6m5xwwC
         Y1QA==
X-Gm-Message-State: AFq9FYL/TvNWXviItNG0EXvCAKJAo252DKVS4Up+0Yl7RtKB7q9XYrGW
	9/cvkp85sn36zmHwe8InpeyGGQnBVAEnjAVU6m+Eh5bKOLWqBRy65FefQh9p0aCYcZsG4BxreE6
	9w4DOlg==
X-Gm-Gg: AYBFou0xMkyeUpwzK2w94kbwAzfThSPG33KU2QGxIqOB1vKGVg+I6KYfbg/soO7PlbU
	hZzMGWwjAjZXIG0tpG6F9rqOw6AvSKt6aZe81nK9SMy9a+AcCw35Y5Jb4GW1xUKSRO7l17o4Ych
	MY2hTHAN3GHvUfuGNa9FvWUfDccywZnHeVNPYruMRveaZlO3VLq+0guzbUynBSVLKvF8ftGootP
	eZrKMo9cEoxKSTMj0v0NEqTEyzVcBwNP/Q9UiLEIwwcYH0rrYk7034P+bu52LXRAMNZ2Y0mlQIq
	AGViUkvGngZVtNMmDVQeyrb7AA1Gv5LApD85XECeLJnl3blN0veHvCsgutVjj/5BphVTWfFQDi9
	JGs1H2ExEO0HcrIGwPYOa4A5UqtK+Jm6B3zQHphLYypACqOd6lh6l0JaQi3vAvxWj2A5o/7+bJb
	Flfa4yzrVz3u8wDf7iRbLuZnqtXNsPrL17igJUKc6JAEyN/pJEGV8geauD3k/F0ANTXeXHLVa84
	99Cnu4G0vCJBkcTN7IoITY8IZkuJeCOEkVf9GvXRahOSeBoLaBAMqNDvPQaRrf0aR8hMFd8hrM/
	FmbiBzNSgw31wuTS4Y7rLCIKy4lYv4KK3tkJCNu6L3U4F5Tss43jm4QrE2HAs1NlGush6MbhC7V
	CjV+SQjmQu46PVbcU32tNEjqOfdM2DD0DC4NhSg==
X-Received: by 2002:a05:600c:37c9:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4a9678c281fmr125754845e9.21.1793283837136;
        Thu, 29 Oct 2026 07:23:57 -0700 (PDT)
Message-ID: <7dc9e911-73f7-4efb-8132-b9f6a5fafc0a@suse.com>
Date: Thu, 29 Oct 2026 15:23:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] x86/physdev: use less heavy locking in
 physdev_unmap_pirq()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
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
In-Reply-To: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1793283837-1A2C49EA-6D9CAA72/10/78276251493
X-purgate-type: spam
X-purgate-size: 623
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Like its mapping counterpart, in the GSI case no (PCI-related) lock would
be needed at all, while in the MSI cases the domain's PCI lock is
sufficient to hold.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -156,11 +156,11 @@ int physdev_unmap_pirq(struct domain *d,
             return ret;
     }
 
-    pcidevs_lock();
+    read_lock(&d->pci_lock);
     write_lock(&d->event_lock);
     ret = unmap_domain_pirq(d, pirq);
     write_unlock(&d->event_lock);
-    pcidevs_unlock();
+    read_unlock(&d->pci_lock);
 
     return ret;
 }


