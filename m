Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C809EC9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:18:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430377.1652840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrG-0005rl-60; Wed, 23 Sep 2026 13:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430377.1652840; Wed, 23 Sep 2026 13:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrF-0005qo-Ve; Wed, 23 Sep 2026 13:17:57 +0000
Received: by outflank-mailman (input) for mailman id 1430377;
 Wed, 23 Sep 2026 13:17:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9MqL-0005fG-Dz
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:17:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MqK-006Omx-Bl
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:17:00 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d149-2eae-0a2a0a5409dd-0a2a45029f8c-10
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:17:00 +0200
Received: from [74.125.229.19] (helo=mail-dy2-f19.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d14a-6ca4-0a2a45020019-4a7de51380cc-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:17:00 +0200
Received: by mail-dy2-f19.google.com with SMTP id
 5a478bee46e88-3286624d194so642813eec.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:16:59 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:16:55 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169418; x=1790774218; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2gngFNJ3Klpuiy2qgGGYHVsKQcajQAru1FZZV3MRnyY=;
        b=L2T1KumsISHbPxz6NPCdQ9wxshXO15Va2/fLFq4HAqOPxgHk000l4fHFyqjsPsbR8O
         1Cjz1wYlVZ2fLsO6RRbws0/nhCGjjvXbDluRVAiA2VPkpT8J+1OwjGnQrH5gezGSd0uW
         0mlpdnct5McvdUglofasmBhx2IJPnBs0kcwCqe5H5E9mPZMz+CETut8vX0rhXGNimbds
         R+DQgAJmSIT8UU504A98woT2zX6i8kXAqo3ZE6p9Dkpq9hmedKJS0/MbMRNI5Ijr8VE1
         yXP5LpOQW+CULlzWBvCcbtd0br+JtS4xx3nl7epoQJBVdeiyBlkzLpie0pV/VMhICgsZ
         bjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169418; x=1790774218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2gngFNJ3Klpuiy2qgGGYHVsKQcajQAru1FZZV3MRnyY=;
        b=D452zPH+khNa/3ZJoTfrI1cv5972f887XM4F1feGM/afa1yY8erR8wrSYIyKCl0mAl
         /C6CLHR3pCMFeyS1J8kuH4Yc+XPkJeWHi5ncjaC9QFnpeCMx2pe1A9eEVucqgA9yVngc
         4llNTOQKupOtqen6dIBtOZDnD03as0LX841L9S22q1aCKiKLL+PX0aeL6yKAdoDxDmcH
         J1gS3JxnXmv0tPbwwgeskp59uG9l6V1ZdrEUSOwxjADkFsWamsejze/w4OBwfeSarwY/
         uVQYXL4VILKeD2ER9LOPAWiyrAnSbKLam0KZdQPSdHNeGxgbM70Ej2gxRcdyJXNxCFOD
         D67A==
X-Forwarded-Encrypted: i=1; AKwUvBwT5lyVNtf5yyMbTlxCYI6N3GJSOwWLtMzuX5mVxR5zuR24HfkD1eVRs3pPnsF0nzjNfhYtu3OMrk4=@lists.xenproject.org
X-Gm-Message-State: AFuF++lRJdT5xhYWY3Omd4q/UvONddwJ8hP71CJzY2r2Qj3jfDT/jTKi
	TIktG8Wpwi4pYwbc6cl2Ie0nQjwS/tryq1RfsuDGG3Ay1fkvCZ2s8gEb
X-Gm-Gg: AYBFou1WFwiGaq0iYK3jZ+1X0aZCfYg0E6oc6xdtIC5MjBQAJ+d2aRyemFYdKpJ4DSe
	GhPRVlj9Q96CNdKd5frls9kjb2GYTAqkqnC0Mf9GJkAgf0BR+1lA4CW4SXchhkiEDmwu8N48j0r
	CwUHpKk78QBGa47YypvOgV6v1GIFgEsSNN6+bZDMDnxRcS6+Pxq9uN/ygEDHjvlsR/um8hklcUH
	Z5/qL12mx0e/wgMGMK9qJhqHFHKpohJiw4Lrv3myOs4NnPywqpMvfSdLga8rZtxqPO8kFniiQaO
	3DtccN+rHkhs4uHyrsHfjVjgsqZZdnlFiLHYtP3+cMEvx/GWMsuD1ck4dkcFV9nok5J/qzd9Y71
	xbg428BJ/NtxU/DTkFu1+oIe/6eOlVi/mdBTOMQ5FLKSzPgG6otfwm68EkOliWwc7hx6/ZaYvAo
	IW8nSMJg+KhY/cSzpjxPUxcTZ4GtgxGUEMWgyrD8BNgFfYWkQ1sTF+SHBBrDOhmi7Tf6Y8REeAv
	pNWZ1dRAy43IxDeQv+X4jHpJUE9qdMtwNSnnEsH/A==
X-Received: by 2002:a05:693c:8808:10b0:33e:6b65:5eab with SMTP id 5a478bee46e88-33e8ddbef60mr2484078eec.26.1790169417968;
        Wed, 23 Sep 2026 06:16:57 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	xen-devel@lists.xenproject.org,
	Chao Liu <chao.liu@processmission.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Fabiano Rosas <farosas@suse.de>,
	Xianglai Li <lixianglai@loongson.cn>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Bibo Mao <maobibo@loongson.cn>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	David Hildenbrand <david@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	qemu-riscv@nongnu.org,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stafford Horne <shorne@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Song Gao <17746591750@163.com>,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 001/114] meson: stale qemu-version.h only when .git exists
Date: Wed, 23 Sep 2026 21:14:35 +0800
Message-ID: <20260923131635.1894-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1790169420-F22A92AC-CEE58226/0/0
X-purgate-type: clean
X-purgate-size: 865

build_always_stale for qemu-version.h is fs.exists on the source
.git. Matches qemu-version.sh, so a tree without git does not
regenerate the header on every ninja.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index cfac634cf13..f17665c667d 100644
--- a/meson.build
+++ b/meson.build
@@ -3546,7 +3546,7 @@ qemu_version = custom_target('qemu-version.h',
                              command: qemu_version_cmd,
                              capture: true,
                              build_by_default: true,
-                             build_always_stale: true)
+                             build_always_stale: fs.exists(meson.current_source_dir() / '.git'))
 genh += qemu_version
 
 hxdep = []
-- 
2.52.0.windows.1


