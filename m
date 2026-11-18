Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A71606A33D
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 14:08:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1494608.1694034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTgKf-0008AV-SH; Wed, 18 Nov 2026 14:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494608.1694034; Wed, 18 Nov 2026 14:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTgKf-0008AO-Pb; Wed, 18 Nov 2026 14:08:17 +0000
Received: by outflank-mailman (input) for mailman id 1494608;
 Wed, 18 Nov 2026 14:08:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 1xTgKe-0008AI-UH
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 14:08:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTgKd-00Ep9R-W1
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 15:08:15 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6afdb14d-8faa-0a2a0a5109dd-0a2a4508ea98-16
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 15:08:15 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <abdelkareem.abdelsaamad@citrix.com>)
 id 6afdb14e-f659-0a2a45080019-a06583099f16-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 15:08:15 +0100
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id 5C99D84F4CBF;
 Wed, 18 Nov 2026 09:06:46 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: chunjie.zhu@citrix.com
Cc: xen-devel@lists.xenproject.org,
	andrew.cooper3@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	abdelkareem.abdelsaamad@citrix.com
Subject: Re: [PATCH v1 4/5] x86/nestedsvm: update vmcb correctly
Date: Wed, 18 Nov 2026 14:08:11 +0000
Message-ID: <20261118140811.101510-1-abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <293d4fce5adc8b4a7f8e9e2700ecaee988ac803c.1790146987.git.chunjie.zhu@citrix.com>
References: <293d4fce5adc8b4a7f8e9e2700ecaee988ac803c.1790146987.git.chunjie.zhu@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1795010895-CED4087B-358BB705/0/0
X-purgate-type: clean
X-purgate-size: 751
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>-    /* Virtual Interrupts */
>-    ns_vmcb->_vintr = n2vmcb->_vintr;
>-    if ( !svm->ns_hostflags.fields.vintrmask )
>-        ns_vmcb->_vintr.fields.intr_masking = 0;
>+    /*
>+     * Virtual Interrupts.  #VMEXIT writes back V_TPR and V_IRQ (APM vol.2
>+     * 15.6); the remaining fields do not change.
Not sure if this has changed recently but the APM also mentions the
INTERRUPT_SHADOW bits? Not sure if the plural bits means also
GUEST_INTERRUPT_MASK?
>+     * enabled in L1.
>+     */
>+    ns_vmcb->_vintr.fields.tpr = n2vmcb->_vintr.fields.tpr;
>+    ns_vmcb->_vintr.fields.irq = n2vmcb->_vintr.fields.irq;
>+    if ( ns_vmcb->_vintr.fields.vgif_enable )
>+        ns_vmcb->_vintr.fields.vgif = n2vmcb->_vintr.fields.vgif;

