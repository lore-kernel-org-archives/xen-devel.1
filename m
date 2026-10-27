Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E89606A322
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 07:29:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1461870.1672876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbcP-0002M2-E2; Tue, 27 Oct 2026 07:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461870.1672876; Tue, 27 Oct 2026 07:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbcP-0002Lv-BR; Tue, 27 Oct 2026 07:29:13 +0000
Received: by outflank-mailman (input) for mailman id 1461870;
 Tue, 27 Oct 2026 07:29:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1xLbcO-0002Lp-8v
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 07:29:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLbcN-005VVl-MB
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 08:29:11 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ae052ae-8faa-0a2a0a5109dd-0a2a450c8304-46
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:29:11 +0100
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6ae052c7-f479-0a2a450c0019-a237832fe184-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:29:11 +0100
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 49EB94EE022E;
 Tue, 27 Oct 2026 08:29:11 +0100 (CET)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1793086151;
	b=CaYBndRMeLUfa1FbjkCb3WF6y1GMPB4SM5NqR9hl3XlGph1HD7fL06BrJMYiZsFRbmdr
	 ZVgwRJxG9BCpLZNERxopJdigqHnIMZA2sMOHLubwW2ysOKsMluWGiI2pgzbUZmrPfIIG2
	 ADmUbg8cwfzu5htjXlBUB8j4sdFG4Qe/blPXxMKXXe1fZ3G2tMCs46962MEU819OFYL1p
	 q5miXR5bN0aXxzizTvjmULksDcqGtc+KiCs7P+9sZncJX9phNce698+aKEqduP+SShC4q
	 +STwW/OcYtxA0VEN1mGbh7IMDHWgb+aJv6wAvRlNbTLOYcclXqwOhzZyDRCCNdpMUpA+/
	 DcvNkkwvTqf8VJtz18GF0cOj2ix3rJtCF88ISpyFFp3FfPzw7+FjXiiM3Az84SqGfyI/n
	 Iq+u24lyZ6UfPrl+EigKdl8OaL1VycdrPKtGD8Rrer5bqKrWfiquYvTCRGqPDLVmRoDTV
	 VnBAdSCiQJYcmA7ty2dHqFPAEBgmmFE8n2UfqOnPvYw1C5VF8rw75MCxHcBts2T/sw6WE
	 EDmzzhzk0VgxQ0pz/UCvagGUaih4/zHQOUpBRNTFUTy9ClDYnyTwRFzsgg+e3Pq1h+gFD
	 wrMWqm192zFIMRyKpolZSESShAHFdJ9DCaoVsBvVALWioUUlcF+60hopm50bHvE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793086151;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=JD64DCt70R+8twG03cuSbjIAx9xyVL3Bb+Ti/daCYPE=;
	b=0um4HkNhIcplWVRaj20+CtHD+8eTYF+zV8qf+SnyXPo+fGKCmh6hz3kchYOgfbj5dur5
	 JO89QE/tf5lxDwUvSHddrgp5lyZyrgZElsyaHCkOfgoC+8IxlyTzZvDz5oT0PVtitpfwI
	 3mXSpDSRZSvxX4WzIZBnNCXiLuySA7mUCfYZBn4mzqKF4L5NV05YTAYijkCN9jCerf690
	 NUjQntwR9FAWKaJveizNwqDUNsvLdKgvn3ECdmkvoXHj4WRMzTLzyjeW+aIRvuinGUdwE
	 aVkRjzoG/irCMpY16KcZA2kwWtU7sFWTzFgqlkmYN1lHn7Y8fhOtw0a0AWLfVylM6dIXW
	 l+r/+Q68vHsdRxpmQGMMNujjYUfG3JqZMCnPkVtF77OF956D2v/QTTvkSSikHPRt6uuX1
	 31PGxP9di6lsng7xpZm6nKeLUCdOCJcZ02ZTFz6MdXzVmpvKwEqr9EnGhHY5kfet7Zkt8
	 fSu9cTWaO/OyHWmJsTl6QYNIz6MSYVZZRo4sima+GiJ0N7iekJZMtvo42fANwVbfQBtNy
	 dlZyXUd5k/ibPp7WHoMvsmO5D1L2i+eehbCaEkqwAvQ5zPlJAWZmTQifMsyOGX8eJMb0i
	 VCOlDv5jzrx9jT3KtT4gfe7RwRP8GEJbLDcxmdoEgRvZKuowXWFCoKXStdILQoo=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 08:29:11 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v2] misra: deviate C library-style functions from Misra
 C:2012 rule 11.8
In-Reply-To: <cab890c77bfbb016e79f847d6dfddac993079f40.1792406297.git.dmytro_prokopchuk1@epam.com>
References: <cab890c77bfbb016e79f847d6dfddac993079f40.1792406297.git.dmytro_prokopchuk1@epam.com>
Message-ID: <9cef9d25d9c1dc136db0e356db4e98c3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1793086151-776D6A5B-B0FD8E9D/0/0
X-purgate-type: clean
X-purgate-size: 4844
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-19 12:41, Dmytro Prokopchuk1 wrote:
> bsearch(), memchr(), strchr(), strpbrk(), strrchr() and strstr() all
> accept a const pointer/object but return a non-const pointer to the
> matched element or byte, matching their standard C library interfaces.
> The casts in these implementations strip const so that callers 
> searching
> a non-const object get back a mutable pointer. Fixing this would 
> require
> changing the public API, so document these uses as deviations instead.
> 
> Update docs/misra/rules.rst to note that this class of double-use
> library functions is deviated on a per-function basis.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com> # 
automation/eclair_analysis/.*

> ---
> Changes in v2:
> - dropped memchr_inv() from the deviation (not a standard function)
> - anchored the file patterns and grouped the xen/lib files, as
>   suggested by Nicola
> - narrowed the justification to the casts in the function bodies
> 
> Link to v1:
> https://patchew.org/Xen/4abcb11ef287170ced74935cbee60c90058c1307.1790671787.git.dmytro._5Fprokopchuk1@epam.com/
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
>  docs/misra/deviations.rst                        | 9 +++++++++
>  docs/misra/rules.rst                             | 6 +++++-
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 6cdb10a129..ed8bad0cb0 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -450,6 +450,14 @@ write or not"
>  
> -config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(file(hvm_guestcopy)&&text(^.*__hvm_copy.*HVMCOPY_to_guest 
> doesn't modify.*$)))"}
>  -doc_end
> 
> +-doc_begin="Functions bsearch(), memchr(), strchr(), strpbrk(), 
> strrchr() and
> +strstr() accept a const pointer/object and return a non-const pointer 
> to the
> +matched element or byte, matching their standard C library interfaces. 
> The
> +casts in these implementations strip const so that a search of a 
> non-const
> +object yields a mutable pointer. This use is deemed safe."
> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(file(^xen/include/xen/bsearch\\.h$||^xen/lib/(memchr|strchr|strpbrk|strrchr|strstr)\\.c$)))"}
> +-doc_end
> +
>  -doc_begin="This construct is used to check if the type is scalar, and 
> for this purpose the use of 0 as a null pointer constant is 
> deliberate."
>  -config=MC3A2.R11.9,reports+={deliberate, 
> "any_area(any_loc(any_exp(macro(^__ACCESS_ONCE$))))"
>  }
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 6bcc2adf95..68de2d8dd1 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -436,6 +436,15 @@ Deviations related to MISRA C:2012 Rules:
>         readability.
>       - Tagged as `safe` for ECLAIR.
> 
> +   * - R11.8
> +     - Functions bsearch(), memchr(), strchr(), strpbrk(), strrchr() 
> and
> +       strstr() accept a const pointer/object and return a non-const 
> pointer
> +       to the matched element or byte, matching their standard C 
> library
> +       interfaces. The casts in these implementations strip const so 
> that a
> +       search of a non-const object yields a mutable pointer. This use 
> is
> +       deemed safe.
> +     - Tagged as `safe` for ECLAIR.
> +
>     * - R11.9
>       - __ACCESS_ONCE uses an integer, which happens to be zero, as a
>         compile time check. The typecheck uses a cast. The usage of 
> zero or other
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index a59cf1782e..00378c474e 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -473,7 +473,11 @@ maintainers if you want to suggest a change.
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
> +       mutable pointer. The casts that implement this are deviated per
> +       function.
> 
>     * - `Rule 11.9 
> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_11_09.c>`_
>       - Required

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

