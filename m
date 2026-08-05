Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467E6C55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383622.1626973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3V-000455-BH; Wed, 05 Aug 2026 14:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383622.1626973; Wed, 05 Aug 2026 14:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3V-00044b-0a; Wed, 05 Aug 2026 14:57:17 +0000
Received: by outflank-mailman (input) for mailman id 1383622;
 Wed, 05 Aug 2026 14:57:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3S-0003aY-Vv
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:57:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3S-00A5WQ-CG
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:57:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f46-bab6-0a2a0a5309dd-0a2a450a919c-6
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:14 +0200
Received: from [202.12.124.150] (helo=fout-b7-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f49-f2d2-0a2a450a0019-ca0c7c96d3d1-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:14 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id E9A701D00112;
 Wed,  5 Aug 2026 10:57:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Wed, 05 Aug 2026 10:57:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:57:11 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1785941832; x=1786028232; bh=2Vy1lzpSY6
	+3Xwm7/h9xeFzQJEpkpv/owElMc4Xp8Lc=; b=NYJbOasRE9L1E0wgi5mSk11pdQ
	ajDa8QGC6ERrlyAkrFHy5Y2tOk/b5yR0jQlN1RhLQAQy08MW7BBdi1tFrXNQgHje
	7VrwMOUCy9+WZPsbWvOsbIWbPmfp1e7x7IH4RpUXF1TrwC2EAsFsWFhXEr6NTRWn
	/UKYHXc3ucsuOdz0QWMRQfatVmUcj5uF/smWMheZLvrTPWzD6KlZ0ctzuNcprrix
	qstweGiFOqtnyC4CgzMVlil+ZsGf/gjsUHFdcilfFGbtHwcH3oFkkz0dwURMLY/C
	7j5Zgn6Y5orfGHLFc/x3pHhbahW8AJPhsCh4ndT86LB/uGHJZYyr4a1zWQFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941832; x=
	1786028232; bh=2Vy1lzpSY6+3Xwm7/h9xeFzQJEpkpv/owElMc4Xp8Lc=; b=g
	k6TFj1XhbIeAqdIDcFDGnd9mwKCfGRerxAFZ9KeSOdPXMOvOI2rOhuDRlWa6fCAo
	yVowXJDdQxkRM094uyJl6r+XFw4l1hmUiWt3NXA4xy5WYMS1ld5quTNIqaaOb5T7
	L0nB6EyYx85ZiLUm5N/ANXXSq2nwwNoXyy1d9d/sPiyKGVip7jN8WnvzLcEEiHh1
	l2vT8GERixtm7JYFUi4ljvZ8/fMyOwfivegxZ0C7mQr5KwmjOgTdoNQUh+s+qrLN
	51364xF+X0+rq673KbUHWhcm3kwJvQ/yG3O7HdwzzAQwCHw7KUM+BAs2ZcJhh9Js
	VyrEWrXQL9fQqOygpEZMg==
X-ME-Sender: <xms:SE9zaukDRHdvRPBwnSXEhX_sToO4aQE0PPb8Euw3fWqwQNKSLfhw6A>
    <xme:SE9zasvmcafuk7k7hkNetbXRDGJXgMUGtQ7mliwL1PaxSrID9J87QnibvVkFzg2pJ
    WWgpy0gH38GvoZRV-9EUxRwT9WHwE1erEEk_UxDUX-xjppnblY>
X-ME-Received: <xmr:SE9zak85EBHmp-1IXdjfB71S_iUlTsZfnBOLsooxM85u_pFtoWEPKwMPpWNThfHnIdavSpGP1ShDdwEg8QSh9rLY4zFSz39gClQ0OP45wq0>
X-ME-Proxy-Cause: dmFkZTEFsr3fiWkpZYryqooLx3kbh+Ts4f345KkT9gdVvpd9ekszqJy7VWnjK2PbrFj5LQ
    NitBf0PdEIBI/suHvnS0zYo/R5qRsLDQBrEmW499IT3EzTl2MaahwXqbjmFFNYGZpxZ/5b
    p4B7pJg15sYbnlZBXco7mxb3X542gdkXCEqYlJa8P5WQQB/RtX317N4YIN9ziiRafDhlGc
    89OM/jfJgDpS8wQRNYzsSDpchNxcRoX3QPKj3oUa0eRNoOX1hDQ02PPD1gK7dvYPchRjIC
    wwvd5eKYYqWlIYSB3GyrYxdAwo+eEieLgrN0OEb4P1KAx+i+QHw+JcyQdOgdE1KkSRVItB
    mkzmperyN8loa/AWp8P7Pk1f4qBZuhubAWJELqBgm1dUEJzT6AKDMTszOWO8Fs7Z2J3ynm
    vnc39N3M7rimyYF5McZ3rkDL1qWV52Ia6An64JFj5QboLVTOFuWonicd3WN55LMkwC6QWT
    p3AamUlSaYSUDJGgkCIrtHutRl5JaDUV8Zk9BSrcbPR7m4APkzjD9lP+7DJdlBGLRLUHjn
    jq0D/RSHxtpxJrrOZPAW3bw9lqaEg2vV7JfxfraS/J1NSC7B4mR3kI+oE8a3uMpleCBl9F
    aZTSNAJWiqTG9fxAcj0jIGEIZjoRrzCOC86VSpzL1NBylojRu2SoosdOraOQ
X-ME-Proxy: <xmx:SE9zauOK2rO9IW-xkAvXPfTaM3xbTNXq2d000_O9PGpo1WqjO70SqA>
    <xmx:SE9zaqHRLgVXosbUV4j5wgTebiJLvifW7Nrol68dQX9gSXL8I_jBCw>
    <xmx:SE9zakRBricJyK_D9ygIKGB5rWB9aD0XQnQNEYjz-jeLQIQwnjV-mg>
    <xmx:SE9zavspvuzjTH56JCYBJQm4_ChWP3xgtaiZM2QWy2LLA2d6mYCI-g>
    <xmx:SE9zalhOyvvWOjGeUDA5LkuhFLBSp3_D2nEfRcTWyJbtdmQkdFCdzKGO>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 13/13] CI: gate macos build jobs with MACOS_JOBS variable
Date: Wed,  5 Aug 2026 16:55:41 +0200
Message-ID: <1c63c71893b9cc2cb6cf2dacaad8fb96fab6cdb8.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1785941834-536D6CFC-9DEF1200/0/0
X-purgate-type: clean
X-purgate-size: 1483

The macos runners have limited availability (they aren't enabled for all
repositories, and have a monthly usage limit). Do not schedule macos
build jobs unless explicitly enabled with MACOS_JOBS=true variable.
Note: just setting the variable is not enough to have macos builds,
relevant runners need to be enabled too. Unfortunately there isn't any
built-in variable signaling runners availability.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v5

MACOS_JOBS=true wants to be set as a group variable in
xen-project/hardware group. Specifically, on this page:
https://gitlab.com/groups/xen-project/hardware/-/settings/ci_cd#ci-variables
---
 automation/gitlab-ci/build.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 27eefec5f9a5..85831f44838b 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -13,7 +13,7 @@
       - '*/*.log'
     when: always
   needs: []
-  rules:
+  rules: &build-rules
     - if: $BUILD_FOR_TESTS_ONLY
       when: never
     - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
@@ -806,6 +806,10 @@ debian-13-riscv64-gcc-randconfig:
 # macOS build jobs
 .macos-26:
   <<: *build
+  rules:
+    - if: $MACOS_JOBS != true
+      when: never
+    - *build-rules
   tags:
     - saas-macos-medium-m1
   image: macos-26-xcode-26
-- 
git-series 0.9.1

