Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71875C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 21:12:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 470502087C
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 21:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 470502087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG8tH-000483-Pp; Mon, 15 Apr 2019 21:11:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owvg=SR=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1hG8tG-00047y-HO
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 21:11:46 +0000
X-Inumbo-ID: 1273be5c-5fc3-11e9-92d7-bc764e045a96
Received: from gateway20.websitewelcome.com (unknown [192.185.67.41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1273be5c-5fc3-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 21:11:44 +0000 (UTC)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 5B0F6400D85D7
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 16:11:44 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id G8tEhE8f92PzOG8tEhmH6G; Mon, 15 Apr 2019 16:11:44 -0500
X-Authority-Reason: nr=8
Received: from [189.250.55.242] (port=53160 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hG8tD-001APC-Av; Mon, 15 Apr 2019 16:11:43 -0500
Date: Mon, 15 Apr 2019 16:11:41 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Message-ID: <20190415211141.GA1732@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.55.242
X-Source-L: No
X-Exim-ID: 1hG8tD-001APC-Av
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.55.242]:53160
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Subject: [Xen-devel] [PATCH net-next] xen-netfront: mark expected switch
 fall-through
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
Cc: xen-devel@lists.xenproject.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgbWFyayBz
d2l0Y2gKY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guCgpUaGlz
IHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKCmRyaXZlcnMvbmV0L3hlbi1uZXRm
cm9udC5jOiBJbiBmdW5jdGlvbiDigJhuZXRiYWNrX2NoYW5nZWTigJk6CmRyaXZlcnMvbmV0L3hl
bi1uZXRmcm9udC5jOjIwMzg6Njogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhy
b3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCiAgIGlmIChkZXYtPnN0YXRlID09IFhlbmJ1
c1N0YXRlQ2xvc2VkKQogICAgICBeCmRyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jOjIwNDE6Mjog
bm90ZTogaGVyZQogIGNhc2UgWGVuYnVzU3RhdGVDbG9zaW5nOgogIF5+fn4KCldhcm5pbmcgbGV2
ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCgpOb3RpY2UgdGhhdCwgaW4g
dGhpcyBwYXJ0aWN1bGFyIGNhc2UsIHRoZSBjb2RlIGNvbW1lbnQgaXMgbW9kaWZpZWQKaW4gYWNj
b3JkYW5jZSB3aXRoIHdoYXQgR0NDIGlzIGV4cGVjdGluZyB0byBmaW5kLgoKVGhpcyBwYXRjaCBp
cyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxlCi1XaW1wbGljaXQtZmFsbHRo
cm91Z2guCgpTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVk
ZGVkb3IuY29tPgotLS0KIGRyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQveGVuLW5ldGZyb250LmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYwppbmRl
eCA4MGMzMDMyMWRlNDEuLjhkMzM5NzBhMjk1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQveGVu
LW5ldGZyb250LmMKKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMKQEAgLTIwMzcsNyAr
MjAzNyw3IEBAIHN0YXRpYyB2b2lkIG5ldGJhY2tfY2hhbmdlZChzdHJ1Y3QgeGVuYnVzX2Rldmlj
ZSAqZGV2LAogCWNhc2UgWGVuYnVzU3RhdGVDbG9zZWQ6CiAJCWlmIChkZXYtPnN0YXRlID09IFhl
bmJ1c1N0YXRlQ2xvc2VkKQogCQkJYnJlYWs7Ci0JCS8qIE1pc3NlZCB0aGUgYmFja2VuZCdzIENM
T1NJTkcgc3RhdGUgLS0gZmFsbHRocm91Z2ggKi8KKwkJLyogRmFsbCB0aHJvdWdoIC0gTWlzc2Vk
IHRoZSBiYWNrZW5kJ3MgQ0xPU0lORyBzdGF0ZS4gKi8KIAljYXNlIFhlbmJ1c1N0YXRlQ2xvc2lu
ZzoKIAkJeGVuYnVzX2Zyb250ZW5kX2Nsb3NlZChkZXYpOwogCQlicmVhazsKLS0gCjIuMjEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
