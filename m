Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB05C9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:18:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430439.1652936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Ms3-0002BO-4v; Wed, 23 Sep 2026 13:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430439.1652936; Wed, 23 Sep 2026 13:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9Ms3-0002BF-1z; Wed, 23 Sep 2026 13:18:47 +0000
Received: by outflank-mailman (input) for mailman id 1430439;
 Wed, 23 Sep 2026 13:18:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1x9Ms1-000284-En
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:18:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Ms0-00DJHR-Rh
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:18:44 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d1ab-bab6-0a2a0a5309dd-0a2a450b8de8-32
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:18:44 +0200
Received: from [74.125.229.43] (helo=mail-dy2-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ab3d1b3-b7e8-0a2a450b0019-4a7de52b8eb7-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:18:44 +0200
Received: by mail-dy2-f43.google.com with SMTP id
 5a478bee46e88-33e6b4e33e4so780595eec.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 06:18:44 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:18:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790169523; x=1790774323; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gvdLUze2sQ9rH6tf9YWuWP18ipAcGMhXKG5e40lFeJk=;
        b=MieeQ+7P9R72xi1QfbRg66IiTR4e17qcc4ha+q+fsv+5lzRcxlDIbHMn51sk3UvhG9
         EZITvSlFpynXUzpkqnvJU0jnCJ0gy64S5wLTqaYaL01hiYcgu9MSEzizGyZIGYAqMZ6n
         ygXGllm/3U5n/NMQaJElDaebZlCaJJYjLU58oZkbvfG7rMswBJnbNRpI7cVlip7PesBn
         kWM84GDWHq7q/oGhZwrEbd1dX4jSaYizrMhKPG5ELmaNIS1uAZnmV3u3cFDlRLTzU1gd
         9fawtCNy57UsVFDog0tPRFv419B9m3nkJqYg6cXi1Qx/ePUwKst+01NYkW6EAJwCeh2Q
         mzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169523; x=1790774323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gvdLUze2sQ9rH6tf9YWuWP18ipAcGMhXKG5e40lFeJk=;
        b=a/VUzhJfjSN7t7SRcjJPL1YzB5gIQNyY97FDtqfjWt4Hki0qK8BreiR5yPVc0pT69B
         cS5x9zAFd/9RjmqpE+K/DR0ROneKm1xLVWHq3YbnPvBQQWFOhtmjY9LLgArNA3jCdcvI
         LvFbTo3RxeRQy9AwVeGd5+P8WCaVGOu7WGx9pikTR3p2o25jyMLKMLUYhmyWnmPqSTVR
         bkOCzYkc51oSOL990G4/mY/+Lmn4LHVa2KYUgONdLeCwqJ+llL/rWy1V9f5GXeHAPBjI
         Vu91tAXaP1otpEgvbBvfKBv1RgMxZBYhhLNq67DNK2NBg8kSnMSSX2iVVzQXrcgnE/PE
         8xuA==
X-Forwarded-Encrypted: i=1; AKwUvBzSquGK8sjBB0BfS9wuVs+PNVq5iL+ceHdyJOhXltnuPaFPZQLmQDl9vh6z1MbqKdrai7yEuWYXPkk=@lists.xenproject.org
X-Gm-Message-State: AFuF++mycvgH/UJNAIONqigkEg6kI87HVahzls+2ohlkRcOzqTn4VDrw
	/VFYyfLlzIloBz9CsZ04QKUD5jqSl6D0CbOsTiInr9HvoeGPWWkWd8sI
X-Gm-Gg: AYBFou1eBcDa5FW8cKVzAROib8iVCIfx0UluH1UUrNDRVqOQ8qZ+PpuUCYXdTwm8PpH
	a2UxkDyd9kPKF2zXSaZwU2962HX9c0EPjR6oEQonmpqEmqP7+RSyzrOtliB6wwrl0Xtqf39px4X
	Bhd3ALxjvtXTFQyHL/L10BTV2X5cQP5/xdN0BKxnNQwl9C+xszf5zZWF8GnVBTwKd7CLOi8cjOc
	oLyuuq2HgltP4nBggdVfpiJxtQR6tThxK7XFBEwV3cmWFN4pLp1UcucP87bG+HlpNuvDcpWhXML
	dGkuInC1xkDi83uDYHCfmRlCgkiFpThtGk++Trgxoq95mv85h4/dW3R65Twg+rLp0TAeh6mxD/1
	sDCV7vVhfF3Se4tND8LhifHb3kl0uaLH8whK3lOkucUDF6woVmb7cPE641Te6d3OoWAFA539jcX
	zATNmx+1nri12Z6KtylFDYKtjEjwOB8JojUAWa+ZbVyhvWj32z6LWyAo4vAfI2y3lCivKlWJq1M
	Zl6XhGDSWbecG22OEBUW4WSJMepNuM=
X-Received: by 2002:a05:7301:3a99:b0:30f:1e28:fb5d with SMTP id 5a478bee46e88-33e8d6d03a4mr2458825eec.20.1790169522434;
        Wed, 23 Sep 2026 06:18:42 -0700 (PDT)
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
Subject: [PATCH v3 011/114] kconfig: rename REGISTER to HW_REGISTER
Date: Wed, 23 Sep 2026 21:14:45 +0800
Message-ID: <20260923131635.1894-12-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1790169524-ABED69EA-DA379DDE/0/0
X-purgate-type: clean
X-purgate-size: 2919

Rename config REGISTER to HW_REGISTER. register is a C keyword, and a
later TargetKconfig commit will use it as a struct member.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/Kconfig          | 2 +-
 hw/core/Kconfig     | 2 +-
 hw/core/meson.build | 2 +-
 hw/dma/Kconfig      | 4 ++--
 hw/i2c/Kconfig      | 2 +-
 hw/usb/Kconfig      | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/Kconfig b/hw/Kconfig
index c92ca2b13a3..94f963f2944 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -85,7 +85,7 @@ config XILINX_AXI
 
 config XLNX_ZYNQMP
     bool
-    select REGISTER
+    select HW_REGISTER
     select CAN_BUS
     select PTIMER
     select XLNX_BBRAM
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index d1bdf765ee8..839e249b9d0 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -29,7 +29,7 @@ config PLATFORM_BUS
     bool
     depends on DEVICE_TREE
 
-config REGISTER
+config HW_REGISTER
     bool
 
 config SPLIT_IRQ
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 8fe776d2c86..1c645d7041d 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -21,7 +21,7 @@ system_ss.add(when: 'CONFIG_GUEST_LOADER', if_true: files('guest-loader.c'))
 system_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
 system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
 system_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
-system_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
+system_ss.add(when: 'CONFIG_HW_REGISTER', if_true: files('register.c'))
 system_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
 system_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
 system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
index 0a23e7d7b87..8f221b20634 100644
--- a/hw/dma/Kconfig
+++ b/hw/dma/Kconfig
@@ -16,7 +16,7 @@ config I8257
 
 config ZYNQ_DEVCFG
     bool
-    select REGISTER
+    select HW_REGISTER
 
 config XLNX_ZDMA
     bool
@@ -29,7 +29,7 @@ config SIFIVE_PDMA
 
 config XLNX_CSU_DMA
     bool
-    select REGISTER
+    select HW_REGISTER
 
 config K230_GSDMA
     bool
\ No newline at end of file
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 0766130b596..3482f475cf9 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -20,7 +20,7 @@ config ARM_SBCON_I2C
 
 config DESIGNWARE_I2C
     bool
-    select REGISTER
+    select HW_REGISTER
     select I2C
 
 config ACPI_SMBUS
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index e8c00f813a6..43771291a06 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -137,7 +137,7 @@ config IMX_USBPHY
 config USB_DWC3
     bool
     select USB_XHCI_SYSBUS
-    select REGISTER
+    select HW_REGISTER
 
 config XLNX_USB_SUBSYS
     bool
-- 
2.52.0.windows.1


