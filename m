Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B169C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:25:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5305C20833
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 10:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5305C20833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDRSi-0005Qv-QE; Mon, 08 Apr 2019 10:25:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CdzU=SK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hDRSh-0005Qi-FB
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 10:25:11 +0000
X-Inumbo-ID: 95fa49e9-59e8-11e9-92d7-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 95fa49e9-59e8-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 10:25:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 01390AEF6;
 Mon,  8 Apr 2019 10:25:08 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>,
 "FionaLi-oc <fionali-oc@zhaoxin.com>" <fionali-oc@zhaoxin.com>
References: =?UTF-8?B?PDE1NTQ2OTEyNDbvv703MjQ577+9Me+/vWdpdO+/vXNlbmTvv71l?=
 =?UTF-8?B?bWFpbO+/vWZpb25hbGnvv71vY0B6aGFveGluLmNvbT4gPDMxOTgzNzg4LWU0ZTQt?=
 =?UTF-8?Q?5526-04a1-660c00930d0d=40suse=2ecom=3e_=3c5CAB13DA02000078002253F?=
 =?UTF-8?B?N0BzdXNlLmNvbT4=?=
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <11f0f156-4313-00c4-0355-0fdb82db70cb@suse.com>
Date: Mon, 8 Apr 2019 12:25:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] cpupool: fix ASSERT( c != old_pool )
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, cobechen@zhaoxin.com,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408102506.pQtQBIPzqrXIlT2PjjkS2zi0rSs3B8aUY2blQXHA0v8@z>

T24gMDgvMDQvMjAxOSAxMToyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDQuMTkg
YXQgMDc6MDksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAwOC8wNC8yMDE5IDA0OjQw
LCBGaW9uYUxpLW9jIHdyb3RlOgo+Pj4gQXNzaWduaW5nIGNwdSB0byBjcHVwb29sIG5lZWRuJ3Qg
dG8gc3dpdGNoIGNwdSBzY2hlZHVsZXIgd2hlbgo+Pj4gc3lzdGVtIHN0YXRlIGlzIHJlc3VtZSwg
b3RoZXJ3aXNlIGl0IHdpbGwgY2F1c2UgQVNTRVJUIGluCj4+PiBzY2hlZHVsZV9jcHVfc3dpdGNo
KCkuCj4+Cj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBwYXRjaCBpcyBuZWVkZWQgb24gY3VycmVudCBz
dGFnaW5nIHRyZWUuIENvbW1pdAo+PiA2ODcwZWE5ZDFmYWQ2ZmJlMjcgY2hhbmdlZCByZXN1bWUg
aGFuZGxpbmcgbGVhZGluZyB0bwo+PiBjcHVwb29sX2Fzc2lnbl9jcHVfbG9ja2VkKCkgYmVpbmcg
bm8gbG9uZ2VyIGNhbGxlZCB3aGVuIHJlc3VtaW5nLgo+IAo+IEJ1dCBpcyBpdCBzb21ldGhpbmcg
d29ydGh3aGlsZSB0byBwdXQgb250byBzdGFibGUgdHJlZXMgKHdpdGggdGhlCj4gb25lIG1pc3Np
bmcgYmxhbmsgYWRkZWQpPwoKSSBkb24ndCB0aGluayBpdCBpcyBhbHdheXMgY29ycmVjdC4KCldo
aWxlIGF2b2lkaW5nIHRoZSBBU1NFUlQoKSB0cmlnZ2VyaW5nIGl0IHdvbid0IHN3aXRjaCBiYWNr
IHRoZQpzY2hlZHVsZXIgZnJvbSB0aGUgZGVmYXVsdCBvbmUgYXQgcmVzdW1lLCB3aGljaCB3YXMg
YWN0aXZhdGVkIHdoZW4Kc3VzcGVuZGluZyB0aGUgbWFjaGluZS4KClNvIGZvciBvbGRlciBYZW4g
dmVyc2lvbnMgd2UnZCBuZWVkIHRvIGtub3cgd2hpY2ggQVNTRVJUKCkgd2FzCnRyaWdnZXJpbmcg
YW5kIHdoeSB0aGF0IGRpZCBoYXBwZW4sIG9yIHdlIGNvdWxkIGJhY2twb3J0IG15IHNlcmllcwpy
ZW1vdmluZyByZWFsbHkgdGhlIG5lZWQgZm9yIGNhbGxpbmcgc2NoZWR1bGVfY3B1X3N3aXRjaCgp
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
