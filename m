Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C381FC88E56
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 16:05:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1418927.1646527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5QDe-0000bv-Dt; Sat, 12 Sep 2026 16:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1418927.1646527; Sat, 12 Sep 2026 16:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5QDe-0000bo-Ao; Sat, 12 Sep 2026 16:04:46 +0000
Received: by outflank-mailman (input) for mailman id 1418927;
 Sat, 12 Sep 2026 16:04:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x5QDd-0000bi-9l
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 16:04:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5QDc-00GbKq-N9
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 18:04:44 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa57816-8faa-0a2a0a5109dd-0a2a45018db2-6
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 18:04:44 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa5781c-5984-0a2a45010019-a237832fa8fa-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 18:04:44 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D5A264EE0097;
 Sat, 12 Sep 2026 18:04:43 +0200 (CEST)
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
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1789229084;
	b=vqX4ekhseKRR1gUd9RPLYpOH3LwX5gQzzdFkL34pkJtaczQCdDPsUKgEVMUUNY+YreNc
	 R9Y0O9vOcsyhro25u+8dl4dq/DqYHt3y6+qRLN7hl6CJqWujFYVMb7SeEDo7ZrIXK3JZ2
	 zPxmMcJMOftJezLNzVLPP08FJaMt0umvZgsWvaycNcMMa4Enyg5AMHG3txhsI2W1OyEFK
	 bW+nXHWn91cWjs36PGUg5W+K03trRUAM6b4PUgWRyA2TRPs64mfhdHFaj5X2fYzQrqkhM
	 RJO3OupKyhB/vFVc6ajtAyimomG+9Th9Vb7piDyT1ClzA4gRxfT6Z1ZG+BtUkydvcJs4q
	 p9MezPflcoLA1UU4DXYpkHGmaJ/SIf21lULFCtCz5FTXkApoxdYDzUsyEWYutlcHBf2W+
	 Wo6Il3e6QCiidnSfZr4ewUMpWK0JJ3SQ326O0NuUJzPmjWXMlHVZqSr0bcw5hUftDQH9i
	 UGhmeW6Jr2/O3i7S9tTNC6qwu5MU7OBQc+fWBA8VF05ZxME8gBqXWnMrq+mukXabO/Okn
	 E+T4bGL8CwHINLJmqh9d7NwfElZelMfSKhLKyIwpSL/ntGtNPeAfhkxxVyhqAvTt3etjK
	 MmWNfG2cNC0Dktw8sbBvHVvN+Tf6EAbJ28jUAmaVC40ZQ1uxZrfmP0FdbmmSgb4=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789229084;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=cSv9l7Vk40fvDBSyCpP8B5XBYa3nkzrOqrr558Ucmlk=;
	b=01fa0IFXT9AmqOdCGXfyhBD4Y7WKlOejaOba4HO6EutZeETGIe7cTc4UQS+o5MOniECk
	 +GMdvg/Z7k77IsjuYrbFhC+0W9usWP0sVmGz20XAcpH9NPLk3IcvlzNeOZuPzwFXOjG3E
	 VidIbnI04ppaZqu676UO/hetqK9HS+wy/nx5vqqGpBHov5SENbkBWBEwobhM3WR7xOTkr
	 3O7vGcvL0qjbe0PR8GxYrRIxA5V15h9Nq2iZxgNlhT49RXXlQgPDJ2sRnfgqLuHaBaynv
	 CzSVifN9wcLM6SZEqSbe/Ljnct0TXFi2WO/q81O0DdtwOBBDC7MZx48V7KUdiIZsPdw1O
	 tpg7mHbPL1MEZxn1jsFwpVs+/yThCmDwpVAAK+4WW0tvKv7fRVMmsh4gp5FCtn0TkjUir
	 1WMyh3+5S4WJlmL+IqIhRkq3gsfZbLvfT5kb6s5bYPadsA2S+GpIh0sP6jGz5M6FZJmAh
	 gjCROkOUVLYPcw1AwnV4UqmqgBqpDzBOiJjc9LjMlX7GdKcGjjRnMxAQY37fE1dX4s8BQ
	 PGhEq0g4fajCK1rxRERSZXoKIlN+SdxSzKni5Lt0zx88r98A5yGN8cUel90QCLHsTmQdT
	 pNu/KWQ+Ea3Y5zOXgjzBVugyysl2Vq1mosVyhwVj11vH0kcB+pmK0yvspvg0554=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 18:04:43 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH 3/4] Eclair: relax "noreturn" function-pointer conversion
 deviation
In-Reply-To: <4cca58b6-b555-4064-aa26-5204dc4b99cc@suse.com>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
 <4cca58b6-b555-4064-aa26-5204dc4b99cc@suse.com>
Message-ID: <3d473b8a85331856ea2b95f9448f2d6c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1789229084-C5341757-4EDCF6CF/0/0
X-purgate-type: clean
X-purgate-size: 3219

On 2026-09-03 13:44, Jan Beulich wrote:
> Like misra/rules.rst says, function arguments other than "void *" are 
> okay
> as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I can't explain why this covers the violation in mce.c:mce_callbacks'es
> initializer, but not the one in mce.c:default_handler's.
> 

Possibly differing attributes (e.g. cf_check vs section attributes)? 
Just a guess that would need to be tested, though.

> As a result of 6852334f8416 ("Arm/GIC: add noreturn in a few more
> places"), vgic_v2_lpi_to_pending() and vgic_v2_lpi_get_priority() (both
> returning non-void) would also need covering. (As said in a remark 
> there,
> non-void together with noreturn is somewhat odd.)
> 

Indeed

> Really before and after this change there's no checking that parameter 
> and
> return types actually match. I have no clue how one would express such
> checks.

The presence of a bitcast indicates that the two types do not match 
exactly. Typically function attributes are not relevant towards 
determining a type difference, but different compilers may model 
non-standard features differently (rightly so), in such a way that some 
make a difference in the AST, and others do not.

To check for compatibility of function pointers I would try activating 
service STD.funptrcv, which essentially mirrors 
-Wincompatible-pointer-types:

caution for rule STD.funptrcv: (rule) A pointer is used to call a 
function whose type is not compatible with the pointed-to type. 
(untagged)
p.c:8.8-8.8: Loc #1 [culprit: implicit cast converts from `void(*)(int)' 
to `__typeof__(@EXPR@)*' (that is `void(*)(void)')]
   qq = m;
        ^
p.c: In function ‘h’:
p.c:8:6: error: assignment to ‘void (*)(void)’ from incompatible pointer 
type ‘void (*)(int)’ [-Wincompatible-pointer-types]
     8 |   qq = m;
       |      ^
p.c:3:6: note: ‘m’ declared here
     3 | void m(int x);
       |      ^


> 
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -391,11 +391,11 @@ constant expressions are required.\""
>  }
>  -doc_end
> 
> --doc_begin="The conversion from 'void noreturn (*)(void *)' to 'void 
> (*)(void *)' is safe
> +-doc_begin="The conversion from 'void noreturn (*)(...)' to 'void 
> (*)(...)' is safe
>  because the semantics of the 'noreturn' attribute do not alter the 
> calling convention or behavior of the resulting code."
>  -config=MC3A2.R11.1,casts+={safe,
> -  
> "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1, 
> pointer(builtin(void)))))))&&from(expr(skip(!syntactic(),
> -   ref(property(noreturn)))))"}
> +  
> "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))))))&&from(expr(skip(!syntactic(),ref(property(noreturn)))))"
> +}
>  -doc_end
> 
>  -doc_begin="The conversion from a pointer to an incomplete type to 
> unsigned long does not lose any information, provided that the target 
> type has enough bits to store it."

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

