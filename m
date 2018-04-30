From: Minjun Hong <nickeysgo@gmail.com>
Subject: Re: where can I find the 'address translation' code in
 Xen?
Date: Mon, 30 Apr 2018 17:17:36 +0900
Message-ID: <CAFX_q-GXHqHaR8ZjXG7Lkuwbr9NN6ePS6L30WJ=EO_7jWc8zMQ@mail.gmail.com>
References: <CAFX_q-EPQuiEV4SBSFnCagEhx8pgTBWe6K-1FUP0sfMaLA5Kmw@mail.gmail.com>
 <20180430084416.0a482950@ezekiel.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5666061356435475905=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ugn4=ht=gmail.com=nickeysgo@srs-us1.protection.inumbo.net>)
 id 1fD40B-0003nI-3P
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 08:17:39 +0000
Received: by mail-vk0-x235.google.com with SMTP id 10-v6so4605908vkh.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Apr 2018 01:17:38 -0700 (PDT)
In-Reply-To: <20180430084416.0a482950@ezekiel.suse.cz>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petr Tesarik <ptesarik@suse.cz>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5666061356435475905==
Content-Type: multipart/alternative; boundary="0000000000009387ad056b0c7cb3"

--0000000000009387ad056b0c7cb3
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 30, 2018 at 3:44 PM, Petr Tesarik <ptesarik@suse.cz> wrote:

> Hi Minjun,
>
> On Sun, 29 Apr 2018 19:11:30 +0900
> Minjun Hong <nickeysgo@gmail.com> wrote:
>
> >[...]
> > My question is,
> >
> > 1. Is it sure that the function will be called even though the HW already
> > translates the address and populates the TLB entry?
>
> I think you miss the point. The hardware page tables for PV domains
> already contain machine addresses. In other words, virtual addresses
> get translated directly to machine addresses by the hardware page table
> walker.
>
> > 2. I'm just asking, is there any code in Xen that is related to the
> > behavior of the 'hardware walker'?
>
> Not sure what you mean. Maybe this question is no longer pertinent
> given the explanation above?
>
> HTH,
> Petr T
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel



Thanks for your kind answer, Petr.

In your answer on my first question, I was wondering why the function (
guest_walk_tables()) should be called even after the address translation
and TLB filling has been completed by the hardware page table walker.
As you mentioned, original goal (address translation) is achieved by the
hardware. If so, is its role like bottom half of interrupt?

I want to know this function is always called after the translation by the
hardware page walker.

--0000000000009387ad056b0c7cb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Apr 30, 2018 at 3:44 PM, Petr Tesarik <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ptesarik@suse.cz" target=3D"_blank">ptesarik@suse.cz</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Minjun,<br>
<br>
On Sun, 29 Apr 2018 19:11:30 +0900<br>
Minjun Hong &lt;<a href=3D"mailto:nickeysgo@gmail.com">nickeysgo@gmail.com<=
/a>&gt; wrote:<br>
<br>
&gt;[...]<br>
<span class=3D"gmail-">&gt; My question is,<br>
&gt; <br>
&gt; 1. Is it sure that the function will be called even though the HW alre=
ady<br>
&gt; translates the address and populates the TLB entry?<br>
<br>
</span>I think you miss the point. The hardware page tables for PV domains<=
br>
already contain machine addresses. In other words, virtual addresses<br>
get translated directly to machine addresses by the hardware page table<br>
walker.<br>
<span class=3D"gmail-"><br>
&gt; 2. I&#39;m just asking, is there any code in Xen that is related to th=
e<br>
&gt; behavior of the &#39;hardware walker&#39;?<br>
<br>
</span>Not sure what you mean. Maybe this question is no longer pertinent<b=
r>
given the explanation above?<br>
<br>
HTH,<br>
Petr T<br>
<br>
______________________________<wbr>_________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenprojec=
t.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/<wbr>mailman/lis=
tinfo/xen-devel</a></blockquote></div><br></div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Thanks for your kind answer, Petr.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">In your a=
nswer on my first question, I was wondering why the function (<span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">guest_walk_tables</span>()) should be called even after the=
 address translation and TLB filling has been completed by the hardware pag=
e table walker.</div><div class=3D"gmail_extra">As you mentioned, original =
goal (address translation) is achieved by the hardware. If so, is its role =
like bottom half of interrupt?</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">I want to know this function is always called afte=
r the translation by the hardware page walker.</div></div>

--0000000000009387ad056b0c7cb3--


--===============5666061356435475905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5666061356435475905==--
