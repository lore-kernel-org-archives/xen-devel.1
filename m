Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79865C55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 13:48:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384780.1627565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrySI-00070E-NT; Thu, 06 Aug 2026 13:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384780.1627565; Thu, 06 Aug 2026 13:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrySI-000707-Km; Thu, 06 Aug 2026 13:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1384780;
 Thu, 06 Aug 2026 13:48:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd754d83e000e099@swg.vates.tech>)
 id 1wrySG-0006ym-Va
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 13:48:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrySG-00875C-8C
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 15:48:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd754d83e000e099@swg.vates.tech>)
 id 6a74907d-2eae-0a2a0a5409dd-0a2a4503e2e8-48
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:48:16 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd754d83e000e099@swg.vates.tech>)
 id 6a74909f-fae8-0a2a45030019-b9ff1c238131-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:48:15 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fd754d83e000e099.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 06 Aug 2026 13:48:09 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0609782116;
 Thu,  6 Aug 2026 15:48:09 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=WHDYfvmtJwvA3xxIRm+9ijAb7jiUxc5x/W+7GWYTxbk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=FrPItnuDc6hnKwl+QsTrEyWkX4l7VoK76o9SOivGkvYO2Re9ClUFGZSOmFFBmG8TwKK3sPnp/
 sReawACDZ5R330BFwOqwkcnANk7G8NAyimNdhFmaT0jwjfsC8QjPCBC9SddENaoXh0bRkHQBTPj
 CCk/i9jHhNi68QMpFHBMi/uF3u7zCqUQigVMwZQbmKgQSjmv6Tw0DuFIQPXbY1CZlEbqGRtcBGx
 m/PgS4GP1F1XI3FEabI2ca0lAuaTRx8KnnTpscS0I8D8OAWu2ygc92jCDinGUVxp96wfw35tQVl
 1l1jK+hKf7qafEQZZn5bJ6LhvkO5I1R3cyhH8oiPNH4g==
X-Zone-Loop: 34273c20037e853124b395c6f5f59e81331e7e35d82e
x-campaign-type: default
x-transaction-id: 3d320ad8-8c15-4596-afe2-33d0285e86f5
x-swg-uid: 01-ac6c1f46-bacf-4631-a6ac-d8f06165d54e
X-Mailer: Sweego
Message-ID:
 <1786024089.8631fc262581453bbf619ec5b2062170.19fd754d83e000e099@vates.tech>
x-swg-bid: 1786024089.8631fc262581453bbf619ec5b2062170.19fd754d83e000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 6 Aug 2026 15:48:08 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/3] build: add compile_commands.json target
References: <20260805015247.41943-1-gwd@xenproject.org>
 <20260805015247.41943-4-gwd@xenproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260805015247.41943-4-gwd@xenproject.org>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1ddb.a4f82da285c3bf95.19fd754d655.e0a61ca139faa02a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786024089174
X-purgate-ID: tlsNG-33051d/1786024096-6F2C84E9-58D5D385/0/0
X-purgate-type: clean
X-purgate-size: 2439

---=Part.1ddb.a4f82da285c3bf95.19fd754d655.e0a61ca139faa02a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2026 at 11:52:40AM +1000, George Dunlap wrote:
> Add a phony convenience target generating the compilation database

"phony convenience target", that a funny way to put it :-) the target
isn't phony, it just use the Make keyword "phony" to have it ignore the
existing target=2E

> from a built object tree, alongside the other developer conveniences
> (tags, cscope, cloc -- the last of which already walks the same =2Ecmd
> files):
>=20
>     make -C xen compile_commands=2Ejson
>=20
> The output lands in the object tree root, where clangd and other
> consumers discover it automatically when opening files from an
> in-tree build=2E

What about out-of-tree build? :-) that first part of the sentence
almost seems to acknowledge their existence=2E Anyway, one can create a
symlink=2E

> Note the database records the compiler invocations actually used=2E
> With a clang build it is consumable by clangd as-is; for a gcc build,
> clang-based tools may need a small =2Eclangd configuration
> (CompileFlags: Remove/Add) dropping gcc-only flags=2E
>=20
> Also add the generated file to =2Egitignore=2E
>=20
> Assisted-by: LLM
> Signed-off-by: George Dunlap <gwd@xenproject=2Eorg>
> ---
>  =2Egitignore   | 1 +
>  xen/Makefile | 4 ++++
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/=2Egitignore b/=2Egitignore
> index bfc7bdf043=2E=2E0aa9b801de 100644
> --- a/=2Egitignore
> +++ b/=2Egitignore
> @@ -192,6 +192,7 @@ xen/arch/*/include/generated
>  xen/build-dir-cppcheck/
>  xen/common/config_data=2ES
>  xen/common/config=2Egz
> +xen/compile_commands=2Ejson
>  xen/cppcheck-htmlreport/
>  xen/cppcheck-report/
>  xen/cppcheck-misra=2E*
> diff --git a/xen/Makefile b/xen/Makefile
> index d39bdfdd53=2E=2Ef87240f33c 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -685,6 +685,10 @@ cloc:
>  	    done; \
>  	done | cloc --list-file=3D-
> =20
> +=2EPHONY: compile_commands=2Ejson
> +compile_commands=2Ejson:

Could you use FORCE instead =2EPHONY? That is just:

    +compile_commands=2Ejson: FORCE

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1ddb.a4f82da285c3bf95.19fd754d655.e0a61ca139faa02a=---

