Return-Path: <SRS0=CqUQ=5N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF79C43331
	for <xen-devel@archiver.kernel.org>; Sat, 28 Mar 2020 12:19:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB83320723
	for <xen-devel@archiver.kernel.org>; Sat, 28 Mar 2020 12:19:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCElhxZf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB83320723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIAQO-0003sN-Tp; Sat, 28 Mar 2020 12:18:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJGS=5N=gmail.com=singhalsimran0@srs-us1.protection.inumbo.net>)
 id 1jIAQN-0003sE-1u
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 12:18:51 +0000
X-Inumbo-ID: 47c20d02-70ee-11ea-bec1-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47c20d02-70ee-11ea-bec1-bc764e2007e4;
 Sat, 28 Mar 2020 12:18:50 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q19so12889624ljp.9
 for <xen-devel@lists.xenproject.org>; Sat, 28 Mar 2020 05:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jevGeFalRwTN+jXYx/WjT+od5OHj4HBBuWMzF3K4fC8=;
 b=TCElhxZfbEcRXgdFdvqZgsuOCKku76A2mQqGywCpNj2a/pV3O8aPuDcv0JF+9W6Bew
 zXBio/iLkbMFcTWilLamLLfu0FFO3S96MFPrtnGUiH/Gj3rtFf53Mbf3mGFSb5Jq6Vxf
 lrbIPjg0GV/aq76s0r+JHEfMSsGXfis/pj61iPrg5kN3x01qkoc2THUgECJY3wf3HSuk
 tgui44HJkKYIvBjtHj+u5Jb4BuZQN+ye0H3mwpFxgDUE0zIFWE4va3PRZQrv3vlDQx7D
 VuayskmA3TR7lCY94c9F5VY5tswAgzVcgaRO7mYGIFlbrgLddObATQIN4KtiFKujZ6Ge
 kygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jevGeFalRwTN+jXYx/WjT+od5OHj4HBBuWMzF3K4fC8=;
 b=DHlXI+nb2l+8gjziMMDZJLOF5KwWsvyNt+B5rNz8JJ3WBdDOTCQvnRTa4V2PJxp1d8
 Lqe3NETkqeC20VdmfuAOFWWFElbSx4ntAlEjig5BukJIknf70c7H0FMC1vyAS6M3QO2R
 1+EuLSncdY/RqIu/Xnj55lsWb+AiDBfdYXETDug1P076bIZzndTiIU3JcCfy+ZcmLR88
 cyxKhp2MgqRxgrrhF1+KNaGUVcNSnHVhI2EOYLtfEb92Iv35ce1CNOvnzZzBC3DiiGpg
 i1t3KTSRIYmI/wzV2zsyOHSEYbyryyq2UugJi0JIot4cT7ODOcoVBXbn+RwB+j/Ze7Bl
 IIIA==
X-Gm-Message-State: AGi0PuY5eEy4siG9LGxZoX67krtc7Ma94iWpEVL5URDV6vqVyWGLDBkR
 2RJxJ5wER5xplr8FfnybhxWvTpCQNzTUk+vsrR0bmARF
X-Google-Smtp-Source: APiQypJPgACNRlgK5jEt6KLhGuV0wjfEWBO4Qf91iEQld7pzgzx2lMUSyrL1tS82Lr5xw2uy6gwgELs8GUsGphcwPRc=
X-Received: by 2002:a2e:5ce:: with SMTP id 197mr2200323ljf.234.1585397929233; 
 Sat, 28 Mar 2020 05:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200328053834.GA12753@simran-Inspiron-5558>
 <20200328101840.GN28601@Air-de-Roger>
 <20200328105839.rf3igs2h7o7ujj7s@debian>
In-Reply-To: <20200328105839.rf3igs2h7o7ujj7s@debian>
From: Simran Singhal <singhalsimran0@gmail.com>
Date: Sat, 28 Mar 2020 17:48:37 +0530
Message-ID: <CALrZqyNqeXM+4ZjgM5tJhVYRpfAgO+xbS8kXJH+V9fkjht-OBQ@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="00000000000066504105a1e93801"
Subject: Re: [Xen-devel] [PATCH] xen/x86: Remove unnecessary cast on void
 pointer
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000066504105a1e93801
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2020 at 4:28 PM Wei Liu <wl@xen.org> wrote:

> On Sat, Mar 28, 2020 at 11:18:40AM +0100, Roger Pau Monn=C3=A9 wrote:
> > Thanks!
> >
> > On Sat, Mar 28, 2020 at 11:08:35AM +0530, Simran Singhal wrote:
> > > diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.=
c
> > > index f049920196..a53d3ca2a4 100644
> > > --- a/xen/arch/x86/hvm/vmx/vvmx.c
> > > +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> > > @@ -256,7 +256,7 @@ static int vvmcs_offset(u32 width, u32 type, u32
> index)
> > >  u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)
> > >  {
> > >      union vmcs_encoding enc;
> > > -    u64 *content =3D (u64 *) vvmcs;
> > > +    u64 *content =3D vvmcs;
> > >      int offset;
> > >      u64 res;
> > >
> > > @@ -310,7 +310,7 @@ enum vmx_insn_errno get_vvmcs_real_safe(const
> struct vcpu *v, u32 encoding,
> > >  void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)
> > >  {
> > >      union vmcs_encoding enc;
> > > -    u64 *content =3D (u64 *) vvmcs;
> > > +    u64 *content =3D vvmcs;
> >
> > While there, would you mind changing u64 to uint64_t? (here and
> > above)
> >
>
> To add some context to this comment: new code has been using uintX
> variants. We want to migrate existing code gradually. Since you're
> touching these lines anyway, it is a good chance to do the migration.
>
> When you do this in your next version, please add a line in the commit
> message saying something along the line that "Take the chance to change
> some u64 to uint64_t".
>

Thanks for the suggestion. I'll do the changes in the next version.

Thanks
Simran


>
> Wei.
>

--00000000000066504105a1e93801
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 28, 2020 at 4:28 PM Wei L=
iu &lt;<a href=3D"mailto:wl@xen.org">wl@xen.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Mar 28, 2020 at 11:1=
8:40AM +0100, Roger Pau Monn=C3=A9 wrote:<br>
&gt; Thanks!<br>
&gt; <br>
&gt; On Sat, Mar 28, 2020 at 11:08:35AM +0530, Simran Singhal wrote:<br>
&gt; &gt; diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/v=
vmx.c<br>
&gt; &gt; index f049920196..a53d3ca2a4 100644<br>
&gt; &gt; --- a/xen/arch/x86/hvm/vmx/vvmx.c<br>
&gt; &gt; +++ b/xen/arch/x86/hvm/vmx/vvmx.c<br>
&gt; &gt; @@ -256,7 +256,7 @@ static int vvmcs_offset(u32 width, u32 type, =
u32 index)<br>
&gt; &gt;=C2=A0 u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 union vmcs_encoding enc;<br>
&gt; &gt; -=C2=A0 =C2=A0 u64 *content =3D (u64 *) vvmcs;<br>
&gt; &gt; +=C2=A0 =C2=A0 u64 *content =3D vvmcs;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int offset;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 u64 res;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt; @@ -310,7 +310,7 @@ enum vmx_insn_errno get_vvmcs_real_safe(const=
 struct vcpu *v, u32 encoding,<br>
&gt; &gt;=C2=A0 void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 =
val)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 union vmcs_encoding enc;<br>
&gt; &gt; -=C2=A0 =C2=A0 u64 *content =3D (u64 *) vvmcs;<br>
&gt; &gt; +=C2=A0 =C2=A0 u64 *content =3D vvmcs;<br>
&gt; <br>
&gt; While there, would you mind changing u64 to uint64_t? (here and<br>
&gt; above)<br>
&gt; <br>
<br>
To add some context to this comment: new code has been using uintX<br>
variants. We want to migrate existing code gradually. Since you&#39;re<br>
touching these lines anyway, it is a good chance to do the migration.<br>
<br>
When you do this in your next version, please add a line in the commit<br>
message saying something along the line that &quot;Take the chance to chang=
e<br>
some u64 to uint64_t&quot;.<br></blockquote><div><br></div><div>Thanks for =
the suggestion. I&#39;ll do the changes in the next version.</div><div><br>=
</div><div>Thanks<br></div><div>Simran<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Wei.<br>
</blockquote></div></div>

--00000000000066504105a1e93801--

