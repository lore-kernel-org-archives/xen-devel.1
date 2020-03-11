Return-Path: <SRS0=Ft0f=44=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6280C10F27
	for <xen-devel@archiver.kernel.org>; Wed, 11 Mar 2020 11:35:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73A1221D7E
	for <xen-devel@archiver.kernel.org>; Wed, 11 Mar 2020 11:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73A1221D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBzeE-0000vE-Mf; Wed, 11 Mar 2020 11:35:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lkak=44=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBzeD-0000v9-Th
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 11:35:37 +0000
X-Inumbo-ID: 6d56155b-638c-11ea-af6e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d56155b-638c-11ea-af6e-12813bfff9fa;
 Wed, 11 Mar 2020 11:35:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BAB3BACBD;
 Wed, 11 Mar 2020 11:35:36 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ac4075c-a847-38e6-f692-646d722da7ef@suse.com>
Date: Wed, 11 Mar 2020 12:35:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310072853.27567-5-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 4/6] xen/rcu: fix rcu_lock_domain()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAwODoyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiByY3VfbG9ja19kb21h
aW4oKSBtaXN1c2VzIHRoZSBkb21haW4gc3RydWN0dXJlIGFzIHJjdSBsb2NrLCB3aGljaCBpcwo+
IHdvcmtpbmcgb25seSBhcyBsb25nIGFzIHJjdV9yZWFkX2xvY2soKSBpc24ndCBldmFsdWF0aW5n
IHRoZSBsb2NrLgo+IAo+IEZpeCB0aGF0IGJ5IGFkZGluZyBhIHJjdSBsb2NrIHRvIHN0cnVjdCBk
b21haW4gYW5kIHVzZSB0aGF0IGZvcgo+IHJjdV9sb2NrX2RvbWFpbigpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJIGd1ZXNzIHRoaXMgb25lIGlzIGluZGVwZW5k
ZW50IG9mIHBhdGNoZXMgMiBhbmQgMywgYW5kIGhlbmNlIGNvdWxkCmdvIGluIHRvZ2V0aGVyIHdp
dGggcGF0Y2ggMT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
