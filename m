Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFEC606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=A8VykUnK
Received: from list by lists.xenproject.org with outflank-mailman.1492819.1693090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTLJ2-0004rm-9n; Tue, 17 Nov 2026 15:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492819.1693090; Tue, 17 Nov 2026 15:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTLJ2-0004rf-7A; Tue, 17 Nov 2026 15:41:12 +0000
Received: by outflank-mailman (input) for mailman id 1492819;
 Tue, 17 Nov 2026 15:41:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTLJ0-0004rZ-7C
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 15:41:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTLIz-005afo-F5
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 16:41:09 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc7587-2eae-0a2a0a5409dd-0a2a4508d89c-24
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 16:41:09 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc7595-f659-0a2a45080019-d1558033e570-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 16:41:09 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso29643615e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 07:41:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a4de4cb1c3sm3090283f8f.8.2026.11.17.07.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 07:41:08 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794930069; x=1795534869; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Da9++i0OBQNJviMSrovM/mB+rY7ilv1crSBh4ypyjQs=;
        b=A8VykUnKj68LedqilYejVuuSlpiRFfLe/BxWY2msv1v65Y0n5qnnli3vuzqLeukvFd
         gPi7FEUxF0fGe/QhUW7+DVywXb7z/CFsFZfeRPRK18fmHQpE6vy7iQqIVPULTTbdsCNa
         EoRxgewqreW5O5OGDOXQc53zq/hx8RMpalwI+VmqTj1JEv5X5ERXWnmLlZ4vt0ESOxka
         figebSDAJjOe3DUlM5W95bF11BPPU272pIGJjutNtTdTj3M99fIM++tliimm9FXYVzQm
         17MQg4nyeoocZ39gfH5aZj1vgC/NBYZGViluRCD3O7Cj8V8sZhcrMoM3MPyBCQ6JA27f
         ekmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930069; x=1795534869;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Da9++i0OBQNJviMSrovM/mB+rY7ilv1crSBh4ypyjQs=;
        b=qQ7NE+9bM3j1L/GY8N83wWtFtDxfueUZEnGD+vTHu3c67CJ6p8RyKdX+nbTrXorr2x
         89/r4ycVUWi3KZ828WvO3VIJ6SIGZT20z0+zRqaxiocxAcw7iYeQc8nhuTqpfGT8e268
         1DDvVJUekXk05+8v6m46Bre2xevGXIco1BlvApLMLa84FFeoYIgGKaDNghog+Jwf60ZK
         re63Bvr/j58oMiUkDPtAj3406zrbKBADmvXstU160slV6fSPI1ZQwW5TWwgw2/WkNt/n
         9zoH+wuLdIZfLdXhjLzrKnZZaXTxXTgcuCO4j7P1xxPX7Sp3llQygNunnIduTurv2pn6
         UdHQ==
X-Gm-Message-State: APuU4Z+/4UbfEji9osRQfIHSLw46Ddksp34V7TRHS+5yKWAzOfMkDuS0
	DEWsaFuWXzVeRS2flnyhAodvmx7bJ/+Ndlh3sB4/76rTNi7kMSwb7ibjUNWaBZnv42aiZprL1uD
	MzxbbfA==
X-Gm-Gg: AYBFou31+22W4ZrQthElHKk+5kHkbgFOsJdaV0taN3hBPucsCVZb9MYkbjETto3CZHW
	Y6fX3dsxl6ixSp/kTSY6l/19DdMX2BRnS3aXFMKdGh9V9i78UWx5jf3fuc8s4ZJLXo8xPvDoiFn
	SJ0RbvjvsKbvrasPAhXrdPwd+0za+KfUMjpO6eG22519A1ShxZx2PVCdNsbq6oDS4p3t5x0Uyou
	ZksUhG5PgUkhMpMZQifZpgMKmAEkkGnCepF3HDrxqsvkN6jGB4JPwGdxqXF5yp379/RGcBfMECD
	y+mm6G4+24Pb/dp4IVddWgduOkgwMvOrczShdZLwOuKj1arQCgLdgrUI/RFdcm9tOhjtr9UZN3t
	mtAzgPV6xxZj27DzV8VhMw29f80X1CntCr5GB5h4eNW+CtqQwu9cWvQJALpFl/kcdylbJf8KfBS
	qcJBQ76yMO9I7Rql+tQcopwrzYBSik2BiOe0Ib8yhCLK7VV5Va4BsDhLNUvv/gepeB4dl2jGLxq
	PK+pZnENqNbOU3c6DdJeV4KpirdbeyKkGSL3a2pemunq6dJZGtE+2q3zH8Qtbop7Q3xb3ZhAF8G
	M4Tp/vNApwfsdXH+O56n2VfM50Y7pw6ydJ/D8u3Dhs52f+XzRhhWRwugsgdJIeVh7ZkkG2kdXvW
	qCZosYv1T7yM4Ew89
X-Received: by 2002:a05:600c:c172:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb5f3b27f9mr243535385e9.30.1794930068737;
        Tue, 17 Nov 2026 07:41:08 -0800 (PST)
Message-ID: <16aeb337-d6f3-4f3f-abcf-56fb6340fc6b@suse.com>
Date: Tue, 17 Nov 2026 16:41:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: off-by-1 in new XEN_DOMCTL_ioport_mapping checks
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794930069-DFAD487B-A4F7B5B5/10/78276251493
X-purgate-type: spam
X-purgate-size: 785
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The new checking introduced not so long ago would wrongly reject exactly
adjacent regions.

Fixes: fa61af950bb4 ("x86/HVM: more checking for XEN_DOMCTL_ioport_mapping")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -756,8 +756,8 @@ long arch_do_domctl(
                     found = 1;
                     break;
                 }
-                if ( fmp + np >= g2m_ioport->mport &&
-                     g2m_ioport->mport + g2m_ioport->np >= fmp )
+                if ( fmp + np > g2m_ioport->mport &&
+                     g2m_ioport->mport + g2m_ioport->np > fmp )
                 {
                     ret = -EBUSY;
                     break;

