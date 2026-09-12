Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EFEC88E56
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 16:06:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1418935.1646535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5QEu-00019N-Mr; Sat, 12 Sep 2026 16:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1418935.1646535; Sat, 12 Sep 2026 16:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5QEu-00019G-Ju; Sat, 12 Sep 2026 16:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1418935;
 Sat, 12 Sep 2026 16:06:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nicola.vetrini@bugseng.com>) id 1x5QEt-000191-9g
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 16:06:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5QEs-00BzvZ-Lh
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 18:06:02 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa5783e-2eae-0a2a0a5409dd-0a2a4509c6d4-38
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 18:06:02 +0200
Received: from [162.55.131.47] (helo=support.bugseng.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nicola.vetrini@bugseng.com>)
 id 6aa5786a-be1a-0a2a45090019-a237832fead8-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 18:06:02 +0200
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 5875C4EE0097;
 Sat, 12 Sep 2026 18:06:02 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1789229162;
	b=ciNIUcNFHwEymnPkd/aSZT8qyv7IX5grpO4bbnPXBQsMHwoiHmZF0i5xgJRCnxFv7CzT
	 mLJciiIfIj4uJ6sKGI58FgUotyxObV0OhBXuNw8oHMSvR194Xty+yGNB3vzi0YQyMIRCT
	 KXjwgDhd/gUfrCtz0aQg7sbShWHRbbKMCS7tf2jbPp+jX43XuczfOpe+kzCBIIG+HhRrp
	 PujGxF9Ae4FOkaZaWtRCef4rsHAC+aAo7nMJSo9SnYxLVVlFLDova0vR8olnX77LdSM3g
	 5yrJ0Gv1yMBi6Q36/JTbW4vnJCYflJ+E+pqGtRfwzB6dIAdLEOgvfU/O2U1AVRzQDH4ud
	 PiFdqisDuZz10eoHM+8XQCN1Gts0j72VR8E33xBKzZuxMu/0mPwyhYW6PHKYlpeIwQhQE
	 jsDrEH645069VQfPbzEzmh1FPohzI0I2noBDRA+lm9QzWZ9XSz2l9GpEZ9cgdd9TfUOhZ
	 6p3LgFNdYMSFSLzsXcjo/VzWMxcrObTV1Onb34dOvC7pIQudkjPcAhvm8hZzwxfogllJY
	 fRuf+Ot7VNgz7/zXITgSVIut5gUuRaCdamOSBsGooGkEcjY8m1IC4DBp1xNpNzJ1u1Nbq
	 7KI9WQHicwj29yUT5iMlZqgAKurKwNoFUw9AmfxyrWirt5q1xlmjDgGd/TKihEM=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789229162;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=fG5ayPlCqvJrR/2PDK/mBBXHYWI+AGxZaxz8I3DlI48=;
	b=1vep8M46bfdKuKQldv06+OcPBpfuqZMDPsmGv2RbTcD2/c/UxldhzoX5kIQUy1xtAU9A
	 FAZAUSPzjt2W+ga4D+zQSD5Owu3itla6RzyyoXgZddytkLkTnEsutSwuq0bKjuwKsbX9F
	 tnytjwULTNCP4DXIELcLlOuawrmjde5D0xVaBUr0mfb4JORdCssH6nOzk1oBWtu7FS5qN
	 MvewpuB2RIeX6RM4GzZzfkeedMGOLUMJvjFZHgnj8PKCAQHbEQHZ23h2SgIMxuqAH4JSx
	 W6Cu+K2Pn5+Vk4YxjWwv+5GKkwQ/YKHzkZQtHxTOeFpBboQLDoxLF9qXIQktHZVxot3Z3
	 YZOVVbxDfws6IWF1WsJ84XPoAfe02MIqvdZBgCQkZXLGNDDC7qiTyb4MDJGS5pkFZL7T3
	 I2StEET/puMZGANOIhtHQ7F2Wmyzg7A5odXaDblGsiQ+g1dRH4V2yYOFSW8UpcBekJNwU
	 VA7pxaoFXsaVOsE8LTh9l3pHyLZU/kYyYQZUpKiYoT+E4rOJDvEThYsyM+6mAC1LJXC13
	 YKbpTrVI4CKoqjQds3cQLp7h7UzNXQwtII0Q5Xbm9dcP3kudGiaZMHG2oaTMGrmntGznF
	 SELU8lXWV49PwIAJtkKy8vc7XE/yM+hCBCM61ZrYP2BsgFgrHl37gOPW0kszP7s=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 18:06:02 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/4] x86/kexec: address Misra rule 11.1 violation in
 machine_kexec_load()
In-Reply-To: <b30f9a03-ebbc-4ff6-8c3d-c9becbca6406@suse.com>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
 <b30f9a03-ebbc-4ff6-8c3d-c9becbca6406@suse.com>
Message-ID: <e94c44167369cca8a2cebdb071cb166d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1789229162-39EC6034-9C467D56/0/0
X-purgate-type: clean
X-purgate-size: 993

On 2026-09-03 13:44, Jan Beulich wrote:
> Misra rule 11.1 demands no conversion to different types at all. We
> deviate conversions to long, unsigned long, and void *, though - 
> leverage
> that deviation here.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> 
> --- a/xen/arch/x86/machine_kexec.c
> +++ b/xen/arch/x86/machine_kexec.c
> @@ -121,7 +121,8 @@ int machine_kexec_load(struct kexec_imag
>      }
> 
>      code_page = __map_domain_page(image->control_code_page);
> -    memcpy(code_page, kexec_reloc, kexec_reloc_end - (char 
> *)kexec_reloc);
> +    memcpy(code_page, kexec_reloc,
> +           kexec_reloc_end - (const char *)(unsigned 
> long)kexec_reloc);
>      unmap_domain_page(code_page);
> 
>      /*

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

