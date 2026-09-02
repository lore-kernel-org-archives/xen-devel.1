Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F2FC61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:37:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405141.1638685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1ebC-0008WT-Az; Wed, 02 Sep 2026 06:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405141.1638685; Wed, 02 Sep 2026 06:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1ebC-0008WM-8C; Wed, 02 Sep 2026 06:37:30 +0000
Received: by outflank-mailman (input) for mailman id 1405141;
 Wed, 02 Sep 2026 06:37:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1ebB-0008WC-1P
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:37:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1ebA-001del-Dv
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:37:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c41d-e002-0a2a0a5209dd-0a2a45079154-44
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:37:28 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c428-b4ea-0a2a45070019-d1558030ec26-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:37:28 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49b0d8bc2aaso5879815e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:37:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce7ac52c3sm11548705e9.4.2026.09.01.23.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:37:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1788331048; x=1788935848; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VJtH51LzC3g8OlgK6LACaAIC7g20s+b/0wgQw5fmfdM=;
        b=f9I4i8IwZEKpAeg0nD7bfpLSye5SIzJ5aqlZwl8P2lpvfmWdc62M3F05IacotG7guS
         IT40Xxb7KNlRaSmgREiOpuKu/Y3GHiNp0UhjtERumdkJK6236AGNap1HDDsEhjFPqO5j
         YL29M2qO7vsQnPB/w5LJfV71p5H5ZX+zHyOOcd6J/5QJdc5pKRtJ01lIwroh+4eGUUmn
         P/+wZilUbzZjoEhfxFiKSgr5XuN8jVN86tmDIQqjWU1jTWgK7XNjo2P45y2DOZnzRTMY
         B409MD8PN+aqN5xr8i8/B1LYPBC0vO7iUe+rhiwTERTpb7iofjAyNF3RjCSyx41/hkp5
         qj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788331048; x=1788935848;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VJtH51LzC3g8OlgK6LACaAIC7g20s+b/0wgQw5fmfdM=;
        b=TXvcNQWP+8jnVKltc98yC9p2qKMMz03vL7BmWA6PpPAcgHxsrWtKrUnklwzs0leSYe
         26HXxd6NopDuXdBekJHLzVpB/0IomdsRclq3jdN48AuaRwOSLulpFIwghYWr2N+1srVw
         GEa1AVHi4dZmWeJLnb5cDbr5bDrP9Dq0na/PItwg0lj0dtTvzjtu8zYcgVRSZ0chKVm2
         tjJI0K18p5/DxBqCQPbhdscaZF/r617A2zgJixaW4j/PyC+8A22Q3m0M3qrXMQT0+uwz
         m0EdZZw5c9NsRR9ThddlBBOkA09CVBT71SAcPjbDBrNCI+I9tAKzGaAa1MvNUnYcAlBo
         K5dg==
X-Gm-Message-State: AFuF++mNsx3lIAGZEEa1tAqT/1vO2HoH2aZ9CyLqABmPD0lBYGYwXkr8
	7B2PBYCqaTE/SDR8yxUoao7qyL5jOn+PWZDL4YWME5mddqBdlFH8HAu6B+ykQ9821rHI6LlvjuF
	P6ZfmJQ==
X-Gm-Gg: AR+sD13g393kKgidTpD0ncQdA8GxYcHlTSb9rIKm3GcpDbgm/EOi6ky7yITHCO1/ijq
	t0+e0pj5cA6HXaJkI8hLGUnvRU7DxLF5eOTAxMdfc9WWJQHAim8STOo55vlvIJy2lSvYK5kquNQ
	/I0XZ9mvz/wmXBb6MFRalXHGh5oX/3YWL80Z3I4tVS41GTIvwrR8QBhZOtovxB9kZu9MJMaqRza
	S1Txwakoiouyvk4HZt+TDBqtgzdrj116Oc6TEOBE9wpsJMV1q2EcD69u52v+Np4iIgQGWBdmZEV
	VVXIQqyQLOXg2Y/yZlIdpfeu12lZcDzeY08gauKUD4OfBr+9J1iZeHeB9nlcmcrC3V+HecVhVYZ
	/HlStscsz2zYIjrWnqx/FdfjM9+j/Xsq0VMVeGlVcIQ3cPn3tu0Pkb9AIY/QmqnFX1dh/rTUPRu
	qIDVbefK6RwUj3AzgkbPupD16khWT11WImt4z6lE+ptq7njd34Da7xNrRFD2zPzSDX5yIAJLVsd
	qpASAJVq/SmwURKXh+C4Fy40g1VhbgbN8JnbL/dpTQpXNPN1OOF
X-Received: by 2002:a05:600c:45c4:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49ce5816186mr38862465e9.10.1788331047806;
        Tue, 01 Sep 2026 23:37:27 -0700 (PDT)
Message-ID: <ffbc98e7-b74a-4188-8dc4-86aa8a962af7@suse.com>
Date: Wed, 2 Sep 2026 08:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 14/14] xhci-dbc: don't cast away const-ness in xhci_find_dbc()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Marek Marczykowski <marmarek@invisiblethingslab.com>
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
X-purgate-ID: tlsNG-ef75cf/1788331048-35EC6AE4-BFE21905/0/0
X-purgate-type: clean
X-purgate-size: 992

Doing so (at the return statement), besides being a bad idea anyway, is a
violation of Misra rule 11.8.

Make "xcap" have an initializer while adjusting the code anyway.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -384,16 +384,15 @@ static bool __init dbc_init_xhc(struct d
  */
 static struct dbc_reg __iomem *xhci_find_dbc(struct dbc *dbc)
 {
-    const uint32_t __iomem *xcap;
     uint32_t xcap_val;
     uint32_t next;
     uint32_t id = 0;
-    const void __iomem *mmio = dbc->xhc_mmio;
+    void __iomem *mmio = dbc->xhc_mmio;
     const uint32_t __iomem *hccp1 = mmio + 0x10;
+    uint32_t __iomem *xcap = mmio;
     const uint32_t DBC_ID = 0xA;
     int ttl = 48;
 
-    xcap = mmio;
     /*
      * This is initially an offset to the first capability. All the offsets
      * (both in HCCP1 and then next capability pointer) are dword-based.


