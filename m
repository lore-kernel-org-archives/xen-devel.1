Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403F9606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Ln5RKd+u
Received: from list by lists.xenproject.org with outflank-mailman.1463055.1674021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0uo-0008No-EX; Wed, 28 Oct 2026 10:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463055.1674021; Wed, 28 Oct 2026 10:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0uo-0008Nh-Bd; Wed, 28 Oct 2026 10:29:54 +0000
Received: by outflank-mailman (input) for mailman id 1463055;
 Wed, 28 Oct 2026 10:29:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM0un-0008Nb-SF
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 10:29:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM0un-00Af6f-94
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 11:29:53 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1820f0ebb000f79f@swg.vates.tech>)
 id 6ae1ce92-2eae-0a2a0a5409dd-0a2a4509dc60-34
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:29:53 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1820f0ebb000f79f@swg.vates.tech>)
 id 6ae1cea0-be1a-0a2a45090019-b9ff1c238ddd-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 11:29:53 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1820f0ebb000f79f.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 28 Oct 2026 10:29:47 +0000
Received: from l14 (areims-651-1-80-194.w90-18.abo.wanadoo.fr [90.18.187.194])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 6D92A83509;
 Wed, 28 Oct 2026 11:29:46 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=oM7KOaX6VYIVdfV4XMb2iaEBJtdIPAO5A7bZbhUGGuU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Ln5RKd+uyBIocE1piY60w3D7zqQgxx2x+cO4+FDdKQV00BruxjrIMnOst+OAxdIghmtYiZcgp
 2I6/QNMQARfQPXYNLdyQjKwQD/58H1mnw9wYoN+S1GbB3TgQOxi3e3M1F3RvVV+luOUFlWsrAn6
 11n9g0NVDZFFiD+x+UKGUcJc0+/Oz5pD9UNYwlMpLnOSuEQSIosrUZ3NK4Zq9VOxkA3G4Db7moJ
 nZL1+NT4l8JOmL6u79ZLiTRdHkkcf58osVWLAXC+7SuNLBQi9sMSf8gQZ2x79i0QILMBZqlKXTu
 seQflLlZKmd5/yNeqsazc/CxHuStEfFERPJRa9CkXDnQ==
X-Zone-Loop: ea7eaeee92fe54395ba15fdcf214a3447410c4e34a94
x-campaign-type: default
x-transaction-id: 9c87ed07-66c1-49fe-bb9a-983c08c370ff
x-swg-uid: 01-abb7c1ab-55d9-447b-85ae-e625e29646f2
X-Mailer: Sweego
Message-ID:
 <1793183387.8631fc262581453bbf619ec5b2062170.1a1820f0ebb000f79f@vates.tech>
x-swg-bid: 1793183387.8631fc262581453bbf619ec5b2062170.1a1820f0ebb000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
Date: Wed, 28 Oct 2026 11:29:46 +0100
From: Anthony PERARD <anthony.perard@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 1/6] Add a QTB container to run the Xen riscv64 tests
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823787.8631fc262581453bbf619ec5b2062170.1a0429a0db7000c4f3@vates.tech>
 <846f2ec6-da73-4f12-b46f-5e9f841e35ad@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <846f2ec6-da73-4f12-b46f-5e9f841e35ad@gmail.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.27f.811fb402820a95f1.1a1820f0be8.6028f5c9945de376=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1793183386600
X-purgate-ID: tlsNG-bad1c0/1793183393-FC610034-570353F1/10/63158204843
X-purgate-type: spam
X-purgate-size: 2933
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.27f.811fb402820a95f1.1a1820f0be8.6028f5c9945de376=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 03:28:26PM +0200, Oleksii Kurochko wrote:
> On 8/27/26 11:42 AM, Baptiste Le Duc wrote:
> > ---
> >   containerize                            |  1 +
> >   images/debian/13-qtb-riscv64=2Edockerfile | 45 +++++++++++++++++++++=
++++
>=20
> This is more a question for the CI maintainers: should this container
> live in test-artifacts at all?
>=20
> So far test-artifacts only holds containers for building its own
> artifacts (kernels, rootfs, microcode), which xen=2Egit then pulls in vi=
a
> cross-project needs:=2E The containers the xen=2Egit test jobs run in,
> including debian:13-riscv64, which already carries
> qemu-system-riscv64 for the test phase, and the hardware runner ones,
> are all built from automation/build/ in xen=2Egit and pulled from
> XEN_REGISTRY=2E
>=20
> Having it as automation/build/debian/13-qtb-riscv64=2Edockerfile in
> xen=2Egit would keep the container next to its only user, avoid the new
> ARTIFACTS_REGISTRY variable and the image: override in patch 6, and
> drop the "must land first" ordering between two repositories=2E

Indeed, the new container would fit better in the `xen=2Egit` tree=2E

And can you rename the container? I think the format is
"$distrib/$release-$arch-$comments"

I guess $arch here should be "x86_64", with the comment saying
"qtb-riscv64"=2E

> > diff --git a/images/debian/13-qtb-riscv64=2Edockerfile b/images/debian=
/13-qtb-riscv64=2Edockerfile
> > new file mode 100644
> > index 0000000=2E=2E86215d3
> > --- /dev/null
> > +++ b/images/debian/13-qtb-riscv64=2Edockerfile
> > @@ -0,0 +1,45 @@
> > +# syntax=3Ddocker/dockerfile:1
> > +FROM --platform=3Dlinux/amd64 debian:trixie-slim
> > +LABEL maintainer=2Ename=3D"The Xen Project"
> > +LABEL maintainer=2Eemail=3D"xen-devel@lists=2Exenproject=2Eorg"
> > +
> > +ENV DEBIAN_FRONTEND=3Dnoninteractive
> > +
> > +ARG QEMU_REPO=3Dhttps://gitlab=2Ecom/xen-project/people/amd/qemu=2Egi=
t
> > +ARG QEMU_COMMIT=3D24cd7e5c0d7e4db8e651f091d0b9da2e7c58dbab
> > +
>=20
> This commit is currently the tip of the 'safety' branch, and no tag
> points to it=2E If that branch gets rebased, the commit may become
> unreachable and the container will no longer rebuild=2E Could a tag be
> created for it in the fork?

I would rather keep the commit hash, but adding a comment that it's
the `safety` branch would be useful=2E

Having the container fails to build because the commit disappear is
better I think than having the test failed because the branch have
changed the way qtb is implemented=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.27f.811fb402820a95f1.1a1820f0be8.6028f5c9945de376=---

