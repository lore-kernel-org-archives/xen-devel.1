Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9224E606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=KKJ2zZmb
Received: from list by lists.xenproject.org with outflank-mailman.1483822.1687182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9HB-0005FL-P6; Wed, 11 Nov 2026 14:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1483822.1687182; Wed, 11 Nov 2026 14:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9HB-0005FE-LF; Wed, 11 Nov 2026 14:26:13 +0000
Received: by outflank-mailman (input) for mailman id 1483822;
 Wed, 11 Nov 2026 14:26:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9HA-0005Ey-6G
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 14:26:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9H9-000kUV-JB
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:26:11 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47afe-bab6-0a2a0a5309dd-0a2a450587e2-24
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:26:11 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af47b03-4cb1-0a2a45050019-d1558033e1b2-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 15:26:11 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4afe2d546f9so40573675e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 06:26:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49895f4e6ffsm10298667f8f.16.2026.11.11.06.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 06:26:09 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794407171; x=1795011971; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h4g09MXqwxA6JGD/nwvGQ5gUvVv6XbPFckJWFd2XsFc=;
        b=KKJ2zZmbWuJKTXj797WpJ9qJZ+VUa+qe+sjG4m/WPxe0FcgiVrMtY+C2UbS94JWo7a
         AlhhLW4RrzneRt0CWWA0FGMnLegSgvGxLRTjKYn8HVplGlEZIY4IRPXVxhEVFgrdRXB0
         /kesemAjGbaWliOAkM14k4eBNGnvoLl+6MUCTM+5o1OYkx162321SruT2iTy/8hgkaPO
         AUca5wzeqp1JwTivvpwCm/yDWDp2zp1zBJltjDeHUDcdUCVde5FP4IsJ4nYIwL9UGQ3Q
         iFQ49BDTY2UAaNaE7hjoN7vQ9oiwU2jGLKC5y/y7pwKCzoOT0ZRFRN6Uz6CxlCSTQWQd
         BzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407171; x=1795011971;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h4g09MXqwxA6JGD/nwvGQ5gUvVv6XbPFckJWFd2XsFc=;
        b=AjUDriKxVDTDNNOI6aHaQhJA7Sw1X9ZBblGhDlzJ1vfciptn1YQ2rqYSdmsOcd4Cga
         KOF0NM5NcCGkWTNKA+cxFZoxCjwtecaTQrzCmj5BsAo2kgInT70L5bD77wplSTWgMMMG
         fgrGP99+1peSWy9C01ga5+R/1seQhEefywWi6jS4TKWRKRjo2jbtx5qt9j4XSouvFOeD
         avZketpVlamNX7wfkcl28TDJFJvHX6lbgnFR/Oy9U0qUgLNzMAZNcgETYBfCSz7G4Yrg
         VLPGMqJyCArH/34x/r/GjOqa4tNmCsKXWBeLpiyPI7GW3vqc5XLLhobFhg6V7MnY1BF1
         TGDg==
X-Gm-Message-State: APuU4Z+Rm3xEL/cWnSXrIu7+jaZSCq4V+kZZ62W7EGd3E70dw0sb8ofc
	MO/4edGMCBHl1Ap+owQw3WESVxvWigLgzNwl5t/nDq8XHpShDkBW9PApmewq2rUyp19Jtpatx1t
	z1ecXQg==
X-Gm-Gg: AYBFou0COiG0jDw9qMIavqdBut39zjxqTm114Uebs+bmKVuDIWUmTYPYCabNXo60WEr
	YTRLrwCgzlJbPBCgWwXmePTMNb10ToDpEtUoMFvIaZ0Ix/U3m/bd4gJu1zv8Zhx8RaCEDF/bTDd
	9ZeoNHBnrr+ezeKHbj4OJl/xiV0JvFsXv53Xlp4Oj+lDD17hiEarnfrTt5lW998iCmL3rApDeT9
	CrsKIGMI1NCusB7/tfHpiocd1xh9yo3xKsD6fYBb9lRe8tCJRhFokcUussW0e1IYwpBbtnUoR8s
	smaM7EThBu1PD3vRJFSc1q7/yyxRnuKb2IS9GeqQrojYWEOVuqz9FkJHOkdNnvjdh25imaWJ3s4
	NCeRQ0zS0e6PEDS7+5gHBPkk6TltYu78djdRsDqT9xEGlc+QL8n/qHeGtNqa1P2Rv37egGC7nsp
	6S45xebI3sAmn0A8yoyCQJ2DT8qvLK93t34oILWAqc3oMyaliU0QyqAFheO1SnT0K7+qsl6siUt
	F/dbHpOhFxFuj9x/2MBaej0tSTdaZDY68RsbNNr0A31Tc+TEtAa3rYhDc2Lu9p8EfQRr8230msi
	eo+hBl2QuV/pQSl73F1Te+DIW9xY8U1G81Nkmo6EL1PcOyXZHxGe+vqkEhjJnMfyziE6W3yhNG8
	c50w5TjlJgksXkHEgBw==
X-Received: by 2002:a05:600c:c4a6:b0:4a2:5267:3cd4 with SMTP id 5b1f17b1804b1-4ba0931d5bamr42729425e9.3.1794407170259;
        Wed, 11 Nov 2026 06:26:10 -0800 (PST)
Message-ID: <b32e793e-7e7b-40e1-8640-76be087ba2e1@suse.com>
Date: Wed, 11 Nov 2026 15:26:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 14/30] x86emul: support basic APX EVEX-encoded ALU insns
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <17d56a5d-41f2-4691-aea7-d6dfdde5ad32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794407171-F7CB82A1-7F338F70/10/78276251493
X-purgate-type: spam
X-purgate-size: 57175
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Quite a bit of generic (opcode independent) logic is needed to recognize /
handle (and reject when invalid to use) EVEX.nd and EVEX.nf. Opcode
independent SIMD mask register reads need suppressing for anything
promoted to EVEX from legacy or VEX encodings. Some basic SCC logic is
also better to have in decode_map4() right away, even if CCMPcc and
CTESTcc otherwise aren't covered here.

Predicates testing in the harness also needs a new "pass" added, to check
that with EVEX.nd set even insn forms with formerly a memory destination
are reported as just memory reads.

APX-NCI-NDD-NF applicability is a little odd: Anything representable by a
REX2 encoding requires the feature when EVEX-encoded, no matter whether
EVEX.nd or EVEX.nf are actually set. Anything that doesn't have a REX2
encoding works normally, i.e. requiring the feature bit only when either
of the features is actually used.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: To check just 64-bit mode during decode and XCR0.APX during (early)
     execute is only one of the options. Like for REX2 we could also
     check XCR0.APX during decode, just that predicates testing then
     grows more involved (and respective entries then wouldn't be
     tested anymore on APX-incapable hardware, unlike everything).

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -10,7 +10,7 @@ struct test {
     unsigned int pfx:2;
     unsigned int vsz:3;
     unsigned int esz:4;
-    unsigned int scale:1;
+    unsigned int scale:2;
     unsigned int ext:3;
 };
 
@@ -19,7 +19,7 @@ enum spc {
     SPC_0f,
     SPC_0f38,
     SPC_0f3a,
-    SPC_unused4,
+    SPC_map4,
     SPC_map5,
     SPC_map6,
     SPC_unused7,
@@ -41,6 +41,7 @@ enum vl {
 enum scale { /* scale by memory operand ... */
     SC_vl,   /* ... vector length */
     SC_el,   /* ... element length */
+    SC_no,   /* Don't scale. */
 };
 
 /*
@@ -861,6 +862,110 @@ static const struct test sm4_all[] = {
     INSN(sm4rnds4, f2, 0f38, da, vl, d_nb, vl),
 };
 
+static const struct test apx_f[] = {
+    INSN(adc,         , map4, 11,    el,   dq, no),
+    INSN(adc,         , map4, 13,    el,   dq, no),
+    INSNX(adc,        , map4, 81, 2, el,   dq, no),
+    INSNX(adc,        , map4, 83, 2, el,   dq, no),
+    INSN(adcb,        , map4, 10,    el,    b, no),
+    INSN(adcb,        , map4, 12,    el,    b, no),
+    INSNX(adcb,       , map4, 80, 2, el,    b, no),
+    INSN(adcw,      66, map4, 11,    el,    w, no),
+    INSN(adcw,      66, map4, 13,    el,    w, no),
+    INSNX(adcw,     66, map4, 81, 2, el,    w, no),
+    INSNX(adcw,     66, map4, 83, 2, el,    w, no),
+    INSN(add,         , map4, 01,    el,   dq, no),
+    INSN(add,         , map4, 03,    el,   dq, no),
+    INSNX(add,        , map4, 81, 0, el,   dq, no),
+    INSNX(add,        , map4, 83, 0, el,   dq, no),
+    INSN(addb,        , map4, 00,    el,    b, no),
+    INSN(addb,        , map4, 02,    el,    b, no),
+    INSNX(addb,       , map4, 80, 0, el,    b, no),
+    INSN(addw,      66, map4, 01,    el,    w, no),
+    INSN(addw,      66, map4, 03,    el,    w, no),
+    INSNX(addw,     66, map4, 81, 0, el,    w, no),
+    INSNX(addw,     66, map4, 83, 0, el,    w, no),
+    INSN(and,         , map4, 21,    el,   dq, no),
+    INSN(and,         , map4, 23,    el,   dq, no),
+    INSNX(and,        , map4, 81, 4, el,   dq, no),
+    INSNX(and,        , map4, 83, 4, el,   dq, no),
+    INSN(andb,        , map4, 20,    el,    b, no),
+    INSN(andb,        , map4, 22,    el,    b, no),
+    INSNX(andb,       , map4, 80, 4, el,    b, no),
+    INSN(andw,      66, map4, 21,    el,    w, no),
+    INSN(andw,      66, map4, 23,    el,    w, no),
+    INSNX(andw,     66, map4, 81, 4, el,    w, no),
+    INSNX(andw,     66, map4, 83, 4, el,    w, no),
+    INSNX(dec,        , map4, ff, 1, el,   dq, no),
+    INSNX(decb,       , map4, fe, 1, el,    b, no),
+    INSNX(decw,     66, map4, ff, 1, el,    w, no),
+    INSNX(div,        , map4, f7, 6, el,   dq, no),
+    INSNX(divb,       , map4, f6, 6, el,    b, no),
+    INSNX(divw,     66, map4, f7, 6, el,    w, no),
+    INSNX(idiv,       , map4, f7, 7, el,   dq, no),
+    INSNX(idivb,      , map4, f6, 7, el,    b, no),
+    INSNX(idivw,    66, map4, f7, 7, el,    w, no),
+    INSNX(imul,       , map4, f7, 5, el,   dq, no),
+    INSNX(imulb,      , map4, f6, 5, el,    b, no),
+    INSNX(imulw,    66, map4, f7, 5, el,    w, no),
+    INSNX(inc,        , map4, ff, 0, el,   dq, no),
+    INSNX(incb,       , map4, fe, 0, el,    b, no),
+    INSNX(incw,     66, map4, ff, 0, el,    w, no),
+    INSNX(mul,        , map4, f7, 4, el,   dq, no),
+    INSNX(mulb,       , map4, f6, 4, el,    b, no),
+    INSNX(mulw,     66, map4, f7, 4, el,    w, no),
+    INSNX(neg,        , map4, f7, 3, el,   dq, no),
+    INSNX(negb,       , map4, f6, 3, el,    b, no),
+    INSNX(negw,     66, map4, f7, 3, el,    w, no),
+    INSNX(not,        , map4, f7, 2, el,   dq, no),
+    INSNX(notb,       , map4, f6, 2, el,    b, no),
+    INSNX(notw,     66, map4, f7, 2, el,    w, no),
+    INSN(or,          , map4, 09,    el,   dq, no),
+    INSN(or,          , map4, 0b,    el,   dq, no),
+    INSNX(or,         , map4, 81, 1, el,   dq, no),
+    INSNX(or,         , map4, 83, 1, el,   dq, no),
+    INSN(orb,         , map4, 08,    el,    b, no),
+    INSN(orb,         , map4, 0a,    el,    b, no),
+    INSNX(orb,        , map4, 80, 1, el,    b, no),
+    INSN(orw,       66, map4, 09,    el,    w, no),
+    INSN(orw,       66, map4, 0b,    el,    w, no),
+    INSNX(orw,      66, map4, 81, 1, el,    w, no),
+    INSNX(orw,      66, map4, 83, 1, el,    w, no),
+    INSN(sbb,         , map4, 19,    el,   dq, no),
+    INSN(sbb,         , map4, 1b,    el,   dq, no),
+    INSNX(sbb,        , map4, 81, 3, el,   dq, no),
+    INSNX(sbb,        , map4, 83, 3, el,   dq, no),
+    INSN(sbbb,        , map4, 18,    el,    b, no),
+    INSN(sbbb,        , map4, 1a,    el,    b, no),
+    INSNX(sbbb,       , map4, 80, 3, el,    b, no),
+    INSN(sbbw,      66, map4, 19,    el,    w, no),
+    INSN(sbbw,      66, map4, 1b,    el,    w, no),
+    INSNX(sbbw,     66, map4, 81, 3, el,    w, no),
+    INSNX(sbbw,     66, map4, 83, 3, el,    w, no),
+    INSN(sub,         , map4, 29,    el,   dq, no),
+    INSN(sub,         , map4, 2b,    el,   dq, no),
+    INSNX(sub,        , map4, 81, 5, el,   dq, no),
+    INSNX(sub,        , map4, 83, 5, el,   dq, no),
+    INSN(subb,        , map4, 28,    el,    b, no),
+    INSN(subb,        , map4, 2a,    el,    b, no),
+    INSNX(subb,       , map4, 80, 5, el,    b, no),
+    INSN(subw,      66, map4, 29,    el,    w, no),
+    INSN(subw,      66, map4, 2b,    el,    w, no),
+    INSNX(subw,     66, map4, 81, 5, el,    w, no),
+    INSNX(subw,     66, map4, 83, 5, el,    w, no),
+    INSN(xor,         , map4, 31,    el,   dq, no),
+    INSN(xor,         , map4, 33,    el,   dq, no),
+    INSNX(xor,        , map4, 81, 6, el,   dq, no),
+    INSNX(xor,        , map4, 83, 6, el,   dq, no),
+    INSN(xorb,        , map4, 30,    el,    b, no),
+    INSN(xorb,        , map4, 32,    el,    b, no),
+    INSNX(xorb,       , map4, 80, 6, el,    b, no),
+    INSN(xorw,      66, map4, 31,    el,    w, no),
+    INSN(xorw,      66, map4, 33,    el,    w, no),
+    INSNX(xorw,     66, map4, 81, 6, el,    w, no),
+    INSNX(xorw,     66, map4, 83, 6, el,    w, no),
+};
+
 static const unsigned char vl_all[] = { VL_512, VL_128, VL_256 };
 static const unsigned char vl_128[] = { VL_128 };
 static const unsigned char vl_no128[] = { VL_512, VL_256 };
@@ -882,6 +987,17 @@ static const uint16_t imm0f[16] = {
             (1 << 0x6) /* vshufp{d,s} */,
 };
 
+/*
+ * This table, indicating the size of a possible immediate for a map 4 major
+ * opcode, is indexed by major opcode byte.  Entries of value 4 will mean 2
+ * when operand size is 16-bit.
+ */
+static const uint8_t immM4[256] = {
+    [0x80] = 1,
+    [0x81] = 4,
+    [0x83] = 1,
+};
+
 static struct x86_emulate_ops emulops;
 
 /*
@@ -912,7 +1028,17 @@ static int read(enum x86_segment seg, un
 {
     if ( !record_access(seg, offset, bytes + !bytes) )
         return X86EMUL_UNHANDLEABLE;
-    memset(p_data, 0, bytes);
+
+    /*
+     * While 0 is the "better" dummy value, APX'es DIV/IDIV won't tolerate
+     * that.
+     */
+    memset(p_data,
+           ((ctxt->opcode | X86EMUL_OPC_66(0, 1))
+            != X86EMUL_OPC_EVEX_66(4, 0xf7) ? 0
+                                            : 0x7f),
+           bytes);
+
     return X86EMUL_OKAY;
 }
 
@@ -924,6 +1050,15 @@ static int write(enum x86_segment seg, u
     return X86EMUL_OKAY;
 }
 
+static int rmw(enum x86_segment seg, unsigned long offset, unsigned int bytes,
+               uint32_t *eflags, struct x86_emulate_state *state,
+               struct x86_emulate_ctxt *ctxt)
+{
+    if ( !record_access(seg, offset, bytes) )
+        return X86EMUL_UNHANDLEABLE;
+    return X86EMUL_OKAY;
+}
+
 static void test_one(const struct test *test, enum vl vl,
                      unsigned char *instr, struct x86_emulate_ctxt *ctxt)
 {
@@ -931,9 +1066,9 @@ static void test_one(const struct test *
     int rc;
     bool sg = strstr(test->mnemonic, "gather") ||
               strstr(test->mnemonic, "scatter");
-    bool imm = test->spc == SPC_0f3a ||
-               (test->spc == SPC_0f &&
-                (imm0f[test->opc >> 4] & (1 << (test->opc & 0xf))));
+    unsigned int imm = test->spc == SPC_0f3a ||
+                       (test->spc == SPC_0f &&
+                        (imm0f[test->opc >> 4] & (1 << (test->opc & 0xf))));
     union evex {
         uint8_t raw[3];
         struct {
@@ -966,7 +1101,7 @@ static void test_one(const struct test *
         break;
 
     case ESZ_w:
-        evex.w = 1;
+        evex.w = test->scale != SC_no;
         /*
          * VBMAC{,X}OR16x16x16 don't follow the general pattern: EVEX.W controls
          * reduction kind there, not element size.
@@ -1034,6 +1169,13 @@ static void test_one(const struct test *
         ASSERT_UNREACHABLE();
     }
 
+    if ( test->spc == SPC_map4 )
+    {
+        imm = immM4[test->opc];
+        if ( imm == 4 && test->pfx == PFX_66 )
+            imm = 2;
+    }
+
     /*
      * Note: SIB addressing is used here, such that S/G insns can be handled
      * without extra conditionals.
@@ -1047,9 +1189,28 @@ static void test_one(const struct test *
     instr[6] = 0x22; /* SIB: base rDX, index none / xMM4 */
     instr[7] = 1; /* Disp8 */
     instr[8] = 0; /* immediate, if any */
+    instr[9] = 0; /* immediate, if wider than 8 bits */
+    instr[10] = 0; /* immediate, if wider than 16 bits */
+    instr[11] = 0; /* immediate, if wider than 24 bits */
 
-    asm volatile ( "kxnorw %k1, %k1, %k1" );
-    asm volatile ( "vxorps %xmm4, %xmm4, %xmm4" );
+    if ( test->spc != SPC_map4 )
+    {
+        asm volatile ( "kxnorw %k1, %k1, %k1" );
+        asm volatile ( "vxorps %xmm4, %xmm4, %xmm4" );
+    }
+    else
+    {
+        switch ( test->opc )
+        {
+        case 0xf6:
+            /*
+             * For APX 8-bit DIV/IDIV %ah needs to be less than what read()
+             * provides as divisor.  Just set the entire %rax to zero.
+             */
+            ctxt->regs->eax = 0;
+            break;
+        }
+    }
 
     ctxt->regs->eip = (unsigned long)&instr[0];
     ctxt->regs->edx = 0;
@@ -1060,11 +1221,11 @@ static void test_one(const struct test *
          (ctxt->regs->eip != (unsigned long)&instr[8 + imm]) )
         goto fail;
 
-    for ( i = 0; i < (test->scale == SC_vl ? vsz : esz); ++i )
+    n = test->scale == SC_vl ? vsz : test->scale != SC_no ? esz : 1;
+    for ( i = 0; i < n; ++i )
         if ( accessed[i] )
             goto fail;
 
-    n = test->scale == SC_vl ? vsz : esz;
     if ( !sg )
         n += vsz;
     else
@@ -1120,8 +1281,11 @@ static void test_one(const struct test *
     return;
 
  fail:
-    printf("failed (v%s%s %u-bit)\n", test->mnemonic,
-           evex.bcst ? "/bcst" : "", 128 << vl);
+    if ( test->scale != SC_no )
+        printf("failed (v%s%s %u-bit)\n", test->mnemonic,
+               evex.bcst ? "/bcst" : "", 128 << vl);
+    else
+        printf("failed (%s [0x%02x])\n", test->mnemonic, test->opc);
     exit(1);
 }
 
@@ -1184,7 +1348,8 @@ static void test_group(const struct test
 
             case ESZ_dq:
                 test_pair(&tests[i], vl[j], ESZ_d,
-                          strncmp(tests[i].mnemonic, "cvt", 3) ? "d" : "l",
+                          (strncmp(tests[i].mnemonic, "cvt", 3) &&
+                           tests[i].spc != SPC_map4 ? "d" : "l"),
                           ESZ_q, "q", instr, ctxt);
                 break;
 
@@ -1288,4 +1453,28 @@ void evex_disp8_test(void *instr, struct
     run(cpu_has_avx10_2, avx10_2, 128);
 
     run(cpu_has_avx10_2_aux, avx10_2_aux, all);
+
+    if ( cpu_has_apx_f )
+    {
+        bool wb = ctxt->force_writeback;
+        bool nci_ndd_nf = cpu_policy.apx.apx_nci_ndd_nf;
+
+        emulops.rmw = rmw;
+
+        ctxt->force_writeback = true;
+
+        /*
+         * The emulator doesn't itself use EVEX-encoded APX insns; allow them
+         * them to be decoded successfully.
+         */
+        cpu_policy.apx.apx_nci_ndd_nf = true;
+
+        printf("%-40s", "Testing APX-F disp8 handling...");
+        test_group(apx_f, ARRAY_SIZE(apx_f),
+                   vl_128, ARRAY_SIZE(vl_128), instr, ctxt);
+        printf("okay\n");
+
+        cpu_policy.apx.apx_nci_ndd_nf = nci_ndd_nf;
+        ctxt->force_writeback = wb;
+    }
 }
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1642,6 +1642,7 @@ static const struct evex {
     uint8_t w:2;
     uint8_t l:3;
     bool mask:1;
+    bool nd:1;
 #define L2 4
 #define Ln (L0 | L1 | L2)
 } evex_0f[] = {
@@ -2127,6 +2128,119 @@ static const struct evex {
     { { 0xc2 }, 3, T, R, pfx_f2, W0, Ln }, /* vcmpbf16 */
     { { 0xce }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineqb */
     { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
+}, evex_map4[] = {
+#ifdef __x86_64__
+#define ND .nd = true
+    { { 0x00 }, 2, T, W, pfx_no, WIG, L0, ND }, /* add */
+    { { 0x01 }, 2, T, W, pfx_no, Wn, L0, ND }, /* add */
+    { { 0x01 }, 2, T, W, pfx_66, Wn, L0, ND }, /* add */
+    { { 0x02 }, 2, T, R, pfx_no, WIG, L0, ND }, /* add */
+    { { 0x03 }, 2, T, R, pfx_no, Wn, L0, ND }, /* add */
+    { { 0x03 }, 2, T, R, pfx_66, Wn, L0, ND }, /* add */
+    { { 0x08 }, 2, T, W, pfx_no, WIG, L0, ND }, /* or */
+    { { 0x09 }, 2, T, W, pfx_no, Wn, L0, ND }, /* or */
+    { { 0x09 }, 2, T, W, pfx_66, Wn, L0, ND }, /* or */
+    { { 0x0a }, 2, T, R, pfx_no, WIG, L0, ND }, /* or */
+    { { 0x0b }, 2, T, R, pfx_no, Wn, L0, ND }, /* or */
+    { { 0x0b }, 2, T, R, pfx_66, Wn, L0, ND }, /* or */
+    { { 0x10 }, 2, T, W, pfx_no, WIG, L0, ND }, /* adc */
+    { { 0x11 }, 2, T, W, pfx_no, Wn, L0, ND }, /* adc */
+    { { 0x11 }, 2, T, W, pfx_66, Wn, L0, ND }, /* adc */
+    { { 0x12 }, 2, T, R, pfx_no, WIG, L0, ND }, /* adc */
+    { { 0x13 }, 2, T, R, pfx_no, Wn, L0, ND }, /* adc */
+    { { 0x13 }, 2, T, R, pfx_66, Wn, L0, ND }, /* adc */
+    { { 0x18 }, 2, T, W, pfx_no, WIG, L0, ND }, /* sbb */
+    { { 0x19 }, 2, T, W, pfx_no, Wn, L0, ND }, /* sbb */
+    { { 0x19 }, 2, T, W, pfx_66, Wn, L0, ND }, /* sbb */
+    { { 0x1a }, 2, T, R, pfx_no, WIG, L0, ND }, /* sbb */
+    { { 0x1b }, 2, T, R, pfx_no, Wn, L0, ND }, /* sbb */
+    { { 0x1b }, 2, T, R, pfx_66, Wn, L0, ND }, /* sbb */
+    { { 0x20 }, 2, T, W, pfx_no, WIG, L0, ND }, /* and */
+    { { 0x21 }, 2, T, W, pfx_no, Wn, L0, ND }, /* and */
+    { { 0x21 }, 2, T, W, pfx_66, Wn, L0, ND }, /* and */
+    { { 0x22 }, 2, T, R, pfx_no, WIG, L0, ND }, /* and */
+    { { 0x23 }, 2, T, R, pfx_no, Wn, L0, ND }, /* and */
+    { { 0x23 }, 2, T, R, pfx_66, Wn, L0, ND }, /* and */
+    { { 0x28 }, 2, T, W, pfx_no, WIG, L0, ND }, /* sub */
+    { { 0x29 }, 2, T, W, pfx_no, Wn, L0, ND }, /* sub */
+    { { 0x29 }, 2, T, W, pfx_66, Wn, L0, ND }, /* sub */
+    { { 0x2a }, 2, T, R, pfx_no, WIG, L0, ND }, /* sub */
+    { { 0x2b }, 2, T, R, pfx_no, Wn, L0, ND }, /* sub */
+    { { 0x2b }, 2, T, R, pfx_66, Wn, L0, ND }, /* sub */
+    { { 0x30 }, 2, T, W, pfx_no, WIG, L0, ND }, /* xor */
+    { { 0x31 }, 2, T, W, pfx_no, Wn, L0, ND }, /* xor */
+    { { 0x31 }, 2, T, W, pfx_66, Wn, L0, ND }, /* xor */
+    { { 0x32 }, 2, T, R, pfx_no, WIG, L0, ND }, /* xor */
+    { { 0x33 }, 2, T, R, pfx_no, Wn, L0, ND }, /* xor */
+    { { 0x33 }, 2, T, R, pfx_66, Wn, L0, ND }, /* xor */
+    { { 0x80, 0x00 }, 3, T, W, pfx_no, WIG, L0, ND }, /* add */
+    { { 0x80, 0x08 }, 3, T, W, pfx_no, WIG, L0, ND }, /* or */
+    { { 0x80, 0x10 }, 3, T, W, pfx_no, WIG, L0, ND }, /* adc */
+    { { 0x80, 0x18 }, 3, T, W, pfx_no, WIG, L0, ND }, /* sbb */
+    { { 0x80, 0x20 }, 3, T, W, pfx_no, WIG, L0, ND }, /* and */
+    { { 0x80, 0x28 }, 3, T, W, pfx_no, WIG, L0, ND }, /* sub */
+    { { 0x80, 0x30 }, 3, T, W, pfx_no, WIG, L0, ND }, /* xor */
+    { { 0x81, 0x00 }, 6, T, W, pfx_no, Wn, L0, ND }, /* add */
+    { { 0x81, 0x00 }, 4, T, W, pfx_66, W0, L0, ND }, /* add */
+    { { 0x81, 0x00 }, 6, T, W, pfx_66, W1, L0, ND }, /* add */
+    { { 0x81, 0x08 }, 6, T, W, pfx_no, Wn, L0, ND }, /* or */
+    { { 0x81, 0x08 }, 4, T, W, pfx_66, W0, L0, ND }, /* or */
+    { { 0x81, 0x08 }, 6, T, W, pfx_66, W1, L0, ND }, /* or */
+    { { 0x81, 0x10 }, 6, T, W, pfx_no, Wn, L0, ND }, /* adc */
+    { { 0x81, 0x10 }, 4, T, W, pfx_66, W0, L0, ND }, /* adc */
+    { { 0x81, 0x10 }, 6, T, W, pfx_66, W1, L0, ND }, /* adc */
+    { { 0x81, 0x18 }, 6, T, W, pfx_no, Wn, L0, ND }, /* sbb */
+    { { 0x81, 0x18 }, 4, T, W, pfx_66, W0, L0, ND }, /* sbb */
+    { { 0x81, 0x18 }, 6, T, W, pfx_66, W1, L0, ND }, /* sbb */
+    { { 0x81, 0x20 }, 6, T, W, pfx_no, Wn, L0, ND }, /* and */
+    { { 0x81, 0x20 }, 4, T, W, pfx_66, W0, L0, ND }, /* and */
+    { { 0x81, 0x20 }, 6, T, W, pfx_66, W1, L0, ND }, /* and */
+    { { 0x81, 0x28 }, 6, T, W, pfx_no, Wn, L0, ND }, /* sub */
+    { { 0x81, 0x28 }, 4, T, W, pfx_66, W0, L0, ND }, /* sub */
+    { { 0x81, 0x28 }, 6, T, W, pfx_66, W1, L0, ND }, /* sub */
+    { { 0x81, 0x30 }, 6, T, W, pfx_no, Wn, L0, ND }, /* xor */
+    { { 0x81, 0x30 }, 4, T, W, pfx_66, W0, L0, ND }, /* xor */
+    { { 0x81, 0x30 }, 6, T, W, pfx_66, W1, L0, ND }, /* xor */
+    { { 0x83, 0x00 }, 3, T, W, pfx_no, Wn, L0, ND }, /* add */
+    { { 0x83, 0x00 }, 3, T, W, pfx_66, Wn, L0, ND }, /* add */
+    { { 0x83, 0x08 }, 3, T, W, pfx_no, Wn, L0, ND }, /* or */
+    { { 0x83, 0x08 }, 3, T, W, pfx_66, Wn, L0, ND }, /* or */
+    { { 0x83, 0x10 }, 3, T, W, pfx_no, Wn, L0, ND }, /* adc */
+    { { 0x83, 0x10 }, 3, T, W, pfx_66, Wn, L0, ND }, /* adc */
+    { { 0x83, 0x18 }, 3, T, W, pfx_no, Wn, L0, ND }, /* sbb */
+    { { 0x83, 0x18 }, 3, T, W, pfx_66, Wn, L0, ND }, /* sbb */
+    { { 0x83, 0x20 }, 3, T, W, pfx_no, Wn, L0, ND }, /* and */
+    { { 0x83, 0x20 }, 3, T, W, pfx_66, Wn, L0, ND }, /* and */
+    { { 0x83, 0x28 }, 3, T, W, pfx_no, Wn, L0, ND }, /* sub */
+    { { 0x83, 0x28 }, 3, T, W, pfx_66, Wn, L0, ND }, /* sub */
+    { { 0x83, 0x30 }, 3, T, W, pfx_no, Wn, L0, ND }, /* xor */
+    { { 0x83, 0x30 }, 3, T, W, pfx_66, Wn, L0, ND }, /* xor */
+    { { 0xf6, 0x10 }, 2, T, W, pfx_no, WIG, L0, ND }, /* not */
+    { { 0xf6, 0x18 }, 2, T, W, pfx_no, WIG, L0, ND }, /* neg */
+    { { 0xf6, 0x20 }, 2, T, R, pfx_no, WIG, L0 }, /* mul */
+    { { 0xf6, 0x28 }, 2, T, R, pfx_no, WIG, L0 }, /* imul */
+    { { 0xf6, 0x30 }, 2, T, R, pfx_no, WIG, L0 }, /* div */
+    { { 0xf6, 0x38 }, 2, T, R, pfx_no, WIG, L0 }, /* idiv */
+    { { 0xf7, 0x10 }, 2, T, W, pfx_no, Wn, L0, ND }, /* not */
+    { { 0xf7, 0x10 }, 2, T, W, pfx_66, Wn, L0, ND }, /* not */
+    { { 0xf7, 0x18 }, 2, T, W, pfx_no, Wn, L0, ND }, /* neg */
+    { { 0xf7, 0x18 }, 2, T, W, pfx_66, Wn, L0, ND }, /* neg */
+    { { 0xf7, 0x20 }, 2, T, R, pfx_no, Wn, L0 }, /* mul */
+    { { 0xf7, 0x20 }, 2, T, R, pfx_66, Wn, L0 }, /* mul */
+    { { 0xf7, 0x28 }, 2, T, R, pfx_no, Wn, L0 }, /* imul */
+    { { 0xf7, 0x28 }, 2, T, R, pfx_66, Wn, L0 }, /* imul */
+    { { 0xf7, 0x30 }, 2, T, R, pfx_no, Wn, L0 }, /* div */
+    { { 0xf7, 0x30 }, 2, T, R, pfx_66, Wn, L0 }, /* div */
+    { { 0xf7, 0x38 }, 2, T, R, pfx_no, Wn, L0 }, /* idiv */
+    { { 0xf7, 0x38 }, 2, T, R, pfx_66, Wn, L0 }, /* idiv */
+    { { 0xfe, 0x00 }, 2, T, W, pfx_no, WIG, L0, ND }, /* inc */
+    { { 0xfe, 0x08 }, 2, T, W, pfx_no, WIG, L0, ND }, /* dec */
+    { { 0xff, 0x00 }, 2, T, W, pfx_no, Wn, L0, ND }, /* inc */
+    { { 0xff, 0x00 }, 2, T, W, pfx_66, Wn, L0, ND }, /* inc */
+    { { 0xff, 0x08 }, 2, T, W, pfx_no, Wn, L0, ND }, /* dec */
+    { { 0xff, 0x08 }, 2, T, W, pfx_66, Wn, L0, ND }, /* dec */
+#undef ND
+#endif /* __x86_64__ */
 }, evex_map5[] = {
     { { 0x10 }, 2, T, R, pfx_f3, W0, LIG }, /* vmovsh */
     { { 0x11 }, 2, T, W, pfx_f3, W0, LIG }, /* vmovsh */
@@ -2303,7 +2417,7 @@ static const struct {
     { evex_0f,   ARRAY_SIZE(evex_0f) },
     { evex_0f38, ARRAY_SIZE(evex_0f38) },
     { evex_0f3a, ARRAY_SIZE(evex_0f3a) },
-    { NULL,      0 },
+    { evex_map4, ARRAY_SIZE(evex_map4) },
     { evex_map5, ARRAY_SIZE(evex_map5) },
     { evex_map6, ARRAY_SIZE(evex_map6) },
 };
@@ -2641,6 +2755,9 @@ void predicates_test(void *instr, struct
 
         for ( x = 0; x < ARRAY_SIZE(evex); ++x )
         {
+            if ( evex[x].tbl == evex_map4 && !m )
+                continue;
+
             for ( t = 0; t < evex[x].num; ++t )
             {
                 uint8_t *ptr = instr;
@@ -2679,6 +2796,21 @@ void predicates_test(void *instr, struct
                                 evex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
                                 evex[x].tbl[t].mem, ctxt, fetch);
                     }
+
+                    if ( evex[x].tbl[t].nd )
+                    {
+                        ptr[-1] |= 0x10;
+                        /* Keep EVEX.W predictably clear for WIG / Wn cases. */
+                        if ( evex[x].tbl[t].w != W1 )
+                            ptr[-2] &= ~0x80;
+                        else
+                            ptr[-2] |= 0x80;
+                        memcpy(ptr, evex[x].tbl[t].opc, evex[x].tbl[t].len);
+
+                        do_test(instr, evex[x].tbl[t].len + ((void *)ptr - instr),
+                                evex[x].tbl[t].modrm ? (void *)ptr - instr + 1 : 0,
+                                mem_read, ctxt, fetch);
+                    }
                 }
             }
         }
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1098,7 +1098,9 @@ int main(int argc, char **argv)
     int rc;
 #ifdef __x86_64__
     unsigned int vendor_native;
+    bool nci_ndd_nf;
 #else
+# define nci_ndd_nf false
     unsigned int bcdres_native, bcdres_emul;
 #endif
 
@@ -1126,6 +1128,10 @@ int main(int argc, char **argv)
     if ( !stack_exec )
         printf("Warning: Stack could not be made executable (%d).\n", errno);
 
+#ifndef nci_ndd_nf
+    nci_ndd_nf = cpu_policy.apx.apx_nci_ndd_nf;
+#endif
+
  rmw_restart:
     printf("%-40s", "Testing addl %ecx,(%eax)...");
     instr[0] = 0x01; instr[1] = 0x08;
@@ -1360,6 +1366,148 @@ int main(int argc, char **argv)
          (regs.rip != (unsigned long)&instr[4]) )
         goto fail;
     printf("okay\n");
+
+    /*
+     * The emulator doesn't itself use EVEX-encoded APX insns, so we can
+     * actually run these tests on all hardware.
+     */
+    if ( true /* cpu_has_apx_nci_ndd_nf */ )
+    {
+        cpu_policy.apx.apx_nci_ndd_nf = true;
+
+        /* EVEX-encoded forms of the above/below, where applicable. */
+        instr[0] = 0x62;
+
+        printf("%-40s", "Testing {nf}add %ecx,(%rax)...");
+        instr[1] = 0xf4; instr[2] = 0x7c; instr[3] = 0x0c;
+        instr[4] = 0x01; instr[5] = 0x08;
+        regs.eflags = EFLAGS_ALWAYS_SET;
+        regs.rip    = (unsigned long)&instr[0];
+        regs.ecx    = 0x12345678;
+        regs.rax    = (unsigned long)res;
+        *res        = 0x7fffffff;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (*res != 0x92345677) ||
+             (regs.eflags != EFLAGS_ALWAYS_SET) ||
+             (regs.rip != (unsigned long)&instr[6]) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing add %ecx,(%rax),%edx...");
+        instr[2] = 0x6c; instr[3] = 0x18;
+        regs.rip    = (unsigned long)&instr[0];
+        regs.edx    = 0x87654321;
+        *res        = 0x7fffffff;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rdx != 0x92345677) ||
+             (*res != 0x7fffffff) ||
+             (regs.eflags != (EFLAGS_ALWAYS_SET |
+                              X86_EFLAGS(OF, SF, AF, PF))) ||
+             (regs.rip != (unsigned long)&instr[6]) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing add %cx,(%rax),%dx...");
+        instr[2] = 0x6d;
+        regs.eflags = EFLAGS_ALWAYS_SET;
+        regs.rip    = (unsigned long)&instr[0];
+        regs.ecx    = 0x56781234;
+        regs.edx    = 0x87654321;
+        *res        = 0xffff7fff;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rdx != 0x00009233) ||
+             (*res != 0xffff7fff) ||
+             (regs.eflags != (EFLAGS_ALWAYS_SET |
+                              X86_EFLAGS(OF, SF, AF, PF))) ||
+             (regs.rip != (unsigned long)&instr[6]) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing add %cl,(%rax),%dl...");
+        instr[2] = 0x6c; instr[4] = 0x00;
+        regs.eflags = EFLAGS_ALWAYS_SET;
+        regs.rip    = (unsigned long)&instr[0];
+        regs.ecx    = 0x34567812;
+        regs.edx    = 0x87654321;
+        *res        = 0xffffff7f;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rdx != 0x00000091) ||
+             (*res != 0xffffff7f) ||
+             (regs.eflags != (EFLAGS_ALWAYS_SET | X86_EFLAGS(OF, SF, AF))) ||
+             (regs.rip != (unsigned long)&instr[6]) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing {nf}xor (%rax),%ecx,%edx...");
+        instr[3] = 0x1c; instr[4] = 0x33;
+        regs.eflags = EFLAGS_ALWAYS_SET;
+        regs.rip    = (unsigned long)&instr[0];
+        regs.ecx    = 0xffffffff12345678UL;
+        regs.edx    = 0xccccccccccccccccUL;
+        *res        = 0x92345677;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (*res != 0x92345677) ||
+             (regs.rcx != 0xffffffff12345678UL) ||
+             (regs.rdx != 0x8000000fUL) ||
+             (regs.eflags != EFLAGS_ALWAYS_SET) ||
+             (regs.rip != (unsigned long)&instr[6]) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing not (%rdi),%cl...");
+        instr[2] = 0x74; instr[3] = 0x18; instr[4] = 0xf6; instr[5] = 0x17;
+        *res        = 0x22334455;
+        regs.eflags = EFLAGS_MASK;
+        regs.rip    = (unsigned long)&instr[0];
+        regs.rdi    = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (*res != 0x22334455) ||
+             (regs.rcx != 0x000000aa) ||
+             ((regs.eflags & EFLAGS_MASK) != EFLAGS_MASK) ||
+             (regs.rip != (unsigned long)&instr[6]) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing dec %cx,%ax...");
+        instr[2] = 0x7d; instr[4] = 0xff; instr[5] = 0xc9;
+        regs.eflags = EFLAGS_ALWAYS_SET;
+        regs.rip    = (unsigned long)&instr[0];
+        regs.ecx    = 0;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rax != 0x0000ffff) ||
+             (regs.rcx != 0) ||
+             (regs.eflags != (EFLAGS_ALWAYS_SET | X86_EFLAGS(SF, AF, PF))) ||
+             (regs.rip != (unsigned long)&instr[6]) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing {nf}imull -4(%rcx)...");
+        instr[2] = 0x7c; instr[3] = 0x0c;
+        instr[4] = 0xf7; instr[5] = 0x69; instr[6] = 0xfc;
+        regs.eflags = EFLAGS_ALWAYS_SET;
+        regs.rip    = (unsigned long)&instr[0];
+        regs.eax    = 0x89abcdef;
+        *res        = 0x12345678;
+        regs.rcx    = (unsigned long)(res + 1);
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.rax != 0x89abcdefU * 0x12345678) ||
+             (regs.rdx != (uint64_t)((int64_t)(int32_t)0x89abcdef *
+                                     0x12345678) >> 32) ||
+             (regs.eflags != EFLAGS_ALWAYS_SET) ||
+             (regs.rip != (unsigned long)&instr[7]) )
+            goto fail;
+        printf("okay\n");
+
+        cpu_policy.apx.apx_nci_ndd_nf = nci_ndd_nf;
+    }
 #endif
 
     printf("%-40s", "Testing xadd %ax,(%ecx)...");
@@ -5782,8 +5930,16 @@ int main(int argc, char **argv)
     if ( stack_exec )
         evex_disp8_test(instr, &ctxt, &emulops);
 
+    /*
+     * Some EVEX.nd / EVEX.nf checks occur during decode. Allow decode to
+     * succeed in such cases.
+     */
+    cpu_policy.apx.apx_nci_ndd_nf = true;
+
     predicates_test(instr, &ctxt, fetch);
 
+    cpu_policy.apx.apx_nci_ndd_nf = nci_ndd_nf;
+
     for ( j = 0; j < ARRAY_SIZE(blobs); j++ )
     {
         unsigned int nr;
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -530,6 +530,170 @@ static const struct ext0f3a_table {
     [0xf0] = { .two_op = 1 /* Mov */ },
 };
 
+static const struct map4_table {
+    bool to_mem:1; /* Unless EVEX.nd is set. */
+    bool byte:1;
+    bool immW:1;
+    bool imm8:1;
+    bool nd:1;
+    bool nf:1;
+    bool nci_ndd_nf:1; /* APX-NCI-NDD-NF required even if EVEX.{nd,nf}=0. */
+} map4_table[256][4] = {
+    [0x00] = { /* ADD (byte) */
+        [vex_np] = { .to_mem = true, .byte = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x01] = { /* ADD ({,d,q}word) */
+        [vex_np] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x02] = { /* ADD (byte) */
+        [vex_np] = { .byte = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x03] = { /* ADD ({,d,q}word) */
+        [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+        [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+    },
+    [0x08] = { /* OR (byte) */
+        [vex_np] = { .to_mem = true, .byte = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x09] = { /* OR ({,d,q}word) */
+        [vex_np] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x0a] = { /* OR (byte) */
+        [vex_np] = { .byte = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x0b] = { /* OR ({,d,q}word) */
+        [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+        [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+    },
+    [0x10] = { /* ADC (byte) */
+        [vex_np] = { .to_mem = true, .byte = true, .nd = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x11] = { /* ADC ({,d,q}word) */
+        [vex_np] = { .to_mem = true, .nd = true, .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .nd = true, .nci_ndd_nf = true },
+    },
+    [0x12] = { /* ADC (byte) */
+        [vex_np] = { .byte = true, .nd = true, .nci_ndd_nf = true },
+    },
+    [0x13] = { /* ADC ({,d,q}word) */
+        [vex_np] = { .nd = true, .nci_ndd_nf = true },
+        [vex_66] = { .nd = true, .nci_ndd_nf = true },
+    },
+    [0x18] = { /* SBB (byte) */
+        [vex_np] = { .to_mem = true, .byte = true, .nd = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x19] = { /* SBB ({,d,q}word) */
+        [vex_np] = { .to_mem = true, .nd = true, .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .nd = true, .nci_ndd_nf = true },
+    },
+    [0x1a] = { /* SBB (byte) */
+        [vex_np] = { .byte = true, .nd = true, .nci_ndd_nf = true },
+    },
+    [0x1b] = { /* SBB ({,d,q}word) */
+        [vex_np] = { .nd = true, .nci_ndd_nf = true },
+        [vex_66] = { .nd = true, .nci_ndd_nf = true },
+    },
+    [0x20] = { /* AND (byte) */
+        [vex_np] = { .to_mem = true, .byte = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x21] = { /* AND ({,d,q}word) */
+        [vex_np] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x22] = { /* AND (byte) */
+        [vex_np] = { .byte = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x23] = { /* AND ({,d,q}word) */
+        [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+        [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+    },
+    [0x28] = { /* SUB (byte) */
+        [vex_np] = { .to_mem = true, .byte = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x29] = { /* SUB ({,d,q}word) */
+        [vex_np] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x2a] = { /* SUB (byte) */
+        [vex_np] = { .byte = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x2b] = { /* SUB ({,d,q}word) */
+        [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+        [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+    },
+    [0x30] = { /* XOR (byte) */
+        [vex_np] = { .to_mem = true, .byte = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x31] = { /* XOR ({,d,q}word) */
+        [vex_np] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x32] = { /* XOR (byte) */
+        [vex_np] = { .byte = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x33] = { /* XOR ({,d,q}word) */
+        [vex_np] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+        [vex_66] = { .nd = true, .nf = true, .nci_ndd_nf = true },
+    },
+    [0x80] = { /* Grp1 (byte); .nf depends on modrm_reg */
+        [vex_np] = { .to_mem = true, .byte = true, .imm8 = true, .nd = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x81] = { /* Grp1 ({,d,q}word); .nf depends on modrm_reg */
+        [vex_np] = { .to_mem = true, .immW = true, .nd = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .immW = true, .nd = true,
+                     .nci_ndd_nf = true },
+    },
+    [0x83] = { /* Grp1 ({,d,q}word); .nf depends on modrm_reg */
+        [vex_np] = { .to_mem = true, .imm8 = true, .nd = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .imm8 = true, .nd = true,
+                     .nci_ndd_nf = true },
+    },
+    [0xf6] = { /* Grp3 (byte); most attributes depend on modrm_reg */
+        [vex_np] = { .byte = true, .nci_ndd_nf = true },
+    },
+    [0xf7] = { /* Grp3 ({,d,q}word); most attributes depend on modrm_reg */
+        [vex_np] = { .nci_ndd_nf = true },
+        [vex_66] = { .nci_ndd_nf = true },
+    },
+    [0xfe] = { /* Grp4 */
+        [vex_np] = { .to_mem = true, .byte = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+    [0xff] = { /* Grp5 */
+        [vex_np] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+        [vex_66] = { .to_mem = true, .nd = true, .nf = true,
+                     .nci_ndd_nf = true },
+    },
+};
+
 static const opcode_desc_t xop_table[] = {
     DstReg|SrcImmByte|ModRM,
     DstReg|SrcMem|ModRM,
@@ -1030,6 +1194,78 @@ decode_0f3a(struct x86_emulate_state *s,
     return X86EMUL_OKAY;
 }
 
+static int
+decode_map4(struct x86_emulate_state *s,
+            struct x86_emulate_ctxt *ctxt,
+            const struct x86_emulate_ops *ops)
+{
+    int rc = X86EMUL_OKAY;
+    bool nd = map4_table[ctxt->opcode & 0xff][s->evex.pfx].nd;
+    bool nf = map4_table[ctxt->opcode & 0xff][s->evex.pfx].nf;
+    bool nci_ndd_nf = map4_table[ctxt->opcode & 0xff][s->evex.pfx].nci_ndd_nf;
+    bool scc = false;
+
+    generate_exception_if(s->evex.lr || s->evex.z, X86_EXC_UD);
+
+    switch ( ctxt->opcode & 0xff )
+    {
+    case 0x80: case 0x81: case 0x83: /* Grp1 */
+        if ( (s->modrm_reg & 7) == 7 ) /* ccmp */
+        {
+            s->desc = (s->desc & ByteOp) | DstNone | SrcMem;
+            nd = false;
+            scc = true;
+            break;
+        }
+
+        /* No need to include opcode bit 0 in the index calculation. */
+        nf = map4_table[(s->modrm_reg & 7) << 3][s->evex.pfx].nf;
+        break;
+
+    case 0xf6: case 0xf7: /* Grp3 */
+        switch ( s->modrm_reg & 7 )
+        {
+        case 0: case 1: /* ctest */
+            s->desc = (s->desc & ByteOp) | DstNone | SrcMem;
+            scc = true;
+            break;
+
+        case 2: /* not */
+            nd = true;
+            break;
+
+        case 3: /* neg */
+            nd = true;
+            nf = true;
+            break;
+
+        default: /* {,i}mul, {,i}div */
+            nf = true;
+            break;
+        }
+        break;
+    }
+
+    generate_exception_if((scc || nci_ndd_nf) && !vcpu_has_apx_nci_ndd_nf(),
+                          X86_EXC_UD);
+    generate_exception_if((EVEX_ND(&s->evex) &&
+                           (!nd || !vcpu_has_apx_nci_ndd_nf())),
+                          X86_EXC_UD);
+    if ( !scc )
+    {
+        generate_exception_if(s->evex.opmsk & 3, X86_EXC_UD);
+        generate_exception_if((EVEX_NF(&s->evex) &&
+                               (!nf || !vcpu_has_apx_nci_ndd_nf())),
+                              X86_EXC_UD);
+        generate_exception_if((!EVEX_ND(&s->evex) &&
+                               (s->evex.reg != 0xf || !s->evex.RX)),
+                              X86_EXC_UD);
+    }
+
+ done:
+    return rc;
+}
+
 #define ad_bytes (s->ad_bytes) /* for truncate_ea() */
 
 int x86emul_decode(struct x86_emulate_state *s,
@@ -1350,7 +1586,37 @@ int x86emul_decode(struct x86_emulate_st
                             goto done;
                         }
 
+                        opcode |= MASK_INSR(4, X86EMUL_OPC_EXT_MASK);
                         s->promoted_evex = true;
+
+                        /*
+                         * In the common case (and when NP and 66 table entries
+                         * match) an embedded 66 prefix takes the role of an
+                         * operand size override (to 16 bits).
+                         */
+                        if ( s->op_bytes == 4 && s->evex.pfx == vex_66 &&
+                             !memcmp(&map4_table[b][vex_np],
+                                     &map4_table[b][vex_66],
+                                     sizeof(**map4_table)) )
+                            s->op_bytes = 2;
+
+                        d = ModRM;
+                        if ( map4_table[b][s->evex.pfx].byte )
+                            d |= ByteOp;
+
+                        if ( map4_table[b][s->evex.pfx].to_mem )
+                            d |= DstMem;
+                        else
+                            d |= DstReg;
+
+                        if ( map4_table[b][s->evex.pfx].immW )
+                            d |= SrcImm;
+                        else if ( map4_table[b][s->evex.pfx].imm8 )
+                            d |= SrcImmByte;
+                        else if ( !map4_table[b][s->evex.pfx].to_mem )
+                            d |= SrcMem;
+                        else
+                            d |= SrcReg;
                         break;
 
                     case evex_map5:
@@ -1444,12 +1710,14 @@ int x86emul_decode(struct x86_emulate_st
         switch ( s->ext )
         {
         case ext_none:
+        case ext_map4:
             switch ( b )
             {
             case 0xf6 ... 0xf7: /* Grp3 */
+                d &= ByteOp;
                 switch ( s->modrm_reg & 7 )
                 {
-                case 0 ... 1: /* test */
+                case 0 ... 1: /* {,c}test */
                     d |= DstMem | SrcImm;
                     break;
                 case 2: /* not */
@@ -2136,6 +2404,10 @@ int x86emul_decode(struct x86_emulate_st
         s->simd_size = ext8f08_table[b].simd_size;
         break;
 
+    case ext_map4:
+        rc = decode_map4(s, ctxt, ops);
+        break;
+
     case ext_map5:
     case ext_map6:
     case ext_map7:
@@ -2164,10 +2436,10 @@ int x86emul_decode(struct x86_emulate_st
     {
     case simd_none:
         /*
-         * When prefix 66 has a meaning different from operand-size override,
-         * operand size defaults to 4 and can't be overridden to 2.
+         * When (legacy) prefix 66 has a meaning different from operand-size
+         * override, operand size defaults to 4 and can't be overridden to 2.
          */
-        if ( s->op_bytes == 2 &&
+        if ( s->op_bytes == 2 && !s->vex.opcx &&
              (ctxt->opcode & X86EMUL_OPC_PFX_MASK) == X86EMUL_OPC_66(0, 0) )
             s->op_bytes = 4;
         break;
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -253,6 +253,9 @@ union evex {
     };
 };
 
+#define EVEX_ND(e) ((e)->brs)
+#define EVEX_NF(e) (!!((e)->opmsk & 4))
+
 struct x86_emulate_state {
     unsigned int op_bytes, ad_bytes;
 
@@ -620,6 +623,8 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx10(minor)  (ctxt->cpuid->avx10.version >= (minor))
 #define vcpu_has_avx10_2_aux() (ctxt->cpuid->avx10.avx10_v2_aux)
 
+#define vcpu_has_apx_nci_ndd_nf() (ctxt->cpuid->apx.apx_nci_ndd_nf)
+
 #define vcpu_must_have(feat, ...) \
     generate_exception_if(!vcpu_has_##feat(__VA_ARGS__), X86_EXC_UD)
 
--- a/xen/arch/x86/x86_emulate/util.c
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -194,8 +194,10 @@ bool cf_check x86_insn_is_mem_write(cons
     switch ( s->desc & DstMask )
     {
     case DstMem:
-        /* The SrcMem check is to cover {,V}MASKMOV{Q,DQU}. */
-        return s->modrm_mod != 3 || (s->desc & SrcMask) == SrcMem;
+        return (s->modrm_mod != 3 &&
+                (!s->promoted_evex || !EVEX_ND(&s->evex))) ||
+               /* This is to cover {,V}MASKMOV{Q,DQU}. */
+               (s->desc & SrcMask) == SrcMem;
 
     case DstBitBase:
     case DstImplicit:
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1204,6 +1204,14 @@ static unsigned long *decode_vex_gpr(
     return decode_gpr(regs, NULL, ~vex_reg & (mode_64bit() ? 0xf : 7));
 }
 
+static unsigned long *decode_evex_gpr(
+    unsigned int evex_reg, struct cpu_user_regs *regs,
+    struct egpr *egpr, const struct x86_emulate_ctxt *ctxt)
+{
+    ASSERT(mode_64bit());
+    return decode_gpr(regs, egpr, ~evex_reg & 0x1f);
+}
+
 #define visa_check(subfeat) \
     generate_exception_if(!cp->feat.avx512 ## subfeat && !cp->feat.avx10, \
                           X86_EXC_UD)
@@ -1369,6 +1377,20 @@ x86_emulate(
     elem_bytes = 2 << (!state->fp16 + evex.w);
 
     generate_exception_if(state->not_64bit && mode_64bit(), X86_EXC_UD);
+#ifdef __XEN__
+    generate_exception_if(state->promoted_evex && !(state->xcr0 & X86_XCR0_APX),
+                          X86_EXC_UD);
+#else
+    /*
+     * To emulate promoted insns we don't use their EVEX forms.  For testing
+     * purposes we can therefore permit such encodings without APX active, so
+     * long as they don't use any of the eGPR-s.
+     */
+    generate_exception_if((state->promoted_evex &&
+                           (!evex.r4 || evex.b4 || !evex.u || !evex.RX) &&
+                           !(state->xcr0 & X86_XCR0_APX)),
+                          X86_EXC_UD);
+#endif
 
     if ( ea.type == OP_REG )
         ea.reg = _decode_gpr(&_regs, &state->egpr, modrm_rm,
@@ -1445,7 +1467,7 @@ x86_emulate(
 
 #ifndef X86EMUL_NO_SIMD
     /* With a memory operand, fetch the mask register in use (if any). */
-    if ( ea.type == OP_MEM && evex.opmsk &&
+    if ( ea.type == OP_MEM && !state->promoted_evex && evex.opmsk &&
          x86emul_get_fpu(fpu_type = X86EMUL_FPU_opmask,
                          ctxt, ops) == X86EMUL_OKAY )
     {
@@ -1555,6 +1577,7 @@ x86_emulate(
             generate_exception_if(lock_prefix, X86_EXC_UD);
             break;
         }
+        generate_exception_if(evex_encoded() && lock_prefix, X86_EXC_UD);
         ea.bytes = (d & ByteOp) ? 1 : op_bytes;
         dst = ea;
         if ( dst.type == OP_REG )
@@ -1574,7 +1597,7 @@ x86_emulate(
             generate_exception_if(lock_prefix, X86_EXC_UD);
             fail_if(!ops->write);
         }
-        else if ( !ops->rmw )
+        else if ( !ops->rmw || (evex_encoded() && EVEX_ND(&evex)) )
         {
             fail_if(lock_prefix ? !ops->cmpxchg : !ops->write);
             if ( (rc = read_ulong(dst.mem.seg, dst.mem.off,
@@ -1594,72 +1617,128 @@ x86_emulate(
         unsigned int i, n;
         unsigned long dummy;
 
-    case 0x00: case 0x01: add: /* add reg,mem */
-        if ( ops->rmw && dst.type == OP_MEM )
+    case 0x00: case 0x01: /* add reg,mem */
+    case X86EMUL_OPC_EVEX   (4, 0x00): /* add r8,r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x01): /* add reg,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x01): /* add r16,r/m{,r16} */
+    add:
+        if ( ops->rmw && dst.type == OP_MEM &&
+             (!evex_encoded() || !EVEX_ND(&evex)) )
             state->rmw = rmw_add;
         else
         {
     case 0x02 ... 0x05: /* add */
+    case X86EMUL_OPC_EVEX   (4, 0x02): /* add r/m,r8{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x03): /* add r/m,reg{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x03): /* add r/m,r16{,r16} */
             emulate_2op_SrcV("add", src, dst, _regs.eflags);
         }
         break;
 
-    case 0x08: case 0x09: or: /* or reg,mem */
-        if ( ops->rmw && dst.type == OP_MEM )
+    case 0x08: case 0x09: /* or reg,mem */
+    case X86EMUL_OPC_EVEX   (4, 0x08): /* or r8,r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x09): /* or reg,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x09): /* or r16,r/m{,r16} */
+    or:
+        if ( ops->rmw && dst.type == OP_MEM &&
+             (!evex_encoded() || !EVEX_ND(&evex)) )
             state->rmw = rmw_or;
         else
         {
     case 0x0a ... 0x0d: /* or */
+    case X86EMUL_OPC_EVEX   (4, 0x0a): /* or r/m,r8{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x0b): /* or r/m,reg{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x0b): /* or r/m,r16{,r16} */
             emulate_2op_SrcV("or", src, dst, _regs.eflags);
         }
         break;
 
-    case 0x10: case 0x11: adc: /* adc reg,mem */
-        if ( ops->rmw && dst.type == OP_MEM )
+    case 0x10: case 0x11: /* adc reg,mem */
+    case X86EMUL_OPC_EVEX   (4, 0x10): /* adc r8,r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x11): /* adc reg,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x11): /* adc r16,r/m{,r16} */
+    adc:
+        if ( ops->rmw && dst.type == OP_MEM &&
+             (!evex_encoded() || !EVEX_ND(&evex)) )
             state->rmw = rmw_adc;
         else
         {
     case 0x12 ... 0x15: /* adc */
+    case X86EMUL_OPC_EVEX   (4, 0x12): /* adc r/m,r8{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x13): /* adc r/m,reg{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x13): /* adc r/m,r16{,r16} */
             emulate_2op_SrcV("adc", src, dst, _regs.eflags);
         }
         break;
 
-    case 0x18: case 0x19: sbb: /* sbb reg,mem */
-        if ( ops->rmw && dst.type == OP_MEM )
+    case 0x18: case 0x19: /* sbb reg,mem */
+    case X86EMUL_OPC_EVEX   (4, 0x18): /* sbb r8,r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x19): /* sbb reg,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x19): /* sbb r16,r/m{,r16} */
+    sbb:
+        if ( ops->rmw && dst.type == OP_MEM &&
+             (!evex_encoded() || !EVEX_ND(&evex)) )
             state->rmw = rmw_sbb;
         else
         {
     case 0x1a ... 0x1d: /* sbb */
+    case X86EMUL_OPC_EVEX   (4, 0x1a): /* sbb r/m,r8{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x1b): /* sbb r/m,reg{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x1b): /* sbb r/m,r16{,r16} */
             emulate_2op_SrcV("sbb", src, dst, _regs.eflags);
         }
         break;
 
-    case 0x20: case 0x21: and: /* and reg,mem */
-        if ( ops->rmw && dst.type == OP_MEM )
+    case 0x20: case 0x21: /* and reg,mem */
+    case X86EMUL_OPC_EVEX   (4, 0x20): /* and r8,r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x21): /* and reg,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x21): /* and r16,r/m{,r16} */
+    and:
+        if ( ops->rmw && dst.type == OP_MEM &&
+             (!evex_encoded() || !EVEX_ND(&evex)) )
             state->rmw = rmw_and;
         else
         {
     case 0x22 ... 0x25: /* and */
+    case X86EMUL_OPC_EVEX   (4, 0x22): /* and r/m,r8{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x23): /* and r/m,reg{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x23): /* and r/m,r16{,r16} */
             emulate_2op_SrcV("and", src, dst, _regs.eflags);
         }
         break;
 
-    case 0x28: case 0x29: sub: /* sub reg,mem */
-        if ( ops->rmw && dst.type == OP_MEM )
+    case 0x28: case 0x29: /* sub reg,mem */
+    case X86EMUL_OPC_EVEX   (4, 0x28): /* sub r8,r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x29): /* sub reg,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x29): /* sub r16,r/m{,r16} */
+    sub:
+        if ( ops->rmw && dst.type == OP_MEM &&
+             (!evex_encoded() || !EVEX_ND(&evex)) )
             state->rmw = rmw_sub;
         else
         {
     case 0x2a ... 0x2d: /* sub */
+    case X86EMUL_OPC_EVEX   (4, 0x2a): /* sub r/m,r8{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x2b): /* sub r/m,reg{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x2b): /* sub r/m,r16{,r16} */
             emulate_2op_SrcV("sub", src, dst, _regs.eflags);
         }
         break;
 
-    case 0x30: case 0x31: xor: /* xor reg,mem */
-        if ( ops->rmw && dst.type == OP_MEM )
+    case 0x30: case 0x31: /* xor reg,mem */
+    case X86EMUL_OPC_EVEX   (4, 0x30): /* xor r8,r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x31): /* xor reg,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x31): /* xor r16,r/m{,r16} */
+    xor:
+        if ( ops->rmw && dst.type == OP_MEM &&
+             (!evex_encoded() || !EVEX_ND(&evex)) )
             state->rmw = rmw_xor;
         else
         {
     case 0x32 ... 0x35: /* xor */
+    case X86EMUL_OPC_EVEX   (4, 0x32): /* xor r/m,r8{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x33): /* xor r/m,reg{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x33): /* xor r/m,r16{,r16} */
             emulate_2op_SrcV("xor", src, dst, _regs.eflags);
         }
         break;
@@ -1970,6 +2049,11 @@ x86_emulate(
         break;
 
     case 0x80: case 0x81: case 0x82: case 0x83: /* Grp1 */
+    case X86EMUL_OPC_EVEX   (4, 0x80): /* <op> imm8,r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0x81): /* <op> imm,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x81): /* <op> imm16,r/m{,r16} */
+    case X86EMUL_OPC_EVEX   (4, 0x83): /* <op> imm8s,r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0x83): /* <op> imm8s,r/m{,r16} */
         switch ( modrm_reg & 7 )
         {
         case 0: goto add;
@@ -1981,6 +2065,8 @@ x86_emulate(
         case 6: goto xor;
         case 7:
             dst.val = imm1;
+            if ( evex_encoded() )
+                goto unimplemented_insn;
             goto cmp;
         }
         break;
@@ -2650,6 +2736,9 @@ x86_emulate(
         break;
 
     case 0xf6 ... 0xf7: /* Grp3 */
+    case X86EMUL_OPC_EVEX   (4, 0xf6):
+    case X86EMUL_OPC_EVEX   (4, 0xf7):
+    case X86EMUL_OPC_EVEX_66(4, 0xf7):
         if ( (d & DstMask) == DstEax )
             dst.reg = (unsigned long *)&_regs.r(ax);
         switch ( modrm_reg & 7 )
@@ -2659,15 +2748,19 @@ x86_emulate(
         case 0 ... 1: /* test */
             dst.val = imm1;
             dst.bytes = src.bytes;
+            if ( evex_encoded() )
+                goto unimplemented_insn;
             goto test;
         case 2: /* not */
-            if ( ops->rmw && dst.type == OP_MEM )
+            if ( ops->rmw && dst.type == OP_MEM &&
+                 (!evex_encoded() || !EVEX_ND(&evex)) )
                 state->rmw = rmw_not;
             else
                 dst.val = ~dst.val;
             break;
         case 3: /* neg */
-            if ( ops->rmw && dst.type == OP_MEM )
+            if ( ops->rmw && dst.type == OP_MEM &&
+                 (!evex_encoded() || !EVEX_ND(&evex)) )
                 state->rmw = rmw_neg;
             else
                 emulate_1op("neg", dst, _regs.eflags);
@@ -2889,19 +2982,24 @@ x86_emulate(
         break;
 
     case 0xfe: /* Grp4 */
+    case X86EMUL_OPC_EVEX   (4, 0xfe): /* inc/dec r/m{,r8} */
+    case X86EMUL_OPC_EVEX   (4, 0xff): /* inc/dec r/m{,reg} */
+    case X86EMUL_OPC_EVEX_66(4, 0xff): /* inc/dec r/m{,r16} */
         generate_exception_if((modrm_reg & 7) >= 2, X86_EXC_UD);
         /* Fallthrough. */
     case 0xff: /* Grp5 */
         switch ( modrm_reg & 7 )
         {
         case 0: /* inc */
-            if ( ops->rmw && dst.type == OP_MEM )
+            if ( ops->rmw && dst.type == OP_MEM &&
+                 (!evex_encoded() || !EVEX_ND(&evex)) )
                 state->rmw = rmw_inc;
             else
                 emulate_1op("inc", dst, _regs.eflags);
             break;
         case 1: /* dec */
-            if ( ops->rmw && dst.type == OP_MEM )
+            if ( ops->rmw && dst.type == OP_MEM &&
+                 (!evex_encoded() || !EVEX_ND(&evex)) )
                 state->rmw = rmw_dec;
             else
                 emulate_1op("dec", dst, _regs.eflags);
@@ -8773,6 +8871,39 @@ x86_emulate(
         put_stub(stub);
     }
 
+    if ( state->promoted_evex &&
+         (dst.type != OP_NONE || state->rmw != rmw_NONE) )
+    {
+        if ( EVEX_ND(&evex) )
+        {
+            dst.reg = decode_evex_gpr(evex.reg | (evex.RX << 4), &_regs,
+                                      &state->egpr, ctxt);
+            dst.type = OP_REG;
+
+            /*
+             * EVEX.nd additionally results in zero-extension even for byte/word
+             * operand size.
+             */
+            switch ( dst.bytes )
+            {
+            case 1:
+                dst.val = (uint8_t)dst.val;
+                fallthrough;
+            case 2:
+                dst.val = (uint16_t)dst.val;
+                dst.bytes = 4;
+                break;
+            }
+        }
+
+        if ( EVEX_NF(&evex) )
+        {
+            /* Squash updates to status flags. */
+            _regs.eflags &= ~EFLAGS_MASK;
+            _regs.eflags |= ctxt->regs->eflags & EFLAGS_MASK;
+        }
+    }
+
     switch ( dst.type )
     {
     case OP_REG:


