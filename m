Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1F9CA5FDD
	for <xen-devel@archiver.kernel.org>; Sat,  3 Oct 2026 20:32:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440123.1657940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xD6PB-0000k2-OJ; Sat, 03 Oct 2026 20:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440123.1657940; Sat, 03 Oct 2026 20:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xD6PB-0000jv-L4; Sat, 03 Oct 2026 20:32:25 +0000
Received: by outflank-mailman (input) for mailman id 1440123;
 Sat, 03 Oct 2026 20:32:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1xD6P9-0000jo-B1
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2026 20:32:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xD6P8-00G0g1-IJ
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2026 22:32:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6ac165d8-2eae-0a2a0a5409dd-0a2a4501d150-32
 for <xen-devel@lists.xenproject.org>; Sat, 03 Oct 2026 22:32:20 +0200
Received: from [165.173.180.50] (helo=sender6-of-o50.zoho.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6ac16652-5984-0a2a45010019-a5adb432c02c-3
 for <xen-devel@lists.xenproject.org>; Sat, 03 Oct 2026 22:32:20 +0200
Received: by smtp.zohomail.com with SMTPS id 1791059534769407.4085393419613;
 Sat, 3 Oct 2026 13:32:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1791059536; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WsPDt3BSh7Cbx0ZKgUSSaKFRs4dR01oEWCoBPyp1fgOkZsAcpQBXt7OVeaNU3v30hoF6/jW1J7ziydf8OABRFEG7auBVL0ufBoDZgtQ0SEOAAnruHp3n8w5WzLfgb/KR7rpb1WmsYi/RLLhRjw9uQUrmfmSUR/8H4MOEkstQlP8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791059536; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=QxLauvXIkEfQdv0YGMb5jRArVzzhaW9TyHftDpWOvbg=; 
	b=hr3FFakmlYSvynPbXRS/lIIpPEXUXUyDp9otSrtWlzzFGZubN3sUi4iMlE7RrVeh0BqAk4KFy7fhjh6hhCL/QDKGwlh4otxpDZQ5YkNfYH/zWcpiSnYPF473aQngdr6oJ5ys3ay83qJc9fFWb8FWpha4eXWdJ9J34CXlADjIa0U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791059536;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=QxLauvXIkEfQdv0YGMb5jRArVzzhaW9TyHftDpWOvbg=;
	b=KlBEfaWFG6+fvY3pL66i+LqEXkmMXqFggWYY7hI9bgjnhbSjajUHrXn0ysXy9k2b
	V42VVuUcnoiSAgUUGNhwQyvmCCeQTcAJk25QtQ8tQF2Axur/EfPuTUoLb3casdpfAu9
	jW8NNTBtVWKL4TZSAlfsrzUOQT5CMhZ8UtGscGYw=
Message-ID: <a600336a-c1d7-4b18-a3d3-03c42a13aad7@apertussolutions.com>
Date: Sat, 3 Oct 2026 16:32:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v1] xen/xsm: flask: restore sidtab state on policy
 load failure
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20261002092556.542986-1-Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20261002092556.542986-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-d62444/1791059540-1F86F757-C59E1D8F/0/0
X-purgate-type: clean
X-purgate-size: 2073

Hey Sergiy,

Apologies for not getting a response on the first send, been a bit 
preoccupied with preparing customer delivery.

On 10/2/26 5:26 AM, Sergiy Kibrik wrote:
> Error path of failed sidtab_map() leaves global sidtab in shutdown state and
> from that point system is unable to allocate new SIDs in sidtab_context_to_sid().
> To restore sidtab state new function sidtab_activate() is introduced, which only
> resets shutdown flag, rewinding effect of sidtab_shutdown().
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
> New function is not strictly required, this also can be achieved just by
> doing sidtab_set(&sidtab, &sidtab), but this way we would rely on its
> undocumented internal behaviour.
> ---
>   xen/xsm/flask/ss/services.c | 1 +
>   xen/xsm/flask/ss/sidtab.c   | 7 +++++++
>   xen/xsm/flask/ss/sidtab.h   | 1 +
>   3 files changed, 9 insertions(+)
> 
> diff --git a/xen/xsm/flask/ss/services.c b/xen/xsm/flask/ss/services.c
> index 35ad1034ca..f5cee1e0b0 100644
> --- a/xen/xsm/flask/ss/services.c
> +++ b/xen/xsm/flask/ss/services.c
> @@ -1427,6 +1427,7 @@ int security_load_policy(const void *data, size_t len)
>       if ( sidtab_map(&sidtab, clone_sid, &newsidtab) )
>       {
>           rc = -ENOMEM;
> +        sidtab_activate(&sidtab);
>           goto err;
>       }
>   
> diff --git a/xen/xsm/flask/ss/sidtab.c b/xen/xsm/flask/ss/sidtab.c
> index 69fc3389b3..5d1653cd02 100644
> --- a/xen/xsm/flask/ss/sidtab.c
> +++ b/xen/xsm/flask/ss/sidtab.c
> @@ -314,6 +314,13 @@ void sidtab_set(struct sidtab *dst, struct sidtab *src)
>       SIDTAB_UNLOCK(src);
>   }
>   
> +void sidtab_activate(struct sidtab *s)
> +{
> +    SIDTAB_LOCK(s);
> +    s->shutdown = 0;
> +    SIDTAB_UNLOCK(s);
> +}
> +

I think calling this sidtab_activate is a bit misleading, as activation 
is really the success path of security_load_policy. Perhaps 
sidtab_cancel_shutdown?


If you're not opposed to the rename, then on respin,

Acked-by: Daniel P. Smith <dpsmith@apertussoutions.com>


