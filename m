Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4076C606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 09:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=bHjwejG0
Received: from list by lists.xenproject.org with outflank-mailman.1467836.1676871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNo91-0001n6-FM; Mon, 02 Nov 2026 09:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467836.1676871; Mon, 02 Nov 2026 09:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNo91-0001mz-Cm; Mon, 02 Nov 2026 09:15:59 +0000
Received: by outflank-mailman (input) for mailman id 1467836;
 Mon, 02 Nov 2026 09:15:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a19b8b3134000403d@swg.vates.tech>)
 id 1xNo8z-0001mt-VH
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 09:15:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNo8z-00A6N4-Bz
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 10:15:57 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a19b8b3134000403d@swg.vates.tech>)
 id 6ae854c3-e002-0a2a0a5209dd-0a2a450c9fee-48
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 10:15:57 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a19b8b3134000403d@swg.vates.tech>)
 id 6ae854cc-f479-0a2a450c0019-b9ff1c23b10f-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 10:15:56 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a19b8b3134000403d.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Nov 2026 09:15:53 +0000
Received: from [192.168.0.226] (88-164-48-32.subs.proxad.net [88.164.48.32])
 (Authenticated sender: thomas.odin@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4AB53822A7;
 Mon,  2 Nov 2026 10:15:52 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=kpsPzvCBIXNCh9I86H30ehoGqnlc3omI3C8g5nhmtT4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=bHjwejG0/4kjKSUolyf5oOeJ1HSx31t6e/9joObjsb58RkwrsIrvHSO9PH2N5EFk3I4qu58Gx
 VVSISp3A+3XuP9IF3ouDc/Iuucw2CV/E5S/inh6FG4ki+oDG+zsw6NlOcI0VsZFFh4n0L7JCzKn
 UEGyownltaEJgb7Orp4cSp1dBFjF+4fNJn13g7y8n0m+/aftfc3ZO/68KBknNXQQh0fHRG6L2MK
 eXT5VCwTG2EM/rvzhROVGmlmiPO1/mKb6GXH5CETNtqQ/bpDV8ZzwLm9Xekg3qqYxrAhiP39fKb
 0ZED3LNMzMQrxDAALDwFqQOYZLG1IMz1UJ6hOy3mhoEg==
X-Zone-Loop: ef32f3546e448a2196eaab16ee4e0bea43e8a46a9956
x-campaign-type: default
x-transaction-id: 6273445d-8a16-4a64-aac0-fe3ba4a6200d
x-swg-uid: 01-077e74c8-6b3e-4dfe-816c-c3ae2530f359
X-Mailer: Sweego
Message-ID:
 <1793610953.8631fc262581453bbf619ec5b2062170.1a19b8b3134000403d@vates.tech>
x-swg-bid: 1793610953.8631fc262581453bbf619ec5b2062170.1a19b8b3134000403d
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Mon, 2 Nov 2026 10:15:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] x86/alternatives: Adjust all insn-relative fields
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <20261015210530.786604-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: ODIN Thomas <thomas.odin@vates.tech>
In-Reply-To: <20261015210530.786604-1-andrew.cooper3@citrix.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.358.c2fb0315e6f61851.1a19b8b2ee3.4fc358d9a3527dff=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793610952420
X-purgate-ID: tlsNG-d25034/1793610957-50B3DA5B-5E53F693/0/0
X-purgate-type: clean
X-purgate-size: 3023
X-Spam-Status: No, score=-19.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.358.c2fb0315e6f61851.1a19b8b2ee3.4fc358d9a3527dff=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/15/26 23:07, Andrew Cooper wrote:
> Alternatives have had a reasonably severe restriction since their
> introduction=2E  This has been the source of several bugs, and several
> inefficiencies particularly in the speculative safety paths=2E
>=20
> https://gitlab=2Ecom/xen-project/hardware/xen-staging/-/pipelines/295255=
6080
>=20
> Andrew Cooper (5):
>    x86/emul: Introduce x86_decode_lite()
>    tests/x86: Introduce a userspace test harness for x86_decode_lite()
>    x86/alternative: Walk all replacements during self tests
>    x86/alternative: Relocate all insn-relative fields
>    x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ
>=20
>   tools/tests/Makefile                      |   1 +
>   tools/tests/x86-decode-lite/=2Egitignore    |   1 +
>   tools/tests/x86-decode-lite/Makefile      |  56 ++
>   tools/tests/x86-decode-lite/insns=2ES       | 711 ++++++++++++++++++++=
++
>   tools/tests/x86-decode-lite/macro-magic=2Eh |  62 ++
>   tools/tests/x86-decode-lite/main=2Ec        | 113 ++++
>   tools/tests/x86-decode-lite/x86-emulate=2Eh |  29 +
>   xen/arch/x86/alternative=2Ec                | 102 +++-
>   xen/arch/x86/hvm/vmx/entry=2ES              |  12 +-
>   xen/arch/x86/include/asm/spec_ctrl_asm=2Eh  |  43 +-
>   xen/arch/x86/x86_emulate/Makefile         |   6 +
>   xen/arch/x86/x86_emulate/decode-lite=2Ec    | 331 ++++++++++
>   xen/arch/x86/x86_emulate/x86_emulate=2Eh    |  14 +
>   13 files changed, 1447 insertions(+), 34 deletions(-)
>   create mode 100644 tools/tests/x86-decode-lite/=2Egitignore
>   create mode 100644 tools/tests/x86-decode-lite/Makefile
>   create mode 100644 tools/tests/x86-decode-lite/insns=2ES
>   create mode 100644 tools/tests/x86-decode-lite/macro-magic=2Eh
>   create mode 100644 tools/tests/x86-decode-lite/main=2Ec
>   create mode 100644 tools/tests/x86-decode-lite/x86-emulate=2Eh
>   create mode 100644 xen/arch/x86/x86_emulate/decode-lite=2Ec
>=20

I tested this series on top of staging/unstable=2E

Hardware: Intel Core Ultra 5 226V
Config:   CONFIG_SELF_TESTS=3Dy, spec-ctrl=3Dbhb-entry,bhb-seq=3Dshort
            (BHB-entry shown for both HVM and PV in the boot log)
Dom0:     PVH

Result:
    * x86-decode-lite userspace test: passed
    * Boot with the alternatives self-test: no decode failures or
      disp8 escapes reported=2E
    * dom0 and an HVM guest ran normally with the BHB sequence
      active, including a guest cpuid loop to generate VM exits=2E
    * PV guest not tested

Note: the CPU doesn't select the BHB sequence by default, so I forced
it on the command line=2E

Tested-by: ODIN Thomas <thomas=2Eodin@vates=2Etech>

~Thomas


-- 
Thomas Odin | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.358.c2fb0315e6f61851.1a19b8b2ee3.4fc358d9a3527dff=---

