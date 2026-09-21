Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F4DC982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 10:18:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427297.1650008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8b69-0002Bz-A4; Mon, 21 Sep 2026 10:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427297.1650008; Mon, 21 Sep 2026 10:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8b69-0002Bs-7C; Mon, 21 Sep 2026 10:18:09 +0000
Received: by outflank-mailman (input) for mailman id 1427297;
 Mon, 21 Sep 2026 10:18:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8b68-0002Bm-2W
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 10:18:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8b67-000mKC-1e
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 12:18:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab1045b-bab6-0a2a0a5309dd-0a2a4503c99e-10
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 12:18:06 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab1045e-fae8-0a2a45030019-4a7de18d9680-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 12:18:06 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso20553425e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 03:18:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd10273fsm222706655e9.7.2026.09.21.03.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 03:18:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1789985886; x=1790590686; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gD+9XwafO3d+jB6LE/VzAZr+e9liNr2SBRBvi63UD8o=;
        b=DEHmFi/LzmXrNmmxElrZd/R8h/lw67FJrG2DHuxUsc7Q8TO7KfFRLByMtIhQUJBg4O
         MhXD5Cd474BRNpA+hd9fsbobzZIkza6uYJvScHf0TV1dQoHYB7HenYNIIm/1vu24/d/y
         6ijDJR6yDGbRNfKs/6KZGGm1nvwlupifWTf6M5N2Nieartm6ishWEDIVkgB8Xvgmd+WN
         rd0Oso+uC/vFRw+gtzRCJJY51JQqvaz4xMifCbkvX+Qd80J6EvawknT2z9F6WgIXxU5R
         OzvJecpOU6T+y4lzwImYvN9YgqWTktRZswELy5wNCBgO4TemZ+S/CZA+yEWc3XC8MjU4
         ykZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789985886; x=1790590686;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD+9XwafO3d+jB6LE/VzAZr+e9liNr2SBRBvi63UD8o=;
        b=wlVpB+ZnII9TT0NQgYjS7QU7k8EvocMlppcYVhnKxzUFOwTu2Kcd1ybqnuq4wRR/TE
         szB/eFxh3KRaZFMZEPkT9rmzZQ0t2K82JXKawPFvJq3xK/UbyrAx3SCjuGNcUaO/Rhxt
         AjjIQ7ImqwcUCsTjJ5QlpD7WDWxoaa7L34xROkGIeiQpILAVG0RoopTeAcU0ty+pkC0T
         AJxQHrJn++uOk9ZlKMDO6DOS/+OVZNsLuy+Z2qhfR/AIIBH4+NKYA9U2i1bZWf1G80WW
         x+BJY4crHlL9XPHgqe5YSRuh8WaRv76T1WrQzKpHxJXnQOTeJNtX51YR1oEq6OI+O6Zo
         rQYQ==
X-Gm-Message-State: AFuF++lB85KwiIxrWna0+q3kVo3itSOHs9FhX0QnV0coF3u51WP2TeiF
	OVpQNfe4Urd60PdFCmhAkMR7HqO1qs1+r6W2OAcwPSDeVgGRHF1uv24F5qvXxA443ndpJcpDqkT
	lkj/ahw==
X-Gm-Gg: AYBFou0cDApRAK8q60KZcURrj8jU+mjqmKu8OIb6vo2kxUgfH6Dc7eMEw3rTTOW56mh
	ByxFD5aVLUfubtcKOhyZR0b3p2bp5A+U3JbwrHwkpD4Tjz9mOY9k2wasojTKxIDW6BgTuzXY5rm
	XVReZi82MpI3p/7I2kD1sxog/lHXhJFIV/29Vy4JbeKi0qzyv4XkZbC/CvQveq7e7p+LuSpeNlb
	xnbqpRAp47WiUEhWvg1xiLFmNNr90zfZD5MduGtVYeEuW18tKODXtBHfQBvluzP58IgTigSaS4/
	8nXwlo9Cfwl7JvH/95CnlU4aBL6xE1L3q3bKTXIPhY+VifuwJ0e8rwVvqmRqN8LKeXWPgTS2pgV
	MpoDj9KoVjeKNPvj48NAnuqwwBxs7NbjEHWwV5gfUK3s20zHm3VgAvZiKhelcKsXDoLj92S8g8X
	NXgzf7uE6A95/hYDpuaXZOym5wAX+tHgq7/zWZcgXYVo4MFtZSadRlDubGy28/Ox5eChinQY6nZ
	T7/xiYt6iQjnkCNR08NBF3I1SzaDwqTwEQbomZvZWRFe66rcQtjXcfAwFIe2oo=
X-Received: by 2002:a05:600c:4e50:b0:49d:17d8:abec with SMTP id 5b1f17b1804b1-49fc5728fa5mr129494685e9.21.1789985886420;
        Mon, 21 Sep 2026 03:18:06 -0700 (PDT)
Message-ID: <5654aeb7-7742-41c6-a382-e1afac9d3bb8@suse.com>
Date: Mon, 21 Sep 2026 12:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Barr Detwix <timotheecisnard@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mkelf32: correct VA/PA of PT_NOTE / .note
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
X-purgate-ID: tlsNG-33051d/1789985886-760FE4E9-8CFC103A/0/0
X-purgate-type: clean
X-purgate-size: 969

For the .p_paddr, .p_vaddr, and .sh_addr fields the image load base
(passed in by command line argument) also needs taking into account. It is
_not_ merely the delta between incoming PT_NOTE and PT_LOAD segments. (The
fields aren't really used anywhere, so this is largely a cosmetic issue;
static analysis tools may be affected, though.)

Fixes: a353cab905af ("build_id: Provide ld-embedded build-ids")
Reported-by: Barr Detwix <timotheecisnard@gmail.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/mkelf32.c
+++ b/xen/arch/x86/boot/mkelf32.c
@@ -362,7 +362,7 @@ int main(int argc, char **argv)
         (void)lseek(infd, offset, SEEK_SET);
 
         note_sz = in64_phdr.p_memsz;
-        note_base = in64_phdr.p_vaddr - note_base;
+        note_base = in64_phdr.p_vaddr - note_base + loadbase;
 
         if ( in64_phdr.p_offset < offset ||
              in64_phdr.p_offset + in64_phdr.p_filesz > offset + dat_siz )

