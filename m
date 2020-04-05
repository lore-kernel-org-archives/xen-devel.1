Return-Path: <SRS0=Gfjm=5V=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5E1C2BA15
	for <xen-devel@archiver.kernel.org>; Sun,  5 Apr 2020 14:48:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2765F20659
	for <xen-devel@archiver.kernel.org>; Sun,  5 Apr 2020 14:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="hXtDTzW+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2765F20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jL6ZS-0006GX-SY; Sun, 05 Apr 2020 14:48:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r+i1=5V=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jL6ZR-0006GS-O7
 for xen-devel@lists.xenproject.org; Sun, 05 Apr 2020 14:48:21 +0000
X-Inumbo-ID: 7e129a98-774c-11ea-9e09-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e129a98-774c-11ea-9e09-bc764e2007e4;
 Sun, 05 Apr 2020 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586098101;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dv7fqLatEFV0k1yOtzP7ztFZ59iUfIbrYnd0MPag2ps=;
 b=hXtDTzW+aZCbpnz/5zHJl+Fy0vni+TLuqEHpnwAm/I57Ff8fxvU+u2RO
 dDQ3Z2fbgG72aE/mQKAhlVHuOicQF1SMA6R1eGlPIsN7Qf2+AGOoGnUzn
 i40cApAPDnODYyJBQ2ILuRmPOXTSeGXB87mVyMs/RgeT/mMqUtmKB8RRu M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OTHzUEhP62QBg4fFXvVb8uLmJK4qIDBWTjJMhyx6rJ5hjDe984Z4B71UT5CN/ip7l05rl1qvtj
 i1ypHqgOvRSotw6Q1MsIc4YWL4kOqSUukzDm3RFybCHCR2WcqgvrTVAUFzGuJpDY22A49LehDw
 KJDhWtqGpMEZPJGCa4nstvpOmAeXBeRaHYUNfPNA8UGkN7mwWeMF40VQzeC2twL/j4I+AEHqs0
 zkdJ9zz8xt5nafVu4kDlPbt56V5246SHmYrbqOVwNHJjd/7RIJBkyZs1EFyWt2iqdmKnZj9OQW
 UIw=
X-SBRS: 2.7
X-MesageID: 15208741
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,348,1580792400"; d="scan'208";a="15208741"
Subject: Re: [PATCH] hvmloader: probe memory below 4G before allocation for
 OVMF
To: <xen-devel@lists.xenproject.org>
References: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <ae48819e-31f8-06ce-fe2e-e3f55af846ef@citrix.com>
Date: Sun, 5 Apr 2020 15:48:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, wl@xen.org,
 jbeulich@suse.com, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02/04/2020 17:18, Igor Druzhinin wrote:
> The area just below 4G where OVMF image is originally relocated is not
> necessarily a hole - it might contain pages preallocated by device model
> or the toolstack. By unconditionally populating on top of this memory
> the original pages are getting lost while still potentially foreign mapped
> in Dom0.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
> That doesn't seem necessary for at least upstream toolstack now.
> Alternative might be - to move population of this area to the toolstack
> where there is more control over memory layout.
> ---

Thanks for the discussion, please ignore this patch. We found a better way how
deal with our problem locally. We will introduce a reserved region within
MMIO hole that is managed similarly to stolen memory.

Igor

