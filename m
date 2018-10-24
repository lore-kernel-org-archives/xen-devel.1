From: Jintack Lim <jintack@cs.columbia.edu>
Subject: Re: How to use PV drivers with fully virtualized HVM on
 x86?
Date: Wed, 24 Oct 2018 11:35:53 -0400
Message-ID: <CAHyh4xg4RpdPnDpyafbk6sbV-bwu_=3V0sZ0aD08v+LU8Wo_uQ@mail.gmail.com>
References: <CAHyh4xgK11VZjgwPKoAwNTx0rD4z+gk+oakY9JrCM426Ekqq0g@mail.gmail.com>
 <455998b3-2310-6d2c-f42b-14a8e4a6be43@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pirj=ne=columbia.edu=jl4312@srs-us1.protection.inumbo.net>)
 id 1gFLCg-0007GN-Du
 for xen-devel@lists.xenproject.org; Wed, 24 Oct 2018 15:36:14 +0000
Received: from hazelnut (hazelnut.cc.columbia.edu [128.59.213.250])
 by outprodmail01.cc.columbia.edu (8.14.4/8.14.4) with ESMTP id w9OFW5LV035399
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 11:36:12 -0400
Received: from hazelnut (localhost.localdomain [127.0.0.1])
 by hazelnut (Postfix) with ESMTP id B706D90
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 11:36:12 -0400 (EDT)
Received: from sendprodmail03.cc.columbia.edu (sendprodmail03.cc.columbia.edu
 [128.59.72.15]) by hazelnut (Postfix) with ESMTP id 14B4791
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 11:36:09 -0400 (EDT)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 by sendprodmail03.cc.columbia.edu (8.14.4/8.14.4) with ESMTP id w9OFa8MA028845
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 11:36:08 -0400
Received: by mail-ed1-f70.google.com with SMTP id u6-v6so2918775eds.10
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 08:36:08 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44])
 by smtp.gmail.com with ESMTPSA id e10-v6sm1048692ejl.25.2018.10.24.08.36.05
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Oct 2018 08:36:05 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id w186-v6so5878259wmf.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Oct 2018 08:36:05 -0700 (PDT)
In-Reply-To: <455998b3-2310-6d2c-f42b-14a8e4a6be43@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

VGhhbmtzIEp1ZXJnZW4sCgpPbiBXZWQsIE9jdCAyNCwgMjAxOCBhdCAxMDozMCBBTSBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Cj4gT24gMjQvMTAvMjAxOCAxNjoxNiwg
SmludGFjayBMaW0gd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBJJ20gaW50ZXJlc3RlZCBydW5uaW5n
IEhWTSBEb21VIG9ubHkgd2l0aCBQViBkcml2ZXJzIChuZXR3b3JrIGFuZAo+ID4gZGlzaykuIEVu
YWJsaW5nIENPTkZJR19YRU5fTkVUREVWX0ZST05URU5EIGFuZCBzdHVmZiBkaWRuJ3QgbWFrZSBE
b21VCj4gPiBzZWUgdGhlIFBWIGRldmljZXMgdW50aWwgSSBlbmFibGVkIENPTkZJR19YRU5fUFZI
Vk0uCj4KPiBSaWdodCwgdGhhdCdzIGhvdyBpdCBpcyBkb25lIGluIG1vZGVybiBMaW51eCBrZXJu
ZWxzLgoKVGhhbmtzIGZvciB0aGUgY29uZmlybWF0aW9uLgoKPgo+ID4gQnV0IGJ5IGxvb2tpbmcg
YXQgdGhlIHZpcnR1YWxpemF0aW9uIHNwZWN0cnVtWzFdLCBpdCBzZWVtcyBwb3NzaWJsZSB0bwo+
ID4gZG8gIkhWTSB3aXRoIFBWIGRyaXZlcnMiLCBidXQgSSBjb3VsZG4ndCBmaW5kIGFueSBndWlk
ZSAoaS5lLgo+ID4ga2VybmVsL3hlbiBjb25maWd1cmF0aW9uKSB0byBkbyB0aGF0LiBDb3VsZCBh
bnlvbmUgc2hlZCBzb21lIGxpZ2h0IG9uCj4gPiB0aGlzPwo+Cj4gRGlzYWJsaW5nIG1vc3Qgb2Yg
dGhlIFBWIGludGVyZmFjZXMgb3RoZXIgdGhhbiB0aG9zZSBuZWVkZWQgZm9yIHVzaW5nCj4gUFYg
ZGV2aWNlcyBpc24ndCBzdXBwb3J0ZWQgaW4gTGludXggc2luY2Ugc2V2ZXJhbCB5ZWFycyBub3cu
Cj4KPiBBbnkgcmVhc29uIHdoeSB5b3Ugd2FudCB0byBkbyB0aGF0PwoKSSB3YXMgdGVzdGluZyBu
ZXN0ZWQgdmlydHVhbGl6YXRpb24gLSBYZW4gb24gS1ZNLiBJIHNlZSBuZXR3b3JrCnBlcmZvcm1h
bmNlIGRlZ3JhZGF0aW9uIHdpdGggUFZIVk0gRG9tVSBpbiBuZXN0ZWQgVk0gY29tcGFyZWQgdG8g
YQpEb21VIHdpdGhvdXQgUFZIVk0gaW4gbmVzdGVkIFZNLiBJJ20gdXNpbmcgYSBwaHlzaWNhbCBO
SUMgZGV2aWNlCmFzc2lnbmVkIHRvIHRoZSBEb21VIGZvciBib3RoIGNhc2VzLgoKSXQncyBxdWl0
ZSB1bnVzdWFsIHNldHVwLCBidXQgSSBqdXN0IHdvbmRlciB3aGF0IGNhdXNlcyBwZXJmb3JtYW5j
ZQpkcm9wIHdpdGggUFZIVk0gZXZlbiB0aG91Z2ggSSdtIG5vdCB1c2luZyBQViBuZXR3b3JrIGRl
dmljZSBpbiBEb21VLiBJCmd1ZXNzIGl0IG1pZ2h0IGJlIHNvbWUgb3RoZXIgc3R1ZmYsIGJ1dCBu
b3Qgc3VyZSB3aGF0IHRoZXkgYXJlLiBTbyBJCndhbnRlZCB0byBjb25maWd1cmUgRG9tVSB0byBl
eGFjdGx5IGhhdmUgUFYgZGV2aWNlcyBhbmQgc2VlIHdoYXQKaGFwcGVucy4KClRoYW5rcywKSmlu
dGFjawoKPgo+Cj4gSnVlcmdlbgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
