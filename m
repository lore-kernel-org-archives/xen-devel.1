Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F301C28CC6
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 09:45:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AD1A2802B
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 09:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AD1A2802B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxnavi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjWL-0003ir-Sm; Mon, 03 Jun 2019 09:44:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXjWK-0003im-J6
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 09:44:48 +0000
X-Inumbo-ID: 38380ebf-85e4-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 38380ebf-85e4-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 09:44:47 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 17:42:33 +0800
To: Jan Beulich <JBeulich@suse.com>
References: <24a63318c9021cb88f31fa416c3aa943@sslemail.net>
 <5CF4E83B02000078002347AC@prv1-mh.provo.novell.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <2ab8c99c-9089-341d-3149-362c4415708e@mxnavi.com>
Date: Mon, 3 Jun 2019 17:44:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF4E83B02000078002347AC@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH RESEND] xen: notifier: refine
 'notifier_head', use 'list_head' directly
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603094442.51Gq9-Yt9YoTdg7zYFd97nj8vEfly_lKa_ZTmT35ecE@z>

Ck9uIDYvMy8xOSAxNzoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDMuMDYuMTkgYXQg
MDM6MzMsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4gJ25vdGlmaWVyX2Jsb2Nr
JyBjYW4gYmUgcmVwbGFjZWQgd2l0aCAnbGlzdF9oZWFkJyB3aGVuIHVzZWQgZm9yCj4+ICdub3Rp
Zmllcl9oZWFkJywgdGhpcyBtYWtlIHRoZSBhIGxpdHRsZSBtb3JlIGNsZWFyLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBCYW9kb25nIENoZW4gPGNoZW5iYW9kb25nQG14bmF2aS5jb20+Cj4gT2gsIGFu
ZCBhbHNvIGEgcmVtYXJrIHJlZ2FyZGluZyB0aGUgdGl0bGU6IFdoeSAiUkVTRU5EIj8gVGhpcwo+
IHNob3VsZCBiZSB1c2VkIG9ubHkgaWYgeW91IHJlLXNlbmQgYW4gZW50aXJlbHkgdW5jaGFuZ2Vk
IHBhdGNoLAo+IHBlcmhhcHMgYmVjYXVzZSBvZiBhIGNvcnJlY3Rpb24gdG8gdGhlIHJlY2lwaWVu
dHMgbGlzdC4gT3RoZXJ3aXNlCj4gcGxlYXNlIGluY3JlbWVudCB0aGUgdmVyc2lvbiBudW1iZXIu
CgpIZWxsbyBKYW4sIFRoYW5rcyBmb3IgZ3VpZGluZyBtZSB0byB0aGUgcmlnaHQgZGlyZWN0aW9u
LgoKVGhpcyBpcyBteSBmaXJzdCBleHBlcmllbmNlIHNlbmRpbmcgcGF0Y2ggdXNpbmcgbWFpbCBs
aXN0LgoKSSB3aWxsIHVzZSB2ZXJzaW9uIG51bWJlciBpbnN0ZWFkIG9mIHJlc2VuZCBuZXh0IHRp
bWUuCgo+IEphbgo+Cj4KPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
