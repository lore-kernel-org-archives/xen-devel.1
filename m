Return-Path: <SRS0=KcDw=KB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A9FC433B4
	for <xen-devel@archiver.kernel.org>; Thu,  6 May 2021 14:00:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62BE86103E
	for <xen-devel@archiver.kernel.org>; Thu,  6 May 2021 14:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62BE86103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123532.232976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeXg-0003iO-5i; Thu, 06 May 2021 13:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123532.232976; Thu, 06 May 2021 13:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeXg-0003iH-1x; Thu, 06 May 2021 13:59:52 +0000
Received: by outflank-mailman (input) for mailman id 123532;
 Thu, 06 May 2021 13:59:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeXe-0003iB-Qx
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 13:59:50 +0000
Received: from mail-qk1-x734.google.com (unknown [2607:f8b0:4864:20::734])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc84a090-afb3-4664-8baf-d61aabdbd6c8;
 Thu, 06 May 2021 13:59:49 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id a22so4385115qkl.10
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 06:59:49 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.06.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:59:48 -0700 (PDT)
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
X-Inumbo-ID: dc84a090-afb3-4664-8baf-d61aabdbd6c8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wJPHvd3uXZn/zFCWAhnJJxqwOJkY4HFy/cNCIYr5uhI=;
        b=TlS7P/oafqjoWmOEY6hdfn/Uy3yJzrqiWQdzUwImeaNjKtMPkozlOWP3lHcxj8SQeU
         28ZltUWOrkvt9T59eY4RL1boZ4MwYUKA9OhAxtuBuo24uskLb9Ff50bZ285bG79sHRtE
         gljAXM9tXHGKkGNAJ8l5ksZYIEBXTQtOqORUKhVTTTa/LuxJTgwUjEIAb9j+tpbfYSGJ
         2URLkoOB6VSN0kn5FQ08wDXWEOsU4TAf8TEtyUw/CtCSkqM8y1tAtrUuHUvkbZBqRiGo
         w3vfSvButAqBKbM7+pmEa58vtDClbk02TF/aefOaR60wpAKr2+okl1TtF2OeIIPFGKkR
         qylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wJPHvd3uXZn/zFCWAhnJJxqwOJkY4HFy/cNCIYr5uhI=;
        b=UqHxgBXt3cI22FZHj+qnITwxbYNN+lEz096xex34Ix49vS0o8HoBU75arZVr69eEMY
         pqeroAgAGRrd7o4xqWX87lCL+3CWkYCvcHuQu5Za0iictpub4gSZiy720dhQH+za8Xzx
         hjFdITW7e1u/SXhNAwtFHbKyY9ZA0GYMbFYehwQck2GrNT7alvW8FOjNtJnuJuI43GYh
         q1lPlRRcoepSxOvVG2ZEhpDNRHpOSt974CK+KU56lyvrzY/odZ+O98NoEQaYEwoSuMIu
         3mKvanVvLaXTVII7Z41zgW8T1zUXsg/rWO9uoS/EBOR9BGWYCOf2/WGK+dn1NSrIVlMe
         pBgg==
X-Gm-Message-State: AOAM532iJ9ld+dtQuqoU1dw8cssL5dKbJK4/xFovGxwzDokLLBwVktYM
	GyqJVhir19wwEuUxq+vCt1FesHHKmbA=
X-Google-Smtp-Source: ABdhPJwPMblysiMTeE3oIEWgXNGAOX9GprQ24myuK+G2/9r4u2lzsfoDGkI5VWuUa7pAbLDqW0oa1Q==
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr4081232qkd.381.1620309589082;
        Thu, 06 May 2021 06:59:49 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 00/13] vtpmmgr: Some fixes - still incomplete
Date: Thu,  6 May 2021 09:59:10 -0400
Message-Id: <20210506135923.161427-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vtpmmgr TPM 2.0 support is incomplete.  There is no code to save the
tpm2 keys generated by the vtpmmgr, so it's impossible to restore vtpm
state with tpm2.  The vtpmmgr also issues TPM 1.2 commands to the TPM
2.0 hardware which naturally fails.  Dag reported this [1][2], and I
independently re-discovered it.

I have not fixed the above issues.  These are some fixes I made while
investigating tpm2 support.  At a minimum, "docs: Warn about incomplete
vtpmmgr TPM 2.0 support" should be applied to warn others.

This is useful for debugging:
vtpmmgr: Print error code to aid debugging

This fixes vtpmmgr output (also noted by Dag [3]):
stubom: newlib: Enable C99 formats for %z

This gives more flexibility if you are already using the TPM2 hardware:
vtpmmgr: Allow specifying srk_handle for TPM2

These are some changes to unload keys from the TPM hardware (so they
are not still loaded for anything that runs afterwards):
vtpmmgr: Move vtpmmgr_shutdown
vtpmmgr: Flush transient keys on shutdown
vtpmmgr: Flush all transient keys
vtpmmgr: Shutdown more gracefully

This lets vtpms initialize their random pools:
vtpmmgr: Support GetRandom passthrough on TPM 2.0

New in v2:
TPM2_GetRandom fix per Samuel:
vtpmmgr: Remove bogus cast from TPM2_GetRandom

Change ":" to "=":
vtpmmgr: Fix owner_auth & srk_auth parsing

Follow on from comments from Samuel
vtpmmgr: Check req_len before unpacking command

Fix for vtpm emulator to work with Linux 5.4
vtpm: Correct timeout units and command duration

Changes in v2:
Added R-by & Ack-by to 1-3,5-8
Updated #4 to use srk_handle=
Updated #7 commit message
Updated #9 per Samuel
Added #10-13

[1] https://lore.kernel.org/xen-devel/8285393.eUs1EhXEQl@eseries.newtech.fi/
[2] https://lore.kernel.org/xen-devel/1615731.eyaQ0j4tC5@eseries.newtech.fi/
[3] https://lore.kernel.org/xen-devel/3151252.0ZAaMuH7Fy@dag.newtech.fi/

Jason Andryuk (13):
  docs: Warn about incomplete vtpmmgr TPM 2.0 support
  vtpmmgr: Print error code to aid debugging
  stubom: newlib: Enable C99 formats for %z
  vtpmmgr: Allow specifying srk_handle for TPM2
  vtpmmgr: Move vtpmmgr_shutdown
  vtpmmgr: Flush transient keys on shutdown
  vtpmmgr: Flush all transient keys
  vtpmmgr: Shutdown more gracefully
  vtpmmgr: Support GetRandom passthrough on TPM 2.0
  vtpmmgr: Remove bogus cast from TPM2_GetRandom
  vtpmmgr: Fix owner_auth & srk_auth parsing
  vtpmmgr: Check req_len before unpacking command
  vtpm: Correct timeout units and command duration

 docs/man/xen-vtpmmgr.7.pod              | 18 +++++++
 stubdom/Makefile                        |  4 +-
 stubdom/vtpm-command-duration.patch     | 52 +++++++++++++++++++
 stubdom/vtpm-microsecond-duration.patch | 52 +++++++++++++++++++
 stubdom/vtpmmgr/init.c                  | 57 +++++++++++++--------
 stubdom/vtpmmgr/marshal.h               | 15 ++++++
 stubdom/vtpmmgr/tpm.c                   |  2 +-
 stubdom/vtpmmgr/tpm2.c                  | 15 ++++--
 stubdom/vtpmmgr/vtpm_cmd_handler.c      | 67 ++++++++++++++++++++++++-
 stubdom/vtpmmgr/vtpmmgr.c               | 12 ++++-
 10 files changed, 266 insertions(+), 28 deletions(-)
 create mode 100644 stubdom/vtpm-command-duration.patch
 create mode 100644 stubdom/vtpm-microsecond-duration.patch

-- 
2.30.2


