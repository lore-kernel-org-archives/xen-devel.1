Return-Path: <SRS0=FjyW=DQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF39C388EC
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2020 19:51:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8550E22282
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2020 19:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8550E22282
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5060.13001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQyQO-0001rN-5B; Fri, 09 Oct 2020 19:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5060.13001; Fri, 09 Oct 2020 19:51:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQyQO-0001rE-0I; Fri, 09 Oct 2020 19:51:32 +0000
Received: by outflank-mailman (input) for mailman id 5060;
 Fri, 09 Oct 2020 19:51:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
 id 1kQyQM-00017t-Nr
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:51:30 +0000
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68e21de4-db08-48c0-a407-2cd0dfe15bf7;
 Fri, 09 Oct 2020 19:51:16 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:16 -0700
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:15 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lMaC=DQ=intel.com=ira.weiny@srs-us1.protection.inumbo.net>)
	id 1kQyQM-00017t-Nr
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 19:51:30 +0000
X-Inumbo-ID: 68e21de4-db08-48c0-a407-2cd0dfe15bf7
Received: from mga18.intel.com (unknown [134.134.136.126])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 68e21de4-db08-48c0-a407-2cd0dfe15bf7;
	Fri, 09 Oct 2020 19:51:16 +0000 (UTC)
IronPort-SDR: xu2zdTr/OuPgqZUiJmtWsW/7B3mrCCwnks9bx2Meq/ltxzmXA//3yXGuOXmgr0dQSn38fBYOaw
 KbopyuSKWrQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="153363398"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="153363398"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:51:16 -0700
IronPort-SDR: JrRKqLJV6Da/4fMbj+O46I413eP5nzJr39umbL7Y1s6mKMem5hJdGDAmJBrAS4XWsKikzHiU+3
 eSwE6XBZdj5A==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="518800998"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:51:15 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	x86@kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvdimm@lists.01.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	devel@driverdev.osuosl.org,
	linux-efi@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-aio@kvack.org,
	io-uring@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-um@lists.infradead.org,
	linux-ntfs-dev@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	cluster-devel@redhat.com,
	ecryptfs@vger.kernel.org,
	linux-cifs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-cachefs@redhat.com,
	samba-technical@lists.samba.org,
	intel-wired-lan@lists.osuosl.org
Subject: [PATCH RFC PKS/PMEM 08/58] drivers/firmware_loader: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:49:43 -0700
Message-Id: <20201009195033.3208459-9-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this driver are localized to a single thread.  To
avoid the over head of global PKRS updates use the new kmap_thread()
call.

Cc: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/base/firmware_loader/fallback.c | 4 ++--
 drivers/base/firmware_loader/main.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index 283ca2de76d4..22dea9ba7a37 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -322,14 +322,14 @@ static void firmware_rw(struct fw_priv *fw_priv, char *buffer,
 		int page_ofs = offset & (PAGE_SIZE-1);
 		int page_cnt = min_t(size_t, PAGE_SIZE - page_ofs, count);
 
-		page_data = kmap(fw_priv->pages[page_nr]);
+		page_data = kmap_thread(fw_priv->pages[page_nr]);
 
 		if (read)
 			memcpy(buffer, page_data + page_ofs, page_cnt);
 		else
 			memcpy(page_data + page_ofs, buffer, page_cnt);
 
-		kunmap(fw_priv->pages[page_nr]);
+		kunmap_thread(fw_priv->pages[page_nr]);
 		buffer += page_cnt;
 		offset += page_cnt;
 		count -= page_cnt;
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 63b9714a0154..cc884c9f8742 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -409,11 +409,11 @@ static int fw_decompress_xz_pages(struct device *dev, struct fw_priv *fw_priv,
 
 		/* decompress onto the new allocated page */
 		page = fw_priv->pages[fw_priv->nr_pages - 1];
-		xz_buf.out = kmap(page);
+		xz_buf.out = kmap_thread(page);
 		xz_buf.out_pos = 0;
 		xz_buf.out_size = PAGE_SIZE;
 		xz_ret = xz_dec_run(xz_dec, &xz_buf);
-		kunmap(page);
+		kunmap_thread(page);
 		fw_priv->size += xz_buf.out_pos;
 		/* partial decompression means either end or error */
 		if (xz_buf.out_pos != PAGE_SIZE)
-- 
2.28.0.rc0.12.gb6a658bd00c9


