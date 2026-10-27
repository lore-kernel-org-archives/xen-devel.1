Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2C606A31B
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=I12N7Fs5
Received: from list by lists.xenproject.org with outflank-mailman.1461920.1672930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLcK5-0004H0-9c; Tue, 27 Oct 2026 08:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461920.1672930; Tue, 27 Oct 2026 08:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLcK5-0004Gt-6r; Tue, 27 Oct 2026 08:14:21 +0000
Received: by outflank-mailman (input) for mailman id 1461920;
 Tue, 27 Oct 2026 08:14:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17c6c9c7f000f79f@swg.vates.tech>)
 id 1xLcK3-0004Gn-H5
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 08:14:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLcK2-003Alg-D0
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 09:14:18 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17c6c9c7f000f79f@swg.vates.tech>)
 id 6ae05d53-bab6-0a2a0a5309dd-0a2a450ab8ec-12
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 09:14:17 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a17c6c9c7f000f79f@swg.vates.tech>)
 id 6ae05d59-f2d2-0a2a450a0019-b9ff1c2389a9-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 09:14:17 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a17c6c9c7f000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 27 Oct 2026 08:14:15 +0000
Received: from [192.168.1.97] (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5F665829D8;
 Tue, 27 Oct 2026 09:14:14 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=mP1E4f/D/4/Sg6JJ6IW5yxH/NtEy4J0g69BwIujVRoM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=I12N7Fs5HAwmWeLcUN90mf++k3QjHxUVD12XVzQnRUsTZBByw52xyKTd/XjRII7Xm9Uh1S7zY
 YutBIUx0rqYVgKHI5YJRhutVFOYznW6siaoJSSqiihMQ7kXV7y7hpAWCMDV6zvpyNL0UNXTlcXH
 OOlWUTkiatB2OZceV68v9F4jiNDtWzgqRIzVGOVGkiJ1+luG1hOEfmnmhZCNF4yvtYd9LDGAUKB
 RNP9g8VHiwxV5n50SkPJSVCpcVH77ZdSaxgN7oNKd2uFLXecePgPIjw912EQrekHo2oZ7s8satl
 /MB2+p6yGUfR7gnsufdFSwRExwVen8o8eVuDwFDrdaRg==
X-Zone-Loop: 18d3fa0d6c09877fa4b2405245f58df04b8f3328bdb1
x-campaign-type: default
x-transaction-id: 681e509e-e1a3-4f59-9a3a-255811de0d37
x-swg-uid: 01-5373029a-9905-403a-b339-dd407479fd19
X-Mailer: Sweego
Message-ID:
 <1793088855.8631fc262581453bbf619ec5b2062170.1a17c6c9c7f000f79f@vates.tech>
x-swg-bid: 1793088855.8631fc262581453bbf619ec5b2062170.1a17c6c9c7f000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Tue, 27 Oct 2026 09:14:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml: Gitlab CI test for bindings
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
References: <20261026162039.1188760-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Julian Vetter <julian.vetter@vates.tech>
In-Reply-To: <20261026162039.1188760-1-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.21e.76e20aae512521d0.1a17c6c99f1.ebcbb46c7156d688=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793088854513
X-purgate-ID: tlsNG-4011c0/1793088857-5A5DBCFC-FF5BEFF7/0/0
X-purgate-type: clean
X-purgate-size: 826
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.21e.76e20aae512521d0.1a17c6c99f1.ebcbb46c7156d688=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> +  printf "Xen version: %d=2E%d%s\n" ver=2Emajor ver=2Eminor ver=2Eextra
> +
> +
> +let () =3D
> +  printf "Test Ocaml Bindings\n%!";
> +
> +  test_xenversion ();
> +
> +  printf "Starting GC=2Ecompact()\n%!";
> +  Gc=2Ecompact ();
> +  printf "GC done\n";
> +
> +  ()
>=20
> base-commit: 46678752be2d97f61317d793408a59927a429847

Thank you Andrew, I will add the other test next to this one=2E

Acked-by: Julian Vetter <julian=2Evetter@vates=2Etech>


-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.21e.76e20aae512521d0.1a17c6c99f1.ebcbb46c7156d688=---

