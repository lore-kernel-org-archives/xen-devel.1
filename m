Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F01CA600B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 12:19:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443286.1660678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEn63-0006eF-05; Thu, 08 Oct 2026 12:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443286.1660678; Thu, 08 Oct 2026 12:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEn62-0006e7-Rx; Thu, 08 Oct 2026 12:19:38 +0000
Received: by outflank-mailman (input) for mailman id 1443286;
 Thu, 08 Oct 2026 12:19:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEn61-0006e1-PB
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 12:19:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEn61-003Cwz-1J
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 12:19:37 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEn61-00AJ65-1B
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 12:19:37 +0000
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5bcb3726952so1041433e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 05:19:37 -0700 (PDT)
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=HP6qqmm0I4lJJBoiO4TK3AioXVE4WsCl/RMtKYAT5VY=; b=WXyECy+l59Kplc+59GTcEEfUn+
	BHd8sTmULsNFK9JSzCq+B2YSmeN2GBI6oYGOwtHdSnOjFNDbsLucjUPfqFHjSXFkQBCJisDKll7Es
	/QzoVE0hHVjmxnHHStx7oe+Ij0MUEQQXZVXXcPaBWGjZP0bIyHnmNq0ABYV/2VzuQmlU=;
X-Forwarded-Encrypted: i=1; AKwUvBw2c0RovfCtd26ed16UnmYMqdx3RVwOTjiE859O++pAsYjJIaWh5+wJxO6bqXMr/YxUtwHjHESqiZU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKJL8EoJPMmh3AYiqG7HIi5754gSyfYnT04g571wynpHl7Ba7is
	qJrqOAp0U3fxehvNHdQ0Y7pY1Z4qDrl+uisc809Fl88YfyxNVZEBc6g3gLPUeavke4LD20ZCl7B
	Dh5wygnZf0O2mgo99CiGf+QuP6TaAfWI=
X-Received: by 2002:a05:6512:696:b0:5bb:7bdf:c884 with SMTP id
 2adb3069b0e04-5bcd074d646mr2068925e87.66.1791461976243; Thu, 08 Oct 2026
 05:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-3-gwd@xenproject.org>
 <asZRz9iFoTWXTVFx@Mac.lan> <41713068-b683-4971-af8b-1dea1bba500c@suse.com>
In-Reply-To: <41713068-b683-4971-af8b-1dea1bba500c@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 8 Oct 2026 13:19:23 +0100
X-Gmail-Original-Message-ID: <CAFLBxZb09gfYbX5ht70v17yW+S_UdvVmfjx2Wz6bWeHt_7Dy6A@mail.gmail.com>
X-Gm-Features: AclHuK9NIdfdIp0mnwPSfTZHlTSJ-9ysJotEZU72dkbLPSUkkRo8UnmjjXy0IEo
Message-ID: <CAFLBxZb09gfYbX5ht70v17yW+S_UdvVmfjx2Wz6bWeHt_7Dy6A@mail.gmail.com>
Subject: Re: [PATCH v3 02/18] x86/mm: purge unneeded destroy_perdomain_mapping()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 3:24=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 07.10.2026 16:06, Roger Pau Monn=C3=A9 wrote:
> > Otherwise LGTM, but I don't think I can RB or Ack it being also the
> > author.
>
> You can, as per earlier discussions of the topic. George's S-o-b effectiv=
ely
> implies an R-b on the code he's taken unchanged. Your R-b then covers the
> parts he has changed (and the overall result). That fulfills the 2-pairs-=
of-
> eyes requirement.

Yes -- relevant section from MAINTAINERS quoted below.  So basically,
the tags should look like:

Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@amd.com>

OK to add your R-b, Roger, pending comment tweaks?

 -Georeg

8<---

In the case where two people collaborate on a patch, at least one of
whom is a maintainer -- typically where one maintainer will do an
early version of the patch, and another maintainer will pick it up and
revise it -- there should be two Signed-off-by's and one Acked-by or
Reviewed-by; with the maintainer who did the most recent change
sending the patch, and an Acked-by or Reviewed-by coming from the
maintainer who did not most recently edit the patch.  This satisfies
the requirement #2 because a) the Signed-off-by of the sender approves
the final version of the patch; including all parts of the patch that
the sender did not write b) the Reviewed-by approves the final version
of the patch, including all patches that the reviewer did not write.
Thus all code in the patch has been approved by someone who did not
write it.

