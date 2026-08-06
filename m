Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13144C56208
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 13:28:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384746.1627540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wry8f-00012o-N2; Thu, 06 Aug 2026 13:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384746.1627540; Thu, 06 Aug 2026 13:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wry8f-00012g-Hm; Thu, 06 Aug 2026 13:28:01 +0000
Received: by outflank-mailman (input) for mailman id 1384746;
 Thu, 06 Aug 2026 13:28:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd7425a8b000e099@swg.vates.tech>)
 id 1wry8e-00012Z-Dw
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 13:28:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wry8d-00D7Jb-I3
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 15:27:59 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd7425a8b000e099@swg.vates.tech>)
 id 6a748bbe-e002-0a2a0a5209dd-0a2a4508860c-16
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:27:59 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fd7425a8b000e099@swg.vates.tech>)
 id 6a748bde-f659-0a2a45080019-b9ff1c238b09-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 15:27:59 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fd7425a8b000e099.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 06 Aug 2026 13:27:57 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1441B82386;
 Thu,  6 Aug 2026 15:27:57 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=fjcOJJ9BNo78EaWRAyLGoUF/eBtBx/DiG9665z3EPtU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=f6UMgWaqhRFqVgHx1QmH/JtT16Z/dYDma5hx456VQEJwCfM58H7RWZ9927IY1YnnpGHslFAN2
 m8WQhguhqtuE9U23n56xaJTuprJKI6LYvsEWjEwkkHWZzd026uc0aiXEEXD0rl4ImbCm0sW9gc+
 RA6QJBgcOQYEnAFsdUely1De6CxpkJjd5zycpyzQa3QgBlHgoa6IoGJnbMr7973QXFnL5MBxTeP
 9qm00Y5jW5wdzoyvaNXQ3+8p5Na69+7C03+P8md36mcsV993eKZZ+Gp3XJR0gWXemPykD1ILE3y
 wreEwz0HsjEgSLE9CDBY9OJAy0iVg1F9SVixDba+Zasw==
X-Zone-Loop: dec621bc5d807e9562f8be292c276d08a94a153578e9
x-campaign-type: default
x-transaction-id: 927a11e6-6598-4bd5-af17-fdf5ba979995
x-swg-uid: 01-e21cba5d-2040-4d00-bfdf-fd5ca1d1d74f
X-Mailer: Sweego
Message-ID:
 <1786022877.8631fc262581453bbf619ec5b2062170.19fd7425a8b000e099@vates.tech>
x-swg-bid: 1786022877.8631fc262581453bbf619ec5b2062170.19fd7425a8b000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 6 Aug 2026 15:27:56 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/3] xen/scripts: adapt gen_compile_commands.py to Xen
References: <20260805015247.41943-1-gwd@xenproject.org>
 <20260805015247.41943-3-gwd@xenproject.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260805015247.41943-3-gwd@xenproject.org>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1dd4.114358bb8e9b1a69.19fd742582f.9b2b9f1f500dbd5c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786022877231
X-purgate-ID: tlsNG-c1860d/1786022879-CDF4787B-4101139F/0/0
X-purgate-type: clean
X-purgate-size: 4002

---=Part.1dd4.114358bb8e9b1a69.19fd742582f.9b2b9f1f500dbd5c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2026 at 11:52:39AM +1000, George Dunlap wrote:
> Two changes from the Linux original:
>=20
>  - Linux's compiler invocations end with the source file
>    ("=2E=2E=2E -c -o foo=2Eo foo=2Ec"), and the script's line pattern re=
lies
>    on that; Xen's cmd_cc_o_c places "-c $<" before "-o" and "-MQ",
>    so on a Xen object tree the unmodified script matches nothing and
>    produces an empty database=2E  Adjust _LINE_PATTERN to capture the
>    command up to and including "-c" plus the source file, dropping
>    the remainder, which database consumers do not need=2E
>=20
>  - Reword the docstring and help text to refer to Xen=2E
>=20
> The support for reading object lists from archives and modules=2Eorder
> is unused in Xen but retained to minimise divergence from the
> original=2E
>=20
> Assisted-by: LLM
> Signed-off-by: George Dunlap <gwd@xenproject=2Eorg>
> ---
>  xen/scripts/gen_compile_commands=2Epy | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/scripts/gen_compile_commands=2Epy b/xen/scripts/gen_com=
pile_commands=2Epy
> index 96e6e46ad1=2E=2E9abc6410c1 100755
> --- a/xen/scripts/gen_compile_commands=2Epy
> +++ b/xen/scripts/gen_compile_commands=2Epy
> @@ -5,7 +5,7 @@
>  #
>  # Author: Tom Roeder <tmroeder@google=2Ecom>
>  #
> -"""A tool for generating compile_commands=2Ejson in the Linux kernel=2E=
"""
> +"""A tool for generating compile_commands=2Ejson for the Xen hypervisor=
=2E"""
> =20
>  import argparse
>  import json
> @@ -19,7 +19,10 @@ _DEFAULT_OUTPUT =3D 'compile_commands=2Ejson'
>  _DEFAULT_LOG_LEVEL =3D 'WARNING'
> =20
>  _FILENAME_PATTERN =3D r'^\=2E=2E*\=2Ecmd$'
> -_LINE_PATTERN =3D r'^(saved)?cmd_[^ ]*\=2Eo :=3D (?P<command_prefix>=2E=
* )(?P<file_path>[^ ]*\=2E[cS]) *(;|$)'
> +# Unlike Linux, Xen's compile commands do not end with the source file:
> +# cmd_cc_o_c places "-c $<" before "-o" and "-MQ"=2E

This looks like a comment for the patch rather than the pattern in the
following line=2E So it doesn't seems useful here=2E

>                                                      Capture the command=
 up
> +# to and including "-c" plus the source file, and drop the remainder=2E

Here, I think it would be worth it to explain what the remainder is,
which in turn would help explain why it is dropped at all=2E

Besides that, the patch description and the other changes looks fine to
me=2E

> +_LINE_PATTERN =3D r'^(saved)?cmd_[^ ]*\=2Eo :=3D (?P<command_prefix>=2E=
* -c )(?P<file_path>[^ ]*\=2E[cS])( =2E*)?$'
>  _VALID_LOG_LEVELS =3D ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>  # The tools/ directory adopts a different build system, and produces =
=2Ecmd
>  # files in a different format=2E Do not support it=2E
> @@ -35,10 +38,10 @@ def parse_arguments():
>          output: Where to write the compile-commands JSON file=2E
>          paths: The list of files/directories to handle to find =2Ecmd f=
iles=2E
>      """
> -    usage =3D 'Creates a compile_commands=2Ejson database from kernel =
=2Ecmd files'
> +    usage =3D 'Creates a compile_commands=2Ejson database from Xen =2Ec=
md files'
>      parser =3D argparse=2EArgumentParser(description=3Dusage)
> =20
> -    directory_help =3D ('specify the output directory used for the kern=
el build '
> +    directory_help =3D ('specify the output directory used for the Xen =
build '
>                        '(defaults to the working directory)')
>      parser=2Eadd_argument('-d', '--directory', type=3Dstr, default=3D'=
=2E',
>                          help=3Ddirectory_help)

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1dd4.114358bb8e9b1a69.19fd742582f.9b2b9f1f500dbd5c=---

