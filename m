Return-Path: <SRS0=63tD=ON=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D08C4332F
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 12:58:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B733161090
	for <xen-devel@archiver.kernel.org>; Thu, 23 Sep 2021 12:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B733161090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.194150.345947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOIZ-0006fo-2k; Thu, 23 Sep 2021 12:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194150.345947; Thu, 23 Sep 2021 12:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOIY-0006fC-RQ; Thu, 23 Sep 2021 12:57:58 +0000
Received: by outflank-mailman (input) for mailman id 194150;
 Thu, 23 Sep 2021 12:57:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOGr-0004it-5p
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:56:13 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b46d3d5b-4489-4e5a-941c-d26fc3fb88f9;
 Thu, 23 Sep 2021 12:55:06 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p29so25910679lfa.11
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:55:06 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id o12sm453010lft.254.2021.09.23.05.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:55:04 -0700 (PDT)
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
X-Inumbo-ID: b46d3d5b-4489-4e5a-941c-d26fc3fb88f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FKgxJK/5NyOFFpbY0xtHY00JQINZqmrpnwuzOqh/Ukk=;
        b=ea9E6tTANi/jveiexkEVCENbTHTScpXopjrod/3psE9GkasQWaKTmKmNiQdbaWuDC/
         yH7u43xdaWw6JGuAmS7VdZIbZs2VK2GJpvAX1gsdiwuVDd+TbekUS79BlpSs/bsPGdKQ
         wP7eOlSKkJfw0G+fTQSHuDwBcZKnZidY09Ob43s+XqlFLMymD65CN10T5mkq4cPwxDdv
         F82q1IJ6In4oWymTxGjH3GeMN5quVUG8HgV9f9dHpD81lh977Lm95mcWCzHZfGcvaIYS
         3ceMEDf10lcNmeqfesDK5HQo4ZBjVI5XVdBj4QNsDHEcVBEJwNF9cuMOkmMvRJYGDj2x
         XeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FKgxJK/5NyOFFpbY0xtHY00JQINZqmrpnwuzOqh/Ukk=;
        b=tlGEHPq9WAcQiTQPWEZ4UJctEr7SyGlw8PBcgg3Bw5L0iBcvlrmrNhP6zXbibKbXss
         Qh6f3eAo2/hbg5xBc3cKX46ugR9thksH66fPINvqjpJk3pN88BoPDVhKWUwvsH7vrqlJ
         m9y9CjKNWXYOP+3yuuFgeeVYYmUiQdEEfyxy7nsbYK92i4JLDcoptmrjUTWc7fHbM5tW
         GAAKUuqMGkUZJbITl8UAAF8N9TK2bh4vFSZjfFU6tcZcN3HGWUDy9KcFuunExCOjPEoQ
         6LMcYgRKIzXUOGZVNUJdKi3VMQA8lq8ira9Fo7q2G5kR7tE43v+GrEok3VcFTA/pKI1M
         mzCg==
X-Gm-Message-State: AOAM532d/NTwju1TkcHaV8WSpYdFEMhgQr4slKU4Z7oDVpBsvoXZuVBR
	7wldFMiFV6TUF1ULxIq1N5aYU6srfofs2g==
X-Google-Smtp-Source: ABdhPJxISqOOWmLgWDAAOw3kzzTRX2xcHM4R9vZqpv+EYE/4AAOVpEOzHCAWnBLNdTRXDedIXQbwPg==
X-Received: by 2002:a05:6512:2244:: with SMTP id i4mr4065599lfu.219.1632401704895;
        Thu, 23 Sep 2021 05:55:04 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 01/11] vpci: Make vpci registers removal a dedicated function
Date: Thu, 23 Sep 2021 15:54:51 +0300
Message-Id: <20210923125501.234252-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125501.234252-1-andr2000@gmail.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This is in preparation for dynamic assignment of the vpci register
handlers depending on the domain: hwdom or guest.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v1:
 - constify struct pci_dev where possible
---
 xen/drivers/vpci/vpci.c | 7 ++++++-
 xen/include/xen/vpci.h  | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index cbd1bac7fc33..1666402d55b8 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -35,7 +35,7 @@ extern vpci_register_init_t *const __start_vpci_array[];
 extern vpci_register_init_t *const __end_vpci_array[];
 #define NUM_VPCI_INIT (__end_vpci_array - __start_vpci_array)
 
-void vpci_remove_device(struct pci_dev *pdev)
+void vpci_remove_device_registers(const struct pci_dev *pdev)
 {
     spin_lock(&pdev->vpci->lock);
     while ( !list_empty(&pdev->vpci->handlers) )
@@ -48,6 +48,11 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
+}
+
+void vpci_remove_device(struct pci_dev *pdev)
+{
+    vpci_remove_device_registers(pdev);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9f5b5d52e159..2e910d0b1f90 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -28,6 +28,8 @@ int __must_check vpci_add_handlers(struct pci_dev *dev);
 
 /* Remove all handlers and free vpci related structures. */
 void vpci_remove_device(struct pci_dev *pdev);
+/* Remove all handlers for the device given. */
+void vpci_remove_device_registers(const struct pci_dev *pdev);
 
 /* Add/remove a register handler. */
 int __must_check vpci_add_register(struct vpci *vpci,
-- 
2.25.1


