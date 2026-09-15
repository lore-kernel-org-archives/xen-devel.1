Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8707C88E75
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 17:45:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422015.1647620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6XDz-0006YA-Mv; Tue, 15 Sep 2026 17:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422015.1647620; Tue, 15 Sep 2026 17:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6XDz-0006Y3-KB; Tue, 15 Sep 2026 17:45:43 +0000
Received: by outflank-mailman (input) for mailman id 1422015;
 Tue, 15 Sep 2026 17:45:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x6XDy-0006Xv-Sr
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 17:45:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6XDy-00D0UO-9f
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 19:45:42 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa9843a-bab6-0a2a0a5309dd-0a2a450acb5e-10
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 19:45:42 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa98441-f2d2-0a2a450a0019-4a7de18d8ba7-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 19:45:37 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e6b885ef8so505415e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 10:45:37 -0700 (PDT)
Received: from [10.59.3.202] ([146.0.124.57]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83da071asm7154315e9.8.2026.09.15.10.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 10:45:36 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789494337; x=1790099137; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmUQ481Rpl/xf/x3B2lvULx6YRYaBZClw8WZwBpgsko=;
        b=Z536YEBvwFwSIjwwGEN/18UIoBqw/uMrz7r8sG/vKGnfhTCzeWlkUjIMfqfMdTPqwy
         5JtA4q5vrO02o6BLpyg5uu/XEtDXXPESUJGCDTgP2hJFUvnbsJfpNH2GMhRA0zyDjnHE
         2UtkpO15o+cjqp21VoXIBXXi4P9i6l4kSJMaDIv9JS6p+i0oSWbqM4/R0JwnP0410tIh
         MfngjtFWBX4M/nQVLB6BIOM9nUi+BOxvuTyikBb/I/jtK/GTGbwV00JSr7lBAYg3shGX
         ipHNeoQ7/mRjzeQvqzwEFjMzAnCr2M347QVKP3e/d4LDecsxHzccc++8xSVgfgD0IJMS
         wb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494337; x=1790099137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmUQ481Rpl/xf/x3B2lvULx6YRYaBZClw8WZwBpgsko=;
        b=O61SIRNidEKWxOvnosniNs5qNQBudbIAntT+1cPVXwpCGKA7JUqjqdc1LL2+CBZ0ip
         6K0UWoG2yNahMhMOqNPV27Y+Qw8Rc1bJmw8p6++C5BfLdvnfW8tVSEsCsDheeKAGlY89
         46dgJW5MECyA+Yhtoxv4B6wZTb3LXpqufqUQtLHPf1cqnynUsBXaJcTCjdffemo6g0lw
         Uhk7ZJnoVvdq980P9JMEF4LJeI35rwkjzlaasWeouMG1DWsa94RI0ETmbFjnxaFymYyR
         WD98W1ghbm4LS2wxx1HOHmikWqP4/Vu0n2VelLxmAbv5s9QVtqbmmcWc/H3mkAwbgL5g
         up2A==
X-Forwarded-Encrypted: i=1; AKwUvBzb6XJ9xEHaqVkx19vAoe1w0lYSQOlUUvBKi66Rn2rzst9IaMlDopqpCdiF3XoaQBsuwbS+x8wFKGU=@lists.xenproject.org
X-Gm-Message-State: AFuF++mtz23IEONAYB3s3FtIR4dDqQF+BiuTLBLeWdlzAUHYnqPqFSnj
	B+X8HQBWvp8/Zjlyjy2eEsuAzTYZU503fsE6T0HpbZFmw/E6PaNTepOmYQdfrf71MA==
X-Gm-Gg: AYBFou3PpamJEmCeQWxjeWAhT7TmqXM57Ofm3lPDLj13IGQkhHo2Fo+KFWJJfsv2k49
	Sn3/Xnix7TZtGhc2oPE8DY0bevyKENDmOchLeWWeRsWbtZ+Fn7cxrBONaj9VOd2/aElcnGpDLqI
	r81NLxHCL7GwxqJxPHnhcYgsP9I+XLIAo1mBlHgGUMw0HbVsim8TEyETwXFl+aVGOgsfHMTqwdL
	UG0WUi26Ypxv70pUKrlbbs0mt4cjgXnHqYS34o/Ook8A1HIsM614qfjwtcCb55bHH2c+5iyjX/h
	Le4xbpxLMRjhfQfGlvsq6+b97TeMnMQkEQcGSmkTY7ue9UhuU1d1HLtpPZG+xXOCLM3K2kPnvW4
	Qf3M6PohdlktIcpktkiDlNcIcHeRNKdCPbsvK9pp51a93DencqILVXiezHAJDGPnTBwOLmqpqCc
	ZmANgoTGtw8uJyKQbYCKmPHgDSUnOPuK3MNB7o463SmzNtsuNyoO11N+swxSZpt2WUVvhkLaBxQ
	yE=
X-Received: by 2002:a05:600c:34c2:b0:49e:8184:f619 with SMTP id 5b1f17b1804b1-49e8184fc78mr31698005e9.22.1789494336598;
        Tue, 15 Sep 2026 10:45:36 -0700 (PDT)
Message-ID: <852f47c4-bd95-4e44-b409-ee805a07a5d4@suse.com>
Date: Tue, 15 Sep 2026 19:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/6] lib/arm: Add I/O memory copy helpers
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1789055542.git.oleksii_moisieiev@epam.com>
 <6bf8f9dd61da4d0fbea096b863f51db08df46c56.1789055542.git.oleksii_moisieiev@epam.com>
 <1d8be2c2-a56d-4b81-8e36-c4f97099c879@suse.com>
 <c9b06223-07b9-4c00-949e-874a6167e2d4@epam.com>
 <a7ba1f23-668d-4697-8de6-9890c64835fe@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a7ba1f23-668d-4697-8de6-9890c64835fe@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1789494342-4ABD8CFC-C90512F1/0/0
X-purgate-type: clean
X-purgate-size: 2078

On 15.09.2026 17:45, Oleksii Moisieiev wrote:
> - io.h
> 
> I'd replace the current comment with something along these lines (kept
> arch-neutral, so other implementations remain possible):
> 
> /*
>   * Copy a sequence of bytes between regular memory and a memory-like
>   * I/O region, e.g. shared memory placed in RAM or SRAM mapped with
>   * device attributes.
>   * The I/O region must behave like byte-addressable storage: it must
>   * accept 8-bit accesses at any byte address and naturally aligned
>   * 32-bit accesses, with plain byte-storage semantics in both cases
>   * (no side effects, no dependency on the access width). An
>   * implementation may use any of these widths, but never wider ones.
>   * The helpers are not suitable for device registers with access-width
>   * requirements.
>   *
>   * Neither pointer needs to be aligned. The access widths issued on the
>   * I/O side depend only on the alignment of the I/O pointer and on
>   * count, never on the alignment of the regular memory pointer.
>   *
>   * Implementations are architecture-specific; see the respective
>   * arch/*/lib/memcpy-{from,to}io.c for the exact access pattern.
>   */
> 
> The Arm-specific note in memcpy-{from,to}io.c would then state the
> concrete pattern: 8-bit accesses until the I/O pointer is 32-bit
> aligned and for the trailing count % 4 bytes, 32-bit accesses for the
> aligned bulk. I'd also drop the "tolerate" wording in favour of the
> above.
> 
> - implementation
> 
> As proposed: only the I/O pointer is aligned up; the RAM side uses
> get_unaligned_le32()/put_unaligned_le32() for the 32-bit part. The
> _le32 variants are used deliberately: paired with readl()/writel(),
> which are defined as little-endian accessors, this preserves the byte
> sequence regardless of CPU endianness. That is the only endianness
> aspect worth a mention, and I'll rewrite the commit message
> accordingly (dropping the sentence you pointed out).
> 
> Would that address your concerns?

I think so.

Jan

