Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF18606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=g4fX+NPY
Received: from list by lists.xenproject.org with outflank-mailman.1500676.1696722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVmMY-0005k3-Kz; Tue, 24 Nov 2026 08:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500676.1696722; Tue, 24 Nov 2026 08:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVmMY-0005jw-IT; Tue, 24 Nov 2026 08:58:54 +0000
Received: by outflank-mailman (input) for mailman id 1500676;
 Tue, 24 Nov 2026 08:58:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20cc76fda0001cf5@swg.vates.tech>)
 id 1xVmMW-0005jq-2w
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 08:58:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVmMV-002f1W-3k
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 09:58:51 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20cc76fda0001cf5@swg.vates.tech>)
 id 6b05518d-8faa-0a2a0a5109dd-0a2a45018bb0-46
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 09:58:50 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20cc76fda0001cf5@swg.vates.tech>)
 id 6b0551ca-5bcc-0a2a45010019-b9ff1c22a669-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 09:58:50 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20cc76fda0001cf5.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 08:58:46 +0000
Received: from [192.168.0.158]
 (cpc92322-cmbg19-2-0-cust1759.5-4.cable.virginm.net [86.26.38.224])
 (Authenticated sender: andriy.sultanov)
 by mail2.vates.fr (Postfix) with ESMTPSA id BDF5F82B62;
 Tue, 24 Nov 2026 09:58:45 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=0z8BABAU35w2jBam4HLQQ50+LdcO3gfe46jCrmE8np0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=g4fX+NPYoamVt4a4r+cwWYAEJjf6GmUuL4zr/qh1N+Qh/3u1g4Qwdlo6Ydz/o+7UseJ0kRi6A
 49VYmGqSwTjy7GqLAqaywLUSxZlZwsPlNV2ptcVi2DW7E3v/3v7lLsdjcpdjLj7bKpvRmGZ7uzg
 3bA5ACP6kDe+++2O6NeKSax8zdCfc89crHT1Ez6r4AnhKVU+56O5CRQ/J0U37WAbCh7US2Jtfmt
 h6X6aTt5NdA11d6HjG7JphWOCNQQiTwQ5aqtSw3GAGKpPblLEjFMXhUj2mUKsspAG6iD4PzyaHp
 fiNf/t+zHUzIVZ6InQoplMU2SCV0sAoxLBbUHp1temcg==
X-Zone-Loop: bd6ba1e5a74ea86c7ad7ef816526300fe5a7a017a798
x-campaign-type: default
x-transaction-id: 4023c363-3f1c-4a07-bb56-ed0341eccddd
x-swg-uid: 01-551de3c1-5d78-4199-b52f-f563f09ea857
X-Mailer: Sweego
Message-ID:
 <1795510726.8631fc262581453bbf619ec5b2062170.1a20cc76fda0001cf5@vates.tech>
x-swg-bid: 1795510726.8631fc262581453bbf619ec5b2062170.1a20cc76fda0001cf5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Tue, 24 Nov 2026 08:58:45 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml: Fix OoB read in stub_syslog()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Olivier Lambert <olivier.lambert@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
References: <20261116222559.3824604-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Andrii Sultanov <andriy.sultanov@vates.tech>
In-Reply-To: <20261116222559.3824604-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795510725972
X-purgate-ID: tlsNG-d62444/1795510730-4D55D5FD-C7AAD7FA/0/0
X-purgate-type: clean
X-purgate-size: 1794
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/26 22:26, Andrew Cooper wrote:

> __syslog_facility_table[] maps Ocaml LOG_* facilities indices to local system
> indices.  The final line is intended to initialise 6 entries in the table, but
> only initalises one with the logical OR of 6 facilities, making the table 5
> entries too short.
>
> This is probably a copy&paste error from Ocaml, where | is right operator to
> use for a list of this nature.
>
> Fixes: ea8ddf27e5c8 ("ocaml: add logging bindings.")
> Assisted-by: LLM
> Reported-by: Olivier Lambert <olivier.lambert@vates.tech>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Andrii Sultanov <andriy.sultanov@vates.tech>
> CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
>
> This is only an issue if you modify oxenstored.conf to use one of these
> facilities.
> ---
>   tools/ocaml/xenstored/syslog_stubs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/ocaml/xenstored/syslog_stubs.c b/tools/ocaml/xenstored/syslog_stubs.c
> index 760e78ff73dc..16c7202d39ba 100644
> --- a/tools/ocaml/xenstored/syslog_stubs.c
> +++ b/tools/ocaml/xenstored/syslog_stubs.c
> @@ -30,7 +30,7 @@ static int __syslog_facility_table[] = {
>   	LOG_AUTH, LOG_AUTHPRIV, LOG_CRON, LOG_DAEMON, LOG_FTP, LOG_KERN,
>   	LOG_LOCAL0, LOG_LOCAL1, LOG_LOCAL2, LOG_LOCAL3,
>   	LOG_LOCAL4, LOG_LOCAL5, LOG_LOCAL6, LOG_LOCAL7,
> -	LOG_LPR | LOG_MAIL | LOG_NEWS | LOG_SYSLOG | LOG_USER | LOG_UUCP
> +	LOG_LPR, LOG_MAIL, LOG_NEWS, LOG_SYSLOG, LOG_USER, LOG_UUCP,
>   };
>   
>   value stub_syslog(value facility, value level, value msg)
>
> base-commit: 97bf370375113caf92fccf04e2877fc6b5ff887f
Acked-by: Andrii Sultanov <andriy.sultanov@vates.tech>


