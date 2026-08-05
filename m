Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9165AC55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:15:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383347.1626605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wraXA-0006bv-2a; Wed, 05 Aug 2026 12:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383347.1626605; Wed, 05 Aug 2026 12:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wraX9-0006bo-WE; Wed, 05 Aug 2026 12:15:44 +0000
Received: by outflank-mailman (input) for mailman id 1383347;
 Wed, 05 Aug 2026 12:15:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wraX9-0006bi-9u
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:15:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wraX9-006L26-0A
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:15:42 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wraX8-00GCzS-2K
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:15:42 +0000
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5b28c91fba5so1192544e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 05:15:42 -0700 (PDT)
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
	bh=IAx6f5biC3iTv+LdiiiwtGsshSnWp3OICO2uNsEBnTo=; b=mJPyro+NE58cJsdfG12gs5vvyr
	nkPuxedqJEQfj9Aa/lCavfquqgu9Z5hJHe2MZ3yO+/tdPHW/tTtVXS+3vj3USZGUHfisLKuIeOHCa
	M3oqRcCwBlrvOGeomeE6cA7lU/hEWcZ+8wmTvoDmmMireVCiw9/OxtimgPgYFxoKppf0=;
X-Gm-Message-State: AOJu0Ywsymk96fTsFbkJwYb1wPVYUsNifo8QYybdlr2Jf8wBBhHlyrMd
	WzgY/MK7DGuEsfPT8khciycenr7OfaqQYmOSBXJdUit/pOzmQzS1qB5qREtRFuI+9g02tPBk2uM
	fhcFjajtyFF5vT9p7ljgx/cj+lkYnZrw=
X-Received: by 2002:a05:6512:20c2:b0:5b2:c068:3530 with SMTP id
 2adb3069b0e04-5b2f488ed8bmr531704e87.13.1785932141585; Wed, 05 Aug 2026
 05:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLBxZZLYxk4ZZZ9++B9qRn_J8X6ochbHr4037mbC8sDfsRqDA@mail.gmail.com>
 <61b9c9fb-3d97-4480-8171-bce986e698a8@suse.com> <31267d9b-022f-48b5-b583-6d9380a22740@suse.com>
 <CAFLBxZYffb3bOS4Zz8m2QX52J6V9-ZonaxPCULoqyRLpPKh-VQ@mail.gmail.com> <e9cffe43-f3d2-4af1-a429-7c83e98daec5@suse.com>
In-Reply-To: <e9cffe43-f3d2-4af1-a429-7c83e98daec5@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Wed, 5 Aug 2026 22:15:27 +1000
X-Gmail-Original-Message-ID: <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
X-Gm-Features: AUfX_mxhzcbGZ8RteTnwsFS0o1a3r0nJXrgamS0cpFvyyutHHEhD_1DDg1EdDSM
Message-ID: <CAFLBxZaTLg7fN1HkQvHMR=o=EEZRBPaWHV3+6Wp9bkcaHTmF-A@mail.gmail.com>
Subject: Dual content (text/plain and text/html) on xen-devel (was Re: Linux
 PV domU with >1 vCPU never resumes after xl save/restore)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="000000000000e4836606584bba67"

--000000000000e4836606584bba67
Content-Type: multipart/alternative; boundary="000000000000e4836406584bba65"

--000000000000e4836406584bba65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Adding back in xen-devel, since this is relevant]

On Wed, Aug 5, 2026 at 9:15=E2=80=AFPM J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om> wrote:

> On 04.08.26 11:34, George Dunlap wrote:
> > On Tue, Aug 4, 2026 at 6:45=E2=80=AFPM J=C3=BCrgen Gro=C3=9F <jgross@su=
se.com
> > <mailto:jgross@suse.com>> wrote:
> >
> >
> >     P.S.: George, would it be possible to turn off HTML mails when
> sending to
> >             xen-devel?
> >
> >
> > I see both a text/plain part and a text/html part in the mail I sent;
> isn't the
> > presence of a text/plain version sufficient?
> >
> > Obviously sending patches is a different matter; but for that I'll be
> using git-
> > send-email.
>
> This is a reply to your mail using Thunderbird (which I have configured t=
o
> use
> plain text format as the default, in order to comply with most mailing
> lists
> I'm using).
>
> I don't think Thunderbird is an exotic MUA, but please have a look how it
> rendered your HTML reply to my original mail. I can't see clearly which
> part
> was written by me originally and was cited by you in this mail.
>

Thanks, this is what I was looking for.

Attached is the message Gmail sent.  As you can see, text/plain uses normal
`>` for quotes.

That makes me think that the problem is in Thunderbird.  It should either
take the text/plan part, and reply to that as though it were the only part
it had received; or it should take the HTML part, and convert the quotes to
text properly.  Replying in HTML and then rendering it with only space
indentations seems like a bug.

Thunderbird certainly isn't exotic, but last time I used it it was
definitely under-maintained.

You're asking every person who sends an email to xen-devel to remember to
take an action before sending the mail (or to send *all* mail as
text/plain, even if it's not to xen-devel), because your MUA isn't handling
the standard properly.  Is that really reasonable?  Couldn't you tell
Thunderbird to ignore html and only render text/plain?

 -George

--000000000000e4836406584bba65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div>[Adding back in xen-devel, sinc=
e this is relevant]</div></div><div><br></div></div><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug=
 5, 2026 at 9:15=E2=80=AFPM J=C3=BCrgen Gro=C3=9F &lt;<a href=3D"mailto:jgr=
oss@suse.com">jgross@suse.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On 04.08.26 11:34, George Dunlap wrote:<br>
&gt; On Tue, Aug 4, 2026 at 6:45=E2=80=AFPM J=C3=BCrgen Gro=C3=9F &lt;<a hr=
ef=3D"mailto:jgross@suse.com" target=3D"_blank">jgross@suse.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jgross@suse.com" target=3D"_blank">jgross=
@suse.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0P.S.: George, would it be possible to turn off HTML=
 mails when sending to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen-devel?<br>
&gt; <br>
&gt; <br>
&gt; I see both a text/plain part and a text/html part in the mail I sent; =
isn&#39;t the <br>
&gt; presence of a text/plain version sufficient?<br>
&gt; <br>
&gt; Obviously sending patches is a different matter; but for that I&#39;ll=
 be using git- <br>
&gt; send-email.<br>
<br>
This is a reply to your mail using Thunderbird (which I have configured to =
use<br>
plain text format as the default, in order to comply with most mailing list=
s<br>
I&#39;m using).<br>
<br>
I don&#39;t think Thunderbird is an exotic MUA, but please have a look how =
it<br>
rendered your HTML reply to my original mail. I can&#39;t see clearly which=
 part<br>
was written by me originally and was cited by you in this mail.<br></blockq=
uote><div><br></div><div>Thanks, this is what I was looking for.</div><div>=
<br></div><div>Attached is the message Gmail sent.=C2=A0 As you can see, te=
xt/plain uses normal `&gt;` for quotes.</div><div><br></div><div>That makes=
 me think that the problem is in Thunderbird.=C2=A0=C2=A0<span style=3D"bac=
kground-color:transparent">It should either take the text/plan part, and re=
ply to that as though it were the only part it had received; or it should t=
ake the HTML part, and convert the quotes to text properly.=C2=A0 Replying =
in HTML and then rendering it with only space indentations seems like a bug=
.</span></div><div><br></div><div>Thunderbird certainly isn&#39;t exotic, b=
ut last time I used it it was definitely under-maintained.</div><div><br></=
div><div>You&#39;re asking every person who sends an email to xen-devel to =
remember to take an action before sending the mail (or to send *all* mail a=
s text/plain, even if it&#39;s not to xen-devel), because your MUA isn&#39;=
t handling the standard properly.=C2=A0 Is that really reasonable?=C2=A0 Co=
uldn&#39;t you tell Thunderbird to ignore html and only render text/plain?<=
/div><div><br></div><div>=C2=A0-George</div></div></div>

--000000000000e4836406584bba65--
--000000000000e4836606584bba67
Content-Type: text/plain; charset="US-ASCII"; name="quoted-reply.txt"
Content-Disposition: attachment; filename="quoted-reply.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_msg1t17q0>
X-Attachment-Id: f_msg1t17q0

TUlNRS1WZXJzaW9uOiAxLjANCkRhdGU6IFR1ZSwgNCBBdWcgMjAyNiAxOTozNDoxMyArMTAwMA0K
UmVmZXJlbmNlczogPENBRkxCeFpaTFl4azRaWlo5KytCOXFSbl9KOFg2b2NoYkhyNDAzN21iQzhz
RGZzUnFEQUBtYWlsLmdtYWlsLmNvbT4NCgk8NjFiOWM5ZmItM2Q5Ny00NDgwLTgxNzEtYmNlOTg2
ZTY5OGE4QHN1c2UuY29tPg0KCTwzMTI2N2Q5Yi0wMjJmLTQ4YjUtYjU4My02ZDkzODBhMjI3NDBA
c3VzZS5jb20+DQpJbi1SZXBseS1UbzogPDMxMjY3ZDliLTAyMmYtNDhiNS1iNTgzLTZkOTM4MGEy
Mjc0MEBzdXNlLmNvbT4NCk1lc3NhZ2UtSUQ6IDxDQUZMQnhaWWZmYjNiT1M0Wno4bTJRWDUySjZW
OS1ab25heFBDVUxvcXlSTHBQS2gtVlFAbWFpbC5nbWFpbC5jb20+DQpTdWJqZWN0OiBSZTogTGlu
dXggUFYgZG9tVSB3aXRoID4xIHZDUFUgbmV2ZXIgcmVzdW1lcyBhZnRlciB4bCBzYXZlL3Jlc3Rv
cmUNCkZyb206IEdlb3JnZSBEdW5sYXAgPGd3ZEB4ZW5wcm9qZWN0Lm9yZz4NClRvOiA9P1VURi04
P0I/U3NPOGNtZGxiaUJIY20vRG53PT0/PSA8amdyb3NzQHN1c2UuY29tPg0KQ29udGVudC1UeXBl
OiBtdWx0aXBhcnQvYWx0ZXJuYXRpdmU7IGJvdW5kYXJ5PSIwMDAwMDAwMDAwMDA5YzcwMzUwNjU4
MzU1YjZmIg0KDQotLTAwMDAwMDAwMDAwMDljNzAzNTA2NTgzNTViNmYNCkNvbnRlbnQtVHlwZTog
dGV4dC9wbGFpbjsgY2hhcnNldD0iVVRGLTgiDQpDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiBx
dW90ZWQtcHJpbnRhYmxlDQoNCk9uIFR1ZSwgQXVnIDQsIDIwMjYgYXQgNjo0NT1FMj04MD1BRlBN
IEo9QzM9QkNyZ2VuIEdybz1DMz05RiA8amdyb3NzQHN1c2UuYz0NCm9tPiB3cm90ZToNCg0KPg0K
PiBQLlMuOiBHZW9yZ2UsIHdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIHR1cm4gb2ZmIEhUTUwgbWFp
bHMgd2hlbiBzZW5kaW5nIHRvDQo+ICAgICAgICB4ZW4tZGV2ZWw/DQo+DQoNCkkgc2VlIGJvdGgg
YSB0ZXh0L3BsYWluIHBhcnQgYW5kIGEgdGV4dC9odG1sIHBhcnQgaW4gdGhlIG1haWwgSSBzZW50
OyBpc24ndA0KdGhlIHByZXNlbmNlIG9mIGEgdGV4dC9wbGFpbiB2ZXJzaW9uIHN1ZmZpY2llbnQ/
DQoNCk9idmlvdXNseSBzZW5kaW5nIHBhdGNoZXMgaXMgYSBkaWZmZXJlbnQgbWF0dGVyOyBidXQg
Zm9yIHRoYXQgSSdsbCBiZSB1c2luZw0KZ2l0LXNlbmQtZW1haWwuDQoNCiAtR2VvcmdlDQoNCi0t
MDAwMDAwMDAwMDAwOWM3MDM1MDY1ODM1NWI2Zg0KQ29udGVudC1UeXBlOiB0ZXh0L2h0bWw7IGNo
YXJzZXQ9IlVURi04Ig0KQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogcXVvdGVkLXByaW50YWJs
ZQ0KDQo8ZGl2IGRpcj0zRCJsdHIiPjxkaXYgZGlyPTNEImx0ciI+PHNwYW4gc3R5bGU9M0QiYmFj
a2dyb3VuZC1jb2xvcjp0cmFuc3BhcmU9DQpudCI+T24gVHVlLCBBdWcgNCwgMjAyNiBhdCA2OjQ1
PUUyPTgwPUFGUE0gSj1DMz1CQ3JnZW4gR3JvPUMzPTlGICZsdDs8YSBocmU9DQpmPTNEIm1haWx0
bzpqZ3Jvc3NAc3VzZS5jb20iPmpncm9zc0BzdXNlLmNvbTwvYT4mZ3Q7IHdyb3RlOjwvc3Bhbj48
L2Rpdj48ZGk9DQp2IGNsYXNzPTNEImdtYWlsX3F1b3RlIGdtYWlsX3F1b3RlX2NvbnRhaW5lciI+
PGJsb2NrcXVvdGUgY2xhc3M9M0QiZ21haWxfcXU9DQpvdGUiIHN0eWxlPTNEIm1hcmdpbjowcHgg
MHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA9DQo0KTtw
YWRkaW5nLWxlZnQ6MWV4Ij48YnI+DQpQLlMuOiBHZW9yZ2UsIHdvdWxkIGl0IGJlIHBvc3NpYmxl
IHRvIHR1cm4gb2ZmIEhUTUwgbWFpbHMgd2hlbiBzZW5kaW5nIHRvPGI9DQpyPg0KPUMyPUEwID1D
Mj1BMCA9QzI9QTAgPUMyPUEweGVuLWRldmVsPzxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9k
aXY+PGRpdj5JPQ0KIHNlZSBib3RoIGEgdGV4dC9wbGFpbiBwYXJ0IGFuZCBhIHRleHQvaHRtbCBw
YXJ0IGluIHRoZSBtYWlsIEkgc2VudDsgaXNuJiMzPQ0KOTt0IHRoZSBwcmVzZW5jZSBvZiBhIHRl
eHQvcGxhaW4gdmVyc2lvbiBzdWZmaWNpZW50PzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkPQ0KaXY+
T2J2aW91c2x5IHNlbmRpbmcgcGF0Y2hlcyBpcyBhIGRpZmZlcmVudCBtYXR0ZXI7IGJ1dCBmb3Ig
dGhhdCBJJiMzOTtsbCBiPQ0KZSB1c2luZyBnaXQtc2VuZC1lbWFpbC48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2Pj1DMj1BMC1HZW9yZ2U8L2Rpdj48L2Rpdj48PQ0KL2Rpdj4NCg0KLS0wMDAwMDAw
MDAwMDA5YzcwMzUwNjU4MzU1YjZmLS0NCg==
--000000000000e4836606584bba67--

