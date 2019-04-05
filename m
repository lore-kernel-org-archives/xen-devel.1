Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D18C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 07:36:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 025C4217D7
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 07:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 025C4217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCJOZ-0004bS-4c; Fri, 05 Apr 2019 07:36:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCJOX-0004bN-44
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 07:36:13 +0000
X-Inumbo-ID: 7a2a4e5a-5775-11e9-8654-db0cb36a98ba
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a2a4e5a-5775-11e9-8654-db0cb36a98ba;
 Fri, 05 Apr 2019 07:36:09 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 01:36:07 -0600
Message-Id: <5CA705680200007800224C5D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 01:36:08 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <20190403142620.1224-1-aisaila@bitdefender.com>
 <5CA4C9F9020000780022450F@prv1-mh.provo.novell.com>
 <aa35ec83-77d2-ffc3-c82a-96c666f97227@bitdefender.com>
 <5CA4D1880200007800224564@prv1-mh.provo.novell.com>
 <0c0c0933-bf70-ac3d-57c8-68c14827bcae@bitdefender.com>
 <7f9d8083-f115-dbb3-676d-547af38eda1c@bitdefender.com>
 <CABfawhnpk8iX=o8cHePOE8DAL+8s85S41DvSXL=DQ=gkc_8ZcA@mail.gmail.com>
 <5CA6166D0200007800224A0B@prv1-mh.provo.novell.com>
 <44BAFC90-7662-4A5C-B781-229712663926@citrix.com>
In-Reply-To: <44BAFC90-7662-4A5C-B781-229712663926@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v1] Fix p2m_set_suppress_ve
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, aisaila@bitdefender.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405073608.59DRJetuCAstna99sAp_99cyzwnU1TlKU7dUAE9TWIg@z>

Pj4+IE9uIDA0LjA0LjE5IGF0IDE2OjU0LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPj4gT24gQXByIDQsIDIwMTksIGF0IDM6MzYgUE0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDA0LjA0LjE5IGF0IDE1OjA5LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4+PiBJIGFncmVlIHRoYXQgaXQgaXMgY29uZnVzaW5nLiBJdCB3b3Vs
ZCBiZSBmaW5lIHRvIFVOU0hBUkUgaGVyZSBhcyB3ZWxsCj4+PiB0byBrZWVwIHRoaW5ncyBjb25z
aXN0ZW50IGJ1dCBvdGhlcndpc2UgaXQncyBub3QgcmVhbGx5IGFuIGlzc3VlIGFzCj4+PiB0aGUg
ZW50cnkgdHlwZSBpcyBjaGVja2VkIGxhdGVyIHRvIGVuc3VyZSB0aGF0IHRoaXMgaXMgYSBwMm1f
cmFtX3J3Cj4+PiBlbnRyeS4gV2UgYXJlIHNpbXBseSB0cnlpbmcgdG8ga2VlcCBtZW1fc2hhcmlu
ZyBhbmQgX21vZGlmaWVkXyBhbHRwMm0KPj4+IGVudHJpZXMgZXhjbHVzaXZlLiBTbyBpdCBpcyBm
aW5lIHRvIGhhdmUgbWVtX3NoYXJlZCBlbnRyaWVzIGluIHRoZQo+Pj4gaG9zdHAybSBhbmQgaGF2
ZSB0aG9zZSBlbnRyaWVzIGJlIGNvcGllZCBpbnRvIGFsdHAybSB0YWJsZXMgbGF6aWx5LAo+Pj4g
YnV0IGZvciBhbHRwMm0gZW50cmllcyB0aGF0IGhhdmUgY2hhbmdlZCBtZW1fYWNjZXNzIHBlcm1p
c3Npb25zIG9yIGFyZQo+Pj4gcmVtYXBwZWQgd2Ugd2FudCB0aGUgZW50cmllcyBpbiB0aGUgaG9z
dHAybSB0byBiZSBvZiByZWd1bGFyIHR5cGUuCj4+PiBUaGlzIGlzIG5vdCBuZWNlc3NhcmlseSBh
IHRlY2huaWNhbCByZXF1aXJlbWVudCwgaXQncyBtb3N0bHkganVzdCB0bwo+Pj4gcmVkdWNlIGNv
bXBsZXhpdHkuIFNvIGl0IHdvdWxkIGJlIGZpbmUgdG8gYWRkIFVOU0hBUkUgaGVyZSBhcyB3ZWxs
LCBJCj4+PiBndWVzcyB0aGUgb25seSByZWFzb24gd2h5IEkgaGF2ZW4ndCBkb25lIHRoYXQgaXMg
YmVjYXVzZSBJIGFscmVhZHkKPj4+IHRyaWdnZXIgdGhlIHVuc2hhcmUgYW5kIGNvcHktdG8tYWx0
cDJtIGJlZm9yZSByZW1hcHBpbmcgYnkgc2V0dGluZwo+Pj4gZHVtbXkgbWVtX2FjY2VzcyBwZXJt
aXNzaW9uIG9uIHRoZSBlbnRyaWVzLgo+PiAKPj4gSSdtIGFmcmFpZCBJIGRvbid0IGFncmVlIHdp
dGggdGhpcyBqdXN0aWZpY2F0aW9uOiBtZW0tc2hhcmluZyBpcyBhYm91dAo+PiBjb250ZW50cyBv
ZiBwYWdlcywgd2hlcmVhcyBhbHRwMm0gaXMgYWJvdXQgbWV0YSBkYXRhIChwZXJtaXNzaW9ucwo+
PiBldGMpLiBJIGRvbid0IHNlZSB3aHkgb25lIHdvdWxkIHdhbnQgdG8gdW5zaGFyZSBiZWNhdXNl
IG9mIGEgbWV0YQo+PiBkYXRhIGFkanVzdG1lbnQgb3RoZXIgdGhhbiBhIHBhZ2UgYmVjb21pbmcg
bm9uLUNvVy13cml0YWJsZS4KPj4gRWFnZXJseSB1bi1zaGFyaW5nIGluIHRoZSBlbmQgdW5kZXJt
aW5lcyB0aGUgaW50ZW50aW9ucyBvZiBzaGFyaW5nLgo+IAo+IFJlbWVtYmVyIGFsc28gdGhhdCBh
bHRwMm1zIGFsbG93IHNvbWVvbmUgdG8gc2V0IG5vdCBqdXN0IGFsdGVybmF0ZSB2aWV3cyAKPiB3
aXRoIGRpZmZlcmVudCBwZXJtaXNzaW9ucywgYnV0IGFsc28gYWx0ZXJuYXRlIHZpZXdzIHdpdGgg
ZGlmZmVyZW50IGJhY2tpbmcgCj4gbWZucy4gIENvbWJpbmluZyBzaGFyZWQgbWZucyB3aXRoIGFs
dGVybmF0ZSB2aWV3cyB3aXRoIGRpZmZlcmVudCBtZm5zIG9uIHRoZSAKPiBzYW1lIGdmbiBtZWFu
cyB0aGF0IHlvdSBoYXZlIHRvIGJlIHZlcnkgY2FyZWZ1bCBub3QgdG8gZW5kIHVwIGdpdmluZyB3
cml0ZSAKPiBwZXJtaXNzaW9uIHRvIHRoZSBzaGFyZWQgcGFnZSwgd2hpY2ggd291bGQgYmUgYSBz
ZWN1cml0eSBpc3N1ZS4gIFVuc2hhcmluZyAKPiB3aGVuIGNyZWF0aW5nIGFuIGFsdHAybSBlbnRy
eSBtZWFucyB0aGF0IGFueSBnaXZlbiBnZm4gaXMgKmVpdGhlciogc2hhcmVkIAo+ICpvciogZHVw
bGljYXRlZCBhY3Jvc3MgYWx0cDJtcywgYnV0IG5vdCBib3RoOyB0aGlzIHNpbXBsaWZpZXMgdGhl
IHJlYXNvbmluZy4KCkhtbSwgeWVzLCBJIGNhbiBzZWUgaG93IHRoaXMgZ2V0cyBjb21wbGljYXRl
ZC4gQnV0IGlzIHRoaXMgYmVoYXZpb3IKc3ltbWV0cmljPyBJLmUuIHdpbGwgYXR0ZW1wdHMgdG8g
c2hhcmUgYSBHRk4gZmFpbCB3aGVuIGl0IGhhcyBhIG5vbi0KZGVmYXVsdCBzZXR0aW5nIGluIG9u
ZSBvZiB0aGUgYWx0ZXJuYXRlIHZpZXdzPyBMb29raW5nIGF0IHRoZSBjb2RlIEkKY2FuJ3Qgc2Vl
bSB0byByZWNvZ25pemUgc3VjaCBiZWhhdmlvci4KCkZ1cnRoZXJtb3JlIEknbSBwdXp6bGVkIGJ5
IHAybV9hbHRwMm1fcHJvcGFnYXRlX2NoYW5nZSgpCmFwcGFyZW50bHkgYmxpbmRseSBvdmVyd3Jp
dGluZyAoYWxtb3N0KSBldmVyeXRoaW5nLiBJcyBpdCByZWFsbHkKaW50ZW5kZWQgaW4gYWxtb3N0
IGNhc2VzICh0aGVyZSBsb29rcyB0byBiZSBhbiBleGNlcHRpb24gd2hlbgp0aGUgb2xkIGVudHJ5
IGhvbGRzIElOVkFMSURfTUZOOyBJIHdvbmRlciB0aG91Z2ggd2hldGhlciBpdHMKY29uZGl0aW9u
IGlzbid0IGludmVydGVkKSB0byBkaXNjYXJkIHNwZWNpYWwgYWNjZXNzIGFuZC9vciBNRk5zIGlu
CmFsdGVybmF0ZSB2aWV3cyB3aGVuIHRoZSBob3N0IHAybSdzIHJlc3BlY3RpdmUgc2xvdCBjaGFu
Z2VzPwoKTG9va2luZyBhdCB0aGUgZnVuY3Rpb24gSSBhbHNvIHdvbmRlciB3aGV0aGVyIGl0IGRv
ZXNuJ3QKcG9pbnRsZXNzbHkgY2FsbCBwMm1fcmVzZXRfYWx0cDJtKCkgd2hlbiBvbGQgYW5kIG5l
dyBlbnRyeQpib3RoIGhvbGQgSU5WQUxJRF9NRk4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
