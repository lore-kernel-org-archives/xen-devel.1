Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D356C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 14:42:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4676420825
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 14:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4676420825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG2nz-000791-R6; Mon, 15 Apr 2019 14:41:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K9O8=SR=citrix.com=prvs=0011d4d25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hG2nx-00078r-TB
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 14:41:53 +0000
X-Inumbo-ID: 9b200302-5f8c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9b200302-5f8c-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 14:41:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,354,1549929600"; d="scan'208";a="83587689"
Date: Mon, 15 Apr 2019 15:40:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20190415144043.GD1354@perard.uk.xensource.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-26-anthony.perard@citrix.com>
 <318fa5c9-c86c-166a-ffa8-0b2219c3de2a@redhat.com>
 <938e1eb0-dfbb-e47e-e2c1-a91fa092a6ef@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <938e1eb0-dfbb-e47e-e2c1-a91fa092a6ef@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v2 25/31]
 OvmfPkg/PlatformBootManagerLib: Handle the absence of PCI bus on Xen PVH
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415144043.WIOf15_-q66MKa7S1EdiYRT8Abp-fWCOfRxs7yjltxU@z>

T24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgMDM6NDk6MjVQTSArMDIwMCwgTGFzemxvIEVyc2VrIHdy
b3RlOgo+IE9uIDA0LzE1LzE5IDE1OjMzLCBMYXN6bG8gRXJzZWsgd3JvdGU6Cj4gPiBPbiAwNC8w
OS8xOSAxMzowOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPj4gZGlmZiAtLWdpdCBhL092bWZQ
a2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMgYi9Pdm1mUGtn
L0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jCj4gPj4gaW5kZXgg
MTIzMDNmYjBmMS4uMWE2ZDQ3NzMyZSAxMDA2NDQKPiA+PiAtLS0gYS9Pdm1mUGtnL0xpYnJhcnkv
UGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jCj4gPj4gKysrIGIvT3ZtZlBrZy9M
aWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZvcm0uYwo+ID4+IEBAIC0xMjEz
LDYgKzEyMTMsMTEgQEAgUGNpQWNwaUluaXRpYWxpemF0aW9uICgKPiA+PiAgICAgICAgUGNpV3Jp
dGU4IChQQ0lfTElCX0FERFJFU1MgKDAsIDB4MWYsIDAsIDB4NmEpLCAweDBiKTsgLy8gRwo+ID4+
ICAgICAgICBQY2lXcml0ZTggKFBDSV9MSUJfQUREUkVTUyAoMCwgMHgxZiwgMCwgMHg2YiksIDB4
MGIpOyAvLyBICj4gPj4gICAgICAgIGJyZWFrOwo+ID4+ICsgICAgY2FzZSBYRU5fUFZIX1BDSV9I
T1NUX0JSSURHRV9ERVZJQ0VfSUQ6Cj4gKFNpZ2guIEkgaGF2ZSB0byBhcG9sb2dpemUgZm9yIG15
IGNvbW1lbnRzIHRoYXQgbWlnaHQgbG9vayAicnVzaGVkIi4gVGhlCj4gZmFjdCBpcyB0aGF0LCBk
ZXNwaXRlIGl0IGJlaW5nIG9ubHkgTW9uZGF5LCBJJ20gYWxyZWFkeSBleGhhdXN0ZWQuIEl0J3MK
PiBNb25kYXkgKmFmdGVybm9vbiosIGFmdGVyIGFsbC4KPiAKPiBBICJub3JtYWwiIG1haW50YWlu
ZXIgaW4gbXkgcG9zaXRpb24gd291bGQgcHJvYmFibHkgbm90IGxvb2sgYXQgcGF0Y2hlcwo+IGZy
b20gdGhpcyBzZXJpZXMgZm9yIGRheXMgb24gZW5kLCBwb3NzaWJseSBmb3IgbXVsdGlwbGUgd2Vl
a3MgZXZlbi4gSSBvbgo+IHRoZSBvdGhlciBoYW5kIGludGVuZCB0byBtYWtlIGEgYml0IG9mIHBy
b2dyZXNzIGV2ZXJ5IGRheSBJIHBvc3NpYmx5Cj4gY2FuLiBUaGUgcmVzdWx0IGlzIHRoYXQgbXkg
Y29tbWVudHMgYXJlIG5vdCBhbHdheXMgMTAwJSBwb2xpc2hlZCB3aGVuIEkKPiBzZW5kIHRoZW0s
IGR1ZSB0byBmYXRpZ3VlLiBTb3JyeSBhYm91dCB0aGF0LikKCk5vIHdvcnJpZXMsIHRha2UgeW91
ciB0aW1lLiBBbmQgdGhhbmtzIGZvciB5b3UgZGV0YWlscyByZXZpZXdzLgoKPiBTbywgbXkgdGhv
dWdodCBvbiB0aGlzIGlzIHRoYXQgWEVOX1BWSF9QQ0lfSE9TVF9CUklER0VfREVWSUNFX0lEIGlz
IHRvbwo+IGdlbmVyaWMgdG8gYWNjZXB0IGhlcmUuIEl0IHdpbGwgYWxpYXMgYXQgbGVhc3QgKnNv
bWUqIGZhaWx1cmVzIHRvIHJlYWQKPiB0aGUgdW5kZXJseWluZyBQQ0kgY29uZmlnIHNwYWNlIHJl
Z2lzdGVyLgo+IAo+IEluIFhlblBsYXRmb3JtUGVpICh2MiAyNC8zMSksIHRoYXQncyBub3QgYW4g
aXNzdWUsIGZvciB0d28gcmVhc29uczoKPiAKPiAtIHRoZXJlIGlzIGEgc3BlY2lmaWMsIGFkZGl0
aW9uYWwsIFhlblB2aERldGVjdGVkKCkgY2hlY2ssCj4gLSBldmVuIGlmIHRoZXJlIHdhcyBhbiBp
c3N1ZSB3aXRoIHRoZSBsb2dpYywgaXQnZCBvbmx5IGFmZmVjdAo+IFhlblBsYXRmb3JtUGVpOyBp
LmUuIHRoZSBPdm1mWGVuIHBsYXRmb3JtLgo+IAo+ICgyKSBDYW4geW91Cj4gCj4gLSBpbnRyb2R1
Y2UgWEVOX1BWSF9QQ0lfSE9TVF9CUklER0VfREVWSUNFX0lEIHdpdGggYSB2YWx1ZSBkaWZmZXJl
bnQKPiAgIGZyb20gMHhGRkZGIHBlcmhhcHM/Cj4gCj4gLSBvciBrZWVwIGl0IGFzIDB4RkZGRiwg
YnV0IHJlbHkgb24gUGNkUGNpRGlzYWJsZUJ1c0VudW1lcmF0aW9uLCBhcyBhCj4gICBmdXJ0aGVy
IHJlc3RyaWN0aW9uPwo+IAo+ICAgKEkgdW5kZXJzdGFuZCB0aGF0IGV4cG9zaW5nIFhlblB2aERl
dGVjdGVkKCkgdG8gUGxhdGZvcm1Cb290TWFuYWdlckxpYgo+ICAgd291bGQgcmVxdWlyZSBtb3Jl
IFBWSCBlbmxpZ2h0ZW5tZW50IGluICJjb21tb24iIGNvZGUsIGFuZCwgaW5kZWVkLCBJCj4gICBk
b24ndCBkZXNpcmUgdGhhdCAtLSB0aGF0J3Mgd2h5IEknbSBzdWdnZXN0aW5nCj4gICBQY2RQY2lE
aXNhYmxlQnVzRW51bWVyYXRpb24pCgpTbywgUGxhdGZvcm1Cb290TWFuYWdlckxpYiBhbHJlYWR5
IGhhcyBhIFhlbkRldGVjdGVkKCkgZnVuY3Rpb24sIHNvCkkgY291bGQgdXNlIHRoYXQgZnVuY3Rp
b24uCgpJIHRoaW5rIHdlIGNvdWxkIHN0b3AgdXNpbmcgWEVOX1BWSF9QQ0lfSE9TVF9CUklER0Vf
REVWSUNFX0lEIChiZWNhdXNlIEkKZG9uJ3Qga25vdyB3aGF0IHZhbHVlIEkgY291bGQgdXNlKSBh
bmQgbm90IHNldApgUGNkT3ZtZkhvc3RCcmlkZ2VQY2lEZXZJZCcgYXQgYWxsLCBpdCB3b3VsZCBk
ZWZhdWx0IHRvIDB4MC4KClRoZW4sIGluIFBsYXRmb3JtQm9vdE1hbmFnZXJMaWIsIHNpbXBseSBp
Z25vcmUgdGhlIGVycm9yIHdoZW4KbUhvc3RCcmlkZ2VEZXZJZCAob3IgUGNkT3ZtZkhvc3RCcmlk
Z2VQY2lEZXZJZCkgaXNuJ3QgcmVjb2duaXNlIGFuZCB3aGVuClhlbkRldGVjdGVkKCkgaXMgdHJ1
ZS4KCldvdWxkIHRoYXQgYmUgZmluZT8KClRoZSBwYXRjaCB3b3VsZCBsb29rIHNvbWV0aGluZyBs
aWtlIHRoaXM6CgpAQCAtMTIyMiw2ICsxMjIyLDEyIEBAIFBjaUFjcGlJbml0aWFsaXphdGlvbiAo
CiAgICAgICBQY2lXcml0ZTggKFBDSV9MSUJfQUREUkVTUyAoMCwgMHgxZiwgMCwgMHg2YiksIDB4
MGIpOyAvLyBICiAgICAgICBicmVhazsKICAgICBkZWZhdWx0OgorICAgICAgaWYgKFhlbkRldGVj
dGVkICgpKSB7CisgICAgICAgIC8vCisgICAgICAgIC8vIFRoZXJlIGlzIG5vIFBDSSBidXMgaW4g
dGhpcyBjYXNlLgorICAgICAgICAvLworICAgICAgICByZXR1cm47CisgICAgICB9CiAgICAgICBE
RUJVRyAoKEVGSV9EX0VSUk9SLCAiJWE6IFVua25vd24gSG9zdCBCcmlkZ2UgRGV2aWNlIElEOiAw
eCUwNHhcbiIsCgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
