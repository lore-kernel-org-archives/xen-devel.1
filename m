Return-Path: <SRS0=STq+=6T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56187C47247
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2020 21:59:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E82820752
	for <xen-devel@archiver.kernel.org>; Tue,  5 May 2020 21:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+MigUZp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E82820752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jW5aJ-0001Mg-E8; Tue, 05 May 2020 21:58:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NSdO=6T=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1jW5aH-0001Mb-Fs
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 21:58:37 +0000
X-Inumbo-ID: 920d9908-8f1b-11ea-b9cf-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 920d9908-8f1b-11ea-b9cf-bc764e2007e4;
 Tue, 05 May 2020 21:58:36 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id b188so44782qkd.9
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2020 14:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UA/FDN/AZmzTyESLz4DzMK+ojUvHNwC6JyTvHuyLC6I=;
 b=D+MigUZpu4+NbAqaht/10YOmvc1yZGsK8eQvPAMo/HPfTRFq5dpRBOtv3D6YxNSv+J
 tH3PrbMQnc57orn0DQGERvRprLeJVXlExc172W5pvr86HLms/2bwaeoLh+bNJDyn4PWl
 BXv/ZlNVbUfTF6cG4qY3Q+CKqtv9+Ak5S5cE03YqZjBReH/ZHny7HbJMShIwrGnZfuo8
 fChO7iL7K59s8BQFC3o8wZTZv5hLf2GJXVvNx0gmSisFCBAPNAivpcx4ylKeQNTsDBOt
 vc5yZBFHrAqwv0Gkq9Ikg/9ENs99S6cWZHmhPEIFfpb74nfo5k1pgUM0clxIvFPeCP7F
 gPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UA/FDN/AZmzTyESLz4DzMK+ojUvHNwC6JyTvHuyLC6I=;
 b=EX7Wqi65Rc/rpzkaq8S7IpADw718l+my/V1tz/8aGJQwVLK2GKgDp+kLRueECAOShn
 oB6ZagDg+8ezTNysvm+20wHNZSy9cEevCWnFi72odu2bfe7VWDrkLJ42WB2qGhVh3luO
 CHujnXRIsoyHhRploVqOK9v49zUjN1WO8gwNskJzG0lspZKoZ5yTGF6EDh0kEskCvlZd
 0qTNdlrZ2z4aQy7xtP8X/2GfnUfWFIkV3IceQ9rMyEl91jAYj0pSC0zIR+Z0ZtDxdR+e
 kDksfo9H8CwyOSexkN9Uz3eUwfluREnLFLb7l/MfOcWwsKZN8/tLJKXc97/vIDxt9Nei
 PjqA==
X-Gm-Message-State: AGi0PuZn10ZvytqSB4v3eiUo2pqOnuDJceCoaRwPUJoQ3y/3n1DfBRYl
 wZPxE5STtoUDdx7I61pU0Ag=
X-Google-Smtp-Source: APiQypJahDcebQMtoyWAHu+3eWyNvl+B3/0PMtj32ASJuoh0Qnr+LHHIwIj5m0QAwzxGGdj5jUFBmg==
X-Received: by 2002:a05:620a:7e8:: with SMTP id
 k8mr5818499qkk.183.1588715916144; 
 Tue, 05 May 2020 14:58:36 -0700 (PDT)
Received: from piano ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id d26sm145362qkk.69.2020.05.05.14.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 14:58:35 -0700 (PDT)
Date: Tue, 5 May 2020 16:58:33 -0500
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts
Message-ID: <20200505215833.GB301373@piano>
References: <20200429225108.GA54201@bobbye-pc>
 <ebdd7b4a-767b-1b72-a344-78b190f42ceb@suse.com>
 <20200430111501.336wte64pwsfptze@tomti.i.net-space.pl>
 <CAMj1kXF1vRtqbGS-eptB682h1xJ8LYQi74YaTZgM1nyYcpFsYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXF1vRtqbGS-eptB682h1xJ8LYQi74YaTZgM1nyYcpFsYA@mail.gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: michal.zygowski@3mdeb.com, Daniel Kiper <daniel.kiper@oracle.com>,
 krystian.hebel@3mdeb.com, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, olivier.lambert@vates.fr, piotr.krol@3mdeb.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 01:41:12PM +0200, Ard Biesheuvel wrote:
> On Thu, 30 Apr 2020 at 13:15, Daniel Kiper <daniel.kiper@oracle.com> wrote:
> > Anyway, the advantage of this new protocol is that it uses UEFI API to
> > load and execute PE kernel and its modules. This means that it will be
> > architecture independent. However, IIRC, if we want to add new modules
> > types to the Xen then we have to teach all bootloaders in the wild about
> > new GUIDs. Ard, am I correct?
> >
> 
> Well, if you are passing multiple files that are not interchangeable,
> each bootloader will need to do something, right? It could be another
> GUID, or we could extend the initrd media device path to take
> discriminators.
> 
> So today, we have
> 
> VendorMedia(5568e427-68fc-4f3d-ac74-ca555231cc68)
> 
> which identifies /the/ initrd on Linux. As long as this keeps working
> as intended, I have no objections extending this to
> 
> VendorMedia(5568e427-68fc-4f3d-ac74-ca555231cc68)/File(...)
> 
> etc, if we can agree that omitting the File() part means the unnamed
> initrd, and that L"initrd" is reserved as a file name. That way, you
> can choose any abstract file name you want, but please note that the
> loader still needs to provide some kind of mapping of how these
> abstract file names relate to actual files selected by the user.

This seems reasonable to me and I can't think of any good reason right
now, if we go down this path, to not just extend the initrd media device
path (as opposed to creating one that is Xen-specific).  It definitely
beats having a GUID per boot module since the number of modules changes
per Xen deployment, so there would need to be some range of GUIDs
representing modules specifically for Xen, and some rules as to how they
are mapped to real files.

It does seem simpler to ask the loader for "dom0's kernel" or "dom1's
initrd" and to have the loader use these references to grab real files.

> One thing to keep in mind, though, is that this protocol goes away
> after ExitBootServices().
> 

Roger that.


Thanks,

-Bobby

