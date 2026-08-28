Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C78C61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:06:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401668.1637231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqfQ-0007lf-1E; Fri, 28 Aug 2026 07:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401668.1637231; Fri, 28 Aug 2026 07:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqfP-0007lY-Um; Fri, 28 Aug 2026 07:06:23 +0000
Received: by outflank-mailman (input) for mailman id 1401668;
 Fri, 28 Aug 2026 07:06:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqfO-0007kD-Iw
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:06:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqfN-00BTdK-Vn
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:06:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91336b-e002-0a2a0a5209dd-0a2a4502a99c-14
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:06:21 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a91336d-6ca4-0a2a45020019-d155dd31d490-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:06:21 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47f93b2fe4cso231934f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:06:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3fdbsm1690444f8f.6.2026.08.28.00.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:06:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1787900781; x=1788505581; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fQitUjUUG5fOaprIaKXCQa+mw1Of9Q5sRiQtWfrJUBc=;
        b=OVnbCOgdY3+MxVxinoEy1+MMYEA7B2eXRPgXg4iw92hIf4sfT/YtzjhxsMZpkRtSHi
         8rIigWonQqiuHBhUTr4Ro2tq5nDfadyWMigtgXJ/CsQIcq20kBDfHmp/lr7Xryjgftzs
         aLmpQVQKhM0TMIpBFFRaJK/gRX0Hj+3sorORaKAGNnOzOVtriogMTrhvbb3pogim3+YH
         LybBsk3Yw0ypYOTi75NRUBACSPdBSoDXa+NU3OKsny4n2qJ4NOdbSeN28pSZJ3y/T0qr
         VF4IGLDZ0/oqPOVpF4d/HvYnDMl18nNV9c6sKFWZ5Na4WFNQvKa4F6nPZHMkI2qA/PO8
         +8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900781; x=1788505581;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fQitUjUUG5fOaprIaKXCQa+mw1Of9Q5sRiQtWfrJUBc=;
        b=ffSBGlvhmKWjNojzpp/pMKi1dZ/UqCPT4gyuXcUUnHP5haQ2hiQ0huZN65toOYRI3t
         nm5Jp6QdSD7VP77R7septdNWui8IqKSVQIWPOCyc0CzdVZIxEiYBc7THM1JyhNHlyUc1
         6cdKNnCoYmbgNlfuY2Ai++B68/SU8Uexe1rGUVWK34GnKc0Vv8Dit7lYhsvRruPhThQu
         XM35HzTQyOSh+BmieXQUfpKxR2BhvX6uqPl0MMJme0vNsoB3H3W0KyKCwPQ+ORqbQ83F
         1Wpk8MKb2jVLtxaAp7wXz/vTTmNm5kv+MT8Mx83Ts4ROFoEDmXi+oOKDUiM++XEg/sr1
         vBZQ==
X-Gm-Message-State: AFuF++kjKU2I4wAa9HCkctXAcu6Lkkf9UVYkspMtqWKu+MdUr9Du90md
	RHR3Z8hq+sdj7BHpy/+ikqsHkr3QTbxCR0vkiptIxp/UIMkzF3+ivoNm8LgU2u2DwjqWVrD0FgS
	RqqbGrg==
X-Gm-Gg: AR+sD1049PmyhEicXgDdRGHJDAkOmgSC2c5kftl6OkylQ/f7QW1y/2qzHtYFvLGX7Ml
	2SRxlsDLL0FjcC6WIVF4xoLu4CTv42hRk3j0doLt//KIB/63d1MdlKQ8sMgtC08GFyWQ3IUdeyh
	I8oA49bhDKgUcQdBXzXBa66XGcn3B2vIy9IQuJakl02GFXzqx9j3VsqDF4sIOkLNPK0KzuzfVuN
	yEc/C7BY5KeAWccFrF3IAOXyl7tI111z1VYO+t/yIMFxAZg0u31sWuuxsxmscfzQm/mSTTclOYY
	ttdfFkkFJuMDgZuc6Qd55bP8Iy/Vps0XV0To0yNuLUBqwivZ38logTr08O+hxOOLKvJ9cHh26JD
	tpoY/jPYuDDPqhbzA+aEMnIuAUYJdG3sp0idH1AhtqaqdLakuUyzBzMyT1R7AME/EUSqL9q82YH
	t1c9sY3c/KYZfYukAwjjUutVE3hbMCsGFcaMR71ScD//X1L5aTVQpLhoDKoX571LcfRqVPj22qy
	uAfuoGl+6GNzQBpLNIypaDJ8w69UenD719/Q7NYMiNIrI2aj/hw
X-Received: by 2002:a5d:64c5:0:b0:47f:f3d4:26da with SMTP id ffacd0b85a97d-482f79c1888mr5437392f8f.11.1787900781432;
        Fri, 28 Aug 2026 00:06:21 -0700 (PDT)
Message-ID: <b5601922-1f8b-46ff-ac3d-0e4310773f85@suse.com>
Date: Fri, 28 Aug 2026 09:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 12/12] x86/nSVM: address Misra 2.1 rule violation
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
X-purgate-ID: tlsNG-720697/1787900781-F04A62AC-AE6828D4/0/0
X-purgate-type: clean
X-purgate-size: 550

The 16-bit range of "port" is fully handled by the switch(). Therefore the
default: case is reported unreachable by Eclair. Insert BUILD_ERROR() to
annotate this for Eclair.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -845,7 +845,7 @@ nsvm_vmcb_guest_intercepts_ioio(paddr_t
         ++gfn;
         break;
     default:
-        BUG();
+        BUILD_ERROR("I/O port range not fully covered");
         break;
     }
 


