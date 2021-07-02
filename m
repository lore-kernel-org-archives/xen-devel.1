Return-Path: <SRS0=Zy1u=L2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF11C07E95
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 22:23:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4501961405
	for <xen-devel@archiver.kernel.org>; Fri,  2 Jul 2021 22:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4501961405
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.149351.276149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzRYr-00017g-Ng; Fri, 02 Jul 2021 22:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149351.276149; Fri, 02 Jul 2021 22:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzRYr-00017X-KC; Fri, 02 Jul 2021 22:23:01 +0000
Received: by outflank-mailman (input) for mailman id 149351;
 Fri, 02 Jul 2021 22:22:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ZMt=L2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lzRYp-00016l-RJ
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 22:22:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e08e4da-db84-11eb-83c9-12813bfff9fa;
 Fri, 02 Jul 2021 22:22:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDEB2613D8;
 Fri,  2 Jul 2021 22:22:57 +0000 (UTC)
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
X-Inumbo-ID: 0e08e4da-db84-11eb-83c9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625264578;
	bh=Fy+lh0gdDpIUJ31/KI+4mZyM1dnS4gMtNFLuAyMxMmw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Kh1lN74M1X59uKKPgGFrOx3YV4nt3Bdy9y9MFmMdAhJ7xYJoBVwh+NkbOq0ruAaaA
	 XuNQ+W2G1VwTObfay7JKaPkaKL4b7YlJXVoNISLIJp3O5zVvuhPrwmk2YgGsX7XIf4
	 y3F5TiFodCHV5DwUg3M2waV6Gln4RXBCjncpRJMeRc4kiivcAUq5PVi6l/qxUTAs7A
	 HTrLXuZGJ8UCi9ZfzJHMSvUnvW4Trn9Il68cXhx2B07TqZrFUAM6iPqVIt9K7jjjm+
	 CBD0uO7DAKBZjyb5fs1jOhyoiMKZjFFKk31fPY7L1lnC1prsixQILhkqOz/wfX+m3c
	 ynGvPBNpp7kTg==
Date: Fri, 2 Jul 2021 15:22:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v6 4/9] m4/python: add function to docs_tool.m4 and new
 m4 module
In-Reply-To: <20210510084105.17108-5-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2107021456281.9437@sstabellini-ThinkPad-T480s>
References: <20210510084105.17108-1-luca.fancellu@arm.com> <20210510084105.17108-5-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 May 2021, Luca Fancellu wrote:
> Add ax_python_module.m4 to have a way to check if
> a python module is installed in the system.
> 
> Add a function to docs_tool.m4 to throw an error if the
> required docs tool is missing.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  m4/ax_python_module.m4 | 56 ++++++++++++++++++++++++++++++++++++++++++
>  m4/docs_tool.m4        |  9 +++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 m4/ax_python_module.m4
> 
> diff --git a/m4/ax_python_module.m4 b/m4/ax_python_module.m4
> new file mode 100644
> index 0000000000..107d88264a
> --- /dev/null
> +++ b/m4/ax_python_module.m4
> @@ -0,0 +1,56 @@
> +# ===========================================================================
> +#     https://www.gnu.org/software/autoconf-archive/ax_python_module.html
> +# ===========================================================================
> +#
> +# SYNOPSIS
> +#
> +#   AX_PYTHON_MODULE(modname[, fatal, python])
> +#
> +# DESCRIPTION
> +#
> +#   Checks for Python module.
> +#
> +#   If fatal is non-empty then absence of a module will trigger an error.
> +#   The third parameter can either be "python" for Python 2 or "python3" for
> +#   Python 3; defaults to Python 3.
> +#
> +# LICENSE
> +#
> +#   Copyright (c) 2008 Andrew Collier
> +#
> +#   Copying and distribution of this file, with or without modification, are
> +#   permitted in any medium without royalty provided the copyright notice
> +#   and this notice are preserved. This file is offered as-is, without any
> +#   warranty.
> +
> +#serial 9
> +
> +AU_ALIAS([AC_PYTHON_MODULE], [AX_PYTHON_MODULE])
> +AC_DEFUN([AX_PYTHON_MODULE],[
> +    if test -z $PYTHON;
> +    then
> +        if test -z "$3";
> +        then
> +            PYTHON="python3"
> +        else
> +            PYTHON="$3"
> +        fi
> +    fi
> +    PYTHON_NAME=`basename $PYTHON`
> +    AC_MSG_CHECKING($PYTHON_NAME module: $1)
> +    $PYTHON -c "import $1" 2>/dev/null
> +    if test $? -eq 0;
> +    then
> +        AC_MSG_RESULT(yes)
> +        eval AS_TR_CPP(HAVE_PYMOD_$1)=yes
> +    else
> +        AC_MSG_RESULT(no)
> +        eval AS_TR_CPP(HAVE_PYMOD_$1)=no
> +        #
> +        if test -n "$2"
> +        then
> +            AC_MSG_ERROR(failed to find required module $1)
> +            exit 1
> +        fi
> +    fi
> +])
> \ No newline at end of file
> diff --git a/m4/docs_tool.m4 b/m4/docs_tool.m4
> index 3e8814ac8d..39aa348026 100644
> --- a/m4/docs_tool.m4
> +++ b/m4/docs_tool.m4
> @@ -15,3 +15,12 @@ dnl
>          AC_MSG_WARN([$2 is not available so some documentation won't be built])
>      ])
>  ])
> +
> +AC_DEFUN([AX_DOCS_TOOL_REQ_PROG], [
> +dnl
> +    AC_ARG_VAR([$1], [Path to $2 tool])
> +    AC_PATH_PROG([$1], [$2])
> +    AS_IF([! test -x "$ac_cv_path_$1"], [
> +        AC_MSG_ERROR([$2 is needed])
> +    ])
> +])
> \ No newline at end of file
> -- 
> 2.17.1
> 
> 

