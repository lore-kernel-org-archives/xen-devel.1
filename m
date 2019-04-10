Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E446C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:58:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 355FD2075B
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 355FD2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEAvU-0003cG-Fr; Wed, 10 Apr 2019 10:57:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEAvS-0003cB-Qh
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 10:57:54 +0000
X-Inumbo-ID: 7d4196f8-5b7f-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7d4196f8-5b7f-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 10:57:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 10 Apr 2019 04:55:52 -0600
Message-Id: <5CADCBB60200007800226206@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 10 Apr 2019 04:55:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190409165210.7624-1-wei.liu2@citrix.com>
 <20190409165210.7624-3-wei.liu2@citrix.com>
In-Reply-To: <20190409165210.7624-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 2/3] xen: remove tmem from hypervisor
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410105550.rZ8Q-dgUADquvAY7M66u8MwIHXtJDDAvWNrZwqIvcMw@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDE4OjUyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVyY2FsbF9wYWdlLlMKPiArKysgYi94ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJjYWxsX3BhZ2UuUwo+IEBAIC01OCw4ICs1OCw4IEBAIERFQ0xBUkVf
SFlQRVJDQUxMKGh2bV9vcCkKPiAgREVDTEFSRV9IWVBFUkNBTEwoc3lzY3RsKQo+ICBERUNMQVJF
X0hZUEVSQ0FMTChkb21jdGwpCj4gIERFQ0xBUkVfSFlQRVJDQUxMKGtleGVjX29wKQo+IC1ERUNM
QVJFX0hZUEVSQ0FMTCh0bWVtX29wKQo+ICBERUNMQVJFX0hZUEVSQ0FMTChhcmdvX29wKQo+ICtE
RUNMQVJFX0hZUEVSQ0FMTCh4Y19yZXNlcnZlZF9vcCkKCklzIHRoaXMgYWRkZWQgbGluZSBhIHJl
LWJhc2luZyBtaXN0YWtlIG92ZXIgdGhlIEFyZ28gc2VyaWVzPwoKCj4gLS0tIGEveGVuL2NvbW1v
bi9NYWtlZmlsZQo+ICsrKyBiL3hlbi9jb21tb24vTWFrZWZpbGUKClRoZXJlJ3MgYXJlIGh1bmtz
IG1pc3NpbmcgaGVyZSB0byByZW1vdmUKCm9iai0kKENPTkZJR19UTUVNKSArPSBsem8ubwoKYW5k
IHRvIHJlcGxhY2UKCmx6by15IDo9IGx6bwpsem8tJChDT05GSUdfVE1FTSkgOj0KCihhbmQgaXRz
IHVzZSkuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy90bWVtLmgKPiArKysgYi94ZW4vaW5j
bHVkZS9wdWJsaWMvdG1lbS5oCj4gQEAgLTEsOCArMSw4IEBACj4gIAo+IC8qKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqCj4gKioKPiAgICogdG1lbS5oCj4gLSAqIAo+ICsgKgo+ICAgKiBHdWVzdCBPUyBpbnRl
cmZhY2UgdG8gWGVuIFRyYW5zY2VuZGVudCBNZW1vcnkuCj4gLSAqIAo+ICsgKgo+ICAgKiBQZXJt
aXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBv
YnRhaW5pbmcgYSBjb3B5Cj4gICAqIG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9j
dW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0bwo+ICAgKiBkZWFsIGluIHRoZSBT
b2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9u
IHRoZQo+IEBAIC0yOSwxNSArMjksMTEgQEAKPiAgCj4gICNpbmNsdWRlICJ4ZW4uaCIKPiAgCj4g
KyNpZiBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fIDwgMHgwMDA0MTIwMAoKSSBndWVzcyB5b3Ug
bWVhbiAweDAwMDQxMzAwIG5vdy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
