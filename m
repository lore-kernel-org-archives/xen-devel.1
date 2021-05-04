Return-Path: <SRS0=Vf37=J7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826BAC433B4
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 14:08:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F1E561164
	for <xen-devel@archiver.kernel.org>; Tue,  4 May 2021 14:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F1E561164
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.122472.231005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldviY-0007zJ-HE; Tue, 04 May 2021 14:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122472.231005; Tue, 04 May 2021 14:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldviY-0007zB-DV; Tue, 04 May 2021 14:08:06 +0000
Received: by outflank-mailman (input) for mailman id 122472;
 Tue, 04 May 2021 14:08:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwvY=J7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ldviW-0007z3-PO
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 14:08:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0595fd8d-2ce1-4a50-b58d-bf5c74176926;
 Tue, 04 May 2021 14:08:03 +0000 (UTC)
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
X-Inumbo-ID: 0595fd8d-2ce1-4a50-b58d-bf5c74176926
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620137283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UmSxk6F4LN5hsPAmNnS6XBgeWQsTTA6KoKvWWnscwcA=;
  b=CrCjDqEzV0iBQ0A49M/BMbvaZWcCYp0KJvEHSjCzM1liqZSZPNErW74e
   h5+MxOV3Rorc/Jpkzl6xPyjc123qUjS9NI1Imk1BJn5plYhqY9FX0A9Er
   MIy0enoi42QNJTLDLJbkA5RMhJWrKPAvsRBSY6dXiw0KgiznTaJsufU4Q
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: TFcedvYesZKszCTsAtytaX7uZ0+cO9+WWYiPXpoDzKuYfDYi6f6S8ZJ0R+1ffdhPIJi8QtklRE
 DegzC+JgN3nh0p+0SbTyJxgN1PYXTs4HqWjshwmBxg+7mQ4dZdVKtqeve/eQ8pcxYogsQe6GfR
 p6yfQbXves/hIrZZgz8/g7sTo3zc9Uyc2VaDp10w/vA34RPCi6ybzxfuPU/CaqH1zXUvTyO4k0
 gmijroFvon9XIeo2aYzwif6S7QpXfIal0rgNH4N7frUgcgiSKIXrYCHYrcgcrzboHw6LVX5Iev
 sB4=
X-SBRS: 5.1
X-MesageID: 44545315
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QONNcq/9BnJexTDEc5Zuk+FucL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmxybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUDD38Zn/+
 Nbf6B6YeebMXFTh8z3+RT9Nt4mzsWO/qzAv5a5815GSwZ2Z6Z8qyJwDQiGGkN7LTM2fKYRPp
 ya+8ZBun6caW0aB/7LcEUtcsrig5nwlJzgaQMbHBJP0mKzpB6h9bKSKWn74j4wSDVKqI1MzU
 HklEjD6ryno7WHzHbnpgjuxrB3vPek9ddZHsyLjaEuW3zRoyKlfp5oVbHHnB1dmpDL1H8QnN
 PBowgtMq1IghvsV1q4rhf31w7r3CxG0Q6H9XajnXDhrcblLQhaN+N9hJlUehacy00ssMAU6t
 Mp40ultoFaBR6FoSLl59KgbXFXv3ezyEBNrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcD1/p9tABinRkGcmlMq7M2nX3w1EBvDaFMFoNap3z9fm20851cExfYYgmwL+PsGOtN5zt
 WBFp4tuKBFT8cQY644LvwGW9GLBmvERg+JF26OP1L9FuUiN2jWo5D6pJU5jdvaNaAg/d8Xot
 DsQVlYvWk9dwbFEsuVxqBG9RjLXSGzRjLoxsZC54Vou7H1SbbxWBfzB2wGoo+FmbEyE8fbU/
 G8NNZ9GPn4N1bjHo5Pwkn/VvBpWDcjefxQnux+d0OFo8rNJIGvnPfcauzvKL3kFithXmv+B3
 AETSXiPcko1DHrZlbIxDzqH1/9cE32+px9VILA+fII9YQLPopQ9g4PiVq44cmPISZYsrM/eV
 Z/JL+PqNL2mUCGuULzq0l5MBtUCUhYpJ/6VWlRmAMMO0ToNaoYt86HYmBU1nufLhp5R8fbeT
 Qv52hfyOaSFdi91CoiA9WoPiamlHMVvmuNVIpZsLaE/93ZdpQxCYsGVKR9GR7QLQF8nR9npQ
 54GUw5b36aMgmrqK2+yLQIGenUdrBH8X+WCP8RjUiaiGKxioUEQGABUzunTMiN6DxePAZ8tx
 lW6K8QgL2JhDC1D3Aw6d5IeGFkWSCsLJwDNh2MYLxOnL/qfQ1qCU+MjTmLkREoE1CatXk6ty
 jaAQPRQ+jCBmNHvH9Z16rwtGl/cH6QFngAL0xSuZFhFGjAp3Z42fKKYK32yGeKdl4e2IgmQU
 v4SCpXLQV0y9+t0hmJ3D6ECHU9350revfQFbI5btjoqwaQAZzNkaENBPlP+pl5cNjor+8QSO
 qaEjXlXw/QGqcs2waPoGwiNzQxoH44kenw0Bmg6GSjxnYwDb7TJ1thLotrUe20/izhR/yS1o
 9+gs9wteysMn/pYtrD0LrJdVd4W23uiH/zS/ttpYFfvKo0urc2F57HUSHQ3HUC2BklNs/7mE
 4XXawT2sG0BqZ/O8gJPy5J9Fsgk9qCaFEmtQH7Gecyd1AghX2zBaL435PY7b40RkGRrgr5Pl
 eStzBH9/DeRi2ZyPoUDbkzLWk+UjlK1F1yuOeZM4veBwWhe7sdoB60MnqhfKRcT6bAE7MKtR
 p+68yJmejSdyeQ4nGtgRJrZqZVt2CgSoeuBQjJH+hC+dmzI06Njaun+9TbtkaHdRKrL0ADwZ
 RYfkkRZNlZgjYsjIcrwjG/I5aH334Ngh9b+3V7jVbj1Yit/XfDEUxHOQPfhI9KXTM7CAn2sf
 j4
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="44545315"
Date: Tue, 4 May 2021 15:08:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v3 12/13] libs/{light,guest}: implement
 xc_cpuid_apply_policy in libxl
Message-ID: <YJFVQMSfTyOeuw3u@perard>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-13-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210430155211.3709-13-roger.pau@citrix.com>

On Fri, Apr 30, 2021 at 05:52:10PM +0200, Roger Pau Monne wrote:
> With the addition of the xc_cpu_policy_* now libxl can have better
> control over the cpu policy, this allows removing the
> xc_cpuid_apply_policy function and instead coding the required bits by
> libxl in libxl__cpuid_legacy directly.
> 
> Remove xc_cpuid_apply_policy.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Use 'r' for libxc return values.
>  - Fix comment about making a cpu policy compatible.
>  - Use LOG*D macros.
> ---

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

