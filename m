Return-Path: <SRS0=cv0X=XG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C78ECDE20
	for <xen-devel@archiver.kernel.org>; Wed, 11 Sep 2019 09:28:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 609E621928
	for <xen-devel@archiver.kernel.org>; Wed, 11 Sep 2019 09:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 609E621928
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7yuy-0001wl-RX; Wed, 11 Sep 2019 09:28:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7yuw-0001we-Vd
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 09:28:03 +0000
X-Inumbo-ID: 734afa02-d476-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 734afa02-d476-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 09:28:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6CFE9AD46;
 Wed, 11 Sep 2019 09:28:01 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <20190911062001.25931-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a2380f3-d318-1086-74ba-8f133db440b4@suse.com>
Date: Wed, 11 Sep 2019 11:28:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911062001.25931-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 1/5] docs: add feature document for Xen
 hypervisor sysfs-like support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAwODoxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiArIyBPdmVydmlldwo+
ICsKPiArVGhlIEh5cGVydmlzb3IgRlMgaXMgYSBoaWVyYXJjaGljYWwgbmFtZS12YWx1ZSBzdG9y
ZSBmb3IgcmVwb3J0aW5nCj4gK2luZm9ybWF0aW9uIHRvIGd1ZXN0cywgZXNwZWNpYWxseSBkb20w
LiAgSXQgaXMgc2ltaWxhciB0byB0aGUgTGludXgKPiAra2VybmVsJ3Mgc3lzZnMsIGJ1dCB3aXRo
b3V0IHRoZSBmdW5jdGlvbmFsaXR5IHRvIGRpcmVjdGx5IGFsdGVyCj4gK2VudHJpZXMgdmFsdWVz
LiBFbnRyaWVzIGFuZCBkaXJlY3RvcmllcyBhcmUgY3JlYXRlZCBieSB0aGUgaHlwZXJ2aXNvciwK
PiArd2hpbGUgdGhlIHRvb2xzdGFjayBpcyBhYmxlIHRvIHVzZSBhIGh5cGVyY2FsbCB0byBxdWVy
eSB0aGUgZW50cnkKPiArdmFsdWVzLgo+ICsKPiArIyBVc2VyIGRldGFpbHMKPiArCj4gK1dpdGg6
Cj4gKwo+ICsgICAgeGVuZnMgLS1scyA8cGF0aD4KPiArCj4gK3RoZSB1c2VyIGNhbiBsaXN0IHRo
ZSBlbnRyaWVzIG9mIGEgc3BlY2lmaWMgcGF0aCBvZiB0aGUgRlMuIFVzaW5nOgo+ICsKPiArICAg
IHhlbmZzIC0tY2F0IDxwYXRoPgo+ICsKPiArdGhlIGNvbnRlbnQgb2YgYW4gZW50cnkgY2FuIGJl
IHJldHJpZXZlZC4KCkp1c3Qgb25lIGluaXRpYWwgcmVtYXJrOiBJIHRoaW5rIHRoZSAtLSBwcmVm
aXggdG8gdGhlIGNvbW1hbmRzCnNob3VsZCBiZSBvbWl0dGVkOyB0aGV5IHNob3VsZCBiZSB1c2Vk
IGZvciBvcHRpb24tbGlrZSBhcmd1bWVudHMKb25seS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
