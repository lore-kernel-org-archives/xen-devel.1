Return-Path: <SRS0=in/6=YQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDCACA9EB6
	for <xen-devel@archiver.kernel.org>; Wed, 23 Oct 2019 13:42:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 872CC20663
	for <xen-devel@archiver.kernel.org>; Wed, 23 Oct 2019 13:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 872CC20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGu8-0002QC-PU; Wed, 23 Oct 2019 13:42:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNGu7-0002Q4-Pc
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:42:23 +0000
X-Inumbo-ID: f0cd8e78-f59a-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0cd8e78-f59a-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 13:42:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 46711BA7C;
 Wed, 23 Oct 2019 13:42:22 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-6-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <03e7c9e3-acaa-29b9-fb90-1a37be9a30ea@suse.com>
Date: Wed, 23 Oct 2019 15:42:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023130013.32382-6-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 05/11] libxl: Move
 shadow_memkb and iommu_memkb defaulting into libxl
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTU6MDAsIElhbiBKYWNrc29uIHdyb3RlOgo+IERlZmF1bHRpbmcgaXMgc3Vw
cG9zZWQgdG8gYmUgZG9uZSBieSBsaWJ4bC4gIFNvIHRoZXNlIGNhbGN1bGF0aW9ucwo+IHNob3Vs
ZCBiZSBoZXJlIGluIGxpYnhsLiAgbGlieGxfX2RvbWFpbl9jb25maWdfc2V0ZGVmYXVsdCBoYXMg
YWxsIHRoZQo+IG5lY2Vzc2FyeSBpbmZvcm1hdGlvbiBpbmNsdWRpbmcgdGhlIHZhbHVlcyBvZiBt
YXhfbWVta2IgYW5kIG1heF92Y3B1cy4KPiAKPiBUaGUgb3ZlcmFsbCBmdW5jdGlvbmFsIGVmZmVj
dCBkZXBlbmRzIG9uIHRoZSBjYWxsZXI6Cj4gCj4gRm9yIHhsLCBubyBjaGFuZ2UuICBUaGUgY29k
ZSBtb3ZlcyBmcm9tIHhsIHRvIGxpYnhsLgo+IAo+IEZvciBjYWxsZXJzIHdobyBzZXQgb25lIG9y
IGJvdGggc2hhZG93X21lbWtiIGFuZCBpb21tdV9tZW1rYiAod2hldGhlcgo+IGZyb20gbGlieGxf
Z2V0X3JlcXVpcmVkX3NoYWRvd19tZW1vcnkgb3Igb3RoZXJ3aXNlKSBiZWZvcmUgY2FsbGluZwo+
IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9yeSAoYW55IHZlcnNpb24pOiB0aGUgbmV3IGNvZGUgd2ls
bCBsZWF2ZSB0aGVpcgo+IHNldHRpbmcocykgdW5jaGFuZ2VkLgo+IAo+IEZvciBjYWxsZXJzIHdo
byBkbyBub3QgY2FsbCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkgYXQgYWxsLCBhbmQgd2hvCj4g
ZmFpbCB0byBzZXQgb25lIG9mIHRoZXNlIG1lbW9yeSB2YWx1ZXM6IG5vdyB0aGV5IGFyZSBib3Ro
IGFyZSBwcm9wZXJseQo+IHNldC4gIFRoZSBzaGFkb3cgYW5kIGlvbW11IG1lbW9yeSB0byBiZSBw
cm9wZXJseSBhY2NvdW50ZWQgZm9yIGFzCj4gaW50ZW5kZWQuCj4gCj4gRm9yIGNhbGxlcnMgd2hp
Y2ggY2FsbCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkgYW5kIHJlcXVlc3QgdGhlCj4gY3VycmVu
dCBBUEkgKDQuMTMpIG9yIHdoaWNoIHRyYWNrIGxpYnhsLCB0aGUgZGVmYXVsdCB2YWx1ZXMgYXJl
IGFsc28KPiBub3cgcmlnaHQgYW5kIGV2ZXJ5dGhpbmcgd29ya3MgYXMgaW50ZW5kZWQuCj4gCj4g
Rm9yIGNhbGxlcnMgd2hpY2ggY2FsbCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnksIGFuZCByZXF1
ZXN0IGFuIG9sZAo+IHByZS00LjEzIGxpYnhsIEFQSSwgYW5kIHdoaWNoIGxlYXZlIG9uZSBvZiB0
aGVzZSBtZW1rYiBzZXR0aW5ncyB1bnNldCwKPiB3ZSB0YWtlIHNwZWNpYWwgbWVhc3VyZXMgdG8g
cHJlc2VydmUgdGhlIG9sZCBiZWhhdmlvdXIuCj4gCj4gVGhpcyBtZWFucyB0aGF0IHRoZXkgZG9u
J3QgZ2V0IHRoZSBhZGRpdGlvbmFsIGlvbW11IG1lbW9yeSBhbmQgYXJlIGF0Cj4gcmlzayBvZiB0
aGUgZG9tYWluIHJ1bm5pbmcgb3V0IG9mIG1lbW9yeSBhcyBhIHJlc3VsdCBvZiBmODlmNTU1ODI3
YTYKPiAicmVtb3ZlIGxhdGUgKG9uLWRlbWFuZCkgY29uc3RydWN0aW9uIG9mIElPTU1VIHBhZ2Ug
dGFibGVzIi4gIEJ1dCB0aGlzCj4gaXMgbm8gd29yc2UgdGhhbiB0aGUgc3RhdGUganVzdCBhZnRl
ciBmODlmNTU1ODI3YTYsIHdoaWNoIGFscmVhZHkKPiBicm9rZSBzdWNoIGNhbGxlcnMgaW4gdGhh
dCB3YXkuICBUaGlzIGlzIHBlcmhhcHMganVzdGlmaWFibGUgYmVjYXVzZQo+IG9mIHRoZSBBUEkg
c3RhYmlsaXR5IHdhcm5pbmcgbmV4dCB0byBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkuCj4gCj4g
QW4gYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gZHJvcCB0aGUgc3BlY2lhbC1jYXNpbmcgb2YgdGhl
c2UgY2FsbGVycy4KPiBUaGF0IHdvdWxkIGNhdXNlIGEgZGlzY3JlcGFuY3kgYmV0d2VlbiBsaWJ4
bF9kb21haW5fbmVlZF9tZW1vcnkgYW5kCj4gbGlieGxfZG9tYWluX2NyZWF0ZTogdGhlIGZvcm1l
ciB3b3VsZCBub3QgaW5jbHVkZSB0aGUgaW9tbXUgbWVtb3J5IGFuZAo+IHRoZSBsYXR0ZXIgd291
bGQuICBUaGF0IHNlZW1zIHdvcnNlLCBidXQgaXQncyBkZWJhdGVhYmxlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IFJldmlld2Vk
LWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClJlbGVhc2Ut
YWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
