Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D482C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:59:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B158A20678
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B158A20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJdy0-0003rM-0P; Thu, 25 Apr 2019 12:59:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJdxy-0003rF-Ia
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:59:06 +0000
X-Inumbo-ID: e7a744fb-6759-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e7a744fb-6759-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 12:59:05 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 06:59:04 -0600
Message-Id: <5CC1AF130200007800229100@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 06:58:59 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Razvan Cojocaru" <rcojocaru@bitdefender.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <CAFLDOk8Egs_gJmx1Yg386eEkmq4gNcbBxVGkjC7Wofhz8zCe1w@mail.gmail.com>
 <1f659428-0dd1-5537-5007-e97ff16a7506@bitdefender.com>
 <CAFLDOk9j1FgXDG2N6rzi0ObO3eip2pxM59_aaTcBjg_F_63A0g@mail.gmail.com>
 <a08d4a56-1da6-b373-f847-3a37197ffb53@bitdefender.com>
 <5CC186320200007800228F32@prv1-mh.provo.novell.com>
 <5cfd3ea1-b25d-ec0b-1278-d4fdb28486be@bitdefender.com>
 <b91bc68b-85fc-a5b8-7b40-126a0c6e463f@citrix.com>
In-Reply-To: <b91bc68b-85fc-a5b8-7b40-126a0c6e463f@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Xen 4.11.1: guest uses altp2m to crash host
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
Message-ID: <20190425125859.QG9vHAFvangkA7ErZCJsg1w0eV764creFBk3L2Z8BRU@z>

Pj4+IE9uIDI1LjA0LjE5IGF0IDE0OjUzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjUvMDQvMjAxOSAxMzoxNywgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+PiBPbiA0
LzI1LzE5IDE6MDQgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTUuMDQuMTkgYXQg
MTY6MTAsIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4+PiBPbiA0LzE1LzE5
IDU6MDQgUE0sIE1hdHQgTGVpbmhvcyB3cm90ZToKPj4+Pj4gWW91IGFyZSBjb3JyZWN0IC0tIGNo
ZXJyeSBwaWNraW5nIHRoYXQgY29tbWl0IGludG8gUkVMRUFTRS00LjExLjEgCj4+Pj4+IGFkZHJl
c3NlcyB0aGUgY3Jhc2guIFRoZSBwcm9ibGVtIGNhbm5vdCBiZSByZXByb2R1Y2VkIG9uIDQuMTIu
Cj4+Pj4+Cj4+Pj4+IEkgaG9wZSB0aGlzIGhlbHBzLgo+Pj4+IFRoYW5rIHlvdSBmb3IgY29uZmly
bWluZyB0aGUgZml4IQo+Pj4+Cj4+Pj4gVG8gdGhlIGRlY2lkZXJzOiB3b3VsZCBpdCBiZSByZWFz
b25hYmxlIHRvIGFzayBwYXRjaGVzIGxpa2UgdGhpcyB0byBiZSAKPj4+PiBiYWNrcG9ydGVkIHRv
IHRoZSBmdXR1cmUgNC4xMSByZWxlYXNlPwo+Pj4gV2VsbCwgZmlyc3Qgb2YgYWxsIHlvdSBjYW4g
YWx3YXlzIHNlbmQgYSByZXF1ZXN0LiBBbmQgeWVzLCBpbiBnZW5lcmFsCj4+PiBJJ2QgY29uc2lk
ZXIgdGhpcyByZWFzb25hYmxlLCBidXQgSSBzYXkgc28gd2l0aG91dCBoYXZpbmcgbG9va2VkIGF0
Cj4+PiB0aGUgYWN0dWFsIGNvbW1pdChzKSBpbiBxdWVzdGlvbi4KPj4gVGhhbmsgeW91IGZvciB0
aGUgYW5zd2VyLiBUaGlzIGlzIHRoZSBjb21taXQgaW4gcXVlc3Rpb246Cj4+Cj4+IAo+IGh0dHA6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1jb21taXRkaWZmO2g9MWRkZGZm
ZjRjMzlkM2RiMTdkZmE3IAo+IDA5YjFjNTdmNDRlM2VkMzUyZTM7aHA9Njg0NjU5NDRjODFmYTJm
YmM0MGJmMjllYzYwODQwNzJhZjVlNDhlYwo+Pgo+PiBBRkFJQ1QgdGhlcmUncyBub3RoaW5nIGNv
bnRyb3ZlcnNpYWwgYWJvdXQgaXQsIGFuZCBpdCBzaG91bGQgZWFzaWx5Cj4+IGFwcGx5IHRvIDQu
MTEsIHNvIGlmIHBvc3NpYmxlIEkgcHJvcG9zZSB0aGF0IHdlIGNvbnNpZGVyIGJhY2twb3J0aW5n
IGl0Cj4+IHRvIHRoZSBuZXh0IDQuMTEgcmVsZWFzZS4KPiAKPiBJIGhhdmUgYSByYXRoZXIgbGFy
Z2UgbnVtYmVyIG9mIGFsdHAybSBiYWNrcG9ydHMgdG8gWGVuIDQuMTEgaW4gdGhlCj4gWGVuU2Vy
dmVyIHBhdGNocXVldWUsIHdoaWNoIGluIHByYWN0aWNlCgouLi4gPz8/Cgo+IEl0IHdvdWxkIGNl
cnRhaW5seSBtYWtlIG15IGxpZmUgZWFzaWVyIGlmIHRoZXkgd2VyZSB0byBnbyB1cHN0cmVhbS4g
IEkKPiBjYW4gcHV0IHRvZ2V0aGVyIGEgYnJhbmNoIGlmIHRoYXQgd291bGQgYmUgaGVscGZ1bC4K
CldoYXQgdm9sdW1lIC8gY291bnQgYXJlIHdlIHRhbGtpbmcgYWJvdXQ/IEFueXdheSwgaWYgaXQn
cyByZWFsbHkKbW9zdGx5IGFsdHAybSBjb2RlIHRoYXQgZ2V0cyB0b3VjaGVkLCBJIGRvbid0IG1p
bmQsIGFuZCBoYXZpbmcgYQpicmFuY2ggdG8gcHVsbCBmcm9tIHdvdWxkIGJlIGhlbHBmdWwuIDQu
MTEuMiBpcyBnb2luZyB0byBiZSBkZWxheWVkCmFueXdheSBhdCBsZWFzdCB1bnRpbCB0aGUgbWFz
dGVyIGJyYW5jaCBhZHZhbmNlcyBhZ2FpbiwgYXMgSSd2ZQptZWFud2hpbGUgcXVldWVkIHVwIHF1
aXRlIGEgZmV3IGJ1ZyBmaXhlcyB3aGljaCBhbGwgc2l0IGJlaGluZCB0aGUKcHVzaCBnYXRlIHRo
ZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
