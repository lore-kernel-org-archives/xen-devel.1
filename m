Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3841606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 20:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=Yw6hjTRg
Received: from list by lists.xenproject.org with outflank-mailman.1493173.1693283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTPha-0006BW-Kn; Tue, 17 Nov 2026 20:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493173.1693283; Tue, 17 Nov 2026 20:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTPha-0006BO-HQ; Tue, 17 Nov 2026 20:22:50 +0000
Received: by outflank-mailman (input) for mailman id 1493173;
 Tue, 17 Nov 2026 20:22:49 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xTPhZ-0006B5-3D
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 20:22:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTPhY-005u3D-47
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 21:22:48 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afcb787-e002-0a2a0a5209dd-0a2a450cba82-14
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 21:22:47 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afcb797-f479-0a2a450c0019-d155dd36e0f7-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 21:22:47 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48b001cd92bso97495f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:22:47 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65560ab59sm640224f8f.29.2026.11.17.12.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 12:22:46 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794946967; x=1795551767; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0p5jYSv5PMZSE9lxhceKM5FD6QS1e9VhSderD6phkKY=;
        b=Yw6hjTRgLawvlhFm1qmLfFmQc+Y+NYqv+aH6nuW92XUZM6Sy2OBG5XGBxPJEqDS9uW
         0rDYyGxwxHrEHeopPrnH6x1c/Y4CYMar0UhP9xcEvSdJwmYsmMrog1KQhJRvDSfgQhEW
         4JQEE4lGMePMugL74D8aHb0tX5/qLSEiokAjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946967; x=1795551767;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0p5jYSv5PMZSE9lxhceKM5FD6QS1e9VhSderD6phkKY=;
        b=GiaT8xUTZlPj5BEvb571L544dGnVMvc4qcWcQqZPerT2+wfkfKuIhaS458O7hqT+Cu
         Wl8CmUEC8fX+AifKCW1AsO57E/t40y2v8K+3FPKEl4p4TjMyeUZ4FF2krDV8j9uuMeJU
         0GPDbxl3OrFkbGdgdgcgDxGY5FvnfAAdfF5NFuV08S/y2uH+VsfPoYWyKdHovyqqVf8W
         +cd1BVlQktVYIQmVrHc2N/De9+afema6CqAWRdF4OOuIofEjcuQ8YGh5T/LPyrTYmaF6
         nF31Ksyd/XYWzROsFa6hDCJPXTJu7r2++kwVWYk4beT9ArkJr01irpGsoOqUDnxNaD0p
         0VGg==
X-Gm-Message-State: APuU4Z8PsfUZYtpI83U40zWqKCcHCJfDaHizjNdA3aid6qb37SyksZ03
	u2rZ60YBxTNKbUr4eWtSFF6fpx4LCXMr3BMsHqBonxDLxcg+3UwyG97viGLwVRE/JZ4MdCkn3Kb
	b4GeOXnk=
X-Gm-Gg: AZFdTZc7CTWlVSHfsV6FYNOwxi5pUbxzdMBFl7EcxsQQo5WMdrvcsPPzyKKduzlfBiM
	XkBB4x+lQtACa6i+BwMe9Z8d5vpih/ovEdAAsPenBiDA2LJZRJJVtAUwYLdINymFE+IfG9VTwHz
	5MdzEVYBcTaWzPa1OAtCdsYOxAXnrcAUAXyCMTggH5IOhNv4EG79gQdAl/2QQyPj16wFQXNxt5G
	FZPxVSfzPZnezBjg1ccrnTxEzIrRxBEMbPcXCV54pkO4+Pmw0fEzfZtD5PHXCn52qVHr0V0AX1n
	Da3ppdDCdp/guSAeCviHlv9sFp5wJHFWK75QFmVf0h9F1oNzscHZ+jcQ6skiRuQuMQ5hI/dYmoY
	nfBlN0NO9Fxfnt9LIVWFQwqQQrC15ImZU6YJ5nGuAmkSzKxxPJntL6rqWMsBNUBp2/8ybUxv5ue
	qCh9U8XWQZ+fKZjDDIkBBVu8poCgZc89cXtKRuBbtkNyuimRDhTrwifrf36FJFNyydf/PG4nFAJ
	x0/WguFEcutyPx68TaP2ZN3IM7BV9C5vcAXNCvZxX4zM4BBu7nFHiREHinovkIdLBJKwcEc7SaP
	E4KwVMkgRqLL+7FQO+PtIR2+lR7gpP6ytpvg9wkQb6yJD2MKR7+dVzy1UJLZ4JBvL/RM2Fep79U
	oZHH13SMLu6jwevBFsOLG9Jbd
X-Received: by 2002:a05:6000:240e:b0:48e:4f1e:5e24 with SMTP id ffacd0b85a97d-4a638339786mr1250025f8f.14.1794946967216;
        Tue, 17 Nov 2026 12:22:47 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 0/2] xen/build-id: Further cleanup
Date: Tue, 17 Nov 2026 20:22:42 +0000
Message-Id: <20261117202244.4054656-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794946967-03CD3A5B-C2E174D3/0/0
X-purgate-type: clean
X-purgate-size: 613
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is the final piece of work 32b63424e4e4 "x86/EFI: Fix detection of
buildid" which is rather overdue a first posting.

v2: Fix pointer arithmatic, and allow for padding.

Andrew Cooper (2):
  xen/build-id: Introduce is_gnu_build_id()
  xen/build-id: Drop xen_build_id_check()

 xen/common/livepatch.c       | 11 ++-----
 xen/common/version.c         | 59 ++++++++++++++++++++----------------
 xen/include/xen/elfstructs.h |  2 ++
 xen/include/xen/version.h    |  4 +--
 4 files changed, 40 insertions(+), 36 deletions(-)


base-commit: ab77da87e9b38022341eb6a54593e681485d203a
-- 
2.39.5


