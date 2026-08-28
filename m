Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF7FC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 06:59:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401587.1637125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqZ0-0008EL-S4; Fri, 28 Aug 2026 06:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401587.1637125; Fri, 28 Aug 2026 06:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqZ0-0008EE-Nq; Fri, 28 Aug 2026 06:59:46 +0000
Received: by outflank-mailman (input) for mailman id 1401587;
 Fri, 28 Aug 2026 06:59:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqYz-0008Dy-HH
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 06:59:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqYx-00Dl7l-7j
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 08:59:43 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9131c7-2eae-0a2a0a5409dd-0a2a4505c7c2-42
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 08:59:43 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9131df-4cb1-0a2a45050019-d155802bdd90-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 08:59:43 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-499ac87c92bso5231945e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 23:59:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b95013d06sm37120195e9.12.2026.08.27.23.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 23:59:42 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787900382; x=1788505182; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oqu+Q0osoQJYn18e0xy/OsR8FRgD25zg2JGzP482jGc=;
        b=FORPWQkvISF9BysPN5UyXtabUu2tHizdVeYmS7cJDsu43rNCTnJ0PSik6pdLgHGkO4
         pbXNHi9J9i3aEyfdC+h/OL50GoHIe0Hob/v7v1A08jZJxzGfpf2ob6orSMrbnfVvnxfd
         CvpY/BRPoQSrRI6RNbf/L9jp8CzLtIZQs/tYuJQE8U8rrTwmXwMV30p4btBh2/Tih/PK
         DC66XrKlPqyBfgjxY7Om+a7i0JM3YGEnpf50Zo10OHY9+5HHJYF/LvxI2NX4FAtt8wXF
         hjmySKLDtZM7y3TLYJx0PjcbwlTD+lhl2BRWcZNrmLI1vEzwLLlKDAODf5jQqf9ehNy7
         Pb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900382; x=1788505182;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oqu+Q0osoQJYn18e0xy/OsR8FRgD25zg2JGzP482jGc=;
        b=k2WIWYOkhe59DOQukh9fFXuy0APJKmD4gCdsTSKPgmh7UvqpeCJDYdE4jXoxEv2/Ro
         V5CPQngSNPBYIwM4Ab2PNJpUS8O67vUTJOdDruyRG5HI8/p7xm76F9oUHj6sP5odmclx
         hkXOUBscuMHxGJjriGbp3E85xgmRPEoeTU+0IbfTULxfAkrCTMU9/KL/Jg9DadymZzdX
         tONvegNaMBv4ixYLzVU5Ts8jQhrqNZioZ1JYh7KQCyk+ALLDakbhZJaPqA37ck+X8j4e
         qIql36bO/i9eCb/+k4ykgr443xK6qJ0IVp0eQK/hPeFiIT33gptelr0P8aRFI8wxXydQ
         ua4w==
X-Gm-Message-State: AFuF++kR9QZergkf3MQRNlacGc/1mg9sLaKtZJXfB8ZnX/+JPozJP6xg
	Y0Fqp5iCgeKzOx//enfEpqiTkP3gb2Wb2o5idEeaOxXqqCMYmVhuG+kLoEMkfrghebYw9qn1DLb
	eXpuPfw==
X-Gm-Gg: AR+sD10U/HS/EpDyWv/IbbdZU0Iyag09wEJtNwHmRxE2Ruxi43/QgG1L/zK3vlR+q29
	Rxywe2faI14lBYLTJ6U1TsE8w2NGx8EsWMkr5deqCvcsPMlc+GkZimer0J3OxY9q2gPxha791Zb
	rgtCajHkQ/kxZWC745rSFnLQEDSysQ8k0OuEIZdcx3YTYH6vqJxfe/1k+MJnFw8Y4DSE3b1it0I
	pMW7zC7vx3Yz/m8b+Od5DOzxynQ+z4xTB7/ihtixWnXu3NEcV7nXe1a8g+Gb3/9OYACX9WcW0/e
	7vRQ5ek6YVXZxfADkmN/2L33VAZPoJzfvQWtk7Drt58p9wOgwktymtZdQzHMWT2FOJcsFU53ub7
	AHqspssff4eiUp1CwS/bBm5DWXKwgUgQ65mbcRYcZ+8AIU3z5y98o5931FirvzP5tVz9xohp6EM
	dhFTJtJz11lMZNCl75Td4HV/77+jrHkpHbu5VWDaCInvC3ryZfh2GZIVZEqQ4MukxJ6qx8c0CqB
	JqAAqrrBNPXUEtftovla/fmhk1YwuvRiKHHn6JKIOo82i6w9req
X-Received: by 2002:a05:600c:83c3:b0:499:b01e:911c with SMTP id 5b1f17b1804b1-49b91c26535mr61714235e9.2.1787900382668;
        Thu, 27 Aug 2026 23:59:42 -0700 (PDT)
Message-ID: <85c111a5-105c-4b8f-8b81-d7ec1d0f9436@suse.com>
Date: Fri, 28 Aug 2026 08:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 01/12] x86/IO-APIC: address Misra 2.1 rule violations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
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
In-Reply-To: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1787900383-247132A1-121F5018/0/0
X-purgate-type: clean
X-purgate-size: 3800

In both functions cases 0..3 are handled, and a 2-bit mask is applied to
the switch() expression. Therefore the default: cases are reported
unreachable by Eclair. Subsume the "case 2" blocks each into the
corresponding default ones.

While there also drop all the pointless figure braces inside the various
case blocks, inserting blank lines instead between them.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -804,66 +804,48 @@ static int __init MPBIOS_polarity(int id
     switch (mp_irqs[idx].mpc_irqflag & 3)
     {
     case 0: /* conforms, ie. bus-type dependent polarity */
-    {
         switch (mp_bus_id_to_type[bus])
         {
         case MP_BUS_ISA: /* ISA pin */
-        {
             polarity = default_ISA_polarity(idx);
             break;
-        }
+
         case MP_BUS_EISA: /* EISA pin */
-        {
             polarity = default_EISA_polarity(idx);
             break;
-        }
+
         case MP_BUS_PCI: /* PCI pin */
-        {
             polarity = default_PCI_polarity(idx);
             break;
-        }
+
         case MP_BUS_MCA: /* MCA pin */
-        {
             polarity = default_MCA_polarity(idx);
             break;
-        }
+
         case MP_BUS_NEC98: /* NEC 98 pin */
-        {
             polarity = default_NEC98_polarity(idx);
             break;
-        }
+
         default:
-        {
             printk(KERN_WARNING "broken BIOS!!\n");
             polarity = 1;
             break;
         }
-        }
         break;
-    }
+
     case 1: /* high active */
-    {
         polarity = 0;
         break;
-    }
-    case 2: /* reserved */
-    {
-        printk(KERN_WARNING "broken BIOS!!\n");
-        polarity = 1;
-        break;
-    }
+
     case 3: /* low active */
-    {
         polarity = 1;
         break;
-    }
-    default: /* invalid */
-    {
+
+    default: /* reserved */
         printk(KERN_WARNING "broken BIOS!!\n");
         polarity = 1;
         break;
     }
-    }
     return polarity;
 }
 
@@ -878,66 +860,48 @@ static int MPBIOS_trigger(int idx)
     switch ((mp_irqs[idx].mpc_irqflag>>2) & 3)
     {
     case 0: /* conforms, ie. bus-type dependent */
-    {
         switch (mp_bus_id_to_type[bus])
         {
         case MP_BUS_ISA: /* ISA pin */
-        {
             trigger = default_ISA_trigger(idx);
             break;
-        }
+
         case MP_BUS_EISA: /* EISA pin */
-        {
             trigger = default_EISA_trigger(idx);
             break;
-        }
+
         case MP_BUS_PCI: /* PCI pin */
-        {
             trigger = default_PCI_trigger(idx);
             break;
-        }
+
         case MP_BUS_MCA: /* MCA pin */
-        {
             trigger = default_MCA_trigger(idx);
             break;
-        }
+
         case MP_BUS_NEC98: /* NEC 98 pin */
-        {
             trigger = default_NEC98_trigger(idx);
             break;
-        }
+
         default:
-        {
             printk(KERN_WARNING "broken BIOS!!\n");
             trigger = 1;
             break;
         }
-        }
         break;
-    }
+
     case 1: /* edge */
-    {
         trigger = 0;
         break;
-    }
-    case 2: /* reserved */
-    {
-        printk(KERN_WARNING "broken BIOS!!\n");
-        trigger = 1;
-        break;
-    }
+
     case 3: /* level */
-    {
         trigger = 1;
         break;
-    }
-    default: /* invalid */
-    {
+
+    default: /* reserved */
         printk(KERN_WARNING "broken BIOS!!\n");
         trigger = 0;
         break;
     }
-    }
     return trigger;
 }
 


