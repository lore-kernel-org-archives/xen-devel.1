Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9A8C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 09:25:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8340820656
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 09:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8340820656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFxrR-0005q3-SA; Mon, 15 Apr 2019 09:25:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n0ti=SR=citrix.com=prvs=001605e3c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hFxrQ-0005py-BX
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 09:25:08 +0000
X-Inumbo-ID: 5b4ea579-5f60-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5b4ea579-5f60-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 09:25:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,353,1549929600"; d="scan'208";a="83560261"
Date: Mon, 15 Apr 2019 10:23:58 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Message-ID: <20190415092358.GM30543@zion.uk.xensource.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Xen commit 9b0bc91b3 possibly removed too much info
 from README
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415092358.ESZRpsFJ8YKy-vtI1OL_9oGfFfWS5Q13eCIhhi7prbQ@z>

T24gU2F0LCBBcHIgMTMsIDIwMTkgYXQgMTE6MTc6NDhBTSArMDgwMCwgS2V2aW4gQnVja2xleSB3
cm90ZToKPiBPbiBUaHUsIDExIEFwciAyMDE5IGF0IDE4OjI5LCBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPiB3cm90ZToKPiA+Cj4gPiAuLi4KPiA+IFN1cmUuIEkgd2lsbCB3cml0ZSBhIHBh
dGNoLgo+ID4KPiA+IFdlaS4KPiAKPiBDb3VwbGUgb2Ygb3RoZXIgdGhpbmdzIEkgbm90aWNlZCBh
ZnRlciBwb3N0aW5nIHRoZSBvcmlnaW5hbCBvYnNlcnZhdGlvbiwKPiB0aGF0IG1pZ2h0IGJlIG9m
IHVzZSBpbiBwYXRjaGluZyB0aGUgZG9jdW1lbnRhdGlvbgo+IAo+IDEpCj4gCj4gVGhlIHRvb2xz
L01ha2VmaWxlIGhhcyBhIGJhcmUgUFlUSE9OIEVudlZhciB0aGF0IGlzbid0IHNlZW1pbmdseQo+
IHJlcGxhY2VkIGJ5IHRoZSBQWVRIT049IHZhbHVlIHN1cHBsaWVkIHRvIGNvbmZpZ3VyZSwgc28g
SSBhbHNvCj4gbmVlZGVkIHRvIHNwZWNpZnkgdGhlCj4gCj4gUFlUSE9OPS9wYXRoL3RvL2ludGVy
cHJldGVyCj4gCj4gYXMgYW4gYXJndW1lbnQgdG8gdGhlICJtYWtlIHdvcmxkIiBhcyB3ZWxsIGFz
IHRvIHRoZSBjb25maWd1cmUuCgpUaGUgb25seSBhcHBlYXJhbmNlIG9mIFBZVEhPTiBpbiB0b29s
cy9NYWtlZmlsZSBpcyBpbiB0aGUgcWVtdSBidWlsZC4KSXQgYWxyZWFkeSBoYXMgdGhlIHJpZ2h0
IGZvcm0uCgpJIHRlc3RlZCB0aGUgZm9sbG93aW5nOgoKICAgICQgUFlUSE9OPS91c3IvYmluL3B5
dGhvbjMgLi9jb25maWd1cmUKICAgICQgbWFrZSAtajggd29ybGQgMj4mMSB8IHRlZSBsb2cgIyBi
cm9rZW4gYXRtIHVuZm9ydHVuYXRlbHkKICAgICQgbWFrZSAtQyB0b29scyBzdWJkaXItYWxsLXFl
bXUteGVuLWRpciAjIHRoZSBydW5lIHdoaWNoIGhhcyBQWVRIT04gaW4gaXQKCkFuZCB0aGVuIEkg
bG9va2VkIGZvciB0aGUgcmVsZXZhbnQgYml0cyBpbiBsb2c6CgpQS0dfQ09ORklHX1BBVEg9L2xv
Y2FsL3dvcmsveGVuLmdpdC90b29scy8uLi90b29scy9wa2ctY29uZmlnJHtQS0dfQ09ORklHX1BB
VEg6Kzoke1BLR19DT05GSUdfUEFUSH19IFwKJHNvdXJjZS9jb25maWd1cmUgLS1lbmFibGUteGVu
IC0tdGFyZ2V0LWxpc3Q9aTM4Ni1zb2Z0bW11IFwKICAgICAgICAuLi4uCiAgICAgICAgLS1weXRo
b249cHl0aG9uMyBcCgpOb3Qgc3VyZSB3aGljaCBiYXJlIFBZVEhPTiBFbnZWYXIgeW91IHJlZmVy
cmVkIHRvLiBDYW4geW91IGNsYXJpZnk/Cgo+IAo+IAo+IDIpCj4gCj4gSW4gdGhlIHRvcC1sZXZl
bCBJTlNUQUxMIGZpbGUsIHdlIHJlYWQKPiAKPiAtLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0t
LS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLQo+IFNN
QklPU19SRUxfREFURT1tbS9kZC95eXl5Cj4gVkdBQklPU19SRUxfREFURT0iZGQgTW9uIHl5eXki
Cj4gCj4gRHVyaW5nIHRvb2xzIGJ1aWxkIGV4dGVybmFsIHJlcG9zIHdpbGwgYmUgY2xvbmVkIGlu
dG8gdGhlIHNvdXJjZSB0cmVlLgo+IFRoaXMgdmFyaWFibGUgY2FuIGJlIHVzZWQgdG8gcG9pbnQg
dG8gYSBkaWZmZXJlbnQgZ2l0IGJpbmFyeSB0byBiZSB1c2VkLgo+IEdJVD0KPiAKPiBEdXJpbmcg
dG9vbHMgYnVpbGQgZXh0ZXJuYWwgcmVwb3Mgd2lsbCBiZSBjbG9uZWQgaW50byB0aGUgc291cmNl
IHRyZWUuCj4gRHVyaW5nIHN0dWJkb20gYnVpbGQgZXh0ZXJuYWwgcGFja2FnZXMgd2lsbCBiZSBk
b3dubG9hZGVkIGludG8gdGhlCj4gc291cmNlIHRyZWUuIFRoZXNlIHZhcmlhYmxlcyBjYW4gYmUg
dXNlZCB0byBwb2ludCB0byBhIGRpZmZlcmVudAo+IGxvY2F0aW9ucy4KPiBYRU5fRVhURklMRVNf
VVJMPQo+IE9WTUZfVVBTVFJFQU1fVVJMPQo+IC0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0t
LS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tCj4gCj4g
SXMgdGhhdCBzZWNvbmQKPiAKPiAgICBEdXJpbmcgdG9vbHMgYnVpbGQgZXh0ZXJuYWwgcmVwb3Mg
d2lsbCBiZSBjbG9uZWQgaW50byB0aGUgc291cmNlIHRyZWUuCj4gCj4gYWJvdmUgdGhlCj4gCj4g
ICAgRHVyaW5nIHN0dWJkb20gYnVpbGQKClRoaXMgaXMgYSBiaXQgeGVuIHNwZWNpZmljIC0tIHdl
IGNvbnNpZGVyIHN0dWJkb20gYW5kIHRvb2xzIHR3byBzZXBhcmF0ZQpjb21wb25lbnRzIGluc2lk
ZSB4ZW4uZ2l0IGJlY2F1c2UgdGhleSBoYXZlIHRoZWlyIG93biBkaXJlY3Rvcmllcy4KClRoYXQg
c2VudGVuY2UgY2FuIGluZGVlZCBiZSBzaW1wbGlmaWVkLiBJIHdpbGwgc3VibWl0IGEgcGF0Y2gg
Zm9yIHRoYXQuCgpXZWkuCgoKPiAKPiByZXF1aXJlZCA/Cj4gCj4gRldJVywgSSBub3RpY2VkICgy
KSAgYmVjYXVzZSBJIGRpZG4ndCBoYXZlIEdpdCBpbiBteSBMRlMgc3lzdGVtIGF0Cj4gcG9pbnQg
dGhhdCBJIHdhcyB0cnlpbmcgdG8gYnVpbGQgWGVuIGluc2lkZSBpdC4KPiAKPiBLZXZpbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
