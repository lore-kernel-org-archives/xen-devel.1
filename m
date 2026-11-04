Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53428606A326
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 02:18:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1471134.1679750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOQaL-0000Tm-Rl; Wed, 04 Nov 2026 02:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471134.1679750; Wed, 04 Nov 2026 02:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOQaL-0000Tf-OB; Wed, 04 Nov 2026 02:18:45 +0000
Received: by outflank-mailman (input) for mailman id 1471134;
 Wed, 04 Nov 2026 02:18:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vulab@iscas.ac.cn>) id 1xOQaK-0000TX-Rx
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 02:18:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOQaK-008wNy-8z
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 03:18:44 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6aea95db-2eae-0a2a0a5409dd-0a2a4508b88e-34
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:18:42 +0100
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vulab@iscas.ac.cn>)
 id 6aea954b-f659-0a2a45080019-9fe2fb15de00-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:15:42 +0100
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowAAXP_lLlepqgHg+AA--.9597S2;
 Wed, 04 Nov 2026 10:15:39 +0800 (CST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Wentao Liang <vulab@iscas.ac.cn>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org
Subject: [PATCH] xen/balloon: drop the device reference if registration fails
Date: Wed,  4 Nov 2026 02:15:48 +0000
Message-Id: <20261104021548.1468864-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAXP_lLlepqgHg+AA--.9597S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWkur1fZryfKr1fAr1kKrg_yoWDZrX_KF
	s2v3s7Xrn5WF17Gry5Cw4avryFkF9rWFWfZwsxKFsagay3Xr4kZw15Zw4Fyr17Jr4xAFW3
	X3WUZr4Igr47KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbc8YjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
	Y20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUyZmRDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMBA2rqY-m5dQAAsO
X-purgate-ID: tlsNG-c1860d/1793758542-CDF4787B-CB1E2C3F/13/0
X-purgate-type: clean
X-purgate-size: 1025
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

register_balloon() registers the statically allocated balloon device.
When device_register() fails, device_add() drops the reference it took
itself but the reference taken by device_initialize() stays behind, so
the device's private data and name are never released.

Give up that reference with put_device() before unregistering the bus.

Fixes: 803eb047a28d ("xen-balloon: Move core balloon functionality out of module")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/xen/xen-balloon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/xen-balloon.c b/drivers/xen/xen-balloon.c
index 67b0e2dbe84a..e1db8b2ffc1e 100644
--- a/drivers/xen/xen-balloon.c
+++ b/drivers/xen/xen-balloon.c
@@ -256,6 +256,7 @@ static int register_balloon(struct device *dev)
 
 	error = device_register(dev);
 	if (error) {
+		put_device(dev);
 		bus_unregister(&balloon_subsys);
 		return error;
 	}
-- 
2.34.1


