Return-Path: <SRS0=vhhj=7L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D26CC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:20:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46BD32074B
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46BD32074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jed3z-0006hM-Pa; Fri, 29 May 2020 11:20:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jed3y-0006g8-DW
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:20:34 +0000
X-Inumbo-ID: 554e1a0c-a19e-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 554e1a0c-a19e-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:20:00 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3P-0003xZ-8q; Fri, 29 May 2020 12:19:59 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 07/49] setupboot_grub2: Drop $submenu variable
Date: Fri, 29 May 2020 12:19:03 +0100
Message-Id: <20200529111945.21394-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
References: <20200529111945.21394-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

We really only used this to check how many levels deep in { we are.
That can be done by checking $#offsets, which is >0 if we are in a
submenu and not otherwise.  We lose the ability to report the start
line of the submenu, but that's OK.

But as a bonus, we no longer bomb out on nested submenus: previously
the first } would cause $submenu to be undef.  Now we pop from
@offsets and all is fine.

Nested submenus are present in Debian buster.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index ba975b87..b8bf67dc 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -452,15 +452,13 @@ sub setupboot_grub2 ($$$$) {
         my @offsets = (0);
         my $entry;
         my $chainentry;
-        my $submenu;
         while (<$f>) {
             next if m/^\s*\#/ || !m/\S/;
             if (m/^\s*\}\s*$/) {
-                die unless $entry || $submenu;
-                if (!$entry && $submenu) {
-                    logm("Met end of a submenu $submenu->{StartLine}..$.. ".
+                die unless $entry || $#offsets;
+                if (!$entry && $#offsets) {
+                    logm("Met end of a submenu at $. (@offsets) ".
                         "Our want kern is $want_kernver");
-                    $submenu= undef;
                     pop @offsets;
                     $offsets[$#offsets]++;
                     next;
@@ -510,7 +508,6 @@ sub setupboot_grub2 ($$$$) {
                 $offsets[$#offsets]++;
             }
             if (m/^\s*submenu\s+[\'\"](.*)[\'\"].*\{\s*$/) {
-                $submenu={ StartLine =>$., MenuEntryPath => join ">", @offsets };
                 push @offsets,(0);
             }
             if (m/^\s*chainloader\s*\/EFI\/osstest\/xen.efi/) {
-- 
2.20.1


