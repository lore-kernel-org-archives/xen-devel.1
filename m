Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C176CA5FA1
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 09:11:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436351.1655054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBTri-0000PX-OK; Tue, 29 Sep 2026 09:11:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436351.1655054; Tue, 29 Sep 2026 09:11:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBTri-0000PQ-LT; Tue, 29 Sep 2026 09:11:10 +0000
Received: by outflank-mailman (input) for mailman id 1436351;
 Tue, 29 Sep 2026 09:11:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xBTrh-0000PK-SO
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 09:11:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBTrh-00DA12-5F
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 11:11:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6abb80a8-bab6-0a2a0a5309dd-0a2a450cc7b0-16
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 11:11:08 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6abb80ac-f479-0a2a450c0019-a237832faeec-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 11:11:08 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id B3D324EE00A5;
 Tue, 29 Sep 2026 11:11:07 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1790673068;
	b=bYJZKlNQ4XkOqqMWjhfFL53HcX8DIGl0cRXeJUz9IX+wsos8aQUkZd7fweG9JNmAAF2I
	 yHYnoiOFuk4AL0bFNllCELISCPlhhQjhiencH3QuBtI0aLne85mOeUsXiy65zPFtbaste
	 t74pM9XV3OlXRVLFVOpIjIBq+8ys5UkJjlFsp6H9uX5RPpbG5Ko0R8FyhSNyR/DVWgy7r
	 lfVPNAXAQ7HUK51y4c+KXYerf+6hSipfxHH6faumNg3YbAeHItwf7zxgUDkMS5swmqIkc
	 OnJyrFhdchpkLGNuUkHqmSZN3sIaADZ3ked35i5w/FMvg20TrZJnwCP9bLTQbE+peexMp
	 27x5Kbk2aV1doHaL6/rmxVutkuWSN9q8esleNHqWKRCr6RPwmq82OuF0TzAzqJy1fiFCC
	 nJLtWocdcEv6VTvDQBESt81g3GbRTBZds8MTkTDMZ0rHoVl3rbj4n0OeJ1s+wOh7nllhA
	 AOzNIbPkOp+IdtGDVB8DfF74s0D92qpYgCcrtDUPXKFyhb1y66sTMtJD9kHBpyWgV2Um3
	 FA84zUC3qT8XZ0pP1eptyhf8MgxAFOCj5hTzPPfsbwzV5tNdsuYy38q2lEdP+NqHGafzX
	 UaqwEwVxGE3mZnVhBOQTD9fM0K8+LBeu4m2b5QM/1788Hpm20bMMUJuE+FSGzl0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790673068;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=GPrvAgC+JqZjQULqTLyRK3n22YmQYCLUZ3LeFkjUEyI=;
	b=gk8kdJih1ro/lMlOj78PJJNw60zBNBWTGHgcrT6pR7JpVSeEcKyJGciikvfKimbFT5Ru
	 y1OtjFsy9w5E8AizztaFqOgOvK7a2RTXkGMfrkSCy4/iPeh3XiYoAKsfU15HzKlGP7H1J
	 n1wHNhzifcRZ6I/m98gtT5qWw+TlObdE0PVxD6MQioVHYep4aBzGHSBNXGHotnS4vj/yi
	 1G66FwGy+xuetoYYQHkzNQ32e2f9f+0owNppGv2+T7bUIlHRbk4lEZgNGx/E3Ax9oCjYG
	 T6kFK52riq8CSbOfB064eq7sZpk42dkoTfglWW41w/tZomUd/X0C+CoJA270i1BLHNqaL
	 o2E3/HPN85Y0EsMWWCO8EERN7u2cyZq7zdqILip6X78shjuJIEPV0lK84KkTYw1IGOjgB
	 tjR4oufBycWwJkJ2pssGEqmwzv2P1Y3D7PUtrx/SY050Y3UL1k57/f2XCHuzii/bnW81V
	 rHiD0lA5undWhaZazv9tWR5gtxUFexiGsonzbjzvIEIXGu0OFL2hEh7ZqYLR8RvNtFOTB
	 LKYp1/XhEzZTshcnJ+aAJmhK9Z1qV7nldYsFpZFlWcDVQgBY5OOA4ZNOhGL3Ldu6UuCj6
	 k7q8OGGWdLqPEkOs2FbueAQ+Yoom9565Xp3i9kA9R5n+fSTYnMrRQED9Al359yA=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Tue, 29 Sep 2026 11:11:07 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
In-Reply-To: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
References: <4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro_prokopchuk1@epam.com>
Message-ID: <d8d26f6890d69c12b017a1fb0b11b875@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790673068-016C6A5B-91006821/0/0
X-purgate-type: clean
X-purgate-size: 4737

On 2026-09-29 11:03, Dmytro Prokopchuk1 wrote:
> bsearch(), memchr(), memchr_inv(), strchr(), strpbrk(), strrchr() and
> strstr() all accept a const pointer/object but return a non-const 
> pointer
> to the matched element or byte, matching their standard C library
> interfaces. The const qualifier is deliberately stripped so that 
> callers
> searching a non-const object get back a mutable pointer to it. Fixing
> this would require changing the public API, so document these uses as
> deviations instead.
> 
> Update docs/misra/rules.rst to note that this class of double-use
> library functions is deviated on a per-function basis.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI pipeline: 
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2892411430
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
>  docs/misra/deviations.rst                        | 9 +++++++++
>  docs/misra/rules.rst                             | 5 ++++-
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 33d508a2fb..0b87bd1d6f 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -445,6 +445,15 @@ write or not"
>  
> -config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*__hvm_copy.*HVMCOPY_to_guest 
> doesn't modify.*$)))"}
>  -doc_end
> 
> +-doc_begin="Functions bsearch(), memchr(), memchr_inv(), strchr(), 
> strpbrk(),
> +strrchr() and strstr() accept a const pointer/object and return a 
> non-const
> +pointer to the matched element or byte, matching their standard C 
> library
> +interfaces. The const qualifier is deliberately stripped so that 
> callers
> +searching a non-const object get back a mutable pointer. This use is 
> deemed
> +safe."
> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(file(^xen/include/xen/bsearch\\.h|xen/lib/memchr\\.c|xen/lib/memchr_inv\\.c|xen/lib/strchr\\.c|xen/lib/strpbrk\\.c|xen/lib/strrchr\\.c|xen/lib/strstr\\.c$)))"}
> +-doc_end
> +

I would say that the regex can be more compact than this. (e.g. 
file(^xen/include/bsearch\\.h$||^xen/lib/(memchr|memchr_inv|strchr|strpbrk|strrchr|strstr)\\.c$) 
)

>  -doc_begin="This construct is used to check if the type is scalar, and 
> for this purpose the use of 0 as a null pointer constant is 
> deliberate."
>  -config=MC3A2.R11.9,reports+={deliberate, 
> "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
>  }
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index b048309596..e3ad3545bc 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -427,6 +427,15 @@ Deviations related to MISRA C:2012 Rules:
>         readability.
>       - Tagged as `safe` for ECLAIR.
> 
> +   * - R11.8
> +     - Functions bsearch(), memchr(), memchr_inv(), strchr(), 
> strpbrk(),
> +       strrchr() and strstr() accept a const pointer/object and return 
> a
> +       non-const pointer to the matched element or byte, matching 
> their
> +       standard C library interfaces. The const qualifier is 
> deliberately
> +       stripped so that callers searching a non-const object get back 
> a
> +       mutable pointer. This use is deemed safe.
> +     - Tagged as `safe` for ECLAIR.
> +
>     * - R11.9
>       - __ACCESS_ONCE uses an integer, which happens to be zero, as a
>         compile time check. The typecheck uses a cast. The usage of 
> zero or other
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index c9bbab6c08..644e897558 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -469,7 +469,10 @@ maintainers if you want to suggest a change.
>     * - `Rule 11.8 
> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_08.c>`_
>       - Required
>       - A cast shall not remove any const or volatile qualification 
> from the type pointed to by a pointer
> -     -
> +     - Some standard C library-style functions are inherently 
> double-use,
> +       accepting a const argument and returning a non-const pointer 
> into
> +       it so that callers searching a non-const object get back a
> +       mutable pointer. Such uses are deviated on a per-function 
> basis.
> 
>     * - `Rule 11.9 
> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_09.c>`_
>       - Required

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

