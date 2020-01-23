Return-Path: <SRS0=7Ixj=3M=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDF4C2D0DB
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jan 2020 16:37:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BBA6214AF
	for <xen-devel@archiver.kernel.org>; Thu, 23 Jan 2020 16:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BBA6214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iufTc-0008EY-Ux; Thu, 23 Jan 2020 16:37:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iufTb-0008ET-8L
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 16:37:03 +0000
X-Inumbo-ID: 9019e3d6-3dfe-11ea-8e9a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9019e3d6-3dfe-11ea-8e9a-bc764e2007e4;
 Thu, 23 Jan 2020 16:36:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 14C1CAD78;
 Thu, 23 Jan 2020 16:36:53 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <59bdc31b9fcffc92c5a8817aeba8eaa2de75a43c.1579628566.git.tamas.lengyel@intel.com>
 <f95e2a51-b866-dc6e-aa10-d81a3f5fd2c3@citrix.com>
 <CABfawhmFrebRs47jQQ_8r2aMsjyWDZH=DLnVuniD3sporPN=rQ@mail.gmail.com>
 <45e5cb4e-9c82-4085-8909-eddfe20124f1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e2b8d8b-ef88-1a13-15a4-42e2a4a649b3@suse.com>
Date: Thu, 23 Jan 2020 17:37:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <45e5cb4e-9c82-4085-8909-eddfe20124f1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 10/18] x86/mem_sharing: Convert
 MEM_SHARING_DESTROY_GFN to a bool
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxNzozMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxLzIzLzIwIDQ6
MjMgUE0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4gT24gVGh1LCBKYW4gMjMsIDIwMjAgYXQg
OToxNCBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+
Pj4KPj4+IE9uIDEvMjEvMjAgNTo0OSBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4+IE1F
TV9TSEFSSU5HX0RFU1RST1lfR0ZOIGlzIHVzZWQgb24gdGhlICdmbGFncycgYml0ZmllbGQgZHVy
aW5nIHVuc2hhcmluZy4KPj4+PiBIb3dldmVyLCB0aGUgYml0ZmllbGQgaXMgbm90IHVzZWQgZm9y
IGFueXRoaW5nIGVsc2UsIHNvIGp1c3QgY29udmVydCBpdCB0byBhCj4+Pj4gYm9vbCBpbnN0ZWFk
Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVs
QGludGVsLmNvbT4KPj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+Pj4KPj4+IEJ1dCBpcyB0aGVyZSBhIHBhcnRpY3VsYXIgYWR2YW50YWdlIHRvIGdldHRp
bmcgcmlkIG9mIHRoZSBiaXRmaWVsZD8KPj4+Cj4+PiBZb3UncmUgdGhlIG1haW50YWluZXIsIHNv
IGl0J3MgeW91ciBkZWNpc2lvbiBvZiBjb3Vyc2UuICBCdXQgaWYgaXQgd2VyZQo+Pj4gbWUgSSdk
IGxlYXZlIGl0IGFzIGEgYml0ZmllbGQgc28gdGhhdCBhbGwgdGhlIGJpdGZpZWxkIGNvZGUgaXMg
dGhlcmUgaWYKPj4+IGl0J3MgbmVlZGVkIGluIHRoZSBmdXR1cmUuICBGbGlwcGluZyBpdCB0byBh
IGJvb2wsIHdpdGggdGhlIHJpc2sgb2YKPj4+IGZsaXBwaW5nIGl0IGJhY2sgdG8gYSBiaXRmaWVs
ZCBsYXRlciwgc2VlbXMgbGlrZSBwb2ludGxlc3MgY2h1cm4gdG8gbWUuCj4+Pgo+Pj4gKEFsdGhv
dWdoIHBlcmhhcHMgdGhlIHJlYXNvbiB3aWxsIGJlY29tZSBldmlkZW50IGJ5IHRoZSB0aW1lIEkg
Z2V0IHRvCj4+PiB0aGUgZW5kIG9mIHRoZSBzZXJpZXMuKQo+Pgo+PiBQcm92aWRlZCBpdHMgYmVl
biBtYW55IHllYXJzIHNpbmNlIHRoaXMgY29kZSBoYXMgYmVlbiBhZGRlZCB3aXRoIG5vCj4+IG5l
ZWQgZm9yIGFueSBleHRyYSBiaXRzLCBhbmQgd2l0aCBubyBleHBlY3RhdGlvbnMgdGhhdCB0aGlz
IHdvdWxkCj4+IGNoYW5nZSBhbnkgdGltZSBzb29uLCBJIHdvdWxkbid0IHdvcnJ5IGFib3V0IHRo
YXQuIFRydWUsIHRoZXJlIGlzIHZlcnkKPj4gbGl0dGxlIGRpZmZlcmVuY2UgYmV0d2VlbiBrZWVw
aW5nIHRoZSBjb2RlIGFzLWlzIHZzIGNvbnZlcnRpbmcgaXQgdG8KPj4gYm9vbCwgYnV0IElNSE8g
aXQgbWFrZXMgdGhlIGNvZGUgZWFzaWVyIHRvIGZvbGxvdyB3aXRob3V0IHlvdQo+PiB3b25kZXJp
bmcgd2hhdCBtaWdodCBiZSB0aG9zZSBub24tZXhpc3RlbnQgc2l0dWF0aW9ucyB0aGF0IHdhcnJh
bnRlZAo+PiBpdCB0byBiZSBhIGJpdG1hcCB0byBiZWdpbiB3aXRoLgo+IAo+IEl0J3MgZGVmaW5p
dGVseSBhIGp1ZGdlbWVudCBjYWxsLCBhbmQgSSBjYW4gc2VlIHdoZXJlIHlvdSdyZSBjb21pbmcK
PiBmcm9tLiAgTGlrZSBJIHNhaWQsIGlmIGl0IHdlcmUgbWUgSSdkIGxlYXZlIGl0LCBidXQgaXQn
cyBub3QuIDotKSAgIEp1c3QKPiB3YW50ZWQgdG8gcmFpc2UgdGhlIGlzc3VlIGFzIEkgd2FzIGdv
aW5nIHRocm91Z2guICBJJ2QgQWNrIGl0IGJ1dCB5b3UndmUKPiBhbHJlYWR5IGdvdCBhbiBSLWIu
CgpVbnRpbCB5b3VyIHByb3Bvc2FsIGdldHMgYWNjZXB0ZWQsIGlzbid0IGl0IHRoYXQgeW91ciBh
Y2sgaXMgbmVlZGVkCmRlc3BpdGUgdGhlIFItYj8gVGhpcyBpcyBhbHNvIHdoeSBlLmcuIGZvciBw
YXRjaCAyIEkgZGlkbid0IHNlZSBhCnBvaW50IGluIHNlbmRpbmcgYW55IFItYiwgYXMgdGhlIHBh
dGNoIHdpbGwgbmVlZCB5b3VyIGFjayBhbnl3YXksCmFuZCBpdCdzIHNvIHNpbXBsZSB0aGF0ICJy
ZXZpZXdlZCIgd291bGQgYmUgYW4gb3ZlcnN0YXRlbWVudC4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
