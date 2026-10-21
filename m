Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E29606A31A
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 16:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=JpmSvb4V
Received: from list by lists.xenproject.org with outflank-mailman.1457426.1670239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJYlv-0000jT-8y; Wed, 21 Oct 2026 16:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457426.1670239; Wed, 21 Oct 2026 16:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJYlv-0000jM-5L; Wed, 21 Oct 2026 16:02:35 +0000
Received: by outflank-mailman (input) for mailman id 1457426;
 Wed, 21 Oct 2026 16:02:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xJYlu-0000jG-Jj
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 16:02:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xJYlu-00000005d0C-2znY
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 16:02:34 +0000
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xJYlu-00000006N7H-2nln
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 16:02:34 +0000
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3ab4891fc73so8104981fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 09:02:34 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=H7NULoOHNlw+dfwR3xwa/ClCFozBRW7oB/WH1dWqxvc=; b=JpmSvb4VSmIaJhfVo4qiCxSfhD
	lJwd9nCctK04TjQ83fHydLLFZyF1ftePfew512HBAOvFsgjLL6642YxaiSoa2f10OBfMPTCdKLPEm
	BaoBHIVwqM3Y/q/Y0dmVSqzE/G0SKXuBLPdYN9iukVtkRRSwUgCuNRhfpVXzjLfOKIqg=;
X-Gm-Message-State: AFq9FYJ2kdjYOyvDLWPvLQjPNKSZuuDmEXIp3hjyV+gIV8/mtfe0AirO
	ZujyK82WtnPpuzFwc34OvGvIaeDa9fyW1uohFQ6QNtiIaILBpnUqHpxqsE4AiUWmZEbzUosmFEs
	/1XwkFLm72o5CB0quEB3+Fl4by/CGt+g=
X-Received: by 2002:a05:651c:1990:b0:3a9:decc:71d8 with SMTP id
 38308e7fff4ca-3ac4420b02cmr7453761fa.20.1792598553366; Wed, 21 Oct 2026
 09:02:33 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
 <20261019-asi-hvm-v4-26-b68b66652266@xenproject.org> <44c485d8-1d57-4c59-9484-7c52303fbe2c@citrix.com>
In-Reply-To: <44c485d8-1d57-4c59-9484-7c52303fbe2c@citrix.com>
From: George Dunlap <gwd@xenproject.org>
Date: Wed, 21 Oct 2026 17:02:21 +0100
X-Gmail-Original-Message-ID: <CAFLBxZbVgmpRp+dTZYRqw4aCjeURpb2=k0-fmMfycFRnWPx99g@mail.gmail.com>
X-Gm-Features: AclHuK8x578LBIgoQB-OCsYcWBmumDpAD-i01nOkgTXPKlXk3PVX3vsBFfL5q8E
Message-ID: <CAFLBxZbVgmpRp+dTZYRqw4aCjeURpb2=k0-fmMfycFRnWPx99g@mail.gmail.com>
Subject: Re: [PATCH v4 26/30] x86/svm: clear the VMCB clean bits in svm_ctxt_switch_from()
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 10:22=E2=80=AFAM Ross Lagerwall
<ross.lagerwall@citrix.com> wrote:
> FYI I posted "x86/svm: Don't clear clean bits on every context switch" a =
few
> weeks ago which moves it into svm_do_resume(). I think that is preferable=
 for
> the reasons mentioned in the patch and IIUC would still be after the vCPU=
's
> VMCB is mapped.


OK; since yours is a single patch with two acks, I'll rebase onto yours.

Thanks,
 -George

