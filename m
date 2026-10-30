Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BAE606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pFjjXG8d
Received: from list by lists.xenproject.org with outflank-mailman.1465771.1676210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoKl-0004Ec-TO; Fri, 30 Oct 2026 15:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465771.1676210; Fri, 30 Oct 2026 15:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMoKl-0004EV-PU; Fri, 30 Oct 2026 15:15:59 +0000
Received: by outflank-mailman (input) for mailman id 1465771;
 Fri, 30 Oct 2026 15:15:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xMoKk-0004EP-J1
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 15:15:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMoKj-00272y-P2
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 16:15:57 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4a5-8faa-0a2a0a5109dd-0a2a450a8476-22
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:15:57 +0100
Received: from [74.125.82.180] (helo=mail-dy1-f180.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae4b4ac-f2d2-0a2a450a0019-4a7d52b4a817-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 16:15:57 +0100
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-35829219da8so2287187eec.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 08:15:57 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1ac1854d925sm12770449c88.7.2026.10.30.08.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:15:54 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373355; x=1793978155; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rg4bi/F0EGsPeT/kaQ1mX1hyEceGiWztvW5JiOyGZA=;
        b=pFjjXG8dATu8FpPVygTlVjIjDM464dFFElckrsSuoV51d7KShaMjOuycsvuTKkeVgw
         EJ1lrg+VreqOaNmWeh80XaXwMaBHaXMNGfDYUu4FsMmkO/4wH55TdCZdisiLPp8wrPbM
         zgdssfhMxHcvju30JQC9xHmBccDgX4+idZHHuvNiSyypGNa4EX2eANvT+fGLzrFrpptb
         nOHqoys7+I0utvIofyHUhgcbEi/Dn7bqJeDdV3eA4pL6S9DAceiNbPEUBuyiolstnNce
         8VpRRa/pHlSszeBdBcy5SZpko75Q7TMqpwRQ0EsPvRGqjPTXv/csSi+S89XAYO8Okwji
         WCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373355; x=1793978155;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Rg4bi/F0EGsPeT/kaQ1mX1hyEceGiWztvW5JiOyGZA=;
        b=jupThNIxNUTXsRJoA/1utCl4Ffe0IOJHiN0OT5rfy2/XQz8zOzdXoQ7vobpkvSaUul
         BcHHpUNOe9bau0FyfTKOQ1MLVgoxIEdbeRJJYtnN9AMvNFGbIRBqfNoUF0P06MWFN9ab
         J1bqRhJXXcC0B7SqsOvlCRFQh4X3vO2h9Z9pbGCJMFoBSgVqrfAZq5qJ9UfCFWl+S0On
         DjTlNpHm+xuo95PaZc4lrbSgMsa8rCW3Q4y+luhQiBxiZY5JdgVQ6UNFZMGoeK8CSzGj
         Sz1lHglayoTx8HJsdF4Z+Otxcypl69lvhXjH6yIHHaM4woeravBA6e2Dxioq6qOLJ9uZ
         ybTA==
X-Forwarded-Encrypted: i=1; AKwUvBwqHxeAhH/oxN+9rlPwc+wgsX4hQ65dgDDHyTnJhCuqVxlGefwMFJYq44rKSRMjBMhMbnhZRw4gwoM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLWOF4z/HRVH8b463JFcQWjfloe5NYDmaKs3qaYkxHKvrhQAKMQ
	nCcDTvdh9vNSh0ubS9kLvZKi5R3JEEJ0hSsxdFL2E1CnnpZoJYcUsOjN
X-Gm-Gg: AYBFou0PKO1ULZyEm06CwU7Z1qLh0I8nx225slEbpLLuwKDzQ5CL0xPuLfOXYdMp5ZF
	D2FE+NE6A0/q/jAw9oZPnVNhzfFELQHpMg5rm+V4TaCf/NOQVOtkY7OOuC3mFkUzshVRzrgswWN
	2MTmB3A5CLDfoLO+gfUmSeEkfWidr3VRGRhmuqYm8KiOcAV7NBC6zFiJcwIAdeZ/nLp1S6XPFI0
	FRvRKXl+hucLgmBS82zgcMzylww570pM7voc5q4sPNHkg7aBMKTuL7K+hOYj0AKMtq3YgobVTxJ
	2y9BXWladRlTkCfbYAKe9J9Q3qTmsFl5My0aOFC5I3RVpR1subdAx1WmZEi59CqQdWK4g91A0Bj
	FceQbHHKEiX0ggeDHghlr3k8t1yn8wcdJNO6zYfLL1mhoEaHrEZEF+hFEG7asCAkFDPRjVbTvj6
	eF9lqwQS91yKgUVTUl1XS0kOChGrSyrK7uk1Q/kWNE+zP2Rjg021qKBHfPCNdzZQAIh0cDsVU7I
	EjC/NcEOFm7WQ0rtb9pBaQlcNt/ZE+mMYDoSfUnrMVyDJI6k2jRhRBDvfckQu0bQ8mh/me4DVUi
	cSY7CKZueFwaVDqUSSmHwExfsWQPO/E8vDr0Xg5BpECD3huY
X-Received: by 2002:a05:7022:f90d:b0:151:7831:e403 with SMTP id a92af1059eb24-1ac5b027fbfmr2873959c88.13.1793373355336;
        Fri, 30 Oct 2026 08:15:55 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
	Felipe Balbi <balbi@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Philippe Mathieu-Daude <philmd@mailo.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-ppc@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Weiwei Li <liwei1518@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Thomas Huth <th.huth+qemu@posteo.eu>,
	=?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Yoshinori Sato <yoshinori.sato@nifty.com>,
	Frederic Konrad <konrad.frederic@yahoo.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Chao Liu <chao.liu@processmission.com>,
	Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
	Alistair Francis <alistair@alistair23.me>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Gaurav Sharma <gaurav.sharma_7@nxp.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	qemu-arm@nongnu.org
Subject: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo registration
Date: Fri, 30 Oct 2026 23:15:21 +0800
Message-ID: <20261030151539.1872-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793373357-5A1DDCFC-D0C1BF03/0/0
X-purgate-type: clean
X-purgate-size: 3671
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DEFINE_MACHINE and DEFINE_MACHINE_EXTENDED hide the TypeInfo and the type_init
function that calls type_register_static(). A later change needs to pass a
target mask into that registration, and the macros have no parameter for it.
This series expands every caller first, with no behavior change, so the
follow-up only replaces the type_register_static() call.

Each machine file gains a class_init function, a TypeInfo, and a type_init
function that calls type_register_static(). The last patch removes
DEFINE_MACHINE* and DEFINE_SECURE_MACHINE* from include/hw/core/boards.h.

Yonggang Luo (15):
  hw/alpha: expand DEFINE_MACHINE in dp264.c
  hw/m68k: expand DEFINE_MACHINE for M68K machines
  hw/microblaze: expand DEFINE_MACHINE for MicroBlaze
  hw/tricore: expand DEFINE_MACHINE in tricore_testboard.c
  hw/arm: expand DEFINE_MACHINE for ARM machines
  hw/riscv: expand DEFINE_MACHINE for RISC-V machines
  hw/core/null-machine: expand DEFINE_MACHINE
  hw/mips: expand DEFINE_MACHINE for MIPS machines
  hw/ppc: expand DEFINE_MACHINE for PowerPC machines
  hw/sh4: expand DEFINE_MACHINE in r2d.c
  hw/sparc: expand DEFINE_MACHINE in leon3.c
  hw/xenpv: expand DEFINE_MACHINE in xen_machine_pv.c
  hw/xtensa: expand DEFINE_MACHINE in sim.c
  hw/xtensa: expand DEFINE_MACHINE in virt.c
  hw/core/boards: remove unused DEFINE_MACHINE* macros

 hw/alpha/dp264.c                    | 18 +++++++++--
 hw/arm/bananapi_m2u.c               | 18 +++++++++--
 hw/arm/cubieboard.c                 | 19 +++++++++---
 hw/arm/digic_boards.c               | 18 +++++++++--
 hw/arm/imx25_pdk.c                  | 18 +++++++++--
 hw/arm/imx8mm-evk.c                 | 20 +++++++++---
 hw/arm/integratorcp.c               | 14 ++++++---
 hw/arm/kzm.c                        | 18 +++++++++--
 hw/arm/max78000fthr.c               | 17 ++++++++--
 hw/arm/mcimx6ul-evk.c               | 18 +++++++++--
 hw/arm/mcimx7d-sabre.c              | 20 +++++++++---
 hw/arm/msf2-som.c                   | 17 ++++++++--
 hw/arm/netduino2.c                  | 17 ++++++++--
 hw/arm/netduinoplus2.c              | 17 ++++++++--
 hw/arm/olimex-stm32-h405.c          | 18 +++++++++--
 hw/arm/orangepi.c                   | 19 +++++++++---
 hw/arm/stm32vldiscovery.c           | 18 +++++++++--
 hw/core/null-machine.c              | 18 +++++++++--
 hw/m68k/an5206.c                    | 18 +++++++++--
 hw/m68k/mcf5208.c                   | 18 +++++++++--
 hw/microblaze/petalogix_ml605_mmu.c | 19 ++++++++++--
 hw/microblaze/xlnx-zynqmp-pmu.c     | 19 ++++++++++--
 hw/mips/boston.c                    | 18 +++++++++--
 hw/mips/fuloong2e.c                 | 18 +++++++++--
 hw/mips/malta.c                     | 12 ++++++--
 hw/ppc/amigaone.c                   | 18 +++++++++--
 hw/ppc/pegasos.c                    | 21 ++++++++-----
 hw/ppc/ppc440_bamboo.c              | 18 +++++++++--
 hw/ppc/prep.c                       | 18 +++++++++--
 hw/ppc/sam460ex.c                   | 18 +++++++++--
 hw/ppc/virtex_ml507.c               | 18 +++++++++--
 hw/riscv/boston-aia.c               | 18 +++++++++--
 hw/riscv/microblaze-v-generic.c     | 18 +++++++++--
 hw/sh4/r2d.c                        | 18 +++++++++--
 hw/sparc/leon3.c                    | 18 +++++++++--
 hw/tricore/tricore_testboard.c      | 18 +++++++++--
 hw/xenpv/xen_machine_pv.c           | 18 +++++++++--
 hw/xtensa/sim.c                     | 18 +++++++++--
 hw/xtensa/virt.c                    | 18 +++++++++--
 include/hw/core/boards.h            | 48 -----------------------------
 40 files changed, 605 insertions(+), 142 deletions(-)

-- 
2.55.0.windows.3


