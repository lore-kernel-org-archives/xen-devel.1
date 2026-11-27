Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15B8606A321
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=ijYNnnI9
Received: from list by lists.xenproject.org with outflank-mailman.1505308.1700138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWyL7-0001OY-Kq; Fri, 27 Nov 2026 15:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505308.1700138; Fri, 27 Nov 2026 15:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWyL7-0001OR-Hf; Fri, 27 Nov 2026 15:58:21 +0000
Received: by outflank-mailman (input) for mailman id 1505308;
 Fri, 27 Nov 2026 15:58:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21dba93590004767@swg.vates.tech>)
 id 1xWyL6-0001O2-5l
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 15:58:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWyL5-001zKu-IL
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 16:58:19 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21dba93590004767@swg.vates.tech>)
 id 6b09a899-8faa-0a2a0a5109dd-0a2a45099bb8-2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 16:58:19 +0100
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21dba93590004767@swg.vates.tech>)
 id 6b09a89b-be1a-0a2a45090019-b9ff1c22a9f3-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 16:58:19 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21dba93590004767.009 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 15:58:16 +0000
Received: from localhost.localdomain (82-67-99-167.subs.proxad.net
 [82.67.99.167]) (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5CAEB81B86;
 Fri, 27 Nov 2026 16:58:15 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=3x4aswkj2nLisbk2vsfkZa7hiGixh0Lxp5zxnEj91xY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ijYNnnI9qwri/F8mbcA9hkFhoj/GHefeJ7U0BJD/f8KEoB8P6BhueyYC+CV1ijFpyurLJpuIf
 UHhWFhkPz6JvJ5EmbWPTWiQUOEZozR42Ii9rKje3z0r/3loqpJLOv9uo22QwXP9pySIhgEZYHzR
 VahfuysmOqHsfqEKK/qOGzV4s42dpSzHYOrehjqYEHtxNtyZmRgN+34uuwfpO4GXNHTGJDvjGB4
 oaBvaSNjVpJchSikBgRsiJgY0uaIynFnFLY9jM0rEcTJKhL6YFjSyPlviUuXNNY8m/MPAEddK3K
 34D7oacsSPYMhufhUObnmymZ9WmGuPyt2IcgXsoUHE1Q==
X-Zone-Loop: 9ba1b8b05e7d2e1d62d6606a32065e7e4b3bacbe4240
x-campaign-type: default
x-transaction-id: 129818e8-0e72-4cc7-9157-e5044488dea7
x-swg-uid: 01-16ed00ac-3483-4622-8663-699ea8f65f9f
X-Mailer: Sweego
Message-ID:
 <1795795096.8631fc262581453bbf619ec5b2062170.1a21dba93590004767@vates.tech>
x-swg-bid: 1795795096.8631fc262581453bbf619ec5b2062170.1a21dba93590004767
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v16 5/6] tools/xl/libxl: wire up SCMI SMC multi-agent
 configuration
From: Anthony PERARD <anthony.perard@vates.tech>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: xen-devel@lists.xenproject.org, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <4fedbb5bffdfe96365e530c985e89cd50b61fb5d.1794839953.git.oleksii_moisieiev@epam.com>
References: <cover.1794839953.git.oleksii_moisieiev@epam.com>
 <4fedbb5bffdfe96365e530c985e89cd50b61fb5d.1794839953.git.oleksii_moisieiev@epam.com>
Date: Fri, 27 Nov 2026 16:58:09 +0100
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.216.224aa0079ead63d4.1a21dba9084.9b5479b2ccf0cc33=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795795095685
X-purgate-ID: tlsNG-bad1c0/1795795099-BE8D9034-06620C1E/0/0
X-purgate-type: clean
X-purgate-size: 1613
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.216.224aa0079ead63d4.1a21dba9084.9b5479b2ccf0cc33=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Oleksii,

> Series-changes 12:
> - reject agent_id in xl=2Ecfg when the ARM_SCI type is not
>   scmi_smc_multiagent, instead of parsing it and discarding it
> - perform the check after the option loop, as type and agent_id may be
>   given in either order

The patch changelog could be removed from the commit message (and moved
after the --- on repost)=2E

> diff --git a/tools/xl/xl_parse=2Ec b/tools/xl/xl_parse=2Ec
> index 0ccece3e8a18=2E=2E97a35ef16987 100644
> --- a/tools/xl/xl_parse=2Ec
> +++ b/tools/xl/xl_parse=2Ec
> @@ -1308,9 +1309,35 @@ static int parse_arm_sci_config(XLU_Config *cfg, =
libxl_arm_sci *arm_sci,
>              }
>          }
> =20
> +        if (MATCH_OPTION("agent_id", ptr, oparg)) {
> +            unsigned long val =3D parse_ulong(oparg);
> +
> +            if ( val >=3D UINT8_MAX ) {

Nit, coding style: We don't have space within the parenthesis in
conditions=2E


Patch looks fine to me as is:

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Something to not forget on commit (or even respin) is to regen the go
binding, due to the IDL change=2E (`make -C tools/golang/xenlight
types=2Egen=2Ego helpers=2Egen=2Ego` if you don't have go installed should=
 do
the trick)

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.216.224aa0079ead63d4.1a21dba9084.9b5479b2ccf0cc33=---

