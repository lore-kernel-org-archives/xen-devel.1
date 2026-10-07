Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49C9CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 15:37:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442482.1660028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETi3-0001UP-ED; Wed, 07 Oct 2026 15:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442482.1660028; Wed, 07 Oct 2026 15:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETi3-0001UI-Bi; Wed, 07 Oct 2026 15:37:35 +0000
Received: by outflank-mailman (input) for mailman id 1442482;
 Wed, 07 Oct 2026 15:37:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1xETi2-0001U9-RM
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:37:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1xETi2-001gu6-1r
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:37:34 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1xETi2-003F2s-1g
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:37:34 +0000
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-3a98fc80925so14671891fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 08:37:34 -0700 (PDT)
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
	From:MIME-Version; bh=w+XKidOF5LxyFtTFhGjvoyegJV3ckygR4rxmKB8hda0=; b=ZkS2auj
	iWV24Xj+DG42EzP4OBT1I86/pXGCbnr5qGQ2Ow46rb/jvlBGDjKCQ+4m4h68X/aAqiD1Kzjp/bRYH
	72yT9OwK1asN1ndsPoghbGDEWt/9Rb4WNn9EmPJH4Nq8Js2v3nfYaf8R5wyTDE/kLJ5nPleBE71jN
	TjZhGFzGJ8=;
X-Gm-Message-State: AFq9FYJNPE3K9nJWP+MaOOnoVI5rkk8BjRrozfvwjiPemWg5ldmK/zs5
	W1G9o7vL3mN4eSYy0/l9v5QaIiA4/lzx0KrVQoF2kEcIWsXLu8TCWzj9ZAGCX4CMZx6JMs729fH
	YyZSInnGnM83MYC47WZArCHEw3QiKXpE=
X-Received: by 2002:a05:651c:b29:b0:3a9:74f3:17d5 with SMTP id
 38308e7fff4ca-3a9a2b8ec4emr6888291fa.3.1791387453444; Wed, 07 Oct 2026
 08:37:33 -0700 (PDT)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Wed, 7 Oct 2026 17:37:21 +0200
X-Gmail-Original-Message-ID: <CAJbE=KwN3tnT80RQ2h4nSVZ+U6O9P=MzrppEu26FEkBhSZmf2g@mail.gmail.com>
X-Gm-Features: AclHuK96hoj_DYbop9OlJ6I2_oQmr-Tqk6jKQ9OzN6rIp_3nR70-D6Vw38K_BXQ
Message-ID: <CAJbE=KwN3tnT80RQ2h4nSVZ+U6O9P=MzrppEu26FEkBhSZmf2g@mail.gmail.com>
Subject: [ANNOUNCE] Xen Community Call - Tomorrow, Thursday, 8 October at
 15:00 UTC
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000d155ee065d41e45f"

--000000000000d155ee065d41e45f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

It's time for the October Xen Project Community Call, happening tomorrow,
Thursday, 8 October 2026 at 15:00 UTC.

Whether you have updates to share or just want to listen in, we'd love to
have you join. It's a great opportunity to hear what the community has been
working on, discuss ongoing project activities, and catch up on recent
developments.

*Preparation*

=F0=9F=91=89 Please take a few minutes to review and update the agenda
<https://cryptpad.fr/pad/#/2/pad/edit/LrrH3UkzCoFKyBPPqN7TTxFu/> before the
call.

Feel free to:

   -

   Add topics or project updates
   -

   Suggest anything we can drop or defer
   -

   Include links to patches, mailing list threads, or documentation where
   helpful

We'll also follow up on Xen Summit 2026. The event was a success, and the
talks are now published. If you haven't already, please complete the
feedback survey
<https://docs.google.com/forms/d/e/1FAIpQLSeQUQXCbKYfrG_Nsrn74Gn09N9pokYzV4=
DDEestzCajPgzeAA/viewform?usp=3Dheader>
.

The agenda includes the meeting link and a link to find your local meeting
time.

*Call Details*

Date: *Thursday, 8 October 2026*
Time: *15:00 UTC (agenda starts at 15:05 UTC)*
Join: https://meet.jit.si/XenProjectCommunityCall

We'll open the room at 15:00 UTC and begin the agenda at 15:05 UTC to give
everyone a few minutes to join.

Want to be CC'd on future community call announcements?

Add or remove yourself from our sign-up sheet
<https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/>.

See you tomorrow!


Cody Zuschlag
Xen Project - Community Manager

--000000000000d155ee065d41e45f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><p>Hi everyone,</p><p>It&#39;s time for the October X=
en Project Community Call, happening tomorrow, Thursday, 8 October 2026 at =
15:00 UTC.</p><p>Whether you have updates to share or just want to listen i=
n, we&#39;d love to have you join. It&#39;s a great opportunity to hear wha=
t the community has been working on, discuss ongoing project activities, an=
d catch up on recent developments.</p><p><strong>Preparation</strong></p><p=
>=F0=9F=91=89 Please take a few minutes to <a href=3D"https://cryptpad.fr/p=
ad/#/2/pad/edit/LrrH3UkzCoFKyBPPqN7TTxFu/">review and update the agenda</a>=
 before the call.</p><p>Feel free to:</p><ul><li><p>Add topics or project u=
pdates</p></li><li><p>Suggest anything we can drop or defer</p></li><li><p>=
Include links to patches, mailing list threads, or documentation where help=
ful</p></li></ul><p>We&#39;ll also follow up on Xen Summit 2026. The event =
was a success, and the talks are now published. If you haven&#39;t already,=
 please <a href=3D"https://docs.google.com/forms/d/e/1FAIpQLSeQUQXCbKYfrG_N=
srn74Gn09N9pokYzV4DDEestzCajPgzeAA/viewform?usp=3Dheader">complete the feed=
back survey</a>.</p><p>The agenda includes the meeting link and a link to f=
ind your local meeting time.</p><p><strong>Call Details</strong></p><p>Date=
: <b>Thursday, 8 October 2026</b><br>Time: <b>15:00 UTC (agenda starts at 1=
5:05 UTC)</b><br>Join: <a href=3D"https://meet.jit.si/XenProjectCommunityCa=
ll">https://meet.jit.si/XenProjectCommunityCall</a></p><p>We&#39;ll open th=
e room at 15:00 UTC and begin the agenda at 15:05 UTC to give everyone a fe=
w minutes to join.</p><p>Want to be CC&#39;d on future community call annou=
ncements?</p><p><a href=3D"https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxA=
Oe6RFPz0sRCf+/">Add or remove yourself from our sign-up sheet</a>.</p><p>Se=
e you tomorrow!</p></div><div><br></div><div><div dir=3D"ltr" class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><img src=
=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJAv9aMXdZ0m=
ghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"><br><div>Cody Zus=
chlag</div><div>Xen Project - Community Manager</div></div></div></div></di=
v>

--000000000000d155ee065d41e45f--

