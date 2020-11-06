Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B92C2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 14:38:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF8A220724
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 14:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="c4PtAoGu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF8A220724
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20860.46900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb2so-0004yl-8q; Fri, 06 Nov 2020 14:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20860.46900; Fri, 06 Nov 2020 14:38:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb2so-0004ye-5O; Fri, 06 Nov 2020 14:38:30 +0000
Received: by outflank-mailman (input) for mailman id 20860;
 Fri, 06 Nov 2020 14:38:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a09F=EM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kb2sn-0004yX-7a
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 14:38:29 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 240a7c8c-e2fe-4f23-a95c-3d09eb96a914;
 Fri, 06 Nov 2020 14:38:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a09F=EM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kb2sn-0004yX-7a
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 14:38:29 +0000
X-Inumbo-ID: 240a7c8c-e2fe-4f23-a95c-3d09eb96a914
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 240a7c8c-e2fe-4f23-a95c-3d09eb96a914;
	Fri, 06 Nov 2020 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604673507;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ALjou14VWdHL+2vpwf8hovwAGsZ+zQMp6avJuQGdslg=;
  b=c4PtAoGuElyecqLXOvx5AeFeWAbHsytda0kt3TAMVl1cHdDYrF89NR7I
   bECznCUtEtXi5YfUck5VoB2iUSarj4aQBkcwV3CHZSpfIS6vGL7qrdJGr
   e9guMrwP8MaUDaMPLYMqoLKa5CMzqj/+k8C4BxzkHPcKnfZJ9nEW6Fi7s
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0vu+2bSbkhQednlK5BSi9XGYZxXTAn4+VwYG5t/bokP/w2nPPHu46yLayCQlgqWNLY2Nrhwm2C
 h+OxNN4z0vUMbzBqJUST0DKuQ1zZeSXOatC3GxwExP1zefU7rUrk8bzAwCy8OJCTwACVQ0VqLw
 iuueTF42F9o+pkgGOj4fhutxMlurn+b4beyvKx8Ax2R8WYOIIIxoANfFTOY1uQOYhrq2SYW1lX
 WypAk8IPShlRiFus1+tCVdPSAJ60LgP207NtfJTjy4x8D/xa9pj+yHsYOT8/moDzseJC2IwDOW
 Yog=
X-SBRS: None
X-MesageID: 30668296
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,456,1596513600"; 
   d="scan'208";a="30668296"
Subject: Re: [PATCH] tools/libs/light: correct bitmap operations
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20201106140504.25488-1-jgross@suse.com>
 <61860ac6-133a-0393-e63c-8de9ea13e5f9@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1226ca3c-df70-0ad0-dda9-3de06ca3482e@citrix.com>
Date: Fri, 6 Nov 2020 14:37:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61860ac6-133a-0393-e63c-8de9ea13e5f9@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 06/11/2020 14:35, Jan Beulich wrote:
> On 06.11.2020 15:05, Juergen Gross wrote:
>> Libxl bitmap operations for single bits (test, set, reset) take the bit
>> number as a signed integer without testing the value to be larger than
>> 0.
>>
>> Correct that by adding the appropriate tests.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> Wouldn't it be better to convert the parameter types to unsigned int?

Yes, except their in the API, so immutable.

(whether they should be in the API is a different question...)

~Andrew

