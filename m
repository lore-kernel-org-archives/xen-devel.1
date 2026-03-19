Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF7C109023F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2026 16:18:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1257366.1551773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3G4V-00079N-5U; Thu, 19 Mar 2026 16:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257366.1551773; Thu, 19 Mar 2026 16:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3G4V-00079G-2W; Thu, 19 Mar 2026 16:18:07 +0000
Received: by outflank-mailman (input) for mailman id 1257366;
 Thu, 19 Mar 2026 16:18:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n+rE=BT=bounce.vates.tech=bounce-md_30504962.69bc21b9.v1-0b87f5854ab040218873617115d9bbae@srs-se1.protection.inumbo.net>)
 id 1w3G4T-000793-8K
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 16:18:05 +0000
Received: from mail180-47.suw31.mandrillapp.com
 (mail180-47.suw31.mandrillapp.com [198.2.180.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33d6b1ec-23af-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 17:18:02 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-47.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4fc9pd3jLkzPm2yq6
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 16:18:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0b87f5854ab040218873617115d9bbae; Thu, 19 Mar 2026 16:18:01 +0000
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
X-Inumbo-ID: 33d6b1ec-23af-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773937081; x=1774207081;
	bh=wzUqvCnsIqLXiPsWyNYRg9g86MGyPS804TPa6RYOzMA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DPFvBrj7JgWAYFaVr2E7JYOy8GWqRz6LbwTLn5b84FIjyj8+I65uA8KKzrzUg/DtO
	 lZ/4eFLcaEQuTiJOAPPlZbCGvwlAHzsUQlWoXFIWzII9ir759jq2XUfpvwbrzYwzPN
	 KoTuu0xqeWNncppw/RWcSKIF7CvwcIg+D1SV/ukWh202BEpgjxTtU51tMzAnFmkbCV
	 MDcER41h/BF1h1/sJgDEfLxL4kvZHdPs14OsNMU0smKjAcpm245+mVgTsRAyByqbyb
	 5TOBPa7hAKtCZVpomxLyQ2j4rJTARX5dlShr8FYro3nnRzjLyCrY/pqzXeW368QJxH
	 F/KSftoLT0bag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773937081; x=1774197581; i=thierry.escande@vates.tech;
	bh=wzUqvCnsIqLXiPsWyNYRg9g86MGyPS804TPa6RYOzMA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OUF2AHaAmF1LcPjX6QxZNE67HtjtcMgkbhaH5i/s1gn2rjGMhCphiSzDqqLwUDvn+
	 TAlFLMD67ON1CeRsIpAYZQqmg5Vf+ruZsIi3MRt79Rjk1CDvfECBZfPWGmv0rI1McI
	 O+X/XCSrCsYowTFY8Kd35GTjDyWKd1M5Ce1lcoZg7zVx/0l9bFJ7aPbKeIG9oQhZzc
	 MT9Da8xmJrdGGOQ+a81O7iP8yVWTxxTLy/v9r3X1tCXwTEaPNtMW4geB2fJeEhUDO0
	 AbBLekDLtXTf8LojUrOxKTqOv5F8dtgNbUVPwhScEiyRCzOLNYkKinj1zJeikMcbkf
	 gPekhcDaZWXzQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20install.sh:=20Preserve=20directory=20symlinks?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773937078651
Message-Id: <d7023a03-778b-411f-a542-e7a63ac6f48c@vates.tech>
To: "Jason Andryuk" <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: "Anthony PERARD" <anthony.perard@vates.tech>
References: <20260313172456.871518-1-thierry.escande@vates.tech> <56e0c738-76cc-4883-afc9-1d76d211ee0e@amd.com>
In-Reply-To: <56e0c738-76cc-4883-afc9-1d76d211ee0e@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0b87f5854ab040218873617115d9bbae?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 16:18:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 3/16/26 16:37, Jason Andryuk wrote:
> On 2026-03-13 13:25, Thierry Escande wrote:
>> In various distros (i.e. Debian) some folders like /lib or /var/run are
>> symlinks. Using the tar option --keep-directory-symlink preserves these
>> symlinks.
>>
>> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> 
> Coincidentally, I hit this last week.=C2=A0 I think the commit message sh=
ould
> be expanded because it resulted in a non-functioning system.=C2=A0 I swit=
ched
> to make debball, but thanks for fixing this.
> 
> I saw Ubuntu's /lib -> /usr/lib symlink replaced with a directory for /
> lib/systemd/system/xen-watchdog-sleep.sh.=C2=A0 With /lib broken, systemd=
 (/
> sbin/init) could not start and boot fails.
> 
> The fix was easy -=C2=A0 just restoring the /lib symlink.
> 
> So maybe add "Replacing the /lib symlink with a directory results in a
> non-functioning system."?
> 
> I thought /var/run was addressed by:
> Fixes: 9d628ff6cc21 ("tools: Fix install.sh for systemd")
> It hasn't been an issue for me since that change.

I thought it was still the case but my current config does not install
files in /var/run anymore, so I missed that fix. Thanks for pointing
this out.

> 
> For /lib a fixes is either:
> Fixes: e54a6cd6a1f3 ("systemd: Add hooks to stop/start xen-watchdog on
> suspend/resume")
> 
> or
> 
> Fixes: b34bde262c8c ("systemd: fall back to default system-sleep dir
> without systemd-devel")
> 
> It might have only been the second one that defaulted to /lib causing
> the problem.=C2=A0 Though the issue is more general.
> 
> I do think a fixes and backport are warranted.=C2=A0 With the commit mess=
age
> updated:

After discussing with Jan, I will send a v2 that uses the more standard
option -h instead of --keep-directory-symlink and updates the commit
message.

Regards,



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



