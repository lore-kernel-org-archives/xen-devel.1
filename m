Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F46606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I7WrC6Y6
Received: from list by lists.xenproject.org with outflank-mailman.1503448.1699161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZgh-00043c-Qx; Thu, 26 Nov 2026 13:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503448.1699161; Thu, 26 Nov 2026 13:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZgh-00043V-OE; Thu, 26 Nov 2026 13:38:59 +0000
Received: by outflank-mailman (input) for mailman id 1503448;
 Thu, 26 Nov 2026 13:38:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZgg-00041A-KO
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:38:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZgf-00AhOv-On
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:38:57 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083663-2eae-0a2a0a5409dd-0a2a450aa674-48
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:38:57 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083671-f2d2-0a2a450a0019-d155dd35bcae-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:38:57 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4a358881793so3695772f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:38:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab9cf005f2sm33806952f8f.45.2026.11.26.05.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:38:56 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Cc:Content-Language:References:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795700337; x=1796305137; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5MIXgI0XtHUA60zJ+1mF1ZqscmsegldqWcuIger8vI=;
        b=I7WrC6Y6yM8BdbSrqFFJLrGVdXyq7sWv8zkNRbUvmlhNgow3xz7tjMtaOEQ6agv1Rc
         EP2k9tXeUg6LFXfTpDzlwRHfSNeGLoi0heaPRDil1nNgc1kAViYOUdOofACk29JAJKlT
         cE26kFcorYTKfskX16b/rEQ/1HF3ol9eM+Ub5HjAZTYgx4Ix/Oim8eUHFUVn30mBha2H
         fnyVrPDY5mo5ytNeXREY2NOvMFllT3KVxbT77igeFpizpR0WTMzSYaG7pvPhf7nRHQdn
         zbwxO2voVYQ3+aWIaWwvgomcFVAPgUk0xJyb6QGedwhbMFZI/36raGL/9tsOvKw+xz4s
         Z1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700337; x=1796305137;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5MIXgI0XtHUA60zJ+1mF1ZqscmsegldqWcuIger8vI=;
        b=GJ7jMzfgavEVlSjtLj0KbJQSV2BN8H9GQ5ZPODCujB3J/8hLYmmDuamB5wUs5xa0rb
         Jep7mYh/EbKLJOyqLHarkC+MmW319Ap6pQjDnfcACqey7k81Iqz0ieJQ9D1SdOH7SXBT
         hX6N5ege2TRTtQ6Rw4inPhKJapGV8hibawGAZcWJiENkslUdQfu/RERt6UhR8t8nn7g3
         ZLiExKCjVrUdRKDATMi4Y7RVvAb5L0BeNYxPJfwy4WEYsJCiRg400MaNy1QxGwpmwJVQ
         74iiJNBScbk+BXJbG5tj1/RT6l/56ZiKBz6WIO8F3JNKVs7UrfRk0CwOOFVGKg6f15Kx
         nLPg==
X-Gm-Message-State: APuU4Z8RV9zppBAYuVME5FlUBTj/93PpnmT8wg/UT+Wlama9B/mw63ag
	nny/iRvg3F15WhsmfdXQR32jlDoLZ+z56JeKr2OiGbNQYLeO+I2tq3dJpcslLfJLhwico9tOtkA
	T0/851Q==
X-Gm-Gg: AZFdTZeiVS4Z8HfRvDFuHEkhXWEaFSN8UuoiTrYJhu/NUlKS2OgqKX6/+0M+mGrF/0N
	SBDDe6iWiqzDSP8/EZYmBpm5ntC1Pb1L329qtVvUFmzzRBc8XP7Fvb2mSjKreXeSHmtUVLb8Ysl
	Cx8Am68N30HtEPdBHuCnMCvedE8v49dcRzSFYmyXgqFRmtY9IeyRsNbhozEZq5NN3iXk7DSumWZ
	N5LXeyiw8uyO/mhhGeOtEFBJmI6WYU+gcK1weccS4b7zKF9mMT8ly2NiL4PAnOKZCEZcWuEu54e
	gOmCnf9wSW2b1L4gUODhlVrQHODQSUzsMX9quqj2M5fqUhwFGF5fA2BkPiLA8ylOYuq4jI8Waog
	vJjLCPfWvDmmP25CKIOP60IfjydMhllKf+nccZ3qfCezPk4oTGvbYkSyJUgnSQQUyMhvnbLfaFe
	giXIzB2BhfP+PytIJ/y1ICOzs+PkgtMVUGno9zOiutxQThO2Bw45DxzdQSzY8ELFij7B0RKceYH
	U9DsCXOTzXLhaCSgBmLn3AfSFK1cqWdy2gYnaiO30yoyvOGNQc5Pj3kViLIj1XpPyyjSkMxPvD6
	Vc4vwdK4HTUd+D+DMkFMe7wrCXyYxuZEvGDK/lIFqrEtL/LGibxPZfbER9bt4GFBLslactbfvvx
	CqH0nhywEklkYWkenneJ9qQ66YI/h8yDHpCa18Q==
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb888236a3mr444852505e9.24.1795700336937;
        Thu, 26 Nov 2026 05:38:56 -0800 (PST)
Message-ID: <e0803486-f682-4bb1-87f8-5ed4fc3f0af3@suse.com>
Date: Thu, 26 Nov 2026 14:38:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 06/13] numa: use domain_vcpu() in domain_to_node()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
In-Reply-To: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1795700337-51CC3CFC-C3A77876/10/78276251493
X-purgate-type: spam
X-purgate-size: 717
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If for nothing else, then to reduce the number of open-coded d->vcpu[]
accesses.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -23,9 +23,10 @@ typedef uint8_t nodeid_t;
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
-#define domain_to_node(d) \
-  (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
-   ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
+#define domain_to_node(d) ({                 \
+  const struct vcpu *v_ = domain_vcpu(d, 0); \
+  v_ ? vcpu_to_node(v_) : NUMA_NO_NODE;      \
+})
 
 /* The following content can be used when NUMA feature is enabled */
 #ifdef CONFIG_NUMA


