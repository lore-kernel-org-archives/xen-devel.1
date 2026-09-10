Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7AFC79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 14:05:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414767.1644503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4fOT-00050S-Hn; Thu, 10 Sep 2026 14:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414767.1644503; Thu, 10 Sep 2026 14:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4fOT-00050L-F9; Thu, 10 Sep 2026 14:04:49 +0000
Received: by outflank-mailman (input) for mailman id 1414767;
 Thu, 10 Sep 2026 14:04:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1x4fOS-00050F-33
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 14:04:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4fOR-002uia-Fl
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 16:04:47 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6aa2b8fa-bab6-0a2a0a5309dd-0a2a4508d6e6-30
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 16:04:47 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6aa2b8fd-f659-0a2a45080019-c689ca888be2-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 16:04:46 +0200
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 68AE455P2182272
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 10 Sep 2026 07:04:05 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2026082801 header.d=zytor.com header.i="@zytor.com" header.h="Date:From:To:CC:Subject:In-Reply-To:References"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 68AE455P2182272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1789049046;
	bh=bmbZp10cNDqVNfgj2/1lbTZerEuEX6pqCeXNP3LSFAY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=KTZPnSy2K5ANWXiRh6p4lAZf3xzzO/YODaU51W7fHLpKLjO43x5uBhGiduvK/khSp
	 4hFjaHV/StgTk5AKzjWfYIG9VUeYfMEOx/22Q3dYKviUw4aKEVFdS7cg+hGCd3s2T/
	 GaaAq24W10ZT7vzNVRqh3K3Z7WWPKzVijpXGL8urAbzP7McdeEo4L02fLVubXTj7vc
	 bZn+bixjWxptAcH2+pZVEDLi03MMBdxlqSovjcdYlMdi696xqol4afF70CcIldcnJb
	 fgQYkx2/6sRe9PTvO8WuSlaQu1o/QGTu9zVFNm0oEXjPoRrb8FjXL1X54BeZ3YaOVv
	 +EPo8Oz9lqULg==
Date: Thu, 10 Sep 2026 07:03:58 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>,
        Mauricio Faria de Oliveira <mfo@igalia.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
        kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
User-Agent: K-9 Mail for Android
In-Reply-To: <20260910033810.GFaqImIu15e_pszuO2@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com> <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com> <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local> <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com> <d1b9ff734b918889eaf8885d64141bc3@igalia.com> <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local> <c955deded411defba0de3a1f6daa78b0@igalia.com> <20260910033810.GFaqImIu15e_pszuO2@fat_crate.local>
Message-ID: <13B381DF-68CB-4ADE-9810-8586C73D7F72@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1789049087-CF75B87B-5CEF91B3/0/0
X-purgate-type: clean
X-purgate-size: 366

On September 9, 2026 8:38:10 PM PDT, Borislav Petkov <bp@alien8=2Ede> wrote=
:
>On Tue, Sep 08, 2026 at 06:06:21PM -0300, Mauricio Faria de Oliveira wrot=
e:
>> Ack, and to confirm: not rename the existing one, either?
>
>Nah, concentrate only on what you're trying to achieve=2E
>
>hpa can send a patch ontop since he cares so much=2E
>
>:-)
>

+1 :)

