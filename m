Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB6CC10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 11:27:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0F1F2084D
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 11:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0F1F2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEuKr-0005r8-Rd; Fri, 12 Apr 2019 11:27:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEuKq-0005r3-Fx
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 11:27:08 +0000
X-Inumbo-ID: e720df43-5d15-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e720df43-5d15-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 11:27:06 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 12 Apr 2019 05:27:05 -0600
Message-Id: <5CB076090200007800226DBD@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 12 Apr 2019 05:27:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CAF1AD502000078002268CA@prv1-mh.provo.novell.com>
 <704b34f9-dbbf-45f4-4e96-2a38e7c942ac@citrix.com>
 <5CAF1D1902000078002268F3@prv1-mh.provo.novell.com>
 <790227e0-921a-bf64-21c1-522e46d72fd5@citrix.com>
In-Reply-To: <790227e0-921a-bf64-21c1-522e46d72fd5@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] timers: move back migrate_timers_from_cpu()
 invocation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412112705.91gq9lWR7n1W7636SRcQXNuppoIhU7d_yfJfSc0pVcA@z>

Pj4+IE9uIDExLjA0LjE5IGF0IDIyOjAzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDQvMjAxOSAxMTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEx
LjA0LjE5IGF0IDEyOjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBP
biAxMS8wNC8yMDE5IDExOjQ1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBAQCAtNjQ4LDYgKzY0
Niw4IEBAIHN0YXRpYyBpbnQgY3B1X2NhbGxiYWNrKAo+Pj4+ICAgICAgY2FzZSBDUFVfVVBfQ0FO
Q0VMRUQ6Cj4+Pj4gICAgICBjYXNlIENQVV9ERUFEOgo+Pj4+ICAgICAgY2FzZSBDUFVfUkVTVU1F
X0ZBSUxFRDoKPj4+PiArICAgICAgICBtaWdyYXRlX3RpbWVyc19mcm9tX2NwdShjcHUpOwo+Pj4+
ICsKPj4+PiAgICAgICAgICBpZiAoICFwYXJrX29mZmxpbmVfY3B1cyAmJiBzeXN0ZW1fc3RhdGUg
IT0gU1lTX1NUQVRFX3N1c3BlbmQgKQo+Pj4+ICAgICAgICAgICAgICBmcmVlX3BlcmNwdV90aW1l
cnMoY3B1KTsKPj4+PiAgICAgICAgICBicmVhazsKPj4+IEknbSBwcmV0dHkgc3VyZSB5b3UgYWxz
byBuZWVkIGEgY2FsbCBpbiB0aGUgUkVNT1ZFX0NBU0UuICBUaGUgY3B1IGNvbWVzCj4+PiBvbmxp
bmUgZm9yIGxvbmcgZW5vdWdoIHRvIHBvdGVudGlhbGx5IGdhaW4gYSB0aW1lci4KPj4gV2hhdCBk
byB5b3UgbWVhbiBieSAiY29tZXMgb25saW5lIGZvciBsb25nIGVub3VnaCI/IFRoZXJlJ3MKPj4g
bm8gY2FsbCBzaXRlIGZvciB0aGUgbm90aWZpZXIgd2l0aCBDUFVfUkVNT1ZFIHJpZ2h0IG5vdywg
c28gd2hhdAo+PiB0aGUgZXZlbnR1YWwgYmVoYXZpb3IgaXMgZ29pbmcgdG8gYmUgaXMgc2ltcGx5
IHVua25vd24uIEkgZm9yIG9uZQo+PiBkb24ndCBleHBlY3QgdGhlIENQVSB0byBiZSBicm91Z2h0
IGJhY2sgdXAgYWdhaW4gaW4gdGhhdCBjYXNlLgo+PiBJJ20gd29uZGVyaW5nIGlmIHlvdSdyZSBt
aXhpbmcgdGhpcyB1cCB3aXRoIENQVV9SRVNVTUVfRkFJTEVELgo+IAo+IE5vdyBJJ20gZXZlbiBt
b3JlIGNvbmZ1c2VkLCBidXQgeWVzIGNsZWFybHkgLSBpdCB3YXNuJ3QgdGhlIENQVV9SRU1PVkUg
Y2FzZS4KPiAKPiBUaGF0IHNhaWQsIGJ5IG1ha2luZyB0aGlzIGFkanVzdG1lbnQsIHlvdSBhcmUg
bm93IGxpYWJsZSB0byBoaXQgYW4KPiBhc3NlcnRpb24gaW4gdGhlIFJFTU9WRSBjYXNlLCB3aGlj
aCBvbiBhIHJlbGVhc2UgYnVpbGQgd2lsbCByZXN1bHQgaW4KPiBjb21wbGV0ZSBtZW1vcnkgY29y
cnVwdGlvbiwgYXMgaXQgZnJlZXMgYW4gaW4tdXNlIGRhdGFzdHJ1Y3R1cmUuCgpOb3cgSSdtIGFm
cmFpZCBJJ20gY29uZnVzZWQgYXMgd2VsbDogV2hpY2ggYXNzZXJ0aW9uIHdvdWxkIHRyaWdnZXIs
CmFuZCB3aGljaCBpbi11c2UgZGF0YSBzdHJ1Y3R1cmUgd291bGQgZ2V0IGZyZWVkPyBGb3IgYW4g
b2ZmbGluZQooYW5kIHBhcmtlZCkgQ1BVLCB0aGUgaGVhcCBwb2ludGVyIHdvdWxkIGNvbnNpc3Rl
bnRseSBwb2ludCB0bwpkdW1teV9oZWFwIGF0IGFsbCB0aW1lcy4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
