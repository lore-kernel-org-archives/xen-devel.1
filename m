Return-Path: <SRS0=4VTz=W5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F60C3A59E
	for <xen-devel@archiver.kernel.org>; Mon,  2 Sep 2019 14:15:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F93921744
	for <xen-devel@archiver.kernel.org>; Mon,  2 Sep 2019 14:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F93921744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4n6l-0002tM-2x; Mon, 02 Sep 2019 14:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4n6j-0002tG-7Q
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 14:15:01 +0000
X-Inumbo-ID: 0c64d8da-cd8c-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c64d8da-cd8c-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 14:15:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7528BACE3;
 Mon,  2 Sep 2019 14:14:59 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190902113034.97934-1-roger.pau@citrix.com>
 <e4afc421-17ef-32a7-21f4-3ecb65ebb44a@suse.com>
 <20190902135813.tz64qcg5rxujis6j@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <386cdf66-f53a-555e-6fb9-1c60681ce082@suse.com>
Date: Mon, 2 Sep 2019 16:15:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902135813.tz64qcg5rxujis6j@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vpci: don't allow access to devices not
 assigned to the domain
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNTo1OCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gTW9uLCBT
ZXAgMDIsIDIwMTkgYXQgMDE6NTg6MDdQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDAyLjA5LjIwMTkgMTM6MzAsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IERvbid0IGFsbG93
IHRoZSBoYXJkd2FyZSBkb21haW4gdG8gYWNjZXNzIHRoZSBQQ0kgY29uZmlnIHNwYWNlIG9mCj4+
PiBkZXZpY2VzIG5vdCBhc3NpZ25lZCB0byBpdC4gSWU6IHRoZSBjb25maWcgc3BhY2Ugb2YgaW9t
bXUgZGV2aWNlcwo+Pj4gaW4gdXNlIGJ5IFhlbiBzaG91bGQgbm90IGJlIGFjY2Vzc2libGUgdG8g
dGhlIGhhcmR3YXJlIGRvbWFpbi4KPj4KPj4gV2VsbCwgSSBhZ3JlZSB3aXRoIHdoYXQgeW91IHNh
eSBhYm92ZSwgYnV0IHRoZSBjb2RlIGNoYW5nZSBkaXNhbGxvd3MKPj4gbXVjaCBtb3JlIHRoYW4g
dGhpcy4gSW4gcGFydGljdWxhciBEb20wIChhbmQgbWF5YmUgc3R1YiBkb21haW5zIHRvbykKPj4g
bmVlZCB0byBiZSBhYmxlIHRvIGFjY2VzcyB0aGUgY29uZmlnIHNwYWNlIG9mIGRldmljZXMgYXNz
aWduZWQgdG8KPj4gZ3Vlc3RzLCBlLmcuIGZvciBxZW11IHRvIGNvbnRyb2wgTVNJIGFuZC9vciBN
U0ktWC4KPiAKPiBSaWdodCwgSSB3YXMgb3Zlcmxvb2tpbmcgdGhlIGZhY3QgdGhhdCBhIGRvbWFp
biB1c2luZyB2UENJIGl0c2VsZgo+IHNob3VsZCBiZSBhYmxlIHRvIGhhbmRsZSBwYXNzdGhyb3Vn
aCBiYWNrZW5kcyBmb3Igb3RoZXIgZG9tYWlucy4KPiAKPiBJIHRoaW5rIHRoZSBjb25kaXRpb24g
c2hvdWxkIGluc3RlYWQgY2hlY2sgaWYgdGhlIGRldmljZSBpcyBhc3NpZ25lZAo+IHRvIGRvbV94
ZW4sIGFuZCBkb24ndCBhbGxvdyBkb21haW5zIGFjY2VzcyB0byBkZXZpY2VzIGFzc2lnbmVkIHRv
Cj4gZG9tX3hlbi4KCkV2ZW4gdGhhdCBnb2VzIHRvbyBmYXIgaW1vOiBXZSBkZWxpYmVyYXRlbHkg
YWxsb3cgcmVhZCBhY2Nlc3MgdG8Kci9vIGRldmljZXMsIGluIG9yZGVyIHRvIGF2b2lkIGFub21h
bGllcyBpbiBidXMgZW51bWVyYXRpb24gaW4KRG9tMC4gQW5kIEknZCB2ZXJ5IG11Y2ggaG9wZSB3
cml0ZSBhdHRlbXB0cyBhbHJlYWR5IGhvbm9yIHRoZQpwc2VnLT5yb19tYXAgYml0IGZvciBhIGRl
dmljZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
