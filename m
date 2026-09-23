Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F37DC98312
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:18:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430389.1652879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrI-0006jT-F7; Wed, 23 Sep 2026 13:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430389.1652879; Wed, 23 Sep 2026 13:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9MrI-0006hs-8P; Wed, 23 Sep 2026 13:18:00 +0000
Received: by outflank-mailman (input) for mailman id 1430389;
 Wed, 23 Sep 2026 13:17:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9MrH-0006BM-5r
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:17:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9MrG-002Egu-HM
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:17:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d182-bab6-0a2a0a5309dd-0a2a45058594-18
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:17:58 +0200
Received: from [74.125.229.43] (helo=mail-dy2-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d184-4cb1-0a2a45050019-4a7de52b9ad1-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:17:58 +0200
Received: by mail-dy2-f43.google.com with SMTP id
 5a478bee46e88-33c3735125bso408413eec.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:17:57 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:17:52 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169476; x=1790774276; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKNecRa3tzG6HeYVTRQDuQ00e5AIYSJOroCNurGi9rk=;
        b=H0JlBJJYkvkW+KZtx2h0u5kby9hMxg82p4aDXBOEt9UuiUSia5z6TvjgFTHK19dRfV
         JBzR71J8YdoYjh/XlPumInXMjXJiYGEGu+MHWWR3Uhc55ejyLvQEAm6SG/BFw27WaFSW
         rUT2bkqhlWOKqe51o7aUSgPuF7818dc7m8SfEmjudJHEpZNjhVLia+/gGbrlSvqE9AYU
         Ux2b5ahblOsbZtjElWi8DDWDNMWUwkFmz1RdBT2pvQgnyAzc3e9z5sDYJvEw4GC2vD8C
         Hy+YJBeNZl5Wvvvn4reXEzAaTKDAjHP3waX9BF+QzwCgrWcuunN4f9HEXPV+3zuQIvXG
         oNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169476; x=1790774276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKNecRa3tzG6HeYVTRQDuQ00e5AIYSJOroCNurGi9rk=;
        b=LDwuPgW4qmXihMUHmBdCuZ6MUWXoeLln9jm8EijdJOTIuxOJdSuIfZrLngS23ZHt/e
         jxRKUoK54y+iRLQo3TbKJZjhYcfg5cPM7b7GVnZbzYZirAj3UjIg1Jt2oZ9Ch6tZ4aTk
         T4cxVF/ShVp7sDIIDDbnnv8BMvEl8rdA5rkWba2JN5lS8tJUVXrmzse/UF4h2+GUcVtW
         NA7e55dCeKPMiaxw3c5P/B5EOfGVg+zukweh4vXVF16dY7hevkWRl8KkPMVFrg2sAj4U
         EelQNwCQMgrdgpjrs1ZOkOsJOfOEyktcZGrpinLSuwj1Zxdgu95vXzbV0XPzTqeMDy9I
         H5nw==
X-Forwarded-Encrypted: i=1; AKwUvBy6mzXZ35n6ELaxvT/qSu74RMkBzB6cheCfuhqBZ2ZOIckPWXs69czdfOGo1tVLFz/GnKDM9A5i8SU=@lists.xenproject.org
X-Gm-Message-State: AFuF++lRIBM4kr+PBoz1ADlslowtza9gLuU9Rk5O1vLQYOC9EZ0xFDE0
	s3h4n3M3Nvm+iGo56m2pIqddk2ofBGCe1cGle/zwLukGRq7eCw8RgPtd
X-Gm-Gg: AYBFou2GysTxb8Hw+qGS7mzciviAQXF7VjHKRDX1wYdMGzpPUCQtLd6zxbEYQ7NdQAS
	AmAZoq/KdBI912zAELXdzHD0zgZI9+JHbC0n29xdjJ0hno6DzA6btOzHhD4mMs6tFs0AJj5yZpr
	t45kcs10G2OZUr2Bs7aXTkKLp2H/dQmJ/taWIMRqA04aSkvtqxtJoh7Uo0fxvG+baUnUJ/uCQnb
	Oe363eRhJolmBCL/JChO6uo+PuiHBZLMDExWSvFfL9LzJLhTiWBcKQk1NjAUp1PsnNp6ZYXgHvo
	YiVvLCnNAxf+nUCPmPA4akxgB3zCNspYW2054K9AgJE2OF5G/8yWLpzRI77zMTJ8JPcpM3UoDzG
	i7ypf6Kq8W6EMTE/Mi+kJ1ycXG4kv4100gt3XFjod0efCxCdoXhE5UrzRsA5LIguA00iQHKMnOP
	oDmXD143xXkwgs4IWpIaM3AxEh0QG252k/hlGLdu71qrCrabqEHGV6yEaw8ZVBw0163eJPLfJuW
	iPPsCYe2AfhRoMb9DpTEmIKrCeZjok=
X-Received: by 2002:a05:7301:db0c:b0:33b:96b8:3818 with SMTP id 5a478bee46e88-33e8ddbe14cmr1954620eec.32.1790169475447;
        Wed, 23 Sep 2026 06:17:55 -0700 (PDT)
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
Subject: [PATCH v3 007/114] vl: parse early options before target-info init
Date: Wed, 23 Sep 2026 21:14:41 +0800
Message-ID: <20260923131635.1894-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790169478-F74BC2A1-949A6469/0/0
X-purgate-type: clean
X-purgate-size: 1312

Move the first argv pass ahead of MODULE_INIT_TARGET_INFO so later
target-info selection can use command-line options before QOM init.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 system/vl.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index 0d52c5d0a46..dc883de8274 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2910,16 +2910,6 @@ void qemu_init(int argc, char **argv)
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
 
-    os_setup_limits();
-
-    module_call_init(MODULE_INIT_TARGET_INFO);
-    target_info_qom_set_target();
-
-    module_init_info(qemu_modinfo);
-    module_allow_arch(target_name());
-
-    qemu_init_subsystems();
-
     /* first pass of option parsing */
     optind = 1;
     while (optind < argc) {
@@ -2938,6 +2928,16 @@ void qemu_init(int argc, char **argv)
         }
     }
 
+    os_setup_limits();
+
+    module_call_init(MODULE_INIT_TARGET_INFO);
+    target_info_qom_set_target();
+
+    module_init_info(qemu_modinfo);
+    module_allow_arch(target_name());
+
+    qemu_init_subsystems();
+
     machine_opts_dict = qdict_new();
     if (userconfig) {
         qemu_read_default_config_file(&error_fatal);
-- 
2.52.0.windows.1


