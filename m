Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1979C982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 11:46:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427375.1650081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8cTb-0000K2-UL; Mon, 21 Sep 2026 11:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427375.1650081; Mon, 21 Sep 2026 11:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8cTb-0000Jv-Qw; Mon, 21 Sep 2026 11:46:27 +0000
Received: by outflank-mailman (input) for mailman id 1427375;
 Mon, 21 Sep 2026 11:46:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x8cTa-0000Jp-3Q
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:46:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8cTY-00DcHU-NA
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:46:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ab1190b-bab6-0a2a0a5309dd-0a2a4508befe-48
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:46:24 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ab1190f-f659-0a2a45080019-a237832f9d4c-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:46:23 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id EAF3C4EE0059;
 Mon, 21 Sep 2026 13:46:22 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1789991183;
	b=MHkuIqLM/wFBF/0znD+m3Lev8QkrMthFyniw1h5+LqPumXO2Z69nXqKZwI74SsqTh2lU
	 YLLy4sob9Rr0dgAdfIx71g8KBe88mL9AwZwhL936H2t0k6v3czFSlv11UmiA1vUbPOkio
	 KmnZVB9nZrI5Lb0t7Uy+sdjXfNN1WEHgwN0mX7j8VebtsUt9KlW4pNFnrEfz2rcVgPCFu
	 PxEmykvYX6dAs4JglMnBaea22lHUANDYvdCesMWcENy9g+YXFuYZOYITHsyeQ371P2i4A
	 JVQh3RR9YSUAC5X36CyovoW5/LKubB2+ipAoJAR1WIzBJabykyOkhINAgyDRoqduuUCC/
	 Mb5pUkblSJxqbbpn0YdNVnv3TIh0ei1OtwINVX/Zqw+WmuBf3KuxpB4An9U9vjSHv1s7a
	 Ae3QK6HKN3CkSDuZfBjXnn+ucTqndKJgMcjNl0F2VCmz8hZX7weVrI5UQQEDRqfBDi7kL
	 CkrqOHgX/m5SUXAsIohRDlqNqmy3ni/YyaKGG+eD69NCLdJwYuLoazGY0HrEzg/eaWElb
	 uoLiIH03sd/FUpBl5aFAJLkRqeljge7cJq+xfqzAtHOgNs0ydbMWOejdInc4ZXt1JIhtK
	 ycsU/59t2J8l14FdwRaja+an5JL5Bsioucl0liXwWkZMkXTZx/zkmVd1SsjNoP4=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789991183;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=daGJpK86flBg+IdzsKG9T9TtHsVol6t4gicRS7tin1Q=;
	b=KiFhWHLQEDkFPL+5IitwXaDTtvB+oGeGu9qXfF4ZoINh8FOqCDQGVVdKB97/id01DXvU
	 9NjAfKK0xr9LfvNt+rubCkN4BRP5p2C5hZYuaiXLjIny2FLZoB1X0v6x/5k/8dkA2r9z2
	 TtShdUsnelzoj50lTB+hws2T0EYkl+iY8WqdcIToFLxY7GLxezvLkucThWyoEzaPovuhA
	 nQS4iMniKLIm1D0BsDHeyV+PmA/Nbd4Z0DIUF7dHeAYMErb7LFHmNKtaoTJIyNhhdnQ2f
	 bvYbXJr5DNT1DEoZnOue7ONV3WtwNFa5hvkASsiEpRM1waDYsGT5lyTT8K/0Zk2rvb02v
	 xChdh0NyPquoXoWu8G0Z2N0ED+aqxcHI0tFpDm4dB45yfnzohdsvvh4VVCRzfiM+JzC4X
	 jadtj09WzPiGOdJCgJdx1Ogq5OAINw/6eAIgEWzzRMUS89SvTipKyK94e5pAMHYWQ90hZ
	 tUZqZDM8W8/g0xkWXIQ/gSDtVr+CE9y+kKPLGMSaJqCXrOjkGvOSTe6ZsxvXpWU0SNrDC
	 zhr2kjCKk7ZokS8iqWtBabfcV2tJ6pf7GqDFpIzO5jlQNbdtHavtWhRvFi621N53WXA2Y
	 wnfNhkHDik44AWiwZDIfTmdoDyomcTSwUQ2+I11Na4IOxQtPvR8a2zfgzEb23Bk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Mon, 21 Sep 2026 13:46:22 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
 <volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 08/14] Arm/guestcopy: deviate copy_guest() uses just like
 their x86 counterparts
In-Reply-To: <a581e503-f1cc-4ae9-80ee-6b32653e8084@suse.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <a581e503-f1cc-4ae9-80ee-6b32653e8084@suse.com>
Message-ID: <c3494c6086c6b49131e488ac5083cf9e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789991183-D7B5987B-C22E9037/0/0
X-purgate-type: clean
X-purgate-size: 2910

On 2026-09-02 08:33, Jan Beulich wrote:
> Like x86/HVM's __hvm_copy(), Arm's copy_guest() is used for both 
> to-guest
> and from-guest copying. Naturally in the latter case the hypervisor 
> buffer
> needs writing to, hence the function parameter cannot be 
> pointer-to-const.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

See comment below, but I can do as a follow-up if you'd like.

> ---
> Of course for both the pre-existing x86 deviation and the new Arm one 
> it
> might be more robust if the deviation was also limited to the 
> respective
> source file. Can this be expressed together with the needed regex?

Yes, e.g.

-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(file(^xen/arch/arm/...$)&&text(^.*copy_guest.*COPY_to_guest 
doesn't modify.*$)))"}

not compile-tested, so YMMV.

> 
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -433,6 +433,12 @@ Fixing this violation would require to i
>  
> -config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
>  -doc_end
> 
> +-doc_begin="Function copy_guest() in xen/arch/arm/guestcopy.c is a 
> double-use
> +function, where the parameter needs to not be const because it can be 
> set for
> +write or not"
> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*copy_guest.*COPY_to_guest 
> doesn't modify.*$)))"}
> +-doc_end
> +
>  -doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a 
> double-use
>  function, where the parameter needs to not be const because it can be 
> set for
>  write or not"
> --- a/xen/arch/arm/guestcopy.c
> +++ b/xen/arch/arm/guestcopy.c
> @@ -109,14 +109,16 @@ static unsigned long copy_guest(void *bu
> 
>  unsigned long raw_copy_to_guest(void *to, const void *from, unsigned 
> int len)
>  {
> -    return copy_guest((void *)from, (vaddr_t)to, len,
> -                      GVA_INFO(current), COPY_to_guest | COPY_linear);
> +    return copy_guest((void *)from, /* COPY_to_guest doesn't modify */
> +                      (vaddr_t)to, len, GVA_INFO(current),
> +                      COPY_to_guest | COPY_linear);
>  }
> 
>  unsigned long raw_copy_to_guest_flush_dcache(void *to, const void 
> *from,
>                                               unsigned int len)
>  {
> -    return copy_guest((void *)from, (vaddr_t)to, len, 
> GVA_INFO(current),
> +    return copy_guest((void *)from, /* COPY_to_guest doesn't modify */
> +                      (vaddr_t)to, len, GVA_INFO(current),
>                        COPY_to_guest | COPY_flush_dcache | 
> COPY_linear);
>  }

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

