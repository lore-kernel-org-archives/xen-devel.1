Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3A7C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:07:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF0C023A5F
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 15:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF0C023A5F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.67098.119480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04DT-0005rQ-Qs; Thu, 14 Jan 2021 15:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67098.119480; Thu, 14 Jan 2021 15:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04DT-0005rJ-Nz; Thu, 14 Jan 2021 15:07:15 +0000
Received: by outflank-mailman (input) for mailman id 67098;
 Thu, 14 Jan 2021 15:07:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04DS-0005r7-8B
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:07:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7525e7f-79d4-4910-b1ce-4b6ca41d03ae;
 Thu, 14 Jan 2021 15:07:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2083B94B;
 Thu, 14 Jan 2021 15:07:11 +0000 (UTC)
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
X-Inumbo-ID: c7525e7f-79d4-4910-b1ce-4b6ca41d03ae
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610636832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8epE1HCtTCPnsbXkHJXiQ7C0R5pieH3DxasIhNaIZuA=;
	b=V4x+akvE5bYYuvJY0idoahtblbLqBtS0kG/g9/y35rERlmJkOaUt7XndUyRsJdSEZaPhir
	QTJnM94Xk7R9WJJxr8gC17INVQqUZ6plRcMnKnno9AMFD+azNlCKZkUpDK86v0VugkOI0l
	6s/GDQm1zHbIdgX/awJAtDrLDAmIq7M=
Subject: [PATCH 08/17] x86: move stac()/clac() from {get,put}_unsafe_asm() ...
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <4d2506ad-b220-ad6a-9138-ff0d28410bab@suse.com>
Date: Thu, 14 Jan 2021 16:07:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

... to {get,put}_unsafe_size(). There's no need to have the macros
expanded once per case label in the latter. This also makes the former
well-formed single statements again. No change in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/uaccess.h
+++ b/xen/include/asm-x86/uaccess.h
@@ -155,7 +155,6 @@ struct __large_struct { unsigned long bu
  * aliasing issues.
  */
 #define put_unsafe_asm(x, addr, GUARD, err, itype, rtype, ltype, errret) \
-	stac();								\
 	__asm__ __volatile__(						\
 		GUARD(							\
 		"	guest_access_mask_ptr %[ptr], %[scr1], %[scr2]\n" \
@@ -170,11 +169,9 @@ struct __large_struct { unsigned long bu
 		: [ret] "+r" (err), [ptr] "=&r" (dummy_)		\
 		  GUARD(, [scr1] "=&r" (dummy_), [scr2] "=&r" (dummy_))	\
 		: [val] ltype (x), "m" (__m(addr)),			\
-		  "[ptr]" (addr), [errno] "i" (errret));		\
-	clac()
+		  "[ptr]" (addr), [errno] "i" (errret))
 
 #define get_unsafe_asm(x, addr, GUARD, err, rtype, ltype, errret)	\
-	stac();								\
 	__asm__ __volatile__(						\
 		GUARD(							\
 		"	guest_access_mask_ptr %[ptr], %[scr1], %[scr2]\n" \
@@ -191,12 +188,12 @@ struct __large_struct { unsigned long bu
 		  [ptr] "=&r" (dummy_)					\
 		  GUARD(, [scr1] "=&r" (dummy_), [scr2] "=&r" (dummy_))	\
 		: "m" (__m(addr)), "[ptr]" (addr),			\
-		  [errno] "i" (errret));				\
-	clac()
+		  [errno] "i" (errret))
 
 #define put_unsafe_size(x, ptr, size, grd, retval, errret)                 \
 do {                                                                       \
     retval = 0;                                                            \
+    stac();                                                                \
     switch ( size )                                                        \
     {                                                                      \
     long dummy_;                                                           \
@@ -214,6 +211,7 @@ do {
         break;                                                             \
     default: __put_user_bad();                                             \
     }                                                                      \
+    clac();                                                                \
 } while ( false )
 
 #define put_guest_size(x, ptr, size, retval, errret) \
@@ -222,6 +220,7 @@ do {
 #define get_unsafe_size(x, ptr, size, grd, retval, errret)                 \
 do {                                                                       \
     retval = 0;                                                            \
+    stac();                                                                \
     switch ( size )                                                        \
     {                                                                      \
     long dummy_;                                                           \
@@ -231,6 +230,7 @@ do {
     case 8: get_unsafe_asm(x, ptr, grd, retval,  "", "=r", errret); break; \
     default: __get_user_bad();                                             \
     }                                                                      \
+    clac();                                                                \
 } while ( false )
 
 #define get_guest_size(x, ptr, size, retval, errret)                       \


