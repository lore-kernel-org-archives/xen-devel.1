Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C478EC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:29:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406886.1640048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25cv-0006FN-PO; Thu, 03 Sep 2026 11:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406886.1640048; Thu, 03 Sep 2026 11:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x25cv-0006FF-Ld; Thu, 03 Sep 2026 11:29:05 +0000
Received: by outflank-mailman (input) for mailman id 1406886;
 Thu, 03 Sep 2026 11:29:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1x25ct-0006F9-RB
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:29:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1x25ct-003XNA-1r
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:29:03 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1x25ct-0005ZS-0u
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:29:03 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3a1eb6fa0f4so19511881fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:29:03 -0700 (PDT)
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
	d=xenproject.org; s=20200302mail; h=Content-Type:To:Subject:Message-ID:Date:
	From:MIME-Version; bh=lBpr1dHsh1/83EeGe2tnLAXLfvBy8CNmurnZ+bsrkX0=; b=0DvFVd+
	jb2R1ZZNmR9/y0afItpJIV5UDl4do1uKG+hHFdWAxrsiIoA0pjGn/h3kxA+lPJmCl+j0k3OiRRcbE
	jn1srf0AwEBWEHGc+9Afh6urUTklxn3r0tLvnITHbrLOb3aBn8D+620sGgM7NjIb2zdlbIofLmxWG
	LcfW/zsK5g=;
X-Gm-Message-State: AFuF++kKh/oBAqEOXHDMv5I2jyEMjJiSel6XjkUwv7PuLucMPilO4zLy
	HqyXJYJbBULq2yTPbbI4N32AyQabxpAeIyW4KpUk+YURdsr9D9pfHLj6RLj6QO2dPc815L+HiPf
	xdhGvnHQWVQ3JA2QxQxK27DwRqbx/ZIE=
X-Received: by 2002:a05:651c:4181:b0:3a2:6bdf:336 with SMTP id
 38308e7fff4ca-3a34fdec142mr25686861fa.14.1788434942138; Thu, 03 Sep 2026
 04:29:02 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Thu, 3 Sep 2026 13:28:51 +0200
X-Gmail-Original-Message-ID: <CAJbE=KztR0ug-VDLaSEOb=NHCvOQN9kya7SNyzP3+hrMcuNUnA@mail.gmail.com>
X-Gm-Features: AcwNN1WpsvuPq-6Y0YPo2qHrACFCqqLamwjdJuQPYSXNCbdbJzrsQlSOarIIN-w
Message-ID: <CAJbE=KztR0ug-VDLaSEOb=NHCvOQN9kya7SNyzP3+hrMcuNUnA@mail.gmail.com>
Subject: [ANNOUNCE] Community Call Today (and call for agenda items)
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000006e1c7d065a92754c"

--0000000000006e1c7d065a92754c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

It's time for the September Xen Project Community Call, happening today
(sorry for the short notice), Thursday, 3 September at 15:00 UTC.

Whether you have updates to share or just want to listen in, we'd love to
have you join. It's a great opportunity to hear what the community has been
working on, discuss ongoing project activities, and catch up on recent
developments.

*Preparation*

=F0=9F=91=89 Please take a few minutes to review and update the agenda befo=
re the
call:

https://cryptpad.fr/pad/#/2/pad/edit/RSWQntS-oB8CBZImS8YfxAgj/

Feel free to:
- Add topics or project updates
- Suggest anything we can drop or defer
- Include links to patches, mailing list threads, or documentation where
helpful

The agenda also includes the meeting link and a link to find your local
meeting time.


*Call Details*
Date: Thursday, 6 August 2026
Time: 15:00 UTC (agenda starts at 15:05 UTC)
Join: https://meet.jit.si/XenProjectCommunityCall

We'll open the room at 15:00 UTC and begin the agenda at 15:05 UTC to give
everyone a few minutes to join.

Want to be CC'd on future community call announcements?

Add or remove yourself from our sign-up sheet:
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

See you on in a few hours!



Cody Zuschlag
Xen Project - Community Manager

--0000000000006e1c7d065a92754c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit"><div style=3D"font-style:normal;font-=
weight:400;letter-spacing:normal;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:1px;font-size:inherit;background-color:rgba(0,0,0=
,0);border-color:rgb(0,0,0);color:rgb(0,0,0)" dir=3D"auto">Hi everyone,<br>=
<br>It&#39;s time for the September Xen Project Community Call, happening t=
oday (sorry for the short notice), Thursday, 3 September at 15:00 UTC.<br><=
br>Whether you have updates to share or just want to listen in, we&#39;d lo=
ve to have you join. It&#39;s a great opportunity to hear what the communit=
y has been working on, discuss ongoing project activities, and catch up on =
recent developments.<br><br><b style=3D"font-size:1rem;background-color:rgb=
a(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)">Preparation</b><br><br=
>=F0=9F=91=89 Please take a few minutes to review and update the agenda bef=
ore the call:<br><br><div style=3D"font-size:inherit"><a href=3D"https://cr=
yptpad.fr/pad/#/2/pad/edit/RSWQntS-oB8CBZImS8YfxAgj/" style=3D"font-size:in=
herit" target=3D"_blank">https://cryptpad.fr/pad/#/2/pad/edit/RSWQntS-oB8CB=
ZImS8YfxAgj/</a></div><br></div><div style=3D"font-style:normal;font-weight=
:400;letter-spacing:normal;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:1px;font-size:inherit;background-color:rgba(0,0,0,0);bo=
rder-color:rgb(0,0,0);color:rgb(0,0,0)" dir=3D"auto">Feel free to:<br>- Add=
 topics or project updates<br>- Suggest anything we can drop or defer<br>- =
Include links to patches, mailing list threads, or documentation where help=
ful<br><br>The agenda also includes the meeting link and a link to find you=
r local meeting time.<br><br><b style=3D"font-size:1rem;background-color:rg=
ba(0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)">Call Details<br></b><=
br></div><div style=3D"font-style:normal;font-weight:400;letter-spacing:nor=
mal;text-indent:0px;text-transform:none;white-space:normal;word-spacing:1px=
;font-size:inherit;background-color:rgba(0,0,0,0);border-color:rgb(0,0,0);c=
olor:rgb(0,0,0)" dir=3D"auto">Date: Thursday, 6 August 2026<br>Time: 15:00 =
UTC (agenda starts at 15:05 UTC)<br>Join:=C2=A0<a href=3D"https://meet.jit.=
si/XenProjectCommunityCall" style=3D"font-size:1rem;background-color:rgba(0=
,0,0,0);border-color:rgb(66,133,244);color:rgb(66,133,244)" target=3D"_blan=
k">https://meet.jit.si/XenProjectCommunityCall</a><br><br>We&#39;ll open th=
e room at 15:00 UTC and begin the agenda at 15:05 UTC to give everyone a fe=
w minutes to join.<br><br>Want to be CC&#39;d on future community call anno=
uncements?<br><br>Add or remove yourself from our sign-up sheet:<br><a href=
=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/" style=
=3D"font-size:1rem;background-color:rgba(0,0,0,0);border-color:rgb(66,133,2=
44);color:rgb(66,133,244)" target=3D"_blank">https://cryptpad.fr/pad/#/2/pa=
d/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>See you on in a few hours!</div=
></div><div><br clear=3D"all"><br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><i=
mg src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9a=
MXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"></div></div=
></div></div></div><div><div><div><div dir=3D"ltr" class=3D"gmail_signature=
" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><br><div>Cody Zuschla=
g</div><div>Xen Project - Community Manager</div></div></div></div></div>
</div>

--0000000000006e1c7d065a92754c--

