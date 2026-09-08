Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90689C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 23:18:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412474.1642934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x454R-0000Vq-0a; Tue, 08 Sep 2026 23:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412474.1642934; Tue, 08 Sep 2026 23:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x454Q-0000Vj-TN; Tue, 08 Sep 2026 23:17:42 +0000
Received: by outflank-mailman (input) for mailman id 1412474;
 Tue, 08 Sep 2026 23:17:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1x454O-0000Vc-NO
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 23:17:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x454N-0031pj-JD
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 01:17:39 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6aa0978e-e002-0a2a0a5209dd-0a2a4508d874-16
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 01:17:39 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6aa09791-f659-0a2a45080019-c689ca88a178-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 01:17:38 +0200
Received: from [IPV6:2601:646:8081:8d71:e98b:813a:9897:e5d1]
 ([IPv6:2601:646:8081:8d71:e98b:813a:9897:e5d1])
 (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 688NGusI2287284
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 8 Sep 2026 16:16:56 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2026082801 header.d=zytor.com header.i="@zytor.com" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 688NGusI2287284
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788909420;
	bh=YxvPbk1+TIa+eRjm3uzymXdFyg0V4mRSsiJGDFWOH4c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DhyEuYlJaKlD5Kqmx1TR6UbWQOE2kUzui755tS5hezt4IAReRx2LCRaz8exC7PYiV
	 2tY6rnOGQK3M9ywC0h8kXKEFjc2o6kFF6poiyH9WdyWsr2+QlZxds+1u2MwrHSfwG+
	 XLbKaeii0VHMChicpduK82c3XGU/pKMi5DDWa4O6CWkTWkZFzkg45hbAk2FmaT2ka8
	 xenh3PCD3NouI+Xtx0kVqsAN2RA7rQ5EGQv7eglg8KNs8Hfcv2rZP7c0guZx/YQOIJ
	 n4zWBf7ULs/igJ9KZOSWOg/f+/eKClMasKTWLS0RWqOHcG4Q4tjgRcow7mDQy8vCA3
	 IyQJ4H5mGZ+pQ==
Message-ID: <e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com>
Date: Tue, 8 Sep 2026 16:16:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
To: Borislav Petkov <bp@alien8.de>,
        Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Jan Beulich
 <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
        kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
 <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
 <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788909459-D514E87B-3C234374/0/0
X-purgate-type: clean
X-purgate-size: 3246

On 2026-09-08 12:32, Borislav Petkov wrote:
> On Tue, Sep 08, 2026 at 03:04:53PM -0300, Mauricio Faria de Oliveira wrote:
>> Boris, perhaps the approach here could be changed to add an actual
>> memcmp()-like inline implementation (e.g., as provided in a previous
>> revision, without return value differences), or continue with the
>> memeq()-like memcmp() from arch/x86/boot/ but rename it to memeq() ?
> 
> Nah, new functionality is not needed. We can add it later when it is really needed.
> 

I personally think it would be a good reason to explicitly rename it memeq(),
after all it indicates what it actually *does*.

	bool memeq(const void *m1, const void *m2, size_t n);

Note, however, that the sense of the return value is opposite -- true means
equal, so !memcmp(...) needs to be replaced with memeq(...) and vice versa.

The other issue is when gcc/clang wants to call memcmp() out of line. Although
a theoretical concern, there really isn't any reason not to DTRT there since
there is only one instance in the code, ever.

Here is an out-of-line compact memcmp() which works for both 16/32 and 64 bits:

int memcmp(const void *s1, const void *s2, size_t len)
{
	int rv;

	asm volatile("xor %0,%0 ; "
		     "test %3, %3 ; "	/* Handle len == 0 correctly */
		     "repe cmpsb ; "}g
		     "setz %b0 ; "
		     "sbb $0, %0"
		: "=&r" (rv), "+D" (s1), "+S" (s2), "+c" (len)
		: : "cc", "memory");

	return rv;
}

On 64 bits it compiles to:

0000000000000000 <memcmp>:
   0:   48 89 d1                mov    %rdx,%rcx
   3:   31 d2                   xor    %edx,%edx
   5:   31 c0                   xor    %eax,%eax
   7:   f3 a6                   repz cmpsb (%rdi),(%rsi)
   9:   0f 97 c2                seta   %dl
   c:   0f 92 c0                setb   %al
   f:   29 d0                   sub    %edx,%eax
  11:   c3                      ret

On 32 bits (-mregparm=3):

00000000 <memcmp>:
   0:   57                      push   %edi
   1:   56                      push   %esi
   2:   89 c7                   mov    %eax,%edi
   4:   89 d6                   mov    %edx,%esi
   6:   31 d2                   xor    %edx,%edx
   8:   31 c0                   xor    %eax,%eax
   a:   f3 a6                   repz cmpsb %es:(%edi),%ds:(%esi)
   c:   0f 97 c2                seta   %dl
   f:   0f 92 c0                setb   %al
  12:   29 d0                   sub    %edx,%eax
  14:   5e                      pop    %esi
  15:   5f                      pop    %edi
  16:   c3                      ret


On 16 bits:

00000000 <memcmp>:
   0:   66 57                   push   %edi
   2:   66 56                   push   %esi
   4:   66 89 c7                mov    %eax,%edi
   7:   66 89 d6                mov    %edx,%esi
   a:   66 31 d2                xor    %edx,%edx
   d:   66 31 c0                xor    %eax,%eax
  10:   f3 a6                   repz cmpsb %es:(%di),%ds:(%si)
  12:   0f 97 c2                seta   %dl
  15:   0f 92 c0                setb   %al
  18:   66 29 d0                sub    %edx,%eax
  1b:   66 5e                   pop    %esi
  1d:   66 5f                   pop    %edi
  1f:   66 c3                   retl

	-hpa


