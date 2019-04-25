Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9A6C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 19:35:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911CE20717
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 19:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911CE20717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJk9C-0005iE-Ml; Thu, 25 Apr 2019 19:35:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PBl1=S3=citrix.com=prvs=0115b8627=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hJk9B-0005i9-EZ
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 19:35:05 +0000
X-Inumbo-ID: 36e65234-6791-11e9-95b0-3fb3a33dda24
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36e65234-6791-11e9-95b0-3fb3a33dda24;
 Thu, 25 Apr 2019 19:35:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="89306852"
To: Mathieu Tarral <mathieu.tarral@protonmail.com>
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <a04c5946-8c2a-72bd-0011-3cb53fd927be@citrix.com>
 <JtM5mkq2NGVy1FZByrNH__YS8zpSo5mWd7ksop9Ns7mUipPKalor78NIFupEwb6a_vjRT5QxTSepTr_o3wqnPuNXL9BLZn5-EXCJ8pezVIQ=@protonmail.com>
 <83a9334a-3ef8-66b4-c197-724821a6be1a@citrix.com>
 <Gch727H7qupGUcfJT57AA7aqd6Mf5pLorJMsEceLbMt_iBEYztzTQZs1O7y1pOhnBlymAus25C69RoY9lpQACkfcHu9c14cbcp661Ba7rkU=@protonmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <328e2d6d-57da-cb40-3aba-35b10ab37dbf@citrix.com>
Date: Thu, 25 Apr 2019 20:34:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <Gch727H7qupGUcfJT57AA7aqd6Mf5pLorJMsEceLbMt_iBEYztzTQZs1O7y1pOhnBlymAus25C69RoY9lpQACkfcHu9c14cbcp661Ba7rkU=@protonmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425193459.14pPHnGqv1PR5wH3exOsm4Wl3Xs_hGb8Qg2fw3hneeA@z>

T24gMjUvMDQvMjAxOSAwMDo0MywgTWF0aGlldSBUYXJyYWwgd3JvdGU6Cj4gT24gV2VkbmVzZGF5
IDI0IEFwcmlsIDIwMTkgMTQ6MDAsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+IHdyb3RlOgo+Cj4+IE9uIDIzLzA0LzIwMTkgMjI6NTksIE1hdGhpZXUgVGFycmFsIHdy
b3RlOgo+Pgo+Pj4+PiBUaGUgZnVubnkgdGhpbmcgaXMgdGhhdCBpdCdzIGFsd2F5cyBhdCB0aGUg
c2FtZSBpbnN0cnVjdGlvbiB0aGF0IGl0IGZhaWxzLCB0aGUgMTA2dGggc2luZ2xlc3RlcCwKPj4+
Pj4gYXQgMHg4MDZkMzJkYzoKPj4+Pj4gWzB4N2M5MGU1MTRdPiBzIDB4ODA2ZDMyZGMKPj4+Pj4g
WzB4ODA2ZDMyZGNdPiBwZCAxMAo+Pj4+PiAweDgwNmQzMmRjIDg5MGQ4MDAwZmVmZiBtb3YgZHdv
cmQgWzB4ZmZmZTAwODBdLCBlY3gKPj4+Pj4gVGhpcyBpcyBhIHJlYWQgb2YgdGhlIEFQSUMgVFBS
LCB3aGljaCBpcyB2ZXJ5IGNvbW1vbmx5IGFuIG9wZXJhdGlvbgo+Pj4+PiBhY2NlbGVyYXRlZCBi
eSBoYXJkd2FyZSAoYmVjYXVzZSB3aXRob3V0IGl0LCB2aXJ0dWFsaXNpbmcgd2luZG93cyBYUCBp
cwo+Pj4+PiBleGNlZWRpbmdseSBzbG93KS4KPj4+PiBXaGF0IGlzIHlvdXIgQ1BVLCBhbmQgaG93
IGV4YWN0bHkgYXJlIHlvdSB0cnlpbmcgdG8gc2luZ2xlc3RlcC7CoCBJcyBpdAo+Pj4+IHdpdGgg
TVRGLCBvciB1c2luZyB0aGUgdHJhcCBmbGFnIGluc2lkZSB0aGUgZ3Vlc3Q/Cj4+Pj4gTXkgQ1BV
IGlzIGFuIEludGVsIGk3LTg3NTBILgo+Pj4+IEknbSB1c2luZyB0aGUgbGlidm1pIEFQSSwgd2hp
Y2ggaXMgZW5hYmxpbmcgdGhlIE1URiBmbGFnIHRvIHNpbmdsZXN0ZXAsIGlmIGkganVkZ2UgYnkg
dGhlIGRlYnVnIGxvZ3MuCj4+IE9rIC0gdGhhdCBpcyBhIENvZmZlZUxha2UuCj4+Cj4+IEkndmUg
aGFkIGEgcXVpY2sgcGxheSB3aXRoIGEgc2ltcGxlIGV4YW1wbGUgKFhURiB0ZXN0IGFuZCB4ZW4t
YWNjZXNzKQo+PiBhbmQgTVRGIGRvZXMgYXBwZWFyIHRvIHdvcmsgZmluZSB3aXRoIGJvdGggVFBS
IHNoYWRvd2luZyBhbmQgZnVsbCBBUElDCj4+IHZpcnR1YWxpc2F0aW9uLsKgIEkndmUgdHJpZWQg
b24gSGFzd2VsbCwgS2FieUxha2UgYW5kIENvZmZlZUxha2UuCj4gVGhhbmsgeW91IGZvciB0ZXN0
aW5nLgo+Cj4+IENhbiB5b3UgZGVzY3JpYmUgdGhlIGV4YWN0IFZNSSBjb25maWd1cmF0aW9uIHlv
dSd2ZSBnb3QgZW5hYmxlZCAtCj4+IHNwZWNpZmljYWxseSB3aGljaCBvdGhlciBpbnRlcmNlcHRz
IGFyZSBhY3RpdmU/Cj4gTXkgQnJlYWtwb2ludE1hbmFnZXIgY2xhc3MgaXMgZGVhbGluZyB3aXRo
IFZNSSBldmVudHMuCj4gSXQgcmVnaXN0ZXJzIDMgZXZlbnRzOgo+IC0gaW50Mwo+IC0gZGVidWcg
ZXZlbnQgKGZvciBoYXJkd2FyZSBicmVha3BvaW50cykKPiAtIHNpbmdsZXN0ZXAgZXZlbnQgKGZv
ciBicmVha3BvaW50IHJlY29pbCBvbiBpbnQzKQo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL1dlbnpl
bC9weXZtaWRiZy9ibG9iLzFhMmU5N2MyMzhhOTZjOThjMTljZGJiZGVmYTYwNDdiZTI0NmU1MDQv
dm1pZGJnL2JyZWFrcG9pbnQucHkjTDIwCgpXaGF0IGFib3V0IGNvbnRyb2wgcmVnaXN0ZXIgaW50
ZXJjZXB0cywgb3IgbWVtb3J5IHBlcm1pc3Npb24gcmVzdHJpY3Rpb25zPwoKSSBleHBlY3QgdGhp
bmdzIGFyZSBnb2luZyB3cm9uZyB3aGVuIHRoZSBUUFIgYWNjZXNzIGlzIGVtdWxhdGVkIGJ5IFhl
biwKcmF0aGVyIHRoYW4gY29tcGxldGVkIGRpcmVjdGx5IGJ5IGhhcmR3YXJlLCBidXQgSSBjYW4n
dCBleHBsYWluIGhvdwp5b3UnZCBiZSBnZXR0aW5nIGludG8gdGhhdCBzaXR1YXRpb24gd2l0aG91
dCBzb21lIG90aGVyIFZNSSBzZXR0aW5ncwpiZWluZyBhY3RpdmUgYXQgdGhlIHNhbWUgdGltZS4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
