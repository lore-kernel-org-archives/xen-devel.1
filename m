Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0A5C79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 08:13:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410642.1641432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3UTa-0004UF-47; Mon, 07 Sep 2026 08:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410642.1641432; Mon, 07 Sep 2026 08:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3UTa-0004U8-1I; Mon, 07 Sep 2026 08:13:14 +0000
Received: by outflank-mailman (input) for mailman id 1410642;
 Mon, 07 Sep 2026 08:13:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3UTZ-0004U1-5D
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 08:13:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3UTY-008itU-I5
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 10:13:12 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e720a-e002-0a2a0a5209dd-0a2a450bcac4-30
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 10:13:12 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e7218-b7e8-0a2a450b0019-d155dd29edcc-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 10:13:12 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so3655114f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 01:13:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce58da3acsm802142145e9.0.2026.09.07.01.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 01:13:11 -0700 (PDT)
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
        d=suse.com; s=google; t=1788768792; x=1789373592; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rDWRoaixBSa+yrlWavbiaoOEY8KRr2jDNabOhhHI10g=;
        b=MyHeFJLz6JuQu7/C7SRyFZH0mogdhAQg0v5luu3BqIrDff5JnnvFNjh6bBxPZSbz0E
         Ja8vDQ2bKr8wo50kIgmyTJtzyFG290cpsGtnypB2D0bTax9mjp5P95ITKIpPdT+uPWLG
         GKpt5dEFGwBn8X16VFFK6UFzYwgGgJzRLGIIsMDcxe18trA60MxyIoHk2PlniQwu/ZmL
         Wx4VM8josW2f2R3nJSjZh6ZUS7LenXzMU2Gg7odryvgr9/STKhj3gsyIIrWT/yFmwKAM
         4Z+4ASCgsI201paYPkEDUYrELGYQCz6AlAOZ1lx8NxDi6kK8bLIDfeKHl2vTulku4lEN
         FXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768792; x=1789373592;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDWRoaixBSa+yrlWavbiaoOEY8KRr2jDNabOhhHI10g=;
        b=LGTuLyf1kP4vzwEfrphXJgSrTmSPLJzOiL2EgIc77TXF64BqL9gzT+kaW8i0b5/B/2
         MmFMv2zfFg8INvbWT5W6v4aoNcbn+5e8ZVnkvh8/q6W7UvUHfZ4ou1gBJbtW0kLS0qPE
         KXumIdgyG88DIqbR4KhWR/dDbBb8Dmk0p+akZPOjw9NzhjzjcOAQBIuLK18kArvOAXNs
         mFu3BofJDjZikoRVw6FLXh9QqVyr04XMeKQqA/ToNKehEbDPSj2K+BrxV/ParTwvh9Uo
         pLieI/+0WiNjmGIJY45LIzbTJch+Yfp7CFNX+dbTo/g3RuSIYIPspYRpZeAk+pAc3e1w
         sJ3A==
X-Gm-Message-State: AFuF++k+aCeagzUe+3yEyrDHEgVx4mlgjGi0pR8E+xV2UqRNg8Uqyh4X
	AFZvQ3gWm72wLptZBtWqxsCM+vbK7uePnsc29O8Z2HcGsu8/Xju1LVXe/l27BNLgOYhhsw+nce3
	aYiJ/sA==
X-Gm-Gg: AYBFou3lQ+rMItEQvlZ3ZXXltCmqJmoqV7tBusuO42VdoO9FglWGwIFWyklAdUWESYy
	g8ivIxNyW4vwbgf5caNS5CBVrtJJlZEl0Ab08UavflF9NcPto1h3hSuQN3n8U5AvsudygSS9hH8
	3mQ3osrEukt89JeNgh97eb+1J4gW0LCvMWZGaW0blIUjihK0NcZiD6eMsdWHRVrIGihGzO8oh5a
	em33opAIrAWtJz8jOUdSBjsgZSnaAo3fM6l734zcMsJ8hKsDH2IVWa1rBd+9vdK7pdm7o+8dmcA
	QWQqlDwc9s3fp7UU8rwZ4ItR923H5yqAwvsUTpbSTCdt+xTPHCD5ClKEewYZ4c99uIaPxn0hizb
	spM27tcQqnikbAlb0f02HAEeyUUSApu/yIFS6nj1utU6YPuy2JyXg2t+C9EVb2KHhX3z5UC4WkR
	gafiQUffOtegqvKS66k/N0YgBygIS8STk55zVTgO4Uby5SoBLTu/Yqs2e841S+kWG/pdMXCXSHq
	sFgiE0aI9bwC2BIrpSOW+RbdU8ngMXE2JM3siGPV3Bu+75YjZkt
X-Received: by 2002:a05:600c:474a:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf825d722mr192950165e9.10.1788768791903;
        Mon, 07 Sep 2026 01:13:11 -0700 (PDT)
Message-ID: <7a77f613-84b9-4049-804c-c3f53d804a38@suse.com>
Date: Mon, 7 Sep 2026 10:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/vRTC: don't overrun array when storing century field
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
X-purgate-ID: tlsNG-42698a/1788768792-A9AC09EA-A23823E1/0/0
X-purgate-type: clean
X-purgate-size: 1515

rtc_ioport_write() has two writes of the new value, yet only one was made
aware of the century going outside of the array. Fold both writes by
changing the RTC_SET short-circuiting.

Fixes: f2ff80877f66 ("x86/vRTC: support century field")
Coverity ID: 1700943
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -521,20 +521,22 @@ static int rtc_ioport_write(RTCState *s,
     case RTC_MONTH:
     case RTC_YEAR:
     case RTC_CENTURY:
-        /* if in set mode, just write the register */
-        if ( (s->hw.cmos_data[RTC_REG_B] & RTC_SET) )
-            s->hw.cmos_data[s->hw.cmos_index] = data;
-        else
+        /* If in set mode, just write the register. */
+        if ( !(s->hw.cmos_data[RTC_REG_B] & RTC_SET) )
         {
             /* Fetch the current time and update just this field. */
             s->current_tm = gmtime(get_localtime(d));
             rtc_copy_date(s);
-            if ( s->hw.cmos_index != RTC_CENTURY )
-                s->hw.cmos_data[s->hw.cmos_index] = data;
-            else
-                s->hw.century = data;
-            rtc_set_time(s);
         }
+
+        if ( s->hw.cmos_index != RTC_CENTURY )
+            s->hw.cmos_data[s->hw.cmos_index] = data;
+        else
+            s->hw.century = data;
+
+        if ( !(s->hw.cmos_data[RTC_REG_B] & RTC_SET) )
+            rtc_set_time(s);
+
         alarm_timer_update(s);
         break;
     case RTC_REG_A:

