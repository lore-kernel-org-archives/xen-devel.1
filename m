Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E106606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 10:41:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1463064.1674030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM15J-0002lX-C3; Wed, 28 Oct 2026 10:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463064.1674030; Wed, 28 Oct 2026 10:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM15J-0002lQ-9T; Wed, 28 Oct 2026 10:40:45 +0000
Received: by outflank-mailman (input) for mailman id 1463064;
 Wed, 28 Oct 2026 10:40:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xM15I-0002lK-9V
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 10:40:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM15H-006a0V-Iy
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:40:43 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ae1d12b-8faa-0a2a0a5109dd-0a2a450280fe-2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:40:43 +0100
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ae1d12b-6ca4-0a2a45020019-a237832f8d62-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:40:43 +0100
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 229D34EE0216;
 Wed, 28 Oct 2026 11:40:43 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1793184043;
	b=i865FpOIqCQZCin9GJ5Y54QbbfmQGc7X2hqnvn8cjfX+Rd/6Z88Ac3yfomXkDp4Y4AxH
	 zoQkTCSekD95sZTt7R6k4SGUpkGxlU1TzVlWCdDqVJhpmV8I1eYe+CA0gDJ2lgOROiYub
	 tOVuo3RUwMrzWc9S206XRANw8i9pUl9RC58744oR1MEuZVNyjDUuOT7wSBRJAiu/mpyOh
	 wGuRVrMxWZ6O6Pz4X42/+ioOW+xfHqgiMLlQAiIYJhjmYf5GVKMJcbCrGUNBHVaKlN0w2
	 aDbKThccz8vQ2jQS4Qut81TgbZBHxH/v1APt5OsflAJxCniPqEzUv3ccbRZXNPk6HqjVt
	 MIxeiZy76IBJDw7tl4chZQD/Loqia2uMOzmqIImKkQE5E5Rlr3Y+D2IOrcXkMP4wXZot3
	 GCs1nVL+P2nZLKe0y4DY6Bpt3bPh0Qc5ghHVJ/GMKLohysITX6sREjwfKa+xUOM/R5SLa
	 fNUe4mG9gvBMsurl7P9ZXATNOiDhTPWnvKPmysbxRNsT1wkOxxmXKQeGWLmTOv4/r7BlL
	 8JL5H+Ire889F4znhDIGlCeqe04nIPYQGcBw7A9ZgP2QBg7wzQW8FXMdwCeou9sIESqH0
	 9dI5kIoRkard3j1osSVm/gEb92biidG96TyGsUZ9LKqXl0xXJRiOlbW9OmyiQ50=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793184043;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=jl4yoVqNP/AdEYmlEgxjx1N8zYUsTpg7wQt86D6War0=;
	b=5tv8JlYuVXiQN0sZ4GNCDT2bF+7hz6AqgloLUS0uWRXGH+bapqBU0RO68U5SMmFKKvjO
	 R6oqGkvfV4GOL/UtT/5kHCoa2U6bE4ETuC3lC7KGpBQwC2JelyUIv+CGZWmUTbTqLnRIe
	 szqQRq0BxzoFtPrQ8o1GccJbqGTimATGucq+hsbMsSBuN4CuYu73+jc/M4qzVJsQSYZFc
	 LIgxZcmbcKG/IXIBLZ8Vy1vJWyTsiI7vmcya+J5i+3wRJ6lgS1tl1mSZ+jem8Fu1eEu4G
	 huuh9ktZgvewYMa3IXvl2NilgojwYkkm3WLb3Dlh/X1kv0ytmH904rIYbVcCgupAXcG93
	 j/Sv7Xl+yhVLGyJfi7M7G5ANONL5TP57G5xtQ1zPREYyFe74Fu9dD8jcg86t4FcmCW80i
	 QGDhs6mKDpli+MnsVv/S04XiDw3QDkH0vfLf4WfsAEslbS2x2QFW7dYkLKoWMzLMe3tPx
	 65mOXJxfUyEbEKv/vF/HSefOPzCfvLa4GsCyy9c70pHH7Q+9W6dfE+KeHeT5zxgq0cBK/
	 uTrGKDjON0LvBvICq+Cotxu5+o1iEVwxydnXxNB4mZCKrY2kOKIeVXU8/JqX5VHarMAUo
	 63M4Yg5+d74lwpUEqpTM8BdIAn/NPEoIXC+5F/8T3yn4/D/s7ItVW9NqVaWZ26c=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Oct 2026 11:40:43 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Shuaidong Chen <shuaidong.chen@amd.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Alejandro
 Vallejo <alejandro.garciavallejo@amd.com>, Grygorii Strashko
 <grygorii_strashko@epam.com>, Penny Zheng <penny.zheng@amd.com>, Ray Huang
 <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] xen/typesafe: don't brace-initialize a scalar
 TYPE_SAFE value
In-Reply-To: <0af0a00b-4f9a-4584-ac5b-554ae00e692e@suse.com>
References: <20261028050336.2549325-1-shuaidong.chen@amd.com>
 <0af0a00b-4f9a-4584-ac5b-554ae00e692e@suse.com>
Message-ID: <25c7537efec9c2a12307fd564f564c45@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1793184043-317CA2AC-A0C4C95D/0/0
X-purgate-type: clean
X-purgate-size: 3418
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-28 08:42, Jan Beulich wrote:
> On 28.10.2026 06:03, Shuaidong Chen wrote:
>> TYPE_SAFE() degrades to a plain typedef in non-debug builds (NDEBUG), 
>> so
>> mfn_t is then `unsigned long' rather than a one-member struct.
>> INVALID_MFN_INITIALIZER and INVALID_GFN_INITIALIZER, however, always
>> expand to `{ ... }', which leaves
>> 
>>     mfn_t first_valid_mfn = { ~0UL };
>> 
>> initializing a scalar from a braced list.  That is valid C, but MISRA
>> C:2012 Rule 9.2 (required) - "The initializer for an aggregate or 
>> union
>> shall be enclosed in braces" - is reported against it, twice in the
>> x86_64 build: common/page_alloc.c and arch/x86/efi/runtime.h.
> Wait - the rule says the opposite; it says nothing about initializers 
> of
> scalars. The rule is clean in all analysis jobs we do. On staging we 
> only
> ever have debug builds analyzed, but on release branches *-allcode have
> DEBUG=n. No 9.2 violation shows up there. You also don't point at 
> Eclair
> output supporting your claim, so I wonder what is going on here.
> 
> Further, "That is valid C" contradicts ...
> 

This was actually an FP present in ECLAIR 3.14.0 (used by Xen), not an 
actual violation:

1|$ /opt/bugseng/eclair-3.14.0/bin/eclair_env 
-enable=MC3A2.R9.2,B.REPORT.TXT -- gcc -c /tmp/fp.c -o /dev/null
violation for rule MC3A2.R9.2: (required) The initializer for an 
aggregate or union shall be enclosed in braces. (untagged)
/tmp/fp.c:1.9-1.11: Loc #1 [culprit: to initialize `int' it was expected 
a scalar but found a compound with 1 element]
int x = {2};
         <~>
nicola@nico:~
0|$ eclair_env -enable=MC3A2.R9.2,B.REPORT.TXT -- gcc -c /tmp/fp.c -o 
/dev/null
nicola@nico:~
0|$ cat /tmp/fp.c
int x = {2};

It has been fixed since ECLAIR 3.15.0. How to proceed (document as FP or 
modify the source to avoid it) is up to the project.

>> --- a/xen/include/xen/typesafe.h
>> +++ b/xen/include/xen/typesafe.h
>> @@ -9,12 +9,17 @@
>>   *  * _$FOO()  which boxes a $TYPE as a $FOO_t
>>   *  * $FOO_x() which unboxes a $FOO_t to $TYPE
>>   *
>> + * TYPE_SAFE_INIT($VAL) spells a constant initializer for a $FOO_t, 
>> for use
>> + * where _$FOO() cannot be (an object of static storage duration).
>> + *
>>   * This makes a $FOO_t and a $BAR_t incompatible even when the box 
>> the same
>>   * $TYPE.
>>   *
>>   * It does have some performance cost because the types now have a 
>> different
>>   * storage attribute, so type safety is only enforced in a debug 
>> build.
>> - * Non-debug builds degrade to a simple typedef and noops for the 
>> functions.
>> + * Non-debug builds degrade to a simple typedef and noops for the 
>> functions,
>> + * and with it TYPE_SAFE_INIT() loses its braces: a scalar must not 
>> be
>> + * brace-initialized.
>>   */
> 
> ... the new wording used here.
> 
> Also, in the earlier insertion above, isn't there "used" missing? 
> Possibly, to
> avoid the double use of "use", with the earlier "use" replaced by 
> "cases"? Yet
> maybe this is legal grammar anyway, and it merely feels odd to me as a 
> non-
> native speaker. A native speaker may want consulting.
> 
> I also wonder why you CC-ed Roger with his old Citrix address.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

