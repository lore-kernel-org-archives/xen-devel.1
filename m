Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F6606A321
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 14:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LJq7GL1f
Received: from list by lists.xenproject.org with outflank-mailman.1502458.1698506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWE5Y-0004EQ-6s; Wed, 25 Nov 2026 14:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502458.1698506; Wed, 25 Nov 2026 14:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWE5Y-0004EJ-3B; Wed, 25 Nov 2026 14:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1502458;
 Wed, 25 Nov 2026 14:35:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWE5W-0004ED-SC
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 14:35:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWE5W-007KwQ-1B
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 15:35:10 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06f214-8faa-0a2a0a5109dd-0a2a450ab5d6-44
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 15:35:09 +0100
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06f21d-f2d2-0a2a450a0019-d155dd34d9d9-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 15:35:09 +0100
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4a32576da88so3377120f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 06:35:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb989eesm34871007f8f.50.2026.11.25.06.35.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 06:35:09 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795617309; x=1796222109; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z1zV6Vw00tffjMJaktR5uoyoj54aP0aPaRhjJ3OZbcc=;
        b=LJq7GL1fqYwsmopWzPTe7/I7vuw6r35TFOWdjBim3TXtbdXenYTOCqadFDX1ChkJyY
         pH3AhDFfQbWoIeR7+i/L8zPIU3Ak8PkJNTXH/N6T0R4Iz3M856Zm3LC+oyQKmPk+TXuk
         lQMWhaJxIpZlAvFw5E4J4KCjSeTvksyBC8OIobeYvrOa/ETQo3kL/epU6w9ajCTDLOBZ
         GyWFxXc6bWPODbAojr37mRH3PWaAsetkul5t9VQ2Bz44ZsdjP8VjtkmHak6sdl81pi3m
         XmULgIhViz0pnGYqH76Iy0J0dqOrd4WvAoFdxTNNdM1X0vQD5v10M5bbV9zFq87Vs5OE
         kn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617309; x=1796222109;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1zV6Vw00tffjMJaktR5uoyoj54aP0aPaRhjJ3OZbcc=;
        b=hALGV1DIEvKBZV4T5zzZb4Arrzmift5ZT8PqNJbU2Cac7dyRoKpUxJa8w9+Jgrx6Gw
         sGQyeJm0IbtOw+qI2Yds5j2G5+Mf2NR4hsfQJkaaYfE4XMgopky66rj3EcCuvbM5MW7V
         o/nQxRgRqfCl9hxqM8cKTgbu3byNhiHVxms1IvYeo0aB+9CxHV34Oa5QGh84Y14hOqZL
         tb9VdOW0kcGtdrWNus9myc0bs0LViltuAGCEs8OHfzRVXXmLptm6xdq480NPsHCXv5X/
         drxp/QXbDuC9SnAKkaTxDS9vviwadO+eUBfe8bHI03eQmTEQo2WWWureFKHv6Q1O9ZiQ
         BRYQ==
X-Gm-Message-State: APuU4Z+HjyA1cJpQGTRp6lgMXeWXQXaH9F6ATkMowRkhZ9R211kD+Kb0
	MwxBO14uP6jMYZ/BQKr238bny3LRhl2MbCE/euljf3bYzl9hg7YxryvlV1UMLIdPvtN5XUsA6ga
	kZJQQ7g==
X-Gm-Gg: AZFdTZfuaVKqbXE3k/QV1WrRHMJp7V1dnnK/aC8eN+VnVo0s50CfQ0sRau22mk7Edln
	cQOYZzAXw9lD5b3toLL+pXVvLTDiwpgkzPoWEVHjqPEebiZV5M/DMGp6b2kyNDU+guUKrHtMJPF
	YeJR5Bu/HgeQ26NnCIADY7dLG/h9GdnKBLqBw0DXVKQ/xpkGISo44cQBHYdbwZV9CdzUiqvZKrT
	hK+qfYneZioPqx8apNW/pZ5gjcke6dTaya8zAJqKEIb9/TcCe1Geqs0l3phbV9Bw6+BSj2pM0a0
	7o6lvMWzQuoAL5a/gATOaMrljHTnxD2jsw//5qrYJlQtexb+3RwFb/hPwsg4wr/Qbind10JNiqp
	AvVNyXDgsZciZC2RBTFEIRawWDNW3c6KexFOy8kohznCs37WOiGR/CrwJtxa0KXwIPqLdd4ZyWH
	uWJ+aNC3sjycjptfL8UvIMr3gf+om40ZNQhLJRHRLsRRCrV98lBV86qks2ZG/HNNZ8soPJVnIY3
	p8ROc1yT9i05wnPYIBAKner4hPxkQSEMTXFYCs1ZJdDFSqlPI3DcDHSNByHz7H4qy36fICGbeWN
	Ewm+XGmwAC4LGIiuJBeEj1cleA5TROa64Gi/JYLZ7cn6Lca8QkPoo0Wv+mAleFc1zP5+xZE5FFt
	2ocQjynbVFMmrYfELjw==
X-Received: by 2002:a05:6000:2b94:b0:4a8:714:7ad4 with SMTP id ffacd0b85a97d-4abb59e28a5mr22341705f8f.32.1795617309343;
        Wed, 25 Nov 2026 06:35:09 -0800 (PST)
Message-ID: <ce77413b-ec50-42e3-a1fb-cfec6e6efcba@suse.com>
Date: Wed, 25 Nov 2026 15:35:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 0/3] "brk" allocator
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
X-purgate-ID: tlsNG-4011c0/1795617309-51CC3CFC-5BA3D41B/10/78276251493
X-purgate-type: spam
X-purgate-size: 198
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

v5 addresses (hopefully) the final bits of feedback that kept trickling in.

1: build: permit .data.ro_after_init in *.init.o
2: common: introduce brk_end
3: x86/EFI: replace ebmalloc()

Jan

