Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D931260A2638
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SLTNAFyp
Received: from list by lists.xenproject.org with outflank-mailman.1496842.1695175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU7lN-0002Y6-Ug; Thu, 19 Nov 2026 19:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496842.1695175; Thu, 19 Nov 2026 19:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU7lN-0002Xy-QV; Thu, 19 Nov 2026 19:25:41 +0000
Received: by outflank-mailman (input) for mailman id 1496842;
 Thu, 19 Nov 2026 19:25:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3MU3_agcKCSgMVSKIVWKSSKPI.GSQbIR-HIZIPPMWXW.bIRTVSNIGX.SVK@flex--irogers.bounces.google.com>)
 id 1xU7lM-0002Qw-Fy
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 19:25:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU7lL-00DAaF-Lj
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 20:25:39 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3MU3_agcKCSgMVSKIVWKSSKPI.GSQbIR-HIZIPPMWXW.bIRTVSNIGX.SVK@flex--irogers.bounces.google.com>)
 id 6aff4cfe-2eae-0a2a0a5409dd-0a2a450ad990-38
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:25:39 +0100
Received: from [209.85.167.198] (helo=mail-oi1-f198.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3MU3_agcKCSgMVSKIVWKSSKPI.GSQbIR-HIZIPPMWXW.bIRTVSNIGX.SVK@flex--irogers.bounces.google.com>)
 id 6aff4d32-f2d2-0a2a450a0019-d155a7c6b465-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:25:39 +0100
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-5735cd94235so213380b6e.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:25:39 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795116338; x=1795721138; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEPVdW1UHjKh7bwOu3YUjmxSg8vF1ESXVYVOzAB45kQ=;
        b=SLTNAFypDcJWMgNo0j520FgJ/Z92jVhwbEvx/pFFD4fztPOFSu+njVcKfUdT1lLbU7
         ElmA9zvCMC4RhM71TCOv8B0KKVaVlz4XocGHD0BY2737Ba1XLod+dshJqH7f9hT3c35t
         OTLtp+BBoWGCJ+DO4WPLD8DDr5Lvye8eFqnkQoWHMjF5SkaWdR3dCj+Pg5IftElB/3HF
         qcqcsAmWv0DRpZboY1lHnpO1GOm6SFLEoAYs0ChfYX4HCI+K9iuWeeQ3kTheBJKuvD04
         cv+Igm0LftW5eYFmLjAs0aimSGgW34ShmvJvV2CrGSK6ylEEPrAIrEzMyhHVNUG/iNj+
         LN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116338; x=1795721138;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEPVdW1UHjKh7bwOu3YUjmxSg8vF1ESXVYVOzAB45kQ=;
        b=LSvLOKTNhwMXtH9y88ShlF0xOEx9efpgostNbZzOsgXUMoBZb6L3cZNV789sYuATiz
         zOJbgVc0p52cXr+jBop+kxy2rxrB/nJYZJXBsU0xqU1BUuFrhmJcLI8wPKQAHK8ayeLu
         ISvAOXm0soaQC/h4/jT+VVrhmZbWK7zJivXHPbbNjyk2YMBA/3MlD8riza1wfrxHLeYo
         cwiehiIOGAFUavLsi1sslLk4eE5CfVN8J1TtLIkBhn1ce91y5fRFjL1FJ9S3dtGTP4uY
         8uX7ZfEbA7N5fKguBn1xd95FP2M7SFXA3ERtZMizo89jIEJg5HpSEEr4/ije6OiyFonb
         CKCQ==
X-Forwarded-Encrypted: i=1; AL+hErGECGFiSzLzZU6TqbefDU3Uw8l5ZXZBEbYQSGQnwg4BrLoMSgJtj2gJadESJs6hqxpamV79uR5Huyg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+sfMK4Jjm3ckMbTTLuLAB860eao1+HdJQalg5vKt1UQDO2kk4p
	hG0dGD1NYO4/TaeX4gJdMVM85fCHq54/5HVFA/pSdTothOwOeA6dtIHnbKqPaC6iuhdUfh/AC34
	aofasadmhHA==
X-Received: from ilmp8.prod.google.com ([2002:a92:c608:0:b0:51e:1b8:eceb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:c110:b0:576:4595:9836
 with SMTP id 5614622812f47-57a0ba52419mr994155b6e.40.1795116337420; Thu, 19
 Nov 2026 11:25:37 -0800 (PST)
Date: Thu, 19 Nov 2026 11:25:13 -0800
In-Reply-To: <20261119192520.1983406-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119192520.1983406-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119192520.1983406-3-irogers@google.com>
Subject: [PATCH v4 2/9] powerpc/secvar: Add missing kobject release callback
 to secvar_ktype
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Srish Srinivasan <ssrish@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1795116339-530D9CFC-71486320/0/0
X-purgate-type: clean
X-purgate-size: 1390
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In add_var(), a struct kobject is dynamically allocated with
kzalloc_obj() and initialized with secvar_ktype. If kobject_add() or
sysfs_create_file() fails, kobject_put(kobj) is called to clean up.
However, secvar_ktype does not define a .release callback, which results
in a memory leak of kobj (and a pr_debug warning in kobject_cleanup()
when CONFIG_DEBUG_KOBJECT_RELEASE is enabled).

Provide a secvar_release() callback that calls kfree(kobj).

Fixes: bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
Reviewed-by: Srish Srinivasan <ssrish@linux.ibm.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 arch/powerpc/kernel/secvar-sysfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index 395399bbab2c..f3f6ac25ea78 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -126,7 +126,13 @@ static const struct attribute_group secvar_attr_group = {
 };
 __ATTRIBUTE_GROUPS(secvar_attr);
 
+static void secvar_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
 static const struct kobj_type secvar_ktype = {
+	.release	= secvar_release,
 	.sysfs_ops	= &kobj_sysfs_ops,
 	.default_groups = secvar_attr_groups,
 };
-- 
2.56.1.708.g77570a6a1d-goog


