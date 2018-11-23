From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 6/6] amd/iommu: skip bridge devices when
 updating IOMMU page tables
Date: Fri, 23 Nov 2018 15:36:51 +0100
Message-ID: <20181123143651.mdmrhg5kunlmioz2@mac>
References: <20181120160153.45259-7-roger.pau@citrix.com>
 <5BF43A1902000078001FE31E@prv1-mh.provo.novell.com>
 <20181120232627.GA31051@amd.com>
 <5BF523A002000078001FE537@prv1-mh.provo.novell.com>
 <20181121103744.pw6qiwasi6qsu63d@mac>
 <5BF53A5A02000078001FE684@prv1-mh.provo.novell.com>
 <20181121115131.wjpmhjsnesfdw2c4@mac>
 <5BF55C5202000078001FE816@prv1-mh.provo.novell.com>
 <20181122124744.ekm2wappzsod2opb@mac>
 <5BF6AD2E02000078001FEE49@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2k7w=oc=citrix.com=prvs=8582a9f6d=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gQCZo-0000xl-7A
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 14:37:00 +0000
Content-Disposition: inline
In-Reply-To: <5BF6AD2E02000078001FEE49@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDY6MjA6NDZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIyLjExLjE4IGF0IDEzOjQ3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gSSB0aGluayB0aGUgaXNfaGFyZHdhcmVfZG9tYWluIHBhcnQgY2FuIGJlIGRyb3Bw
ZWQgZnJvbSB0aGUKPiA+IGNvbmRpdGlvbmFsIEknbSBhZGRpbmcuIHVwZGF0ZV9wYWdpbmdfbW9k
ZSBzaG91bGRuJ3QgYmUgdXNlZCB0byBkZWNpZGUKPiA+IHdoZXRoZXIgYSBkb21haW4gY2FuIG9y
IGNhbm5vdCBoYXZlIGJyaWRnZXMgYXR0YWNoZWQuIFdoZXRoZXIgYSBEb21VCj4gPiBjYW4gb3Ig
Y2Fubm90IGhhdmUgYSBob3N0IGJyaWRnZSBhc3NpZ25lZCBzaG91bGQgYmUgZGVjaWRlZCBhdAo+
ID4gYXNzaWduYXRpb24gdGltZSwgYW5kIGhlbmNlIHVwZGF0ZV9wYWdpbmdfbW9kZSBzaG91bGRu
J3QgaGF2ZSBoYXJkd2FyZQo+ID4gZG9tYWluIHNwZWNpZmljIGNoZWNrcy4KPiAKPiBPa2F5LCB3
ZSdyZSBpbiBhZ3JlZW1lbnQgdGhlbi4KPiAKPiA+IFJlZ2FyZGluZyB0aGUgY2hlY2sgaW4gYW1k
X2lvbW11X2FkZF9kZXZpY2UsIGlmIGl0J3MgcmVtb3ZlZCBmcm9tCj4gPiB0aGVyZSBhbWRfaW9t
bXVfYWRkX2RldmljZSB3b3VsZCByZXR1cm4gYW4gZXJyb3Igd2hlbiBhZGRpbmcgYSBob3N0Cj4g
PiBicmlkZ2UgZGV2aWNlLCBhbmQgdGhhdCB3b3VsZCBjYXVzZSBzZXR1cF9vbmVfaHdkb21fZGV2
aWNlIHRvIHJldHVybgo+ID4gZWFybHkgYW5kIG5vdCBzZXR1cCB2UENJIGhhbmRsZXJzIGZvciBo
b3N0IGJyaWRnZXMsIHNvIEkgdGhpbmsgd2Ugd2FudAo+ID4gdG8gbGVhdmUgdGhhdCBvbmUgYXMt
aXMuCj4gCj4gUmlnaHQsIEkgY2FuIHNlZSB3aHkgaXQgbWF5IGJlIGJldHRlciB0byByZXRhaW4g
aXQgdGhlcmUuCgpUaGFua3MuIFdvdWxkIHlvdSBsaWtlIG1lIHRvIHJlc2VuZCB0aGUgc2VyaWVz
IHdpdGggdGhpcyBmaXgsIG9yCnNob3VsZCBJIHdhaXQgZm9yIGZlZWRiYWNrIG9uIHRoZSByZW1h
aW5pbmcgcGF0Y2hlcz8KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
