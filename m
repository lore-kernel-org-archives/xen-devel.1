Return-Path: <SRS0=af7b=6H=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD2FC54FCB
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2020 16:04:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA0D20728
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2020 16:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBh7QMxb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADA0D20728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jReKe-0007fO-PN; Thu, 23 Apr 2020 16:04:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA1d=6H=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jReKc-0007fJ-Vv
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 16:04:07 +0000
X-Inumbo-ID: 0e912020-857c-11ea-83d8-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e912020-857c-11ea-83d8-bc764e2007e4;
 Thu, 23 Apr 2020 16:04:06 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e25so6782953ljg.5
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 09:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jl/mQ2S57lrCLWS8kOqczzvd1rhQS4QIIAeKgUoS/o0=;
 b=LBh7QMxba3fD1tuIqrdXAAqbvjS4foINqiU5D2wMEjDv/bzE14PmF2j/bVs61JVbWU
 G231u9UNmZDctbVL5xqB1CYAc5J1fKOo0+Q7SDzAGSBfnBJKBG+0dyLPE2rxXBXk0wo1
 Vn0sPgUeBV704+XAK82UfMYNSy6kgBWh2aoT1qgxdDHvarcVSQ8Y2WMoRclG+BiYAQ1v
 4n4go/kU0macg/hh44h0+Mu1duqnCb+YpPMiT0Ot7cgzW8BQ7MHuer4lkM0+4lj1kSbR
 aaNvgKBO0kjsOmkQZ68hb7nK0k5axpF4cj9svjEhHmuZIOIRmyMVdnfpr7GKVDIXtSCN
 gNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jl/mQ2S57lrCLWS8kOqczzvd1rhQS4QIIAeKgUoS/o0=;
 b=bbRNPkFOjxnNN7hzkSmCtmdIAstAlzfhtcuYwX506409vAgv+FnUkwTsO6Y05Oe2jT
 z9A4irFz0URBWSh2HBrlLVFKkup6B5lg1PZ6XjlV7yOUCJoVuqlZXdoXVXAMV8q0QjWr
 /lHcSRrtqUzhwzeM3TyNyhOl4tUNsnCPu1+97dEhCfA3wOq9CutqRstyar2eNbfI/Of8
 qhwKMHvHQCNuGq7pPgRTtc6mI/acD4UhUTE8uC0wV+ra6jZ2hO+q2reJ64V1GO+Lc8Sw
 9irS9B9gCtwCeY4UxHXZeePbKksU45NFOMzrisOHm49xjIBXwNzCAHuYyHMPVS/Q0p3e
 YOLA==
X-Gm-Message-State: AGi0PubdTg/gvKd8vZXMR4yyKmqw/8TC650IbLbTAyQN2VSJOjZFHXY9
 n/Up/kAowF6XyKkRD8KpXmJmcJD2190jjg2evxA=
X-Google-Smtp-Source: APiQypL29hwNrh9EZ+iZWZHtOLzHf/J/E0Fhapd0VSzs+wVwhe27mKT12iXYkhkLSmx1ng8Ns5YHUy7Qs6wEVMFbHh8=
X-Received: by 2002:a2e:95c5:: with SMTP id y5mr2936483ljh.26.1587657845012;
 Thu, 23 Apr 2020 09:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587599094.git.rosbrookn@ainfosec.com>
 <c2d966b43313c9df64551b0ce31462c176445b70.1587599095.git.rosbrookn@ainfosec.com>
 <CAFLBxZaKiuqpmVvP2ww9YbuTkCm9wdBKGdMJOrT=sTaJSaycqg@mail.gmail.com>
In-Reply-To: <CAFLBxZaKiuqpmVvP2ww9YbuTkCm9wdBKGdMJOrT=sTaJSaycqg@mail.gmail.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 23 Apr 2020 12:03:53 -0400
Message-ID: <CAEBZRSfG053_DYA6BCZUjg6c4oa3AHDsK5Puc4ipy=py8C6Mgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] tools: build golang tools if go compiler is present
To: George Dunlap <dunlapg@umich.edu>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 9:44 AM George Dunlap <dunlapg@umich.edu> wrote:
>
>
>
> On Thu, Apr 23, 2020 at 1:51 AM Nick Rosbrook <rosbrookn@gmail.com> wrote:
>>
>> By default, if the go compiler is found by the configure script, build
>> the golang tools. If the compiler is not found, and
>> --enable-golang_tools was not explicitly set, do not build to the golang
>> tools.
>>
>> The new corresponding make variable is CONFIG_GOLANG_TOOLS. Remove
>> CONFIG_GOLANG from tools/Rules.mk since the new variable is set by
>> configure.
>>
>> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
>> ---
>>  config/Tools.mk.in |   1 +
>>  m4/golang.m4       |   4 ++
>>  tools/Makefile     |   2 +-
>>  tools/Rules.mk     |   2 -
>>  tools/configure    | 138 +++++++++++++++++++++++++++++++++++++++++++++
>>  tools/configure.ac |  12 ++++
>>  6 files changed, 156 insertions(+), 3 deletions(-)
>>  create mode 100644 m4/golang.m4
>>
>> diff --git a/config/Tools.mk.in b/config/Tools.mk.in
>> index 189fda1596..2c219f5477 100644
>> --- a/config/Tools.mk.in
>> +++ b/config/Tools.mk.in
>> @@ -55,6 +55,7 @@ CONFIG_QEMU_TRAD    := @qemu_traditional@
>>  CONFIG_QEMU_XEN     := @qemu_xen@
>>  CONFIG_QEMUU_EXTRA_ARGS:= @EXTRA_QEMUU_CONFIGURE_ARGS@
>>  CONFIG_LIBNL        := @libnl@
>> +CONFIG_GOLANG_TOOLS := @golang_tools@
>>
>>  CONFIG_SYSTEMD      := @systemd@
>>  SYSTEMD_CFLAGS      := @SYSTEMD_CFLAGS@
>> diff --git a/m4/golang.m4 b/m4/golang.m4
>> new file mode 100644
>> index 0000000000..0b4bd54ce0
>> --- /dev/null
>> +++ b/m4/golang.m4
>> @@ -0,0 +1,4 @@
>> +AC_DEFUN([AC_PROG_GO], [
>> +    dnl Check for the go compiler
>> +    AC_CHECK_TOOL([GO],[go],[no])
>> +])
>
>
> AFAICT this only checks for the existence of the binary.  Will the bindings compile with all versions of go?  If not, should we try to check the version here?

There are no obvious pieces to me that won't compile on fairly recent
(i.e. >= 1.9) versions of go, but yes it would probably be best to
check for a minimum version. I will do some more work to figure out an
appropriate minimum version, but I think go 1.10 might be a reasonable
start.

Thanks,

-NR

