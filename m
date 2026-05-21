Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7E1CD5BAC
	for <xen-devel@archiver.kernel.org>; Thu, 21 May 2026 13:11:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1315187.1585032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3Au-0005Nd-8U; Thu, 21 May 2026 13:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315187.1585032; Thu, 21 May 2026 13:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3Au-0005NW-5p; Thu, 21 May 2026 13:10:56 +0000
Received: by outflank-mailman (input) for mailman id 1315187;
 Thu, 21 May 2026 13:10:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4aa8f3cc000f373@swg.vates.tech>)
 id 1wQ3As-0005N4-IL
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 13:10:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ3Ar-0036UN-V9
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:10:53 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4aa8f3cc000f373@swg.vates.tech>)
 id 6a0f045c-5cb7-0a2a0a5109dd-0a2a450ae036-10
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:10:53 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4aa8f3cc000f373@swg.vates.tech>)
 id 6a0f045c-56b3-0a2a450a0019-b9ff1c22b5e3-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:10:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4aa8f3cc000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 21 May 2026 13:10:46 +0000
Received: from l14 (unknown [82.67.99.167])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4772B866C6;
 Thu, 21 May 2026 15:10:46 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=+zgSvlim6gRdCupTW4H21bdYQ4IwdPqT0BeBRo8Cn7s=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=LfMC+pArjoiP1nvfVdsmK29UgMkX7q44+DPqLvnlHLxzCnGsKmyTATjJ6TQVuAzlLlzFxZdn1
 ay5vaA4dX9lHhm2f4lJmFnIDnrDE3XnaHNEQFQYiKaRj3MhV8yMJZKaqRvdIk+/SQC7WQpcu1UK
 clkkbxkr9k5T/iPlZhK8fFFSAGXWALpIypkasFF+o4VPEKNM1nOB9v++NTo/kcQDpVQm4c3zY5i
 pVhOy1Rm7IHr1PXSN9ZLLnyf5aHPJDd+16adh8Myr25SyiMNGs9ACNrAs9fiySIEqmtTESnYlI6
 HVxBktIexN0CPrYAyRb5thddvOocxFsMlii34+mVTWhQ==
X-Zone-Loop: 7fd641c7608def934c8445d1eccb769459b160f92d1c
x-campaign-type: default
x-transaction-id: 213d17ae-20e8-4dd2-a84b-fc5fb827ac70
x-swg-uid: 01-be5ecac9-3414-44cd-9823-884a22860b65
X-Mailer: Sweego
Message-ID:
 <1779369047.8631fc262581453bbf619ec5b2062170.19e4aa8f3cc000f373@vates.tech>
x-swg-bid: 1779369047.8631fc262581453bbf619ec5b2062170.19e4aa8f3cc000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 21 May 2026 15:10:45 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH] Arm: do a 4th linking pass if necessary
References: <7b23e011-56b8-4f6c-bd55-83e1d9b0453f@suse.com>
 <1779293000.8631fc262581453bbf619ec5b2062170.19e46209296000f373@vates.tech>
 <e3a08386-7b3a-4127-9127-f484ff8bcac8@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3a08386-7b3a-4127-9127-f484ff8bcac8@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1119.e76aa2b3b30ea5b4.19e4aa8f1c7.4a35099588d3b533=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779369046472
X-purgate-ID: tlsNG-4011c0/1779369053-7C47E8B7-AE5D6594/0/0
X-purgate-type: clean
X-purgate-size: 2734

---=Part.1119.e76aa2b3b30ea5b4.19e4aa8f1c7.4a35099588d3b533=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 08:08:44AM +0200, Jan Beulich wrote:
> On 20=2E05=2E2026 18:03, Anthony PERARD wrote:
> > On Wed, May 20, 2026 at 01:53:34PM +0200, Jan Beulich wrote:
> >> +	then \
> >> +		$(LD) $(XEN_LDFLAGS) -T $(obj)/xen=2Elds $< $(build_id_linker) \
> >> +		    $(dot-target)=2E2=2Eo -o $(dot-target)=2E2; \
> >> +		$(NM) -pa --format=3Dsysv $(dot-target)=2E2 \
> >> +			| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
> >> +			> $(dot-target)=2E3=2ES; \
> >> +		$(MAKE) $(build)=3D$(@D) $(dot-target)=2E3=2Eo; \
> >=20
> > This new block ignore all errors, from LD, NM and MAKE=2E We want
> > a `set -e` before the if=2E
>=20
> Hmm, perhaps I should add that, yes, albeit =2E=2E=2E
>=20
> >> +		$(call compare-symbol-tables, $(dot-target)=2E2=2Eo, $(dot-target)=
=2E3=2Eo); \
> >=20
> > At least, an error returned by `diff` in that macro should be taken in=
to
> > account, for now=2E
>=20
> =2E=2E=2E I expect this would fail if there was an earlier error=2E

Yes, but that's fragile, and that's not how `make` behave=2E It's better i=
f
every command behave the same way, that is the recipe fails on the first
command that fail=2E So adding `set -e` would be useful=2E

> >> --- a/xen/scripts/Kbuild=2Einclude
> >> +++ b/xen/scripts/Kbuild=2Einclude
> >> @@ -65,7 +65,7 @@ define compare-symbol-tables
> >>      $(OBJDUMP) -t $(@D)/=2Ecst=2E$$$$ > $(1)=2Esym; \
> >>      ln -f $(2) $(@D)/=2Ecst=2E$$$$; \
> >>      $(OBJDUMP) -t $(@D)/=2Ecst=2E$$$$ > $(2)=2Esym; \
> >> -    rm -f $(@D)/=2Ecst=2E$$$$
> >> +    rm -f $(@D)/=2Ecst=2E$$$$; \
> >>      diff -u $(1)=2Esym $(2)=2Esym
> >=20
> > This macro is missing `set -e`, if both OBJDUMP command fails and crea=
te
> > an empty file, `diff` will return success=2E
>=20
> Whether to have "set -e" here is an independent question, I guess=2E To =
avoid
> the case you mention, maybe better
>=20
>       $(OBJDUMP) -t $(@D)/=2Ecst=2E$$$$ > $(1)=2Esym || rm -f $(1)=2Esym=
; \
>=20
> ?

That sounds fine=2E (Replacing all the `;` by `&&` would work too=2E)

> > But looks like `set -e` in
> > this macro isn't going to work in the condition of the `if`=2E
>=20
> Whereas the above would be compatible with both uses, I think=2E

Yes=2E


With at lest a `set -e` for the `if` block:
Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.1119.e76aa2b3b30ea5b4.19e4aa8f1c7.4a35099588d3b533=---

