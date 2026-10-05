Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A95ECA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 09:43:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440663.1658076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfEI-0005hJ-9Q; Mon, 05 Oct 2026 09:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440663.1658076; Mon, 05 Oct 2026 09:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfEI-0005hC-67; Mon, 05 Oct 2026 09:43:30 +0000
Received: by outflank-mailman (input) for mailman id 1440663;
 Mon, 05 Oct 2026 09:43:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1xDfEG-0005h6-Ou
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 09:43:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDfEG-006mz0-1I
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:43:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6ac37134-8faa-0a2a0a5109dd-0a2a4501bf7a-20
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:43:27 +0200
Received: from [74.125.229.42] (helo=mail-dy2-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6ac3713e-5984-0a2a45010019-4a7de52a8925-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:43:27 +0200
Received: by mail-dy2-f42.google.com with SMTP id
 5a478bee46e88-3511f5f79e0so455658eec.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 02:43:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1791193406; cv=none;
        d=google.com; s=arc-20260327;
        b=oG94yUMeYtM1nn4SL3UKA8T/WlM8SefYoeCcT0f7piWFKROfTqB1gD+hWVzkOnDGWg
         egiE1Kyw+haA2aQSDqWR7lthFjH/0PuJukt22hc3VTkP0wqQZpQ0wfT6ZJcnhZXydfUb
         00U/RrYnuQZrVbZiuZUjyVuY0I+rno4iWhyoO9QFTRl6BgzMX320UCZCfuY85JrFSxT/
         CHmExjsv8Q18e5lwgJ07aXk9BafXp93xQs1H85IrPkIew+u1Kn0d0wyuwxtuCy/pzZp4
         u60XY6T3E/vfxYusdZBoecyuIsWzt+E1KSoKxnAyEemZAIqMkGJEeIhBoBYRNahAi58D
         WUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=quhIV9GdtVDmTI8LUlH7i1DV+qV5VNc2ufrP6HZ3T1o=;
        fh=qQgayo031e06I1GDNrttdYn1vRpwjnfh4+F1VTvCGjg=;
        b=pN+pASFSLJtZ8a405ghQQG9wbB9v5jPrIcAzxAcBxFRMgEJTGC6vJsLBqU4EGP0Sb7
         dW166leazqQHqTNT8KudBuKVXLTxj1pw62SGSWY5bZC3Jf69gTv1D7qaHmhvrpzHd1ha
         +uPdTpdevPVEInP+rQg0ltk26pgKtjoa9cSSy58wAFhJ4icGPFKgPuDGDsw8m1+Kz6jA
         wPdvJqRYLUYaFUeYka8apbraetBcyi19Go8X6Wklba4IuG0N3A1HygTUF6UK7ohyZQqp
         tKDEohtY2vKH6FyLdi6Wnqd1OSY3AOZtl+BYBx6tRIprwomMD3GEF06ag44hOPpkhYfK
         ziXg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193406; x=1791798206; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quhIV9GdtVDmTI8LUlH7i1DV+qV5VNc2ufrP6HZ3T1o=;
        b=R28mEZ7R52ENOes9OvfR3TuA2bA0bqg4ma0iFdl0qjhr3UPwZPziBo1XwJJ56ePJBH
         cQZgxNHj3RtLnw6s55wjvBkz5VX+3PBJDOX6FQxie8f/K5Bw1atIditG/w/44dCSEw0d
         VEXDczZi3B4e5jvzQ7fjIQV8vj8SLCS3sr1n8Fp9tb1zgUwdhX+rqOLZgyZ3UT/zxrbh
         pcA9+QmCgFDN12c1bdYBWnP8sEsY3tngKGWS2eVAROkoLVzUWZLRPDi9wReeE6O156Lp
         aF34kUPgIuZuklhBhM2UMkE18oped8SyVRm+pBzQwayn30x3C3luGejKK7woggOl7R4c
         YK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193406; x=1791798206;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=quhIV9GdtVDmTI8LUlH7i1DV+qV5VNc2ufrP6HZ3T1o=;
        b=Jbes9yofGeWKE2heCr/8KXOj4ewIXX0z1hVlJkBJ02IUHl5hWyqKf0wG1wADPNQZPl
         xkWlJmsq9b8/CdmJwtuAjXZ2y0WJdB+/78jBPlDpaP+oW2YjBjJmtSW+eSyuXt2jW9hX
         wJAcEOlxIuH2YKPB6MzKoqqnzBdfF7Vcp9BUBmwl3O8FaVJoQFt097gUx16BjVpDGbtP
         CN6+13aVA73fEg17yzr3kaMGT5/ncgrCdJgnlMjMYbb2AsK8ZozjWsDgRIqn2y2z4Ueo
         6INyrCjS/DZNgfqhYoUi0X7AdN8q3lX0ltVRW6nHGsNw3by15zxIep1m8l46BfI+VkFx
         B9nA==
X-Gm-Message-State: AFuF++niNYcBKc4CHb6vj9Qt5C9JS5bgDNqFUoJbPctKdLR0+mUasEf9
	vkon4oXLZmn5VaNo0ygehG4hwSf24qpDbwnWuB60x7ZjHKOESgJdxNA3XgVF7h6sXzDy2ZQTqQ1
	tk2SFXGweSgYQ5OIZb4vm4HwNK8qnsD+t/jwI
X-Gm-Gg: AYBFou3/tCP4D0DzgEu0Nub38XbNxvU9kqhmQ1AkFw1jlns5mxZ+s16rjRyFsJCZafN
	H6pBKytFOVp00m/yJTm0p/iQlFTaqu37iEcDFZiedK7uf5PAte/cksc26tjV6AIJ5PowE9oSkEC
	VSFKc/F3XoTtU09wxcg6N+9JygcQVnVSh5ctNNaTr7OydTHBAcabGPkuD1Ym2DjNvEG4Z/b8fa9
	uPYaUTg4vu6bymBFcEZtvX0MoVo+sGgcJ2KDKnZkyk6oJGLGJ7mBs8oeCJ1nmv/dJvrmiPF0gcs
	sU/B6ksqOgv/BNceepdl3ELkvmq5L9VHQqBlLfqgfjcSN+Z4Mzy5QOg=
X-Received: by 2002:a05:7022:f905:b0:14c:b520:7db with SMTP id
 a92af1059eb24-14f5af2666emr10623485c88.7.1791193405328; Mon, 05 Oct 2026
 02:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <CALHzv=K_wH2O2hV+X8PtB8USX4kdFO3GTh7L93r_4rXyx+VcqQ@mail.gmail.com>
In-Reply-To: <CALHzv=K_wH2O2hV+X8PtB8USX4kdFO3GTh7L93r_4rXyx+VcqQ@mail.gmail.com>
From: Andrew Precious <andrewprecious388@gmail.com>
Date: Mon, 5 Oct 2026 12:43:12 +0300
X-Gm-Features: AclHuK_hO4lE2Gyp_iU3_ojXAJTEub0t_yvG9410xc6ZonwOcW9qHN4L0gk9Nzc
Message-ID: <CAF14T9=LpABbCG=6CrZH7RnDAFaddOx+mW=ym8Di9qYFYXYz-w@mail.gmail.com>
Subject: Re: Newcomer looking for a small first task
To: r4ahim <mer.r4him@gmail.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a64476065d14b628"
X-purgate-ID: tlsNG-d62444/1791193407-1E465757-26E3B009/0/0
X-purgate-type: clean
X-purgate-size: 3376

--000000000000a64476065d14b628
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One of the ways I find what to work on is search through the code comments
by doing a grep scan(example that searches the tools/ & excludes qemu/) - $
grep -rnI --exclude-dir=3Dqemu* "TODO" tools/

For misra rules violation as per(docs/misra/xen-static-analysis.rst) - $
xen/xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra
--cppcheck-html -- -j$(nproc)

A html report then gets generated in the
directory(/xen/xen/cppcheck-htmlreport)

As for documentation updates there is on-going work to convert relevant
pages from the Wiki to .rst format for the new Xen handbook
- Contributor handbook -
https://handbook.xenproject.org/contribution-guidelines.html
- Gitlab handbook - https://gitlab.com/xen-project/websites/handbook - Once
youve made relevant changes you can submit a merge request.

On Fri, Oct 2, 2026 at 1:27=E2=80=AFPM r4ahim <mer.r4him@gmail.com> wrote:

> Hi,
>
> I'm new to Xen, running it under QEMU (Xen builds and Dom0
> boots). I'm preparing my first patch and I'm most interested in
> PCI passthrough, vPCI and the IOMMU, but I'm happy to start
> anywhere.
>
> Is there a small unclaimed item (a MISRA violation, docs fix or
> XTF test) that I could take?
>
> Thanks,
> Abderrahim Meriah
>
>

--000000000000a64476065d14b628
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">One of the ways I find what to work on is search through t=
he code comments by doing a grep scan(example that searches the tools/ &amp=
; excludes qemu/) - $ grep -rnI --exclude-dir=3Dqemu* &quot;TODO&quot; tool=
s/<br><br>For misra rules violation as per(docs/misra/xen-static-analysis.r=
st) - $ xen/xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra --c=
ppcheck-html -- -j$(nproc)<br><br>A html report then gets generated in the =
directory(/xen/xen/cppcheck-htmlreport)<br><br>As for documentation updates=
 there is on-going work to convert relevant pages from the Wiki to .rst for=
mat for the new Xen handbook<br>- Contributor handbook - <a href=3D"https:/=
/handbook.xenproject.org/contribution-guidelines.html">https://handbook.xen=
project.org/contribution-guidelines.html</a><br>- Gitlab handbook - <a href=
=3D"https://gitlab.com/xen-project/websites/handbook">https://gitlab.com/xe=
n-project/websites/handbook</a>=C2=A0- Once youve made relevant changes you=
 can submit a merge request.<br></div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 2, 2026 a=
t 1:27=E2=80=AFPM r4ahim &lt;<a href=3D"mailto:mer.r4him@gmail.com">mer.r4h=
im@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi,<br>
<br>
I&#39;m new to Xen, running it under QEMU (Xen builds and Dom0<br>
boots). I&#39;m preparing my first patch and I&#39;m most interested in<br>
PCI passthrough, vPCI and the IOMMU, but I&#39;m happy to start<br>
anywhere.<br>
<br>
Is there a small unclaimed item (a MISRA violation, docs fix or<br>
XTF test) that I could take?<br>
<br>
Thanks,<br>
Abderrahim Meriah<br>
<br>
</blockquote></div>

--000000000000a64476065d14b628--

