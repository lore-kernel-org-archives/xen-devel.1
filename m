Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C22EC55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:04:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383551.1626831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrcE2-0000KJ-8F; Wed, 05 Aug 2026 14:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383551.1626831; Wed, 05 Aug 2026 14:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrcE2-0000Jw-5c; Wed, 05 Aug 2026 14:04:06 +0000
Received: by outflank-mailman (input) for mailman id 1383551;
 Wed, 05 Aug 2026 14:04:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wrcE1-0000Jm-T3
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:04:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrcE1-006NBO-2c
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:04:05 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wrcE1-00H4TB-1a
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:04:05 +0000
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5b0117d49dcso1282438e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 07:04:05 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version;
	bh=3qLiuJFGpN11+MdjblulRfLKk+aAgO7+B5B9IdpRmA4=; b=0EAC0Wfaz2J7xsn6HBHrMcuE75
	fKeBxfxoCC1N7wHRpy2hcaqbCC2YKyg3Zr5wcvA7OAdAT9L4m1LgpLlsCwEvTw+ro2jtc1XnlThuF
	J08MAiHvWjQtLxZ6MSOmJ+S17XZp/IHEFp/LHYC/ycqjY7+sp5aOiKQ9xKTRWHGSPy14=;
X-Gm-Message-State: AOJu0YypqaiMLIOlE2MQ6NudXoVyacOl/DCRSqj7VBzuwkejwcPkSaPU
	4Q+0wsOAtFHEPaVmQ5/Brl2DCPcUi/h6/oviPQQk/o0NM//TgQpp+lZHX++J5tOwPZ+CF279EO9
	aFiMX3G4cXG5uWBbgI9NRJggRGpsgr8k=
X-Received: by 2002:a05:6512:1327:b0:5ae:bc4f:d631 with SMTP id
 2adb3069b0e04-5b2f4cd42dbmr1077274e87.44.1785938644416; Wed, 05 Aug 2026
 07:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com> <31267d9b-022f-48b5-b583-6d9380a22740@suse.com>
 <CAFLBxZYffb3bOS4Zz8m2QX52J6V9-ZonaxPCULoqyRLpPKh-VQ@mail.gmail.com>
 <e9cffe43-f3d2-4af1-a429-7c83e98daec5@suse.com> <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
 <0f821f2d-70ea-4616-a82e-73a6fe19829e@suse.com>
In-Reply-To: <0f821f2d-70ea-4616-a82e-73a6fe19829e@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 6 Aug 2026 00:03:52 +1000
X-Gmail-Original-Message-ID: <CAFLBxZZZP+NvCsvszNAmoTSSD2tZqe=Z0UVoo-sY+DyOrVu2PQ@mail.gmail.com>
X-Gm-Features: AUfX_mzd6dBticIODYK7r_o4tlKgLtoPNRNzITXiNfwT22XduMBsW7Lo1OjTvAk
Message-ID: <CAFLBxZZZP+NvCsvszNAmoTSSD2tZqe=Z0UVoo-sY+DyOrVu2PQ@mail.gmail.com>
Subject: Re: Dual content (text/plain and text/html) on xen-devel (was Re:
 Linux PV domU with >1 vCPU never resumes after xl save/restore)
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: multipart/alternative; boundary="0000000000007dc03f06584d3e53"

--0000000000007dc03f06584d3e53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 11:28=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:

> On 05.08.2026 14:15, George Dunlap wrote:
> > You're asking every person who sends an email to xen-devel to remember =
to
> > take an action before sending the mail
>
> You're by far not the first one to be asked this; you're the first one to
> have an issue with being asked, beyond some companies' IT getting in the
> way. (As to the latter point, I'm already combining my observations on
> xen-devel@ with those elsewhere.)
>

And indeed, if I were sending to a community I was new to, I would just
suck it up.  I'm pushing back for two reasons: first, it wasn't an issue
for the previous 18 years, so I'm trying to figure out why it's an issue
now; secondly, whether it's a big barrier or not, it adds a barrier, which
seems to me unnecessary.

I do feel a bit weird starting an argument about this on my second or third
public post coming back.  But, the arguments put forth to support the
"text/plain *only*" position don't seem to me (at the moment) to be
justified; and in this community I'm in a position to push back in a way a
newbie would not be.


> > because your MUA isn't handling
> > the standard properly.  Is that really reasonable?  Couldn't you tell
> > Thunderbird to ignore html and only render text/plain?
>
> Both questions go together: text/plain as the only content is (not just b=
y
> us) being asked for because that's the form known to work virtually
> everywhere. Wanting your mails to be properly handled at all receiving
> ends is - I think - not only reasonable, but also in your own interest?
>

As I said in a sibling thread, the fact stands that (as far as I can tell)
Gmail is following long-established mail conventions, and Thunderbird is
not.  Juergen can read my mail just fine.  *His* MUA generates somewhat
mangled responses, specifically because *it* is using HTML rather than
text/plain; I don't see why that should be my issue.

 -George

--0000000000007dc03f06584d3e53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 5, =
2026 at 11:28=E2=80=AFPM Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.co=
m">jbeulich@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 05.08.2026 14:15, George Dunlap wrote:<br>
&gt; You&#39;re asking every person who sends an email to xen-devel to reme=
mber to<br>
&gt; take an action before sending the mail<br>
<br>
You&#39;re by far not the first one to be asked this; you&#39;re the first =
one to<br>
have an issue with being asked, beyond some companies&#39; IT getting in th=
e<br>
way. (As to the latter point, I&#39;m already combining my observations on<=
br>
xen-devel@ with those elsewhere.)<br></blockquote><div><br></div><div>And i=
ndeed, if I were sending to a community I was new to, I would just suck it =
up.=C2=A0 I&#39;m pushing back for two reasons: first, it wasn&#39;t an iss=
ue for the previous 18 years, so I&#39;m trying to figure out why it&#39;s =
an issue now; secondly, whether it&#39;s a big barrier or not, it adds a ba=
rrier, which seems to me unnecessary.</div><div><br></div><div>I do feel a =
bit weird starting an argument about this on my second or third public post=
 coming back.=C2=A0 But, the arguments put forth to support the &quot;text/=
plain *only*&quot; position don&#39;t seem to me (at the moment) to be just=
ified; and in this community I&#39;m in a position to push back in a way a =
newbie would not be.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">&gt; because your MUA isn&#39;t handling<br>
&gt; the standard properly.=C2=A0 Is that really reasonable?=C2=A0 Couldn&#=
39;t you tell<br>
&gt; Thunderbird to ignore html and only render text/plain?<br>
<br>
Both questions go together: text/plain as the only content is (not just by<=
br>
us) being asked for because that&#39;s the form known to work virtually<br>
everywhere. Wanting your mails to be properly handled at all receiving<br>
ends is - I think - not only reasonable, but also in your own interest?<br>=
</blockquote><div><br></div><div>As I said in a sibling thread, the fact st=
ands that (as far as I can tell) Gmail is following long-established mail c=
onventions, and Thunderbird is not.=C2=A0 Juergen can read my mail just fin=
e.=C2=A0 *His* MUA generates somewhat mangled responses, specifically becau=
se *it* is using HTML rather than text/plain; I don&#39;t see why that shou=
ld be my issue.</div><div><br></div><div>=C2=A0-George</div></div></div>

--0000000000007dc03f06584d3e53--

