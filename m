Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84C3CA600A
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 07:35:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442989.1660352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEiez-0002dX-Vp; Thu, 08 Oct 2026 07:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442989.1660352; Thu, 08 Oct 2026 07:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEiez-0002dQ-T4; Thu, 08 Oct 2026 07:35:25 +0000
Received: by outflank-mailman (input) for mailman id 1442989;
 Thu, 08 Oct 2026 07:35:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEiex-0002dK-W9
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 07:35:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEiev-002Yru-Vc
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 09:35:21 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac747b6-e002-0a2a0a5209dd-0a2a4507cd4c-10
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 09:35:21 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac747b9-b4ea-0a2a45070019-d1558035bd7d-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 09:35:21 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a02718da81so20597715e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 00:35:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1843df445sm48642385e9.12.2026.10.08.00.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 00:35:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791444921; x=1792049721; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6kPmwEer3ezcMtwe2rCD124a2D8iDGY92ujr4XdubA=;
        b=dRGmXorUgy9SSmfCXzM19iZEBMhii1bbXwKV+e/KAODkaJvuaJN4Zz6VkEL5mNKZVd
         dlQsAaRJud8wExPgBqOj3Uaxwv98KqcRDkWnTL64YcTvV/67rzrQQ3FNrEDK8AOYwgdf
         gphh86OQ97iVNKETL+JhrZi11V2SCDTiC0OizefpMGfuMkyDi2pAEe82xTz9o00uk+7I
         exPYIHXxYR1tJQ14vcOhFd/eITLy9TAxXpTyJIyXaFOT2MNF0UjVHteshuDTyjLjTC92
         yRW+WajxUnsQo9yb259XWR2O39Parz2ayEKdNRziJEbUa3QEvj6Fp2nU9r5DdPEPj5fB
         xQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444921; x=1792049721;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6kPmwEer3ezcMtwe2rCD124a2D8iDGY92ujr4XdubA=;
        b=RgCAaNyPWxDRXsErVbJrLNioY8mY813iWiKo29c0Co6KN6MVNKZNYN7ZsfEgh7rykR
         qySmtOopPquqvIWzvwhLE19xwrAk8gzQ1Y2eocOgJ7KePyjVkjsG7aQ6jtBcTj5XrY+a
         PZ5jHt/6OI4IpPZuFwDJy24vo8vLsf8+aBMF4NXtPgExoM1srIPCVStHP71TwCnT7y+D
         3CJCXKZ2pmgdRkJUuTTS2/5HqanRXZOQe8MJaRvRlTQGVkJFclJQYi07ELJpgF/fxnqd
         npzv0WLDsLOOk03EN6IRiV+O8SostUHo8KMfTBsRs3Lvc7i1RY++Fahrd6Q+nHGUy0yv
         /aKw==
X-Forwarded-Encrypted: i=1; AKwUvByzcbt3WMbEO05jf3I3Y+lcrRSzdgSdUABcySStuekWbcIf8xD1SQbGVSbXjPt8VeR/SRBodRxJj2I=@lists.xenproject.org
X-Gm-Message-State: AFuF++nRIILawMBa6OEaYj94n7kAUBWySmwi6dm67HOih950DUnKxeha
	EeOMGL4jk8sqCCm3UxaLZiHXe4SSzH45F79lBs9GBtr9x0I/N/BeiHVsptOp5lx7lQ==
X-Gm-Gg: AYBFou22U3uH8gEbBbCeuPk6QxBDCJiP8TiV1Pb2JrLGkBONss3Fcvfy/3Kfp05RiRv
	r5RZyJt89pd1wWKk0pB1Pys1yt03s3PLWoH+1V6ogWCWMvyNamxCghVw9vSipkswyHnoGrNVUJB
	9+RVTegyMo6gp0kOetiHbQHWJHpZosC3TuFGqM7lltIkpNc4S6hp9xF7lxZkgKWULcdt0ydSqwY
	pAGxBRC5SFmeC+4q3j7yMYRAMUlIBhZzxXFM3z2rKIOSyRhVZGMAWJ/gNqr11hHkIu9ZZFMU0C9
	RnDipSfq9dtW6pt5TDbCnpNMq8fjQ9DRpKWNc4nsgdecHtFY74mEwMzBvv9xbIChzJ+HMXltSYf
	vIyv5KKzhGZHt55OH2G5wADeybnRowdXNlN9TnjDIsHcONV+VWiYvgfWwWaWgQ17R20Ewut8aS1
	e958AgAl+P2PACf05LppboDfMHiRTzBZ5np2g/ZCG1VXa0QMJJ1tfJF3uNWGowgZpAyICu4jODm
	1oknpuYymmKLNSsW0oL1T43ob2SMjakBsERcV4AO0bwBzHNvfySpppOc+FrVKY=
X-Received: by 2002:a05:600c:3b0a:b0:4a0:276e:9efb with SMTP id 5b1f17b1804b1-4a1800ca1dcmr78124545e9.4.1791444921159;
        Thu, 08 Oct 2026 00:35:21 -0700 (PDT)
Message-ID: <2f41315f-b533-471e-9f88-57f6eae384ec@suse.com>
Date: Thu, 8 Oct 2026 09:35:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] tools/symbols: fix oversized names and token
 expansion
To: Mykola Kvach <mykola_kvach@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1791384310.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <cover.1791384310.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1791444921-A54C3AE4-4DC8D961/10/78276251493
X-purgate-type: spam
X-purgate-size: 3303

On 07.10.2026 20:11, Mykola Kvach wrote:
> Patch 1 fixes the first bug. In SYSV input, local symbols are prefixed
> with the source file name ("filename#symbol"). A long absolute build
> path can therefore create a name longer than 127 bytes, even when the
> symbol itself is short. A debug Xen build on an Orange Pi 5 (RK3588S)
> crashed during the boot self-tests: symbols_lookup_by_name() expanded
> such a name into its 128-byte buffer and overwrote the saved frame
> pointer and return address. The patch rejects retained names longer than
> KSYM_NAME_LEN during the build and prints the offending name.
> Readable --xensyms maps are not restricted. Nothing changes for names
> of at most 127 bytes.
> 
> A build from a long absolute source path can now fail at link time.

This isn't acceptable imo. Omitting such a symbol is a far less severe
action (see below for another option).

As a more general remark: We've inherited this tool from Linux. Any
issues we find want cross checking there. If fixed there, taking their
change is often preferable over making our own. To cover overly long
symbols names, they have a check in read_symbol(). As we add the
filename for static symbols there as well, I don't see why we couldn't
similarly have the check there.

Furthermore, if the main issue is with long filenames, for static
symbols an option would be to replace the filename prefix with some
surrogate (either a shortened form of the path, or something like
"...#").

Yet further, the problem of (long or not) absolute path names is to
be solved differently anyway. Not just for reproducible builds we want
to omit them altogether. There are two separate proposals [1], [2];
what's missing is a decision which way to go. (Both are pending a
resubmission, yet perhaps not just me but also Marek is hesitant to
do so when the decision which route to go is still pending.)

> On x86, in-tree builds use relative paths and are not affected. An
> out-of-tree build with the default config fails if the absolute path of
> xen/ is longer than 78 bytes; the longest such name is
> kexec_reloc.S#compatibility_mode.
> 
> Patch 2 fixes the second bug. In the compressed stream, each symbol is
> stored as [type][name]. A compression token can therefore expand to
> the type byte plus a full 127-byte name (128 bytes), and write_src()
> adds a terminating NUL. Its local buffer was 128 bytes, one byte too
> small. The patch allocates KSYM_NAME_LEN + 2 bytes (type + name +
> NUL). This bug can trigger with fully valid names, but only with a very
> small symbol table; real symbol tables do not hit it. The new size
> relies on the name limit from patch 1.

Linux'es write_src() doesn't even add 1 to KSYM_NAME_LEN. The +1 there
went away in 2.6.23, commit 9281acea6a36 ("kallsyms: make KSYM_NAME_LEN
include space for trailing '\0'"). (Later KSYM_NAME_LEN was bumped to
512, btw.) Might we not want to follow that approach? (There then still
looks to be an off-by-one due to the type that's being prefixed to all
symbols. If that's indeed the case, a patch may want sending also for
Linux.)

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-09/msg00311.html
[2] https://lists.xen.org/archives/html/xen-devel/2025-09/msg00362.html

