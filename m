Return-Path: <SRS0=ShNj=ZT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2336C432C0
	for <xen-devel@archiver.kernel.org>; Wed, 27 Nov 2019 11:01:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA003206BF
	for <xen-devel@archiver.kernel.org>; Wed, 27 Nov 2019 11:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA003206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZv49-0000WH-Ul; Wed, 27 Nov 2019 11:01:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZv48-0000WC-AE
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:01:00 +0000
X-Inumbo-ID: 30a1ff54-1105-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30a1ff54-1105-11ea-9db0-bc764e2007e4;
 Wed, 27 Nov 2019 11:00:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2C661B1BE;
 Wed, 27 Nov 2019 11:00:57 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>, Julien Grall <jgrall@amazon.com>
References: <20191126171715.10881-1-pdurrant@amazon.com>
 <afa87ca4-ecda-82d7-7c99-4dcf807ddd6d@suse.com>
 <7593041e441a4136ade7ee17d4d35971@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9c1a6931-88cf-a9a8-7da5-4ad0627b8cd3@suse.com>
Date: Wed, 27 Nov 2019 12:01:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7593041e441a4136ade7ee17d4d35971@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: vpmu: Unmap per-vCPU PMU page when
 the domain is destroyed
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxMTo1NywgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+IFNlbnQ6IDI3IE5vdmVtYmVyIDIwMTkgMDk6NDQKPj4gVG86IER1cnJhbnQsIFBhdWwgPHBk
dXJyYW50QGFtYXpvbi5jb20+OyBHcmFsbCwgSnVsaWVuIDxqZ3JhbGxAYW1hem9uLmNvbT4KPj4g
Q2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgQW5kcmV3IENvb3Blcgo+PiA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsgV2VpCj4+IExpdSA8d2xAeGVuLm9yZz4KPj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
eGVuL3g4NjogdnBtdTogVW5tYXAgcGVyLXZDUFUgUE1VIHBhZ2Ugd2hlbiB0aGUKPj4gZG9tYWlu
IGlzIGRlc3Ryb3llZAo+Pgo+PiBPbiAyNi4xMS4yMDE5IDE4OjE3LCBQYXVsIER1cnJhbnQgd3Jv
dGU6Cj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+Pj4KPj4+IEEg
Z3Vlc3Qgd2lsbCBzZXR1cCBhIHNoYXJlZCBwYWdlIHdpdGggdGhlIGh5cGVydmlzb3IgZm9yIGVh
Y2ggdkNQVSB2aWEKPj4+IFhFTlBNVV9pbml0LiBUaGUgcGFnZSB3aWxsIHRoZW4gZ2V0IG1hcHBl
ZCBpbiB0aGUgaHlwZXJ2aXNvciBhbmQgb25seQo+Pj4gcmVsZWFzZWQgd2hlbiBYRU1QTVVfZmlu
aXNoIGlzIGNhbGxlZC4KPj4+Cj4+PiBUaGlzIG1lYW5zIHRoYXQgaWYgdGhlIGd1ZXN0IGlzIG5v
dCBzaHV0ZG93biBncmFjZWZ1bGx5IChzdWNoIGFzIHZpYSB4bAo+Pj4gZGVzdHJveSksIHRoZSBw
YWdlIHdpbGwgc3RheSBtYXBwZWQgaW4gdGhlIGh5cGVydmlzb3IuCj4+Cj4+IElzbid0IHRoaXMg
c3RpbGwgdG9vIHdlYWsgYSBkZXNjcmlwdGlvbj8gSXQncyBub3QgdGhlIHRvb2wgc3RhY2sKPj4g
aW52b2tpbmcgWEVOUE1VX2ZpbmlzaCwgYnV0IHRoZSBndWVzdCBpdHNlbGYgYWZhaWNzLiBJLmUu
IGEKPj4gbWlzYmVoYXZpbmcgZ3Vlc3QgY291bGQgcHJldmVudCBwcm9wZXIgY2xlYW51cCBldmVu
IHdpdGggZ3JhY2VmdWwKPj4gc2h1dGRvd24uCj4+Cj4gCj4gT2ssIGhvdyBhYm91dCAnaWYgdGhl
IGd1ZXN0IGZhaWxzIHRvIGludm9rZSBYRU5QTVVfZmluaXNoLCBlLmcuIGlmCj4gaXQgaXMgZGVz
dHJveWVkLCByYXRoZXIgdGhhbiBjbGVhbmx5IHNodXQgZG93bic/CgpTb3VuZHMgZ29vZC4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
