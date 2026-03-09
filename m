Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5FCF3C246
	for <xen-devel@archiver.kernel.org>; Mon,  9 Mar 2026 12:18:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1249369.1546836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZYa-0001L3-Sl; Mon, 09 Mar 2026 12:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249369.1546836; Mon, 09 Mar 2026 12:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZYa-0001Kr-Pl; Mon, 09 Mar 2026 12:17:56 +0000
Received: by outflank-mailman (input) for mailman id 1249369;
 Mon, 09 Mar 2026 12:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akxf=BJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vzZYZ-0001Jp-Ix
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:17:55 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe727f8e-1bb1-11f1-b164-2bf370ae4941;
 Mon, 09 Mar 2026 13:17:52 +0100 (CET)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 88508EC0273;
 Mon,  9 Mar 2026 08:17:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Mon, 09 Mar 2026 08:17:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Mar 2026 08:17:50 -0400 (EDT)
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
X-Inumbo-ID: fe727f8e-1bb1-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1773058671; x=1773145071; bh=xqkqiee5wa
	QOwJic/qsVej/NyQDtai116ygtpOvqQAM=; b=Sma89FvAZfg+PfEybOMR7l/fwT
	rxENHYi4ncZEa/Cg+/5PzFbUUvwuinrTDsBQn7HkwnumkDeFXEGob8/urYR50baK
	KKncY2UTXLfQKHjyZXzIBHBv/Py2Jpa1jbYo2yPGipUoTyx1Ur/e0sjUYc7o0h+j
	ywa+7LxcqG5EoIQaRrtxkfo1Y/tATDtOskwUuXcC6j3AzZIUo0OhX11bTA9NsrUs
	Hj1bVc+93nY5ENe9TSWYH8JA3ZSesapebYIeDyZjw6525B/jRZG0SqNaEzud8CEb
	YPnnkRJFfrV0IklTGSuGceBLrYazGDHyOyRPmLsozdy1PRCnBX7Nu346xpzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773058671; x=
	1773145071; bh=xqkqiee5waQOwJic/qsVej/NyQDtai116ygtpOvqQAM=; b=o
	3iJf9fGiYSG9zva9TE/RZ7hSCNjmmW6wXi4FKXEC+5meY9aPS80pmTumuDiyxO7g
	77YfnaYpXPF/7WPg+gTlyBkvXykVWlpZO4Om4XhspdH9oZfKPdG13UzrInX2EiV8
	bS3jq3pxx48r32/u5C/zDOx5wKGPX6Zsfy1MkavSS4F7wG3SDdWaJdLSyO0Ezl/g
	9dpM6OKMlm6mmlZ8ijSt//ypG1zO4IwPfJ8eaMOmR7mFQFitQqmX5iHEUUf6X34F
	/Rqm9NFp+sVeaCPeGVk9GBLdUODZOTpLBMD/olink7HCU3vpGB4Gop7nzBWlh2mU
	33H2yW+SpGJGZOiNzcJnQ==
X-ME-Sender: <xms:b7quaWwcuRy8ZenpEmZ5o6I72EvhI1iaNyToJhaMFQyZPh2gP-WPPQ>
    <xme:b7quacWBN7hwKqDPtK8DcjAyie6VDpBX950KpCOG6tYBuzlKOgt71hJlaSjUWeNEe
    vB4ZQ1y2741gk5KBYAPii78E3w6y0Xei3K4Sa1dJjnYIQs>
X-ME-Received: <xmr:b7quaYOarzkovhs_jM9QfO78FmYgGw9UUHtugkEVV9rHi5QJLWxX_iq27PsYNIF64yoJSONel5dCDUjyCCn21og4ek-XoCB98UfWE3dRDBI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjeektdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefguedu
    hefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeejpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohhumhihrghjhihothhishgrrh
    hkrghrvdefsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhi
    shhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopegrrhgusges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlihgrshdrrghprghlohguihhmrghsse
    hlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgvfhhisehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:b7quaeB2w-2PSr7ho1pTIpPcMe22EpMBM7lIOmVQrMwXrbI4vqP7eg>
    <xmx:b7quaVebE0NZxnFhjln5iYJ_P1RKQ0AtxQuJ-q7_YpU-5mbuwZuPzA>
    <xmx:b7quadNrBkjiFVOBTTZ2L0zzUXSG1TmqyW8iDNjauElcLkXwZqPFcQ>
    <xmx:b7quaVIJXvg9OtXLvdZ5BriDUfDUBG7WES-EdZ95N5jeCYb-ngJQHA>
    <xmx:b7quacEMpCO7V6N7R3P4Cbvki42lQAfkh1ZhVMidq10KPBwQAvUrOUtA>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE (EFI))
Subject: [PATCH 1/2] efi: make efi_mem_type() and efi_mem_attributes() work on Xen PV
Date: Mon,  9 Mar 2026 13:17:22 +0100
Message-ID: <952b54025f836c19f57d7207d3881cacf937a50a.1773058629.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.1773058629.git-series.marmarek@invisiblethingslab.com>
References: <cover.751f45ebbb644244b1d9da3aff289d6b66db4c6b.1773058629.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen doesn't give direct access to the EFI memory map, but provides a
hypercall interface for it. efi_mem_desc_lookup() was already adjusted
in aca1d27ac38a "efi: xen: Implement memory descriptor lookup based on
hypercall" to (optionally) use it. Now make efi_mem_type() and
efi_mem_attributes() use common efi_mem_desc_lookup() too.
This also reduces code duplication a bit.
efi_mem_type() retains separate check for -ENOTSUPP error case (even
though no caller seems to rely on this currently).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 drivers/firmware/efi/efi.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index b2fb92a..36efc92 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -983,18 +983,12 @@ char * __init efi_md_typeattr_format(char *buf, size_t size,
  */
 u64 efi_mem_attributes(unsigned long phys_addr)
 {
-	efi_memory_desc_t *md;
+	efi_memory_desc_t md;
 
-	if (!efi_enabled(EFI_MEMMAP))
+	if (efi_mem_desc_lookup(phys_addr, &md))
 		return 0;
 
-	for_each_efi_memory_desc(md) {
-		if ((md->phys_addr <= phys_addr) &&
-		    (phys_addr < (md->phys_addr +
-		    (md->num_pages << EFI_PAGE_SHIFT))))
-			return md->attribute;
-	}
-	return 0;
+	return md.attribute;
 }
 
 /*
@@ -1007,18 +1001,15 @@ u64 efi_mem_attributes(unsigned long phys_addr)
  */
 int efi_mem_type(unsigned long phys_addr)
 {
-	const efi_memory_desc_t *md;
+	const efi_memory_desc_t md;
 
-	if (!efi_enabled(EFI_MEMMAP))
+	if (!efi_enabled(EFI_MEMMAP) && !efi_enabled(EFI_PARAVIRT))
 		return -ENOTSUPP;
 
-	for_each_efi_memory_desc(md) {
-		if ((md->phys_addr <= phys_addr) &&
-		    (phys_addr < (md->phys_addr +
-				  (md->num_pages << EFI_PAGE_SHIFT))))
-			return md->type;
-	}
-	return -EINVAL;
+	if (efi_mem_desc_lookup(phys_addr, &md))
+		return -EINVAL;
+
+	return md.type;
 }
 
 int efi_status_to_err(efi_status_t status)
-- 
git-series 0.9.1

