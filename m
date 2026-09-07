Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAD6C79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 09:48:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410750.1641547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Vxa-0007fX-5P; Mon, 07 Sep 2026 09:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410750.1641547; Mon, 07 Sep 2026 09:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3Vxa-0007fQ-2E; Mon, 07 Sep 2026 09:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1410750;
 Mon, 07 Sep 2026 09:48:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3VxY-0007fK-RB
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 09:48:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3VxX-004ToB-Ei
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 11:48:15 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e8857-2eae-0a2a0a5409dd-0a2a450aaa52-38
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 11:48:15 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e885e-f2d2-0a2a450a0019-d1558029bd54-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 11:48:15 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso28239155e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 02:48:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d0656e7bbsm195921945e9.10.2026.09.07.02.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 02:48:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788774494; x=1789379294; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nOUGvh6ep1mInl0Q2DlDHVX6PKKvK4aUiskOUYilt2c=;
        b=dtqIZDEvNvQEDeen9BKm9OkHJ+UXrLPjbQY2LOp/HM+xwraNokiuTScexHLVME070m
         Wno5p9SnPg+YjeJ78GvAg6xpingNO6eT3M/Y3CnwthUq0UDRVi/NSUxxVFe+CtEmmGzP
         hZPCcNCoiWkoNHA7MpbYzvak+JQ1q7RTmpz7QgstJB/P5Ic1QGLvF0LN9Az0koLJin5l
         AJH/K7gWhxpy4fqlgeKBX7bjeTn7NVSBjf/gMCJ3DiOme1ieV7ZlQEFj13uC0rfNW1rK
         TDp/abceVJXcRG33gqVW40RMB4CqR3bjc3dwI9Are3mBGZMoPYvN5FGHKcY7yWLTbvMe
         5Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774494; x=1789379294;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOUGvh6ep1mInl0Q2DlDHVX6PKKvK4aUiskOUYilt2c=;
        b=g2bTrWiw7nww/SNlyw1DntwjBp7DzWzIqbz18GN3MG89DgzqBxXzm2Ebc7RszLgP6Y
         tMS/z3v97hH1wNgjG28reTzH3L+56mKKDnL1WPu0ds3Cp02ZMKoKw/36qC0QYhmgav8v
         bAEuhCigRpphy8TlgN6xtmHLVfxFB5jDS7Gnl3Tuk0hdeZc4NI4ADvT6IhfyRgtEkJhb
         0NdZbZnTXRF40gXQEvFXPfBny+f+GvxHWWuKGgqH92ZnnFSTAg5qBnXxr59XPiNqANMk
         diZ8SgYM3yXmiH3qgswhTYjzcOFTPexes8nnw95E2LjYbqbRorpdbG0wuqoCeL+u16FW
         Tcmg==
X-Gm-Message-State: AFuF++lINbkJHXlLZXXHvejeFeT5yTkUF87DP8kP4Wrpiaoa/3udToqb
	TobA/w4CYDnJZ9d+jQe6HwaHrZfJzNk9/C/j+Uo3ay3vV6r/mgD8bW2kAbf6s1bSn/Sx37/W2GY
	ELQGMiQ==
X-Gm-Gg: AYBFou2g1Z1mh/ZwVNfTnHWGzvt5abl3S6BIIYnH/JEehwkyQ4nsAljoqfAiSfpC2vq
	nA8yzk9yIFGvGmw9l7zvofvmAhTd7ezePwuI6kd2ETwYBBUTC4fmKwERIZJSvZqLr7uTIbgQ5FL
	0m+cAyfn3ifJxpGPR0C1w94Y+wlTj1z16sOdI17rnJRo4817IrWRYWlOf4XgxUCtR63yJe7QFU4
	HJ43Cr/w9EpRZUOygZleZXzbBZgaHfPER12wQz1xbT/TnxtB6HFc8vyzL0ruOPHixePGP7cSzmA
	GQYft9hwWcJvKPIDUu6ZEmGui+pBHeYG+UgWsSOoXNbADa8KxkwJCCubjBsRE+Y+2QfqGsoc4D+
	4HS3bfIusaYJMHpS8xIZcawVsZXTLkR1uZUsiIslr5MxOR7tLZ5d2jvJqYGtZvKNrkTml+35XYA
	6PDwrik6bmzdOpC/uTjv4BU/8rd8DFAxa2wZ4Dy57KoZrfzflC5a+uB5rhEIBaChjHuruJOl+2q
	Pqo/Xl05s/CLRpY4u3eO8ZKq+VaYkarGTi7Sg05YMnbZ+WDW6Bf
X-Received: by 2002:a05:600c:474c:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49cf828cd70mr200254295e9.16.1788774494397;
        Mon, 07 Sep 2026 02:48:14 -0700 (PDT)
Message-ID: <13ebb85c-62c2-477b-87ff-377bbe3cfc6a@suse.com>
Date: Mon, 7 Sep 2026 11:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libacpi: drop mk_dsdt's -d / --debug option
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1788774495-5A1DDCFC-1F47096C/0/0
X-purgate-type: clean
X-purgate-size: 2406

Recent Clang complains about the "debug" static variable only ever being
written to. Drop it and the command line option controlling it.

Fixes: 19ab8356abe4 ("tools: remove support for running a guest with qemu-traditional")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libacpi/mk_dsdt.c
+++ b/tools/libacpi/mk_dsdt.c
@@ -15,7 +15,6 @@
 #endif
 
 static unsigned int indent_level;
-static bool debug = false;
 
 typedef enum dm_version {
     QEMU_NONE,
@@ -73,7 +72,6 @@ static struct option options[] = {
 #ifdef CONFIG_X86
     { "dm-version", 1, 0, 'q' },
 #endif
-    { "debug", 1, 0, 'd' },
     { 0, 0, 0, 0 }
 };
 
@@ -125,10 +123,7 @@ int main(int argc, char **argv)
             }
             break;
 #endif
-        case 'd':
-            if (*optarg == 'y')
-                debug = true;
-            break;
+
         default:
             return -1;
         }
--- a/tools/libacpi/Makefile
+++ b/tools/libacpi/Makefile
@@ -43,7 +43,7 @@ $(ACPI_BUILD_DIR)/dsdt_anycpu_qemu_xen.a
 	# Remove last bracket
 	awk 'NR > 1 {print s} {s=$$0}' $< > $@.$(TMP_SUFFIX)
 	cat dsdt_acpi_info.asl >> $@.$(TMP_SUFFIX)
-	$(MK_DSDT) --debug=$(debug) --dm-version qemu-xen >> $@.$(TMP_SUFFIX)
+	$(MK_DSDT) --dm-version qemu-xen >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
 
 # NB. awk invocation is a portable alternative to 'head -n -1'
@@ -51,17 +51,17 @@ $(ACPI_BUILD_DIR)/dsdt_%cpu.asl: dsdt.as
 	# Remove last bracket
 	awk 'NR > 1 {print s} {s=$$0}' $< > $@.$(TMP_SUFFIX)
 	cat dsdt_acpi_info.asl >> $@.$(TMP_SUFFIX)
-	$(MK_DSDT) --debug=$(debug) --maxcpu $* --dm-version qemu-xen >> $@.$(TMP_SUFFIX)
+	$(MK_DSDT) --maxcpu $* --dm-version qemu-xen >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
 
 $(ACPI_BUILD_DIR)/dsdt_pvh.asl: dsdt_acpi_info.asl $(MK_DSDT)
 	printf "DefinitionBlock (\"DSDT.aml\", \"DSDT\", 5, \"Xen\", \"HVM\", 0)\n{" > $@
 	cat dsdt_acpi_info.asl >> $@
-	$(MK_DSDT) --debug=$(debug) --maxcpu any --dm-version none >> $@
+	$(MK_DSDT) --maxcpu any --dm-version none >> $@
 
 $(ACPI_BUILD_DIR)/dsdt_anycpu_arm.asl: $(MK_DSDT)
 	printf "DefinitionBlock (\"DSDT.aml\", \"DSDT\", 3, \"Xen\", \"ARM\", 1)\n{" > $@.$(TMP_SUFFIX)
-	$(MK_DSDT) --debug=$(debug) >> $@.$(TMP_SUFFIX)
+	$(MK_DSDT) >> $@.$(TMP_SUFFIX)
 	mv -f $@.$(TMP_SUFFIX) $@
 
 $(C_SRC): $(ACPI_BUILD_DIR)/%.c: $(ACPI_BUILD_DIR)/%.asl

