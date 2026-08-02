Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC79C55162
	for <xen-devel@archiver.kernel.org>; Sun,  2 Aug 2026 13:10:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1380620.1624349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVx3-0003Ux-A0; Sun, 02 Aug 2026 13:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1380620.1624349; Sun, 02 Aug 2026 13:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqVx3-0003Un-5Q; Sun, 02 Aug 2026 13:10:01 +0000
Received: by outflank-mailman (input) for mailman id 1380620;
 Sun, 02 Aug 2026 13:09:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1wqVx1-0003SZ-OU
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 13:09:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqVx1-004d7k-5L
 for xen-devel@lists.xenproject.org; Sun, 02 Aug 2026 15:09:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f4195-2eae-0a2a0a5409dd-0a2a4507dfe0-26
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:58 +0200
Received: from [188.165.39.161] (helo=15.mo582.mail-out.ovh.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a6f41a6-b4ea-0a2a45070019-bca527a1b141-3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Aug 2026 15:09:58 +0200
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.43.253])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4hCgBs6hNwz5xnH
 for <xen-devel@lists.xenproject.org>; Sun,  2 Aug 2026 13:09:57 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-z8rfb (unknown [10.110.178.126])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 115A5100161;
 Sun,  2 Aug 2026 13:09:57 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.95])
 by ghost-submission-7d8d68f679-z8rfb with ESMTPSA
 id 5ylFN6RBb2rsZRYAaLQSgA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 02 Aug 2026 13:09:57 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo3617313-selector1 header.d=3mdeb.com header.i="@3mdeb.com" header.h=From
Authentication-Results:garm.ovh; auth=pass (GARM-95G0018acbab62-8b0a-4aab-827c-72b2fa275ecb,
                    A7BD45287BC66A7121136900083CD01C39616B1D) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.215
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v4 05/23] x86/tpm.c: add CRB interface support
Date: Sun,  2 Aug 2026 16:09:21 +0300
Message-ID: <5d71b306b8b6162cc434e8bfe16ed5dd1da068e8.1785668458.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
References: <cover.1785668458.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4730186985154487740
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEO37Lm1soAj3J6HJwxZueJ91jNrKiCMD9VOxO+7S6oZcwX5ZhHy/rf+u1q3gsSFBR0MQ0G/W66mTSt5xumJoxY/EyDpxdVBT5aAA1fHupbW88f/IumzeClwwf3PGe5NCfIC4rAkaw9D49zl0L3FOqYw1yebY9XQZPEoEgqOhxU7iAITzoi4rSZJugXTxFrfgz5z3QYtYzrLSr0w464iDE2Jv+mfsQyDLbPqlC9XEGpFu9KBxFx07+KPXWsR6kr02Tgk2fJ3ulvjdiKijPJd2EPMcqID96OcOqj/uCF/V+6MYDFkW6NlVR5eWMFf+caoPBoCiQxHguJ/BWn2Nt+/d7LIegd+W1HbJziGmUkNlCXhtzzh8HFSxQegASwemNchOJ3BdFA6NU/4EVQ6NTYL5e7Ey8YL1XyK6rItWnm1ifNg8olZjXM/sdiZFU7hWXSnAcleF0ugP7hWh9YMLoZKt3VU86pK5q81+ombrJ7OPetYH7fY+t3rbw/Jhf5Wv83Om4S1dmHgmtZqwbsUU0WOuoZka2cCqGYKQj95R7eLHEadAPWPErFtoSxe/DqQGlVxCkTNJxPW54bS6YywVOBrLhPp0WqOjYusmxpja7d2qS6Qz9xPDhxddyzZbWfAChxAYyfYUwcPOMXOM9M4msoqRwjdLhCFiFXeInLQDMwBhZoJg
DKIM-Signature: a=rsa-sha256; bh=BhGw1vM0t4hYsGT8oICAVoewzT6l4ZY+UO8jUoK1vZ0=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1785676198; v=1;
 b=Fj/EKOsqTK9/FmUtMRYQH++TVyOAB2/XJP5qoITerU7RU7h1mJBVrgjrmqJTyRdNFRw+fngG
 6JDaEBOnSjtG3GUiD4Pf/S6Ta5cLXgIvqeJk3hGVlEOfIR2hkU/jMli936A6KhN+JJ7lUmnIcJR
 r/HSlWEoyZLppwcLjzA0I4VF33zX8516OObJT6BRnPgeZWo9dsKOImSl/Q8d15R1/B3PGHrBTtQ
 Wh87/I2OQ/vgJuA1cbCVDOCMBHU3qAJokzQsPMlof8PT4e90s6iWTWVxldP6vTgoUNx2/NzAJJW
 29ilNPj2WE4ddpfYs6vsXdB3/scPaVhd+cqp86/yeSi/Q==
X-purgate-ID: tlsNG-ef75cf/1785676198-A72DCAE4-33145081/0/0
X-purgate-type: clean
X-purgate-size: 6771

From: Szymon Acedański <accek@mimuw.edu.pl>

TIS is an older and slower byte-oriented TPM interface that gets
replaced by CRB on modern systems.

Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---

Notes:
    v4: new commit to support CRB interface of TPM2.0

 xen/arch/x86/tpm.c | 134 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 131 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/tpm.c b/xen/arch/x86/tpm.c
index 59bb1ff2c4..a3d9a0d3e5 100644
--- a/xen/arch/x86/tpm.c
+++ b/xen/arch/x86/tpm.c
@@ -72,6 +72,11 @@ static uint8_t tpm_read8(unsigned int reg)
     return *(volatile uint8_t *)__va(TPM_MMIO_BASE + reg);
 }
 
+static void tpm_write32(unsigned int reg, uint32_t val)
+{
+    *(volatile uint32_t *)__va(TPM_MMIO_BASE + reg) = val;
+}
+
 static void tpm_write8(unsigned int reg, uint8_t val)
 {
     *(volatile uint8_t *)__va(TPM_MMIO_BASE + reg) = val;
@@ -110,6 +115,31 @@ static bool tpm_is_crb(void)
 #define TIS_BURST_COUNT_(x)     TPM_LOC_REG(x, 0x19)  /* the middle of STS */
 #define TIS_DATA_FIFO_(x)       TPM_LOC_REG(x, 0x24)
 
+/************************** CRB register definitions **************************/
+
+#define CRB_LOC_STATE_(x)       TPM_LOC_REG(x, 0x00)
+#define CRB_LOC_STATE_LOC_ASSIGNED   (1 << 1)
+#define CRB_LOC_STATE_REG_VALID_STS  (1 << 7)
+#define CRB_LOC_CTRL_(x)        TPM_LOC_REG(x, 0x08)
+#define CRB_LOC_CTRL_REQUEST_ACCESS  (1 << 0)
+#define CRB_LOC_CTRL_RELINQUISH      (1 << 1)
+#define CRB_CTRL_REQ_(x)        TPM_LOC_REG(x, 0x40)
+#define CRB_CTRL_REQ_CMD_READY       (1 << 0)
+#define CRB_CTRL_REQ_GO_IDLE         (1 << 1)
+#define CRB_CTRL_STS_(x)        TPM_LOC_REG(x, 0x44)
+#define CRB_CTRL_STS_ERROR           (1 << 0)
+#define CRB_CTRL_CANCEL_(x)     TPM_LOC_REG(x, 0x48)
+#define CRB_CTRL_CANCEL_INVOKE       (1 << 0)
+#define CRB_CTRL_START_(x)      TPM_LOC_REG(x, 0x4C)
+#define CRB_CTRL_START_INVOKE        (1 << 0)
+#define CRB_CTRL_CMD_SIZE_(x)   TPM_LOC_REG(x, 0x58)
+#define CRB_CTRL_CMD_LADDR_(x)  TPM_LOC_REG(x, 0x5C)
+#define CRB_CTRL_CMD_HADDR_(x)  TPM_LOC_REG(x, 0x60)
+#define CRB_CTRL_RSP_SIZE_(x)   TPM_LOC_REG(x, 0x64)
+#define CRB_CTRL_RSP_ADDR_(x)   TPM_LOC_REG(x, 0x68)
+#define CRB_DATA_BUFFER_(x)     TPM_LOC_REG(x, 0x80)
+#define CRB_DATA_BUFFER_SIZE    0x0F80
+
 /************************** TIS locality & command ****************************/
 
 static void tis_request_locality(unsigned int loc)
@@ -195,12 +225,110 @@ static void tis_send_cmd(unsigned int loc, uint8_t *buf, unsigned int i_size,
     tpm_write8(TIS_STS_(loc), STS_COMMAND_READY);
 }
 
+/************************** CRB locality & command ****************************/
+
+static void crb_request_locality(unsigned int loc)
+{
+    const uint32_t mask = CRB_LOC_STATE_LOC_ASSIGNED |
+                          CRB_LOC_STATE_REG_VALID_STS;
+
+    tpm_write32(CRB_LOC_CTRL_(loc), CRB_LOC_CTRL_REQUEST_ACCESS);
+    while ( (tpm_read32(CRB_LOC_STATE_(loc)) & mask) != mask )
+        ;
+}
+
+static void crb_relinquish_locality(unsigned int loc)
+{
+    tpm_write32(CRB_LOC_CTRL_(loc), CRB_LOC_CTRL_RELINQUISH);
+    while ( tpm_read32(CRB_LOC_STATE_(loc)) & CRB_LOC_STATE_LOC_ASSIGNED )
+        ;
+}
+
+static void crb_cmd_ready(unsigned int loc)
+{
+    tpm_write32(CRB_CTRL_REQ_(loc), CRB_CTRL_REQ_CMD_READY);
+    while ( tpm_read32(CRB_CTRL_REQ_(loc)) & CRB_CTRL_REQ_CMD_READY )
+        ;
+}
+
+static void crb_go_idle(unsigned int loc)
+{
+    tpm_write32(CRB_CTRL_REQ_(loc), CRB_CTRL_REQ_GO_IDLE);
+    while ( tpm_read32(CRB_CTRL_REQ_(loc)) & CRB_CTRL_REQ_GO_IDLE )
+        ;
+}
+
+static void crb_send_cmd(unsigned int loc, uint8_t *buf, unsigned int i_size,
+                         unsigned int *o_size)
+{
+    paddr_t data_buf_pa = TPM_MMIO_BASE + CRB_DATA_BUFFER_(loc);
+    unsigned int expected;
+
+    if ( i_size > CRB_DATA_BUFFER_SIZE || *o_size < sizeof(struct tpm_rsp_hdr) )
+    {
+        *o_size = 0;
+        return;
+    }
+
+    /* Out of caution, make sure no previous command is still executing. */
+    while ( tpm_read32(CRB_CTRL_START_(loc)) & CRB_CTRL_START_INVOKE )
+        ;
+
+    crb_cmd_ready(loc);
+
+    /* In an unlikely event that TPM signals irrecoverable error here,
+     * better bail out than hang in infinite loop waiting for the
+     * start condition later. */
+    if ( tpm_read32(CRB_CTRL_STS_(loc)) & CRB_CTRL_STS_ERROR )
+    {
+        *o_size = 0;
+        crb_go_idle(loc);
+        return;
+    }
+
+    tpm_write32(CRB_CTRL_CANCEL_(loc), 0);
+
+    tpm_write32(CRB_CTRL_CMD_LADDR_(loc), data_buf_pa);
+    tpm_write32(CRB_CTRL_CMD_HADDR_(loc), 0);
+    tpm_write32(CRB_CTRL_CMD_SIZE_(loc), CRB_DATA_BUFFER_SIZE);
+    tpm_write32(CRB_CTRL_RSP_SIZE_(loc), CRB_DATA_BUFFER_SIZE);
+    /* RSP_ADDR is 64-bit. */
+    tpm_write32(CRB_CTRL_RSP_ADDR_(loc), data_buf_pa);
+    tpm_write32(CRB_CTRL_RSP_ADDR_(loc) + 4, 0);
+
+    memcpy(__va(data_buf_pa), buf, i_size);
+
+    tpm_write32(CRB_CTRL_START_(loc), CRB_CTRL_START_INVOKE);
+    while ( tpm_read32(CRB_CTRL_START_(loc)) & CRB_CTRL_START_INVOKE )
+        ;
+
+    if ( tpm_read32(CRB_CTRL_STS_(loc)) & CRB_CTRL_STS_ERROR )
+    {
+        *o_size = 0;
+        crb_go_idle(loc);
+        return;
+    }
+
+    /* Read header to learn the response length. */
+    memcpy(buf, __va(data_buf_pa), sizeof(struct tpm_rsp_hdr));
+    expected = be32_to_cpu(((struct tpm_rsp_hdr *)buf)->paramSize);
+    if ( expected > *o_size )
+        expected = *o_size;
+    if ( expected > CRB_DATA_BUFFER_SIZE )
+        expected = CRB_DATA_BUFFER_SIZE;
+
+    memcpy(buf, __va(data_buf_pa), expected);
+
+    *o_size = expected;
+    crb_go_idle(loc);
+}
+
 /************************** Interface dispatch ********************************/
 
 static void request_locality(unsigned int loc)
 {
     if ( tpm_is_crb() )
-        return;
+        crb_request_locality(loc);
     else
         tis_request_locality(loc);
 }
@@ -208,7 +336,7 @@ static void request_locality(unsigned int loc)
 static void relinquish_locality(unsigned int loc)
 {
     if ( tpm_is_crb() )
-        return;
+        crb_relinquish_locality(loc);
     else
         tis_relinquish_locality(loc);
 }
@@ -217,7 +345,7 @@ static void send_cmd(unsigned int loc, uint8_t *buf, unsigned int i_size,
                      unsigned int *o_size)
 {
     if ( tpm_is_crb() )
-        *o_size = 0;
+        crb_send_cmd(loc, buf, i_size, o_size);
     else
         tis_send_cmd(loc, buf, i_size, o_size);
 }
-- 
2.55.0


