Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B928C282DD
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 09:47:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D2520880
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 09:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D2520880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDQrr-0000qd-U5; Mon, 08 Apr 2019 09:47:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Brje=SK=citrix.com=prvs=9945fa68e=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hDQrr-0000qY-1b
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 09:47:07 +0000
X-Inumbo-ID: 446a5c19-59e3-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 446a5c19-59e3-11e9-92d7-bc764e045a96;
 Mon, 08 Apr 2019 09:47:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,324,1549929600"; d="scan'208";a="82984113"
To: Paul Durrant <Paul.Durrant@citrix.com>, Anthony Perard
 <anthony.perard@citrix.com>
References: <c8ed6851-70c1-500d-5d66-1e8a6b7133c5@steadfast.net>
 <20180103175759.GA1905@perard.uk.xensource.com>
 <3a19395e-c52f-bbfd-5986-ba56cc10c767@steadfast.net>
 <20180104125217.GB1905@perard.uk.xensource.com>
 <10c96acc-9bb5-713b-93c9-60f06c84bfd5@citrix.com>
 <20180125180439.GC2183@perard.uk.xensource.com>
 <2b101965-dfeb-61a2-ab15-8fb75330e536@citrix.com>
 <b96b8dcec4944918a41c60ab63bdf841@AMSPEX02CL03.citrite.net>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <eefdc065-6557-a5a7-e0c5-f941ce6a6911@citrix.com>
Date: Mon, 8 Apr 2019 10:46:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <b96b8dcec4944918a41c60ab63bdf841@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] PCI Device Subtree Change from Traditional to
 Upstream
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
Cc: Kevin Stange <kevin@steadfast.net>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408094657._554VAjBT7kCUthnewOmJVFXb-mMwxRAKTHYgaCbQcE@z>

T24gMS8yNi8xOCAxMDozOCBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNl
c0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmCj4+IE9mIEdlb3JnZSBEdW5sYXAKPj4g
U2VudDogMjUgSmFudWFyeSAyMDE4IDE4OjE1Cj4+IFRvOiBBbnRob255IFBlcmFyZCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KPj4gQ2M6IEtldmluIFN0YW5nZSA8a2V2aW5Ac3RlYWRmYXN0
Lm5ldD47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsKPj4gR2VvcmdlIER1bmxhcCA8
R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPgo+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gUENJ
IERldmljZSBTdWJ0cmVlIENoYW5nZSBmcm9tIFRyYWRpdGlvbmFsIHRvCj4+IFVwc3RyZWFtCj4+
Cj4+IE9uIDAxLzI1LzIwMTggMDY6MDQgUE0sIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gT24g
VGh1LCBKYW4gMjUsIDIwMTggYXQgMDU6NTQ6MzZQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3cm90
ZToKPj4+PiBPbiAwMS8wNC8yMDE4IDEyOjUyIFBNLCBBbnRob255IFBFUkFSRCB3cm90ZToKPj4+
Pj4gRnJvbTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4+Pj4+
IFN1YmplY3Q6IFtQQVRDSF0gbGlieGxfZG06IEV4cGxpY2l0bHkgcHV0IHhlbi1wbGF0Zm9ybSBk
ZXZpY2Ugb24gUENJIHNsb3QKPj4gMwo+Pj4+Pgo+Pj4+PiBJbiBvcmRlciB0byBkbyB0aGF0LCB3
ZSBkb24ndCB1c2UgeGVuZnYgbWFjaGluZSBhbnltb3JlIGFuZCBleHBsaWNpdHkKPj4+Pj4gYWRk
IHRoZSBwbGF0Zm9ybSBkZXZpY2Ugb24gdGhlIGNvbW1hbmQgbGluZS4KPj4+Pj4KPj4+Pj4gU2ln
bmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4+
Pj4KPj4+PiBBbnRob255LAo+Pj4+Cj4+Pj4gSXQgc2VlbXMgbGlrZSB3ZSBtaWdodCB3YW50IHRv
IGFkZCB0aGUgYWJpbGl0eSB0byBzcGVjaWZ5IHdoaWNoIHNsb3Qgd2UKPj4+PiB3YW50IHRoZSB4
ZW4tcGxhdGZvcm0gZGV2aWNlIHRvIG9jY3VweS4gSXMgaXQgd29ydGggdGhpbmtpbmcgb2YgdGhl
IGJlc3QKPj4+PiB3YXkgdG8gYWRkIGEgcGF0Y2ggbGlrZSB0aGlzIHVwc3RyZWFtPwo+Pj4KPj4+
IEkgdGhpbmsgdGhhdCB3b3VsZCBiZSBuaWNlIGZvciBwZW9wbGUgd2hvIHN3aXRjaCBmcm9tIHFl
bXUtdHJhZCB0bwo+Pj4gUUVNVS4gVGhlIG9ubHkgcXVlc3Rpb24gdGhhdCByZW1haW4gaXMsIGhv
dyB0byBuYW1lIHRoZSB4bCBjb25maWcKPj4+IG9wdGlvbj8gIFRoZSByZXN0IGlzIHRvIHNpbXBs
eSB0YWtlIG15IGxpYnhsIHBhdGNoIGFuZCBtYWtlIGl0IHVzZQo+Pj4gdGhlIG5ldyBjb25maWcg
b3B0aW9uLgo+Pgo+PiBXZWxsIHRoZSBvdGhlciBoYWxmIHdvdWxkIGJlIHRvIG1ha2Ugc3VyZSBz
b21ldGhpbmcgbGlrZSB0aGlzIGRvZXNuJ3QKPj4gaGFwcGVuIGJ5IGFjY2lkZW50IGluIHRoZSBm
dXR1cmUgLS0gaS5lLiwgdGhhdCBubyBmdXR1cmUgY2hhbmdlcyBpbiBRRU1VCj4+IHdpbGwgYWNj
aWRlbnRhbGx5IG1vdmUgaXQgYXdheSBmcm9tIHdoYXRldmVyIHRoZSBjdXJyZW50IHNsb3QgaXMg
bm93Lgo+Pgo+IAo+IElNTywgaXQgd291bGQgYmUgYmVzdCBpZiBsaWJ4bCBzcGVjaWZpZWQgdGhl
IGJ1cyB0b3BvbG9neSBleGFjdGx5IChpLmUuIHNwZWNpZmllZCBkZXZmbiBmb3IgZXZlcnl0aGlu
ZyB0aGF0IGFwcGVhcnMgb24gdGhlIGJ1cykuIElmIHdlLCBhcyBJIGhvcGUsIG1ha2UgYSBtb3Zl
IHRvIGhhdmluZyBYZW4gcmF0aGVyIHRoYW4gUUVNVSBvd24gdGhlIHRvcG9sb2d5IHRoZW4gdGhp
cyBzaG91bGQgaG9wZWZ1bGx5IGVuc3VyZSBhdCBsZWFzdCBzb21lIGRlZ3JlZSBvZiBmb3J3YXJk
IGNvbXBhdGliaWxpdHkuCgpJcyB0aGlzIG9uIGFueWJvZHkncyByYWRhcj8gIEl0IHNlZW1zIGxp
a2UgdGhpcyB3b3VsZG4ndCBiZSBhIGh1Z2UKYW1vdW50IG9mIHdvcmssIGFuZCBpdCB3b3VsZCBw
cmV2ZW50IHRoaXMgc29ydCBvZiBjb21wYXRpYmlsaXR5IGlzc3VlIGluCnRoZSBmdXR1cmUuCgog
LUdlb3JnZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
