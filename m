Return-Path: <SRS0=vhhj=7L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7D2C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:36:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAF47207D4
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2020 11:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAF47207D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedIj-0003jb-1A; Fri, 29 May 2020 11:35:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5c=7L=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jedIg-0003hV-Ul
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:35:46 +0000
X-Inumbo-ID: 5ea31d30-a1a0-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ea31d30-a1a0-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:34:34 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jed3a-0003xZ-Ui; Fri, 29 May 2020 12:20:11 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 46/49] setupboot_grub2: Copy hv command line from grub
 to xen.cfg
Date: Fri, 29 May 2020 12:19:42 +0100
Message-Id: <20200529111945.21394-47-ian.jackson@eu.citrix.com>
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

This reuses all of the stuff that update-grub, etc., have put there.

In particular without this we never have flask=enforcing!

We have to do something about the ${xen_rm_opts} that appear in these
entries.  In principle there might be many variable expansions, but in
practice there is only this one It applies only to x86, and this use
of chainloading to xen.efi and reading xen.cfg applies only to arm64.
And anyway we weren't putting it these things in before.  So OK...

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/Debian.pm | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index de53c1ac..c18bf718 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -534,10 +534,11 @@ sub setupboot_grub2 ($$$$) {
                 $entry->{Hv}= $1;
                 $entry->{Chainload} = 1;
             }
-            if (m/^\s*multiboot2?\s+(?:\/boot)?\/(xen\-[0-9][-+.0-9a-z]*\S+)/) {
+            if (m/^\s*multiboot2?\s+(?:\/boot)?\/(xen\-[0-9][-+.0-9a-z]*\S+)\s+(.*)/) {
                 die unless $entry;
                 $entry->{Hv}= $1;
                 $entry->{Chainload} = 0;
+		$entry->{HvOpts} = $2;
             }
             if (m/^\s*multiboot2?\s+(?:\/boot)?\/(vmlinu[xz]-(\S+))\s+(.*)/) {
                 die unless $entry;
@@ -575,7 +576,7 @@ sub setupboot_grub2 ($$$$) {
             # Propagate relevant fields of the main entry over to the
             # chain entry for use of subsequent code.
             foreach (qw(KernVer KernDom0 KernOnly KernOpts
-                        Initrd Xenpolicy)) {
+                        Initrd Xenpolicy HvOpts)) {
 		next unless $entry->{$_};
 		die if $chainentry->{$_};
 		$chainentry->{$_} = $entry->{$_};
@@ -604,12 +605,14 @@ sub setupboot_grub2 ($$$$) {
 
 	if ($need_uefi_chainload) {
 	    my $entry= $parsemenu->();
+	    my $hvopts = $entry->{HvOpts};
+	    $hvopts =~ s/\$\{\w+\}//g; # delete these and hope!
 	    my $xencfg = <<END;
 [global]
 default=osstest
 
 [osstest]
-options=$xenhopt
+options=$hvopts
 kernel=vmlinuz $entry->{KernOpts}
 END
             $xencfg .= "ramdisk=initrd.gz\n" if $entry->{Initrd};
-- 
2.20.1


