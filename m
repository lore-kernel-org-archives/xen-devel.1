Return-Path: <SRS0=3Mnr=7R=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDEAC433E0
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2020 20:53:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77E492075B
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2020 20:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77E492075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgwr3-00045P-FD; Thu, 04 Jun 2020 20:52:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfFn=7R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jgwr1-00045K-Vu
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 20:52:48 +0000
X-Inumbo-ID: 57f02e4c-a6a5-11ea-9dbe-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57f02e4c-a6a5-11ea-9dbe-bc764e2007e4;
 Thu, 04 Jun 2020 20:52:46 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1kMOpVy3ctgqYlT+UbIEH6sLSUAD2XqAn/s1CTLwT/vgKdmqdxbmPM5Mv0eCQUb1t0ravf5nWy
 8jazkTu23leOedKQeuvXwO5N51v18RK6NwyjNj/Q6lrBBhi9ED6p4V+C+65fXf6K/qtD1YiOya
 bXtwgla+Wa6REtsgHMCGBNnFWzUd1/ao/fPYyklsPRcAXz9Ss3PHf9QptuxKoKkAo7ksXxISN+
 R0+6A7zs//anF7sSH++PZcddxvb4NtqnlYyn+3N666r6IPrkToezzAM1LNbQ+SFxjk5aL2Jmua
 8yY=
X-SBRS: 2.7
X-MesageID: 20027619
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,472,1583211600"; d="scan'208";a="20027619"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 RFC] docs/support-matrix: Gross bodge to unbreak docs
 rendering
Date: Thu, 4 Jun 2020 21:52:26 +0100
Message-ID: <20200604205226.14518-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, Jan
 Beulich <JBeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The cronjob which renders https://xenbits.xen.org/docs/ has been broken for a
while.  commitish_version() pulls an old version of xen/Makefile out of
history, and uses the xenversion rule.

Currently, this fails with:

  tmp.support-matrix.xen.make:130: scripts/Kbuild.include: No such file or directory

which is because the Makefile legitimately references Kbuild.include with a
relative rather than absolute path.

Rearrange $CWD of the make rune to be in xen/

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Paul Durrant <paul@xen.org>

This is obviously not a proper fix.  It will break in an unfixable way if we
ever delete a file from the xen/ build system.

I don't think pulling a makefile out of history and expecting it to work in
the current working tree is a reasonable expectation.
---
 docs/support-matrix-generate | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/support-matrix-generate b/docs/support-matrix-generate
index a3d93321f1..2a1c3fad57 100755
--- a/docs/support-matrix-generate
+++ b/docs/support-matrix-generate
@@ -102,8 +102,8 @@ commitish_version () {
     esac
 
     git cat-file blob "$commitish:$versionfile" >"$tmp_versionfile"
-    version=$(make --no-print-directory -C docs \
-                   -f "${tmp_versionfile#docs/}" xenversion)
+    version=$(make --no-print-directory -C xen \
+                   -f "../${tmp_versionfile}" xenversion)
     case "$version" in
         *.*.*) version="${version%.*}" ;;
     esac
-- 
2.11.0


