Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A990C531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 18:46:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371925.1619379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woQLL-0003tL-PT; Mon, 27 Jul 2026 18:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371925.1619379; Mon, 27 Jul 2026 18:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woQLL-0003tE-MV; Mon, 27 Jul 2026 18:46:27 +0000
Received: by outflank-mailman (input) for mailman id 1371925;
 Mon, 27 Jul 2026 17:13:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yannick.martin@okazoo.eu>) id 1woOtF-0001c6-NB
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 17:13:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woOtF-000MZt-0N
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 19:13:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yannick.martin@okazoo.eu>)
 id 6a6791ae-2eae-0a2a0a5409dd-0a2a4502af30-2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 19:13:20 +0200
Received: from [62.210.211.125] (helo=yop24.okazoo.eu)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yannick.martin@okazoo.eu>)
 id 6a6790fc-6ca4-0a2a45020019-3ed2d37d9f66-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 19:10:20 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=yop20250924 header.d=okazoo.eu header.i="@okazoo.eu" header.h="Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding"
Authentication-Results: yop24.okazoo.eu; arc=none smtp.remote-ip="2a01:cb01:3019:fd9:ce9c:d8bc:1d5f:86a2"
ARC-Seal: i=1; d=okazoo.eu; s=_arc_yop20260218; a=rsa-sha256; cv=none;
	t=1785172220;
	b=HFH4gozeKopYmh0ZVAnAei8sGTfTror5MSn2ixv0xIIvosUP6FklRX6nnSsZBRzqDXEm
	 oZFrhNguPBdAG4+wPW3wVIc6dZbma2B907ZcvYY0tzfGfYkW6qllgAjeQIyhXcSFKj5Zd
	 p5uWMCdzKow52wM9EbD8IJIbbZv/Nh7R8Ezzj5oR3iM5rNE+8w0NZrnEBIvcOc/qaSKez
	 fFSzBgI6N/sy5eGdHYgxPnufD/hozYWJYPArWzBIKaxltd7IYPSZAf9Zjc9bbYwALaOPq
	 95hx1JdHKAUxeVUJkhFR8B+JQLGp/IEIrh+t2WSKlP5FzT6k0sCT9Ozvw9V+Jd2fEdQ==
ARC-Message-Signature: i=1; d=okazoo.eu; s=_arc_yop20260218; a=rsa-sha256;
	c=relaxed/relaxed; t=1785172220;
	h=DKIM-Signature:Date:From:To:CC:Subject:User-Agent:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EGYuJVbvQvuUKXlCj9j7BBhC/teBJO6hWi6cmVejq0M=;
	b=DNeXWI2YxqOUeJCar9wQnPvG736n8+8ZTvDr9Y86rQRroCy27hmh06JTjhshVlenHb7n
	 AdpFdOuJCT209BtJFWD1c7qPoGzwt/QvLMLyoNKx1XfqYEPBaNtulB9CkTwalslN+xkTb
	 EHs093AUbgQkbLcDtB04+DiWJ4Uj/5JGYhY8KuGERitGbZam/vgK9WFV1G6W0jomyE6HS
	 uARAbcZDibZmYX61ytLtBRWVdiag7Ror7897LvnuAGi97U1B8w+1pPjcLULH2oKfX+Vx0
	 Z+kXW88UqGmEivAczdQiJIqJGWHZf3OnqJNlpTmqr/hD3tJvNBTNee7q+pCdDv5J+bA==
ARC-Authentication-Results: i=1; yop24.okazoo.eu; arc=none smtp.remote-ip="2a01:cb01:3019:fd9:ce9c:d8bc:1d5f:86a2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=okazoo.eu;
	s=yop20250924; t=1785172220; r=y;
	bh=EGYuJVbvQvuUKXlCj9j7BBhC/teBJO6hWi6cmVejq0M=;
	h=Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=QbjioxhCK7te+WamG1ZNE36wsxNCL2IanGTjizPYCCI5T5Xr9n1vMaXk4fVOWbOhg
	 3O2SXFLQ4JJC+JUSPlkkBZiPe7ub1RIsbQA+q3MfEqiZU+5SicgaD1ZaGrLXqzX/TR
	 TbdUHgzcQNG/Ub3JouqwvLe/4W77TJXK7yM0kdsrT8Z9MQiwIUrVh31Lx2rzjhhif1
	 8ZEHlX1R4MxRtVPVbW4vwUNjLX8RlGmEvfh8nzpym0bNR/Y2EHl7CtPfb5Nb9lHs4g
	 PxUhag9g7dPmLBFQKpiAD14sCZaEG4Zp8Mxy6FU/neaBrs5m1aatt2lOxPZThyDo/U
	 4hSDeYmsLUgoA==
Date: Mon, 27 Jul 2026 19:10:17 +0200
From: Yannick Martin <yannick.martin@okazoo.eu>
To: =?ISO-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
CC: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 yannick.martin+kernelorg@okazoo.eu
Subject: Re: [regression] Bug 221745 - PV DomU ballooning driver init issue
User-Agent: K-9 Mail for Android
In-Reply-To: <ameMgwuUIhZbslHh@macbook.local>
References: <f7fe5959-f0c6-430c-8404-927d7944c836@leemhuis.info> <ameMgwuUIhZbslHh@macbook.local>
Message-ID: <519EE50D-9B83-424F-8800-B19DFA81FD79@okazoo.eu>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----RS2PCMTCU78J3Q0Z5AR98WDC2C8USN
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1785172220-F2EB32AC-429A5DF7/13/0
X-purgate-type: clean
X-purgate-size: 7318

------RS2PCMTCU78J3Q0Z5AR98WDC2C8USN
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello

I will try this tomorrow !

Regards

Le 27 juillet 2026 18:51:15 GMT+02:00, "Roger Pau Monn=C3=A9" <roger=2Epau=
@citrix=2Ecom> a =C3=A9crit :
>On Mon, Jul 27, 2026 at 10:42:25AM +0200, Thorsten Leemhuis wrote:
>> Hi Roger! FYI, it seems your change 0949c646d64697 ("Partial revert
>> "x86/xen: fix balloon target initialization for PVH dom0"") [v7=2E0-rc1=
]
>> caued a regression=2E For details see
>> https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D221745
>>=20
>> To quote the initial comment:
>>=20
>> > Since commit db8c4b1 (Partial revert "x86/xen: fix balloon target ini=
tialization for PVH dom0"), xen ballooning fails to init correctly on domU =
(on amd64 arch) with the following configuration:
>> >=20
>> > -- xl=2Ecfg
>> > =2E=2E=2E
>> > memory      =3D '2048'
>> > maxmem      =3D '4096'
>> > =2E=2E=2E
>> > --
>> >=20
>> > -- domU balloon dmesg (init fails)
>> > [    0=2E908337] xen:balloon: Initialising balloon driver
>> > [    0=2E940721] Extra pages underflow current target
>
>Yeah, I'm afraid the original fix commit didn't fully fix the issues,
>so there's the following change (chunk below) that's needed
>additionally to cope with memory !=3D maxmem on PV guests=2E
>
>I've done some basic testing and it seems to solve the issue, could
>you give it a spin also?  (just to make sure I'm not missing anything
>else)=2E
>
>Thanks, Roger=2E
>---
>diff --git a/drivers/xen/balloon=2Ec b/drivers/xen/balloon=2Ec
>index e7f1d4ca6d75=2E=2Ec20a1ff8292d 100644
>--- a/drivers/xen/balloon=2Ec
>+++ b/drivers/xen/balloon=2Ec
>@@ -703,19 +703,26 @@ static int __init balloon_add_regions(void)
> 			balloon_append(pfn_to_page(pfn));
>=20
> 		/*
>-		 * Extra regions are accounted for in the physmap, but need
>-		 * decreasing from current_pages and target_pages to balloon
>-		 * down the initial allocation, because they are already
>-		 * accounted for in total_pages=2E
>+		 * For HVM domains: extra regions are accounted for in the
>+		 * physmap, but need decreasing from current_pages and
>+		 * target_pages to balloon down the initial allocation, because
>+		 * they are already accounted for in total_pages=2E
>+		 *
>+		 * For PV domains: extra regions are not accounted for in the
>+		 * initial memory target, and hence need adding to the stats as
>+		 * additional unpopulated regions=2E
> 		 */
> 		pages =3D extra_pfn_end - start_pfn;
>-		if (pages >=3D balloon_stats=2Ecurrent_pages ||
>-		    pages >=3D balloon_stats=2Etarget_pages) {
>+		if (xen_pv_domain()) {
>+			balloon_stats=2Etotal_pages +=3D pages;
>+		} else if (pages >=3D balloon_stats=2Ecurrent_pages ||
>+		           pages >=3D balloon_stats=2Etarget_pages) {
> 			WARN(1, "Extra pages underflow current target");
> 			return -ERANGE;
>+		} else {
>+			balloon_stats=2Ecurrent_pages -=3D pages;
>+			balloon_stats=2Etarget_pages -=3D pages;
> 		}
>-		balloon_stats=2Ecurrent_pages -=3D pages;
>-		balloon_stats=2Etarget_pages -=3D pages;
> 	}
>=20
> 	return 0;

------RS2PCMTCU78J3Q0Z5AR98WDC2C8USN
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">Hello<br><br>I will try this tom=
orrow !<br><br>Regards</div><br><br><div class=3D"gmail_quote"><div dir=3D"=
auto">Le 27 juillet 2026 18:51:15 GMT+02:00, "Roger Pau Monn=C3=A9" &lt;rog=
er=2Epau@citrix=2Ecom&gt; a =C3=A9crit :</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, =
204, 204); padding-left: 1ex;">
<pre class=3D"com-fsck-k9__plain-text-message-pre"><div dir=3D"auto">On Mo=
n, Jul 27, 2026 at 10:42:25AM +0200, Thorsten Leemhuis wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin-bottom: 1ex; --com-fsck-k9__b=
lockquote-default-border-color: #729fcf;"><div dir=3D"auto">Hi Roger! FYI, =
it seems your change 0949c646d64697 ("Partial revert<br>"x86/xen: fix ballo=
on target initialization for PVH dom0"") [v7=2E0-rc1]<br>caued a regression=
=2E For details see<br><a href=3D"https://bugzilla=2Ekernel=2Eorg/show_bug=
=2Ecgi?id=3D221745">https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D221=
745</a><br><br>To quote the initial comment:<br><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin-bottom: 1ex; --com-fsck-k9__blockquote-def=
ault-border-color: #ad7fa8;"><div dir=3D"auto">Since commit db8c4b1 (Partia=
l revert "x86/xen: fix balloon target initialization for PVH dom0"), xen ba=
llooning fails to init correctly on domU (on amd64 arch) with the following=
 configuration:<br><br>-- xl=2Ecfg<br>=2E=2E=2E<br>memory      =3D '2048'<b=
r>maxmem      =3D '4096'<br>=2E=2E=2E<br>--<br><br>-- domU balloon dmesg (i=
nit fails)<br>[    0=2E908337] xen:balloon: Initialising balloon driver<br>=
[    0=2E940721] Extra pages underflow current target<br></div></blockquote=
></blockquote><div dir=3D"auto"><br>Yeah, I'm afraid the original fix commi=
t didn't fully fix the issues,<br>so there's the following change (chunk be=
low) that's needed<br>additionally to cope with memory !=3D maxmem on PV gu=
ests=2E<br><br>I've done some basic testing and it seems to solve the issue=
, could<br>you give it a spin also?  (just to make sure I'm not missing any=
thing<br>else)=2E<br><br>Thanks, Roger=2E<hr>diff --git a/drivers/xen/ballo=
on=2Ec b/drivers/xen/balloon=2Ec<br>index e7f1d4ca6d75=2E=2Ec20a1ff8292d 10=
0644<br>--- a/drivers/xen/balloon=2Ec<br>+++ b/drivers/xen/balloon=2Ec<br>@=
@ -703,19 +703,26 @@ static int __init balloon_add_regions(void)<br> 			bal=
loon_append(pfn_to_page(pfn));<br> <br> 		/*<br>-		 * Extra regions are acc=
ounted for in the physmap, but need<br>-		 * decreasing from current_pages =
and target_pages to balloon<br>-		 * down the initial allocation, because t=
hey are already<br>-		 * accounted for in total_pages=2E<br>+		 * For HVM d=
omains: extra regions are accounted for in the<br>+		 * physmap, but need d=
ecreasing from current_pages and<br>+		 * target_pages to balloon down the =
initial allocation, because<br>+		 * they are already accounted for in tota=
l_pages=2E<br>+		 *<br>+		 * For PV domains: extra regions are not accounte=
d for in the<br>+		 * initial memory target, and hence need adding to the s=
tats as<br>+		 * additional unpopulated regions=2E<br> 		 */<br> 		pages =
=3D extra_pfn_end - start_pfn;<br>-		if (pages &gt;=3D balloon_stats=2Ecurr=
ent_pages ||<br>-		    pages &gt;=3D balloon_stats=2Etarget_pages) {<br>+		=
if (xen_pv_domain()) {<br>+			balloon_stats=2Etotal_pages +=3D pages;<br>+	=
	} else if (pages &gt;=3D balloon_stats=2Ecurrent_pages ||<br>+		          =
 pages &gt;=3D balloon_stats=2Etarget_pages) {<br> 			WARN(1, "Extra pages =
underflow current target");<br> 			return -ERANGE;<br>+		} else {<br>+			ba=
lloon_stats=2Ecurrent_pages -=3D pages;<br>+			balloon_stats=2Etarget_pages=
 -=3D pages;<br> 		}<br>-		balloon_stats=2Ecurrent_pages -=3D pages;<br>-		=
balloon_stats=2Etarget_pages -=3D pages;<br> 	}<br> <br> 	return 0;<br></di=
v></pre></blockquote></div></body></html>
------RS2PCMTCU78J3Q0Z5AR98WDC2C8USN--

