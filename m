Return-Path: <SRS0=aF8x=AZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24378C433EA
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2020 14:58:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E53272245A
	for <xen-devel@archiver.kernel.org>; Tue, 14 Jul 2020 14:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Wr3g114W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E53272245A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvMNo-0005wh-HE; Tue, 14 Jul 2020 14:58:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaI7=AZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvMNn-0005wc-PY
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 14:58:11 +0000
X-Inumbo-ID: 6f19a9e8-c5e2-11ea-9320-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f19a9e8-c5e2-11ea-9320-12813bfff9fa;
 Tue, 14 Jul 2020 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594738690;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8GwmC1NYm0grqvw7mMFRcv5MLXu3sjy/KxOFU51OiTI=;
 b=Wr3g114WHbd49hER/E+Z2bxM5nwxmyQEh7DdoUVpMK/qjkXtICEjCuGv
 j7g/CI4JuwVu4V+OdH5PiXCnpUCn/4LW8cmKnyt8AT5xQgXIsKuypNHr6
 mCtqd8qQhaZ9JTFrES+QKRdD2YKHhMqed6evFCJw8I25/tDkBzMb1nA+N E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ObyGNI763xUGEZXGQWCbEQOyEiBqPG5Lau/VeEp9Dokf5bC8HmXx/m8Pxz4HQd+Bg5VE9tVddP
 SImemHO1A7NWUjcO2Gudq+OlPNQ9c1I+oDEE1S6I1Tp7KAEbn+4EGNpuoTA8zUoFpyHC+qS2vi
 eQzNs63d/PqIshaWkQkI9uRlehnHthegKvagiPg+n44PI32aSjJNUh3uHna3GOWNPuKM/vkFlS
 X8Vkm3Iegz+M0XmIBgVoyruZrpSc4WLiTuIExAk87FX1xTGfS4Vp7/Zy3RZk2Sb6sqiYfyPa3Q
 ubw=
X-SBRS: 2.7
X-MesageID: 22544735
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,350,1589256000"; d="scan'208";a="22544735"
Date: Tue, 14 Jul 2020 16:58:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 6/7] flask: drop dead compat translation code
Message-ID: <20200714145800.GO7191@Air-de-Roger>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
 <7711f68d-394e-a74f-81fa-51f8447174ce@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7711f68d-394e-a74f-81fa-51f8447174ce@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 01, 2020 at 12:28:07PM +0200, Jan Beulich wrote:
> Translation macros aren't needed at all (or else a devicetree_label
> entry would have been missing), and userlist has been removed quite some
> time ago.
> 
> No functional change.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -148,14 +148,11 @@
>  ?	xenoprof_init			xenoprof.h
>  ?	xenoprof_passive		xenoprof.h
>  ?	flask_access			xsm/flask_op.h
> -!	flask_boolean			xsm/flask_op.h
>  ?	flask_cache_stats		xsm/flask_op.h
>  ?	flask_hash_stats		xsm/flask_op.h
> -!	flask_load			xsm/flask_op.h
>  ?	flask_ocontext			xsm/flask_op.h
>  ?	flask_peersid			xsm/flask_op.h
>  ?	flask_relabel			xsm/flask_op.h
>  ?	flask_setavc_threshold		xsm/flask_op.h
>  ?	flask_setenforce		xsm/flask_op.h
> -!	flask_sid_context		xsm/flask_op.h
>  ?	flask_transition		xsm/flask_op.h

Shouldn't those become checks then?

Sorry I realize my knowledge of all this compat stuff is very poor.

Thanks.

