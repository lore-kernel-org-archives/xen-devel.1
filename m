Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAB1CA5FCB
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 13:35:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438365.1657224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCGwe-0004Uh-LD; Thu, 01 Oct 2026 13:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438365.1657224; Thu, 01 Oct 2026 13:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCGwe-0004UW-HH; Thu, 01 Oct 2026 13:35:32 +0000
Received: by outflank-mailman (input) for mailman id 1438365;
 Thu, 01 Oct 2026 13:35:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xCGwd-0004UQ-31
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 13:35:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCGwc-00FzYm-G0
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 15:35:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6abe61a0-8faa-0a2a0a5109dd-0a2a450c93f0-6
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 15:35:30 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6abe61a1-f479-0a2a450c0019-a237832fc208-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 15:35:29 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 9980E4EE00D0;
 Thu,  1 Oct 2026 15:35:28 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1790861729;
	b=oBIhli+vQv07pXOwc11LZxAsDidCojCCSpg9deL0HIRCQQtnVsHM0LTwdHNxmwwS2jhw
	 vy9iw/1aojmGGlxkHEb0JI3gzjXfvXa6VDQCStkaQ3CwUcI497gQXY6XX/Dz/PV3I/gqz
	 8n4Ry111rDF1LH63R0H3PDNgPbvLe/QLiwsvAqua6vfpGRSllTLBAECbPvTapeZQm3dC8
	 jlel1GXC6l4Xb5g2T4bIeJTDt/ZR7n/AuyIYdkUSri8k5XkdT2e8JLt0kFGmhSpRbzpQB
	 4D8lyEqr+euUTurPfyKh9x9pYEgnasJtUr4yGKLVfvMFc1Ai6LFakOUDghbJwdbbtnMKA
	 uLtcGWX6OLy6zaQ2ElVIh78Fxuh/uWQ0qqzrbiDvFrL0UjOggxKOOc8DY4wOd9EpwUo2u
	 ekZeXdi5q+EEo78aa4XFA/yHwDAZMIQxBElGxcrW05G1I5E15QCRoAN68qAhgvvKuWdSJ
	 oAEnhIGBPDEsLjW+VQqmVDpIQqitjeQkBbEH1axTz9X9bS1qeGDZx5aU4WiCO7Fu2CWar
	 my3JpAdpM6jqwGOqz2smH0KPDWziSx6HQSMmmJcAlkQ7mCUgi0BJbwtyhKVuqYjOIzOBN
	 hSMH6tM/h8znHXBCs9PBNA2OWri3LU2Mi2QbHJIBd5dsOXc8+fs9Ou0It8wmiJU=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790861729;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=PsgLv0+JVFkZZR//5DOG/cSKwYlJbO9mVstpnbJOOns=;
	b=n4m/SA5w/S0TBm36bPuWQuSg+32KCA0E2OaGjPPgvE6SVgq1dGjGX4aBTYPpFhAwmM//
	 DPJZL/6J0T1TdZzoOxGCixYkPNeIHHkOQow1n9VmFqRCWn0ZqqRTDEsbITokAB9C8BWUa
	 UuWsrgpF7QFqSqdc+so5pvE1U2cCXoBBiu1QkLu8nHTIldZNGb8/UnvAq9Z3Erb6RkJWJ
	 f8sqMeL+6t3lhzNXEckY5LhQFE+jY1XQ27ylU0tQBM5kTh6AalCMPP1Z+AIemTdEYwppk
	 LmYs1sBokEO6vKo+Ruohdgxy4m31euRM7Zb+VvFajew6BtpqyDy/wOZZzMzkO4y/Bzh4z
	 t98oSCfhIm0ddfxY+l/14E2Yoo4ANhT1KS6FHIkY+5FzwBUnJcHkLomLiN4rJ5VOyC2U0
	 lHNLDJRiH+xfLlsDsO1tyEo6OcLVbauBio4Spj4vZbc0YCriZ/iiDeeis5jQBAcC8U0sD
	 jUoBkIL/PeXLNp/PJU3nrE6kwolLDKvYkTiIszcibunkZ6ZlBTe8WttABgEukJRe4lQHo
	 JOT/zmPofM9ZL68XgyytTKaXDCMTi77xNI6/HD2gjg6UPu1WS2p5FQlvKnZUaxhKvADaF
	 MmdSmGYn7Ze6G8OgPbhNvii888HRwHmrpDh6eA292dIHA0DdNUXTT8od5a011dQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Thu, 01 Oct 2026 15:35:28 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Dmytro Prokopchuk1
 <dmytro_prokopchuk1@epam.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
In-Reply-To: <3cb25b4c-6470-44a4-bc46-55776317ea67@citrix.com>
References: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
 <0a286fe9-2133-4f28-8fab-59f4e51d1484@suse.com>
 <446354d93ae04a07b86d7293705d7e46@bugseng.com>
 <0373fcc0-5bc9-4140-a2c9-52a31c7e42b5@suse.com>
 <2a8557d7ba88e95ec75148ff180ae0a0@bugseng.com>
 <f68982e1-f46c-4640-88b7-36ef362bf340@citrix.com>
 <cefa3793-a319-4041-9204-fb115b9c5511@suse.com>
 <3cb25b4c-6470-44a4-bc46-55776317ea67@citrix.com>
Message-ID: <a8e271ad6bfa70f8c080d4a454f6f052@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1790861729-01AC4A5B-9EC37A87/0/0
X-purgate-type: clean
X-purgate-size: 1073

On 2026-10-01 15:16, Andrew Cooper wrote:
> On 01/10/2026 1:43 pm, Jan Beulich wrote:
>> On 01.10.2026 14:39, Andrew Cooper wrote:
>>> We want _Generic() for const-correctness reasons only.  (And possibly
>>> API transition work - this has mixed results but can substantially
>>> reduce churn in a series if done well).
>>> 
>>> This depends on moving to C11, which we need to at some point anyway
>>> even if weren't for _Generic().
>> Why is this? Can't we use _Generic() as a compiler extension, i.e. 
>> without
>> fully going to C11?
> 
> AIUI, the parsing rules had to change in C11 to support _Generic()'s
> syntax, and IIRC Eclair can't parse it without specifying C11 or later.
> 

That's not true, ECLAIR copes just fine with _Generic regardless of the 
-std:

0|$ cat p.c
void f(void) {
   int x;
   _Generic(x, int: 0, unsigned: 1);
}
nicola@nico:~
0|$ eclair_env -- gcc -std=c99 -c p.c


-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

