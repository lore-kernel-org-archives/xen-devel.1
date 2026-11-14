Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DC6606A31E
	for <xen-devel@archiver.kernel.org>; Sun, 15 Nov 2026 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AbjyQl0H
Received: from list by lists.xenproject.org with outflank-mailman.1489362.1691021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSXEs-0005IG-OU; Sun, 15 Nov 2026 10:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1489362.1691021; Sun, 15 Nov 2026 10:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSXEs-0005Fb-HE; Sun, 15 Nov 2026 10:13:34 +0000
Received: by outflank-mailman (input) for mailman id 1489362;
 Sat, 14 Nov 2026 20:06:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chris@chrisdown.name>) id 1xSK0i-0002LG-0y
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 20:06:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSK0h-001vHR-E5
 for xen-devel@lists.xenproject.org; Sat, 14 Nov 2026 21:06:03 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chris@chrisdown.name>)
 id 6af8bef5-2eae-0a2a0a5409dd-0a2a4507a38e-32
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 21:06:03 +0100
Received: from [209.85.215.169] (helo=mail-pg1-f169.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chris@chrisdown.name>)
 id 6af8bf29-b4ea-0a2a45070019-d155d7a9e473-3
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 21:06:03 +0100
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-cdb628232d2so2076436a12.0
 for <xen-devel@lists.xenproject.org>; Sat, 14 Nov 2026 12:06:02 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b1b1e9ef15sm5258887a91.0.2026.11.14.12.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2026 12:06:00 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=chrisdown.name header.i="@chrisdown.name" header.h="User-Agent:Message-ID:Content-Disposition:Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686761; x=1795291561; darn=lists.xenproject.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=AbjyQl0HyfJF7cOtMOa+zkIcMT/XTeQuCrAzuHAEzWHogPmfHAvp+VAd/WYr23oMji
         bVM61Cxs/Rk5/gv/OLOPb+fUfC3s06hF4t31Pk+YkaoPDPjNIJuGuSWX6BYoHkqKISqs
         070ShKtoh+Xg9N/9wENvYZ0JH8+HqfdJQcRSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686761; x=1795291561;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=gQxNp+0MwcnPfMGcSoNI3ocZlpEDTmMOFrsrficayfULbT9ezbEZHujGGUIZegcG4j
         myb290LDOmHY9U3SG+r891U2uqZGjc/MAF0ZXWkjQU36A4DmRxzgwI6OMh2/WuDxDf9Y
         YesdKt8ySIyU20qD5wxIMK3qRgZGnje5DvomQm2iTQyiW1GQc2VG2gUlfCXwP7O8Un3v
         hpsBrYwoUcqks+VT8v0AsarjUpbKFyLKceQhp423cFB7d46bG5OgRGNptHKrqVZ9BuFv
         WG1mVXbcUsmPt5O+6wyBvVi+jzTHsemhEEDHcCmbbxx32kR0pYAks4GQOuo4Be80sgDm
         j6rg==
X-Forwarded-Encrypted: i=1; AL+hErGFaXXrZ6XnG4RahQgsK5jQ59eq77ry3D9fCnpsyvhm/G4WVaapetuXIS54QgOekCPBu/91tFiSFts=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8ufz1GX3HGuDXoB5NVQzaucRYfQwm1Bx6rF2MtfBjpGBWwNwlP
	tIstyIZ+5DWRgJGrBtnJWfcHC5UDFLDznlkS7xkzcUZ1wqiMyl/Wi8mc8GlojdQ7GAU=
X-Gm-Gg: AYBFou3Q2BOJdLG51bMiABoDj/an/W9nbW4POf1eqrUfDxtwrsGiX5OOnWV7+X03IK+
	4Sz+vUI4EUnXYioC1ubs9g4bOc9kwH+MMW/VEP4ipGvMpx8eOYXfVLt+XoBAyHDXrDdewrY3m9t
	2Lxq9ZshNqSN3f89LYgKA6T9bB0531feQQ1cB47ZxcE4D9p6pIUbAo85KzGh/kRH7US1mO0Idtb
	WmScJlNpCokzWFV+9lQUNTNLdqW7XYDMmtEEZ7mdC8xhrKmF+AVx36IlgVfqVcGHclZLyReNW8W
	CutAIy23Fk4KwXhmX9UVif4TGRfVNHQIA/g8ynZikpBIPb9FjpKcfpxQl6ENNzNR0vxUGNYw/6i
	dq4kTOnN3D9UXzIbc0vqh0ccWPd3DdYH6uoad0XIPwQsUCm1Paomkc2cgqQ9l30HuHv3FNKv3yH
	9oz8K239nZXIzdzcCGBeCfCI86DQaEGbRxqomPqdxgS2A3pqovPZYFNmT+7FWHUestAG3o40gUz
	+gfCm3L3TzkFo5a4Ps6pt3WpCcLgc8mbQ0ld1CNRT/kv7QlVJyjuCWGaX/G2MuAYn5pt35CGVet
	HKf7eplj3alKSaosJP3xPd5S64iq/iI4ax0WDJpXcsNMNZ8No9Nsu+yCgGolB0pXKYpPMfnYIuX
	995Ci/ME4WurfyrREHbZppOTnS1hZ1dLwwwBTfZtQUi7etW2jCfGEKV8dSrKgtDftGqK3YZBes4
	0GABjcUJAiaLK9BM4s1F6qd9qRQuk0zKbxdEr5RWVE1W285gZCLzJ/mFnm
X-Received: by 2002:a17:90b:2584:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b1b0ba61famr5629200a91.33.1794686761104;
        Sat, 14 Nov 2026 12:06:01 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:57 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
In-Reply-To: <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-purgate-ID: tlsNG-ef75cf/1794686763-37CD7AE4-5190CA85/0/0
X-purgate-type: clean
X-purgate-size: 1600
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Christian,

Christian Brauner writes:
>+	/* Look through stacking filesystems at the inode with the data. */
>+	if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEUDO)
>+		return -EINVAL;

This looks good in general, but what the bots said about O_PATH files
here is real. With FMODE_PATH this is reached for a file that was never
opened, so on overlayfs nothing has been through ovl_open() to look up
the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
itself, and when that fails it hits the WARN(1) at its end and returns
the overlayfs dentry, so the check passes as well.

Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
it's easy to trigger with that. From a quick test with a metacopy file
whose redirect into a data-only layer points at nothing, registering an
O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives

     ovl_d_real(/f, 0): real dentry not found
     WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
     [...]
      file_check_backing+0x308/0x5e0
      fuse_backing_new+0x219/0x4a0
      fuse_backing_open+0xe8/0x390
      fuse_dev_ioctl+0x53a/0x7d0

and the ioctl still succeeds. A normal open of that file fails with
ENOENT, so nothing could have used it as a backing file anyway, but with
panic_on_warn this is now a panic.

Maybe ovl_d_real() should just stop warning when the lookup fails, now
that it has a caller that isn't trace_uprobe? The check would still pass
for an O_PATH file whose lowerdata couldn't be looked up at that point,
though.

Thanks!

Chris

