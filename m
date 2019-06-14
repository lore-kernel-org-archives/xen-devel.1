Return-Path: <SRS0=aUBB=UN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C90C31E4B
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 21:36:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2781720850
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 21:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2781720850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbtrq-0003xo-R6; Fri, 14 Jun 2019 21:36:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nj4/=UN=ravnborg.org=sam@srs-us1.protection.inumbo.net>)
 id 1hbtrp-0003xj-Bj
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 21:36:13 +0000
X-Inumbo-ID: 6ceb5816-8eec-11e9-ae53-fbe43aa4bc5d
Received: from asavdk3.altibox.net (unknown [109.247.116.14])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ceb5816-8eec-11e9-ae53-fbe43aa4bc5d;
 Fri, 14 Jun 2019 21:36:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 837A32002E;
 Fri, 14 Jun 2019 23:36:07 +0200 (CEST)
Date: Fri, 14 Jun 2019 23:36:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20190614213606.GB19476@ravnborg.org>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-7-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614203615.12639-7-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=GAxTd-NkrUytLa5Px2AA:9 a=CjuIK1q_8ugA:10
Subject: Re: [Xen-devel] [PATCH 06/59] drm/prime: Actually remove
 DRIVER_PRIME everywhere
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 lima@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, spice-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 etnaviv@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGFuaWVsLgoKTWlub3Igbml0cGljay4uCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYwo+IGlu
ZGV4IDY1ZDU5OTA2NTcwOS4uNGZkMDlhOWFkNjdhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Ry
di5jCj4gQEAgLTMxOTMsNyArMzE5Myw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2
ZXIgPSB7Cj4gIAkgKiBkZWFsIHdpdGggdGhlbSBmb3IgSW50ZWwgaGFyZHdhcmUuCj4gIAkgKi8K
PiAgCS5kcml2ZXJfZmVhdHVyZXMgPQo+IC0JICAgIERSSVZFUl9HRU0gfCBEUklWRVJfUFJJTUUg
fAo+ICsJICAgIERSSVZFUl9HRU0gfCAKPiAgCSAgICBEUklWRVJfUkVOREVSIHwgRFJJVkVSX01P
REVTRVQgfCBEUklWRVJfQVRPTUlDIHwgRFJJVkVSX1NZTkNPQkosCkFkZHMgYSB3aGl0ZXNwYWNl
LgoKCVNhbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
