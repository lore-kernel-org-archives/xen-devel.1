Return-Path: <SRS0=Q/fq=BX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3934C433DF
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2020 07:05:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA3FA20716
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2020 07:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA3FA20716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k67Iq-00066l-5e; Thu, 13 Aug 2020 07:05:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EEtF=BX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k67Io-00066g-LV
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 07:05:30 +0000
X-Inumbo-ID: 5d081bd5-6f18-4c18-b0aa-cc19eb93762e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d081bd5-6f18-4c18-b0aa-cc19eb93762e;
 Thu, 13 Aug 2020 07:05:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A22C1B163;
 Thu, 13 Aug 2020 07:05:50 +0000 (UTC)
Subject: Re: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20200813062113.11030-1-andr2000@gmail.com>
 <7c8cb6e9-8270-d27a-6480-793ef5599d09@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <231ee1e7-c2fa-3c2a-f444-f9f813fc906d@suse.com>
Date: Thu, 13 Aug 2020 09:05:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7c8cb6e9-8270-d27a-6480-793ef5599d09@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13.08.20 08:32, Oleksandr Andrushchenko wrote:
> Juergen, Boris,
> 
> can we please merge these via Xen Linux tree as I have collected enough Ack/R-b?
> 
> The series has DRM patches, but those anyway are Xen related, so I think
> 
> this should be fine from DRI point of view.

Yes, fine with me.


Juergen

> 
> Thank you,
> 
> Oleksandr
> 
> On 8/13/20 9:21 AM, Oleksandr Andrushchenko wrote:
>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>
>> Hello,
>>
>> This series contains an assorted set of fixes and improvements for
>> the Xen para-virtualized display driver and grant device driver which
>> I have collected over the last couple of months:
>>
>> 1. Minor fixes to grant device driver and drm/xen-front.
>>
>> 2. New format (YUYV) added to the list of the PV DRM supported formats
>> which allows the driver to be used in zero-copying use-cases when
>> a camera device is the source of the dma-bufs.
>>
>> 3. Synchronization with the latest para-virtualized protocol definition
>> in Xen [1].
>>
>> 4. SGT offset is now propagated to the backend: while importing a dmabuf
>> it is possible that the data of the buffer is put with offset which is
>> indicated by the SGT offset. This is needed for some GPUs which have
>> non-zero offset.
>>
>> Thank you,
>> Oleksandr Andrushchenko
>>
>> [1] https://urldefense.com/v3/__https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=c27a184225eab54d20435c8cab5ad0ef384dc2c0__;!!GF_29dbcQIUBPA!iAHOdk4M167VNM1AypMGVmyKJu-iqC9e5cXyu6N595Np3iyIZDnZl0MIBX3IROJSD1GSMX_GfQ$ [xenbits[.]xen[.]org]
>>
>> Changes since v1:
>> =================
>>
>> 1. Removed patch which adds EDID to PV DRM as it needs more time for review:
>> "5. Version 2 of the Xen displif protocol adds XENDISPL_OP_GET_EDID
>> request which allows frontends to request EDID structure per
>> connector. This request is optional and if not supported by the
>> backend then visible area is still defined by the relevant
>> XenStore's "resolution" property.
>> If backend provides EDID with XENDISPL_OP_GET_EDID request then
>> its values must take precedence over the resolutions defined in
>> XenStore."
>> I will send this as a dedicated patch.
>>
>> 2. Added missing CC stable for the patches with fixes
>>
>> Oleksandr Andrushchenko (5):
>>     xen/gntdev: Fix dmabuf import with non-zero sgt offset
>>     drm/xen-front: Fix misused IS_ERR_OR_NULL checks
>>     drm/xen-front: Add YUYV to supported formats
>>     xen: Sync up with the canonical protocol definition in Xen
>>     drm/xen-front: Pass dumb buffer data offset to the backend
>>
>>    drivers/gpu/drm/xen/xen_drm_front.c      | 10 +--
>>    drivers/gpu/drm/xen/xen_drm_front.h      |  2 +-
>>    drivers/gpu/drm/xen/xen_drm_front_conn.c |  1 +
>>    drivers/gpu/drm/xen/xen_drm_front_gem.c  | 11 +--
>>    drivers/gpu/drm/xen/xen_drm_front_kms.c  |  2 +-
>>    drivers/xen/gntdev-dmabuf.c              |  8 +++
>>    include/xen/interface/io/displif.h       | 91 +++++++++++++++++++++++-
>>    7 files changed, 111 insertions(+), 14 deletions(-)
>>
> 


