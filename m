Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01498C61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 06:36:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405130.1638675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eaF-0007y4-2d; Wed, 02 Sep 2026 06:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405130.1638675; Wed, 02 Sep 2026 06:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1eaE-0007xv-WD; Wed, 02 Sep 2026 06:36:31 +0000
Received: by outflank-mailman (input) for mailman id 1405130;
 Wed, 02 Sep 2026 06:36:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1eaD-0007xg-F4
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 06:36:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1eaC-008Nhm-Rr
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:36:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c3e0-2eae-0a2a0a5409dd-0a2a4509bb86-36
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:36:28 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97c3ec-be1a-0a2a45090019-d155802dd4f7-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 08:36:28 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso4638525e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 23:36:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce3e04csm117687405e9.10.2026.09.01.23.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:36:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1788330988; x=1788935788; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=McMHeBsvsP9+2Amzdovql9JHeO48zwLTMwqVky0FzsI=;
        b=UkuWBuVqIQqs4CK124QTWwtr+dxsefWKsXHCypBS0UgY+EXE26/KqcMOnUOO3X+DzY
         fz7rV5puIxoc4tFTYhBnh5FCKrdfcx44ZeyqJlul1EzeMrjWs845X7APxyamIj/Fe4Fm
         JQsElOFPTVm/Z0cxMCXRjziuLUfWQW+b+8gUopCf9qwP3stKw9dSmm6BhCGR5M6vfM44
         mUuUOzvAhlzubbQ2Sd5fFmuFhldKLJ0zsjxPrynlQBzEjVvkryrjZXqBQGel6QgEHmdv
         FIdSgXDm6jRPC84umUVdtUSST11SvOBp0jol0MhUc4pdCdI+rGZGMieoVvHfSmURSbd6
         tl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330988; x=1788935788;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=McMHeBsvsP9+2Amzdovql9JHeO48zwLTMwqVky0FzsI=;
        b=rIj7ZhdFQDkHvbaaNkA+LfmjdxHQSARMSueOg8bNJCgtSa2/uIbnDfywDad2BEo2TC
         Hj0m7loZvqJnW/n1NlTiQzF45FX/fBBuf9QE9aR5NQfsmWQn2j76Ge7loaQettIiM7qZ
         +Y6rvA82Bdl/KIOZt0r68D48Vdm5nTkyt3E42l8ZD19plR7EW0XaNfIFNvY1yIRHZMNO
         LXuUydESbrd2PCD1OhBi1soDSmZMVgZp2P6NzapC/TGaxLsM3F/DG+FdS3eDIDGbftK6
         AVpnmeEDu6vmvnq9h9TTZMH5yyux95N0Fk1dgizdTg5jR6zNvP5r7689rwc7YgTmYZCF
         2sEQ==
X-Gm-Message-State: AFuF++kc99N17mWiWL3kOHesDfvsmcoGegydn3Ignl7npZ3Da8E3Pva1
	0dCA+gxSF94IqJ18H8F3QBSJwDczMKzeET2oZJc40oDHsNA+tCO0yblO6BRSRRCDaOABr0D6LY7
	vL6dIZQ==
X-Gm-Gg: AR+sD10Glo5vBdi9dxnoRSXD5GNwvnFFtuI0W0Qnsgg4ZoflF6dnJln2X3v1J/9NYj3
	JD+bP02n64jTUEHEOHGe3fgvDXrw4/MYn+44yQG5SAVUmqY17FhpTIpVTTMbaqwYLS8Gmuxu72T
	ARe4SKZSlmvNHSwqz5iB2k9Yq8ypA712uscUSfzKBdIUAAIGDtvVVZ7tIXR48y9EA4AQux133wr
	QHt+5zk8Nun0injZWt+izFvoBvZFicZSnyylR6n31W3cDTmSF5syb5UhpeeCMQy/3iouBJ2ti55
	6/SxbVUSH4lxYGQS+ec9Td2BjYqXl0qFWngIejjt+83H5T43NxQ3pnXZ5tB7HuVeSwnIxw6PD/D
	mC7PIFwsw1T4b3biUahEMfiJVYNhp6/pfHmFRquOLdRt1gkSRxIkTBzIfKzFUPQx51IhwjKNGtf
	vHDj9nDTdif52raN+haMZGyXnyQw2zhihQlKBdvcvRs/fKQA3RUpWXiLuhVYM8TYgDUdywgSXwj
	O72UimGUxPznr2vXz0EPobnKXYsN85YiS82p7X1AFr+A1UhG5TT
X-Received: by 2002:a05:600c:a086:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-49ce580c170mr48931045e9.8.1788330988342;
        Tue, 01 Sep 2026 23:36:28 -0700 (PDT)
Message-ID: <baa05f9c-6787-44c3-9d53-e3adc0509140@suse.com>
Date: Wed, 2 Sep 2026 08:36:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 13/14] passthrough/PCI: rework (s,b,d,f) init of struct
 pci_dev
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
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
In-Reply-To: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1788330988-3B0DD034-6F56138B/0/0
X-purgate-type: clean
X-purgate-size: 2097

Right now we're casting away const-ness, to initialize the individual
elements despite the field(s) being declared const. Eclair validly
recognizes this as a Misra rule 11.8 violation. Hide this by switching to
the use of memcpy(), deriving the destination address from the (mutable)
struct pci_dev * which we hold in hands.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Subsequently we may want to further leverage the sbdf local variable we
now have in the function. Yet of course the primary question is: Is this
an okay game to play in the first place?

--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -318,6 +318,7 @@ static void apply_quirks(struct pci_dev
 static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
 {
     struct pci_dev *pdev;
+    pci_sbdf_t sbdf = { .seg = pseg->nr, .bus = bus, .devfn = devfn };
     unsigned int pos;
     int rc;
 
@@ -329,9 +330,15 @@ static struct pci_dev *alloc_pdev(struct
     if ( !pdev )
         return NULL;
 
-    *(u16*) &pdev->seg = pseg->nr;
-    *((u8*) &pdev->bus) = bus;
-    *((u8*) &pdev->devfn) = devfn;
+    /*
+     * pdev->sbdf is deliberately const, i.e. it can't be written by structure
+     * or field assignment.  Writing by memcpy() works, as long as it's not
+     * &pdev->sbdf which is passed.  Since memcpy() isn't type-safe, have an
+     * explicit type check first.
+     */
+    (void)(&pdev->sbdf != &sbdf);
+    memcpy((void *)pdev + offsetof(struct pci_dev, sbdf), &sbdf, sizeof(sbdf));
+
     pdev->domain = NULL;
 
     INIT_LIST_HEAD(&pdev->vf_list);
@@ -390,7 +397,6 @@ static struct pci_dev *alloc_pdev(struct
                          phantom_devs[i].slot == PCI_SLOT(devfn) &&
                          phantom_devs[i].stride > PCI_FUNC(devfn) )
                     {
-                        pci_sbdf_t sbdf = pdev->sbdf;
                         unsigned int stride = phantom_devs[i].stride;
 
                         while ( (sbdf.fn += stride) > PCI_FUNC(devfn) )


