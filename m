Return-Path: <SRS0=BXCD=X3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F1EC35280
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 07:40:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF2E215EA
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 07:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AF2E215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFZF1-00052K-6S; Wed, 02 Oct 2019 07:40:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFZEz-0004vC-V0
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 07:40:05 +0000
X-Inumbo-ID: d971ce06-e4e7-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d971ce06-e4e7-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 07:40:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A720ACFE;
 Wed,  2 Oct 2019 07:40:04 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20191001151633.1659-1-boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b3f955c-ad76-601f-2b58-fa9dc4608c72@suse.com>
Date: Wed, 2 Oct 2019 09:40:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001151633.1659-1-boris.ostrovsky@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/xen: Return from panic notifier
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, james@dingwall.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxNzoxNiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IEN1cnJlbnRseSBl
eGVjdXRpb24gb2YgcGFuaWMoKSBjb250aW51ZXMgdW50aWwgWGVuJ3MgcGFuaWMgbm90aWZpZXIK
PiAoeGVuX3BhbmljX2V2ZW50KCkpIGlzIGNhbGxlZCBhdCB3aGljaCBwb2ludCB3ZSBtYWtlIGEg
aHlwZXJjYWxsIHRoYXQKPiBuZXZlciByZXR1cm5zLgo+IAo+IFRoaXMgbWVhbnMgdGhhdCBhbnkg
bm90aWZpZXIgdGhhdCBpcyBzdXBwb3NlZCB0byBiZSBjYWxsZWQgbGF0ZXIgYXMKPiB3ZWxsIGFz
IHNpZ25pZmljYW50IHBhcnQgb2YgcGFuaWMoKSBjb2RlIChzdWNoIGFzIHBzdG9yZSB3cml0ZXMg
ZnJvbQo+IGttc2dfZHVtcCgpKSBpcyBuZXZlciBleGVjdXRlZC4KCkJhY2sgYXQgdGhlIHRpbWUg
d2hlbiB0aGlzIHdhcyBpbnRyb2R1Y2VkIGludG8gdGhlIFhlbm9MaW51eCB0cmVlLApJIHRoaW5r
IHRoaXMgYmVoYXZpb3Igd2FzIGludGVudGlvbmFsIGZvciBhdCBsZWFzdCBEb21VLXMuIEkgd29u
ZGVyCndoZXRoZXIgeW91IHdvdWxkbid0IHdhbnQgeW91ciBjaGFuZ2UgdG8gZnVydGhlciBkaXN0
aW5ndWlzaCBEb20wCmFuZCBEb21VIGJlaGF2aW9yLgoKPiBUaGVyZSBpcyBubyByZWFzb24gZm9y
IHhlbl9wYW5pY19ldmVudCgpIHRvIGJlIHRoaXMgbGFzdCBwb2ludCBpbgo+IGV4ZWN1dGlvbiBz
aW5jZSBwYW5pYygpJ3MgZW1lcmdlbmN5X3Jlc3RhcnQoKSB3aWxsIGNhbGwgaW50bwo+IHhlbl9l
bWVyZ2VuY3lfcmVzdGFydCgpIGZyb20gd2hlcmUgd2UgY2FuIHBlcmZvcm0gb3VyIGh5cGVyY2Fs
bC4KCkRpZCB5b3UgY29uc2lkZXIsIGFzIGFuIGFsdGVybmF0aXZlLCB0byBsb3dlciB0aGUgbm90
aWZpZXIncwpwcmlvcml0eT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
