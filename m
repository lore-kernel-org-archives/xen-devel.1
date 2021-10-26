Return-Path: <SRS0=UA04=PO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DC1C433F5
	for <xen-devel@archiver.kernel.org>; Tue, 26 Oct 2021 07:32:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEC7B600D3
	for <xen-devel@archiver.kernel.org>; Tue, 26 Oct 2021 07:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEC7B600D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.216264.375798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfGwW-0006Fm-Ux; Tue, 26 Oct 2021 07:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216264.375798; Tue, 26 Oct 2021 07:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfGwW-0006Ff-RS; Tue, 26 Oct 2021 07:32:20 +0000
Received: by outflank-mailman (input) for mailman id 216264;
 Tue, 26 Oct 2021 07:32:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJH3=PO=iscas.ac.cn=jiasheng@srs-us1.protection.inumbo.net>)
 id 1mfGwV-0006FZ-Th
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 07:32:19 +0000
Received: from cstnet.cn (unknown [159.226.251.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 67de6bf0-5dcc-4160-a8a4-60959cc4a14d;
 Tue, 26 Oct 2021 07:32:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.128])
 by APP-05 (Coremail) with SMTP id zQCowADX37_8rndhi+4zBQ--.50197S2;
 Tue, 26 Oct 2021 15:32:12 +0800 (CST)
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
X-Inumbo-ID: 67de6bf0-5dcc-4160-a8a4-60959cc4a14d
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH v2] xen: Fix implicit type conversion
Date: Tue, 26 Oct 2021 07:32:11 +0000
Message-Id: <1635233531-2437704-1-git-send-email-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID:zQCowADX37_8rndhi+4zBQ--.50197S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kry8CryDZF4DJrW8Ary8AFb_yoW8Xw4Dpa
	yjk34UAryrGa4qka4fJr4kuFyfGayDCrWxWwnrt39YvFn8ury0qFyfJ34Y9ryDur4rC3WI
	vrWqvr17GrsxXrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUh4SOUUUUU=
X-Originating-IP: [124.16.138.128]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/

The variable 'i' is defined as UINT.
However in the for_each_possible_cpu, its value is assigned to -1.
That doesn't make sense and in the cpumask_next() it is implicitly
type conversed to INT.
It is universally accepted that the implicit type conversion is
terrible.
Also, having the good programming custom will set an example for
others.
Thus, it might be better to change the definition of 'i' from UINT
to INT.

Fixes: 3fac101 ("xen: Re-upload processor PM data to hypervisor after S3 resume (v2)")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/xen/xen-acpi-processor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index df7cab8..9cb61db 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -450,7 +450,7 @@ static struct acpi_processor_performance __percpu *acpi_perf_data;
 
 static void free_acpi_perf_data(void)
 {
-	unsigned int i;
+	int i;
 
 	/* Freeing a NULL pointer is OK, and alloc_percpu zeroes. */
 	for_each_possible_cpu(i)
@@ -462,7 +462,7 @@ static void free_acpi_perf_data(void)
 static int xen_upload_processor_pm_data(void)
 {
 	struct acpi_processor *pr_backup = NULL;
-	unsigned int i;
+	int i;
 	int rc = 0;
 
 	pr_info("Uploading Xen processor PM info\n");
@@ -518,7 +518,7 @@ static struct syscore_ops xap_syscore_ops = {
 
 static int __init xen_acpi_processor_init(void)
 {
-	unsigned int i;
+	int i;
 	int rc;
 
 	if (!xen_initial_domain())
-- 
2.7.4


