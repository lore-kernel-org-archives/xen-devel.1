Return-Path: <SRS0=/EcG=4B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F157C2BA83
	for <xen-devel@archiver.kernel.org>; Thu, 13 Feb 2020 12:05:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDE272168B
	for <xen-devel@archiver.kernel.org>; Thu, 13 Feb 2020 12:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDE272168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2DEp-00018F-6R; Thu, 13 Feb 2020 12:04:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V1im=4B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j2DEn-000181-MS
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 12:04:57 +0000
X-Inumbo-ID: 0a758e4a-4e59-11ea-ade5-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a758e4a-4e59-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 12:04:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2DEh-0006hp-I6; Thu, 13 Feb 2020 12:04:51 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2DEh-0005q2-6W; Thu, 13 Feb 2020 12:04:51 +0000
Date: Thu, 13 Feb 2020 12:04:47 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200213120447.uscprhwo2mmg4l3p@debian>
References: <20200212074154.23755-1-jgross@suse.com>
 <20200212074154.23755-4-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212074154.23755-4-jgross@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 3/3] xenstore: remove not applicable
 control commands in stubdom
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDg6NDE6NTRBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBXaGVuIHJ1biBpbiBhIHN0dWJkb20gZW52aXJvbm1lbnQgWGVuc3RvcmUgY2FuJ3Qg
c2VsZWN0IGEgbG9nZmlsZSBvcgo+IGVtaXQgbWVtb3J5IHN0YXRpc3RpY3MgdG8gYSBzcGVjaWZp
YyBmaWxlLgo+IAo+IFNvIHJlbW92ZSBvciBtb2RpZnkgdGhvc2UgY29udHJvbCBjb21tYW5kcyBh
Y2NvcmRpbmdseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Cj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
