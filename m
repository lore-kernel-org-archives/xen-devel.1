Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B46DC43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 15:30:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350163.1607716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewt7-0005Rh-Su; Wed, 01 Jul 2026 15:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350163.1607716; Wed, 01 Jul 2026 15:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewt7-0005Ra-QA; Wed, 01 Jul 2026 15:30:09 +0000
Received: by outflank-mailman (input) for mailman id 1350163;
 Wed, 01 Jul 2026 15:30:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wewt6-0005RD-Hx
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:30:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wewt6-0028zg-2D
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:30:08 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1wewt6-002mTL-11
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:30:08 +0000
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-39957d210f4so8123511fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 08:30:08 -0700 (PDT)
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
	From:MIME-Version; bh=T6mw+mMJOdl5hUTkEqale/uYDzDG6vIcz1q3yNEIq9k=; b=A0yH3+i
	Fo/3RuANBIEMnvgCvZgEAPYHUWKStFQdK/9paXjJ/4us6M7Vjf++z7KU7l7i03FsByDkfRQJfABDt
	4zP/HIkHGD2/eD5cFSdc7kbD7RGvUvMXDC6QW2tmdnHrjEKy/8m4dwzi6VxxcNGJqnhfmdh9hg+qC
	orOk5leqDY=;
X-Gm-Message-State: AOJu0Yxm4mJzaxthf6mgu/1TKKGWtb9a5YAIpzhd8VZMbq0CNokVauf4
	UhNoTU7sCwEn4miAuaV3PLunwALpMwd6LJdYcmgyAR3JeyY1LjKeZsrPyBNrZiQZDbFBl/Oz9bI
	KiM5Vk+c+4s7OlprJuD9jTOGRCaDjIoA=
X-Received: by 2002:a2e:b891:0:b0:39a:e3c7:6649 with SMTP id
 38308e7fff4ca-39b3406b5f9mr5869941fa.28.1782919807185; Wed, 01 Jul 2026
 08:30:07 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Wed, 1 Jul 2026 17:29:54 +0200
X-Gmail-Original-Message-ID: <CAJbE=Kxmq-2QLScjxVjXw5rg0SPky=6RL-GeuJVBjAbXjPOipg@mail.gmail.com>
X-Gm-Features: AVVi8Ce0T2c5gcTJQjHKfTk87pywHalYs-RoggO2ZWB09IhznD0KZAlbcYRlb2E
Message-ID: <CAJbE=Kxmq-2QLScjxVjXw5rg0SPky=6RL-GeuJVBjAbXjPOipg@mail.gmail.com>
Subject: [ANNOUNCE] - Call for agenda items for July 2 Xen Community Call @
 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c5384706558e5d83"

--000000000000c5384706558e5d83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

It=E2=80=99s time for the July Xen Project Community Call, happening tomorr=
ow,
Thursday, 2 July at 15:00 UTC.

We=E2=80=99d love to have you join. Whether you have updates to share or ju=
st want
to listen in, it's a great opportunity to hear what the community has been
working on and discuss ongoing project activities.


*Preparation:*=F0=9F=91=89 Please take a moment to review and update the ag=
enda ahead
of the call:
https://cryptpad.fr/pad/#/2/pad/edit/JItQI8jtCjrs3eM1SWSgjDgv/

Feel free to:
- Add topics or project updates
- Suggest anything we can drop or defer
- Include links to patches, threads, or documentation where helpful

The agenda also includes the meeting link and additional call details.


*Call Details:*Date: Thursday, 2 July 2026
Time: 15:00 UTC (agenda starts at 15:05 UTC)
Join: https://meet.jit.si/XenProjectCommunityCall

We'll open the room at 15:00 UTC and begin the agenda at 15:05 UTC to give
everyone a few minutes to join.

Want to be CC'd on future calls?

Add or remove yourself from our sign-up sheet:
https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/

See you tomorrow!

Best regards,

Cody Zuschlag
Xen Project - Community Manager

--000000000000c5384706558e5d83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,<br><br>It=E2=80=99s time for the July Xe=
n Project Community Call, happening tomorrow, Thursday, 2 July at 15:00 UTC=
.<br><br>We=E2=80=99d love to have you join. Whether you have updates to sh=
are or just want to listen in, it&#39;s a great opportunity to hear what th=
e community has been working on and discuss ongoing project activities.<br>=
<br><b>Preparation:<br></b>=F0=9F=91=89 Please take a moment to review and =
update the agenda ahead of the call:<br><a href=3D"https://cryptpad.fr/pad/=
#/2/pad/edit/JItQI8jtCjrs3eM1SWSgjDgv/">https://cryptpad.fr/pad/#/2/pad/edi=
t/JItQI8jtCjrs3eM1SWSgjDgv/</a><br><br>Feel free to:<br>- Add topics or pro=
ject updates<br>- Suggest anything we can drop or defer<br>- Include links =
to patches, threads, or documentation where helpful<br><br>The agenda also =
includes the meeting link and additional call details.<br><br><b>Call Detai=
ls:<br></b>Date: Thursday, 2 July 2026<br>Time: 15:00 UTC (agenda starts at=
 15:05 UTC)<br>Join: <a href=3D"https://meet.jit.si/XenProjectCommunityCall=
">https://meet.jit.si/XenProjectCommunityCall</a><br><br>We&#39;ll open the=
 room at 15:00 UTC and begin the agenda at 15:05 UTC to give everyone a few=
 minutes to join.<br><br>Want to be CC&#39;d on future calls?<br><br>Add or=
 remove yourself from our sign-up sheet:<br><a href=3D"https://cryptpad.fr/=
pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/">https://cryptpad.fr/pad/#/2/pad=
/edit/D9vGzihPxxAOe6RFPz0sRCf+/</a><br><br>See you tomorrow!<br><br>Best re=
gards,</div><div><br><img src=3D"https://ci3.googleusercontent.com/mail-sig=
/AIorK4x5nkRDCOFJDJAv9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqn=
Y6IaJUrl12" style=3D"background-color: transparent;"></div><div><div dir=3D=
"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>Cody Zuschlag</div><div>Xen Project - Community Manager</div>=
</div></div></div></div>

--000000000000c5384706558e5d83--

