Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D632606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 06:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DqRfIaXx
Received: from list by lists.xenproject.org with outflank-mailman.1485169.1688458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xROSl-0005LM-Ci; Thu, 12 Nov 2026 06:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485169.1688458; Thu, 12 Nov 2026 06:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xROSl-0005LF-9P; Thu, 12 Nov 2026 06:39:11 +0000
Received: by outflank-mailman (input) for mailman id 1485169;
 Thu, 12 Nov 2026 06:39:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ma.mandourr@gmail.com>) id 1xROSk-0005Ja-4t
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 06:39:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xROSj-005rQS-I1
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 07:39:09 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ma.mandourr@gmail.com>)
 id 6af55f04-2eae-0a2a0a5409dd-0a2a450c8114-22
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 07:39:09 +0100
Received: from [209.85.210.171] (helo=mail-pf1-f171.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ma.mandourr@gmail.com>)
 id 6af55f0c-f479-0a2a450c0019-d155d2aba542-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 07:39:09 +0100
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-8a0880a46e7so318120b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 22:39:08 -0800 (PST)
Received: from cs-arch-srv04.cmpt.sfu.ca (cs-arch-srv04.cmpt.sfu.ca.
 [142.58.10.48]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baab9d572fsm3034188b3a.56.2026.11.11.22.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 22:39:06 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465547; x=1795070347; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jH7OYWG8lE6yHRDGuidbeMEDKLbprvboZgEKa+UBEyY=;
        b=DqRfIaXxj2fmsWx3AbdEdUy52U/A7mvI0KbQ6JFxL7cMS4f4NNRtrD80/emnrUTQzA
         tg5bnYNAqwgTLv0RJeKtvLPwXaYYpy4ffKguDfIf9JoQBlw8mglv6MfgrAYjmwQK53sB
         b3YU13HKvV645qD+L21tlxvnfFwzJ1Hs/orRcbk/5V1WyiXmVkcQQlENswvyy41NesIw
         I5D/W5mFc4sOUvhHNfB7wJ3hGaJHwFBnQ/pDUxgs1jAf2MHdyi+RnUDxJx3FfNv+uwEL
         o4a/DI2fb8/xxk5hN0S8bYfmEbmnw7M4ikMa8WETcsTiET6BYdv5WTokJKoNRLmpIhC5
         wT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465547; x=1795070347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jH7OYWG8lE6yHRDGuidbeMEDKLbprvboZgEKa+UBEyY=;
        b=0qRGzDLY5zjUbXhGB0p5i28BRvGWgxV3jpgOVAncvpxPtFzDcj2vP71+K/s22sRCWi
         ZnccmP6d2+y80PQVpXMsjOGQ7PBRYuUQqTS4Vh93g5sgjVPmTs4GlFS2j4wH/ILQrzH5
         CtN+7cXANkSVjDKionA2n9CSndAP4Zy5GXzFCdPlCe6KmIPIwDDa14crvYgbP2fT9Y6l
         UpDjlU6kfyNUMhOX6RslpoDp57nQZKPsNYjbO5KgKINfARChZAiEdw8RFWwGsLjlbub3
         OBNeCrxBlp4mtHdt865mr93rTn2VstzFOqJnI3KzwTig69Qn5R9gaeQ1vvp3Qt4GOqg3
         VV1g==
X-Gm-Message-State: APuU4Z8GOPxeCkToym43HrZoG1ToVj+7RjrB1EgLBCO0Wd1sJzobMfq8
	uZxyujpDgtFpfnx9Cor8HYQROSDfhQlmAzIIetMKUXDIApE3c7I4vwIUpRJRUA==
X-Gm-Gg: AYBFou3XOZug6+6NSZrn47p5yesTOuSBh1+ElRTAO05xmxWsYFJDPRm0ifHnkCEoCFQ
	zanjdcg8JNdnXA/nYyJuuNdwAIRreBmDBM13kxeYuUFYQrQfJURNGcSJO9bodDn4CcgAeY5qFHB
	CJw5m4xxAMgj6j0TAOhKqsOpyy9d2ujSi1C0fz61ZpkkLUTi08he3x2v7NNs99EdcXxjqrWuZwV
	0mXZBYhUS7LOoCplU7CK2vrrphokxr7UiKUeCTni/3Kt2V11daFrDfApfur+8v4FBuvT9bQXlzO
	xDXU21vXAjGmfxoRQrFiWbDYnL9rCyLcLfJd/XgFdYwnIVgBI8lC/KlZZ4MP7LPrWUAg8hPAIc1
	/iabmZzcJPqZr+KQby1SRMdvSk9gEEHjY7h0jTGjo/KNKP4V+DKcRT/i2E6ogy4MfLBxtTOTd3n
	t7gFLSQOWyOYKn1rvvNNR1Zn7ZtQ41XCTKtRpAfKLDoYioivlOAHBUDdaY3iOJMKK0JunMeFt86
	324R0KnDD+wD7dKvm0bky0YLxDVxmqN/M9636zVVOq/E+RBsjB1/BKBQlaHjTov0SwRpufoRDxX
	h2ANnH6aqV9pp4khBA/SlnsSj7CIQ/Gk8EPr85nVJAvJnQZbSVwfuugJjJSEi0heSOBfVnbIgoL
	JYnAXxQAGH0xThxKiSLPrGmmnpu9E8inncNsoP8SCT+9QuD+YA6NYIEcSM9yx859rHyzKXGFUQj
	NMWf1UjtK3HExzfXACfDu3U7x/I6jbICc=
X-Received: by 2002:a05:6a00:2d25:b0:881:e266:c3d8 with SMTP id d2e1a72fcca58-8bd62ce86b2mr1274241b3a.35.1794465547189;
        Wed, 11 Nov 2026 22:39:07 -0800 (PST)
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Subject: [PATCH] x86/nestedhvm: make L2's CLTS clear the CR0.TS that L2 reads
Date: Wed, 11 Nov 2026 22:39:06 -0800
Message-Id: <20261112063906.1096784-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794465549-77AD4A5B-2DD90DF2/0/0
X-purgate-type: clean
X-purgate-size: 1075
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When L1 does not own CR0.TS, Xen emulates L2's CLTS but leaves TS set in
the CR0 value nvmx_set_cr_read_shadow() installs for L2, so L2 reads TS
set until its next VM exit to L1. Clear it there too, as hvm_update_cr()
does for MOV to CR0.

Fixes: ef17e127c411 ("Nested VMX: CR emulation fix up")
Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>
---
Found by a VMX isolation fuzzer.

 xen/arch/x86/hvm/vmx/vmx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 3c7374a9ff..b5176485b5 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3294,6 +3294,8 @@ static int vmx_cr_access(cr_access_qual_t qual)
         if ( vm_event_is_enabled(curr) )
             hvm_monitor_crX(CR0, value, old);
         curr->arch.hvm.guest_cr[0] = value;
+        nestedhvm_set_cr(curr, 0,
+                         vcpu_nestedhvm(curr).guest_cr[0] & ~X86_CR0_TS);
         vmx_update_guest_cr(curr, 0, 0);
         TRACE(TRC_HVM_CLTS);
         break;
-- 
2.25.1


