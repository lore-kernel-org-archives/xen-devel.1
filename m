From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 6/6] amd/iommu: skip bridge devices when
 updating IOMMU page tables
Date: Thu, 22 Nov 2018 06:20:46 -0700
Message-ID: <5BF6AD2E02000078001FEE49@prv1-mh.provo.novell.com>
References: <20181120160153.45259-1-roger.pau@citrix.com>
 <20181120160153.45259-7-roger.pau@citrix.com>
 <5BF43A1902000078001FE31E@prv1-mh.provo.novell.com>
 <20181120232627.GA31051@amd.com>
 <5BF523A002000078001FE537@prv1-mh.provo.novell.com>
 <20181121103744.pw6qiwasi6qsu63d@mac>
 <5BF53A5A02000078001FE684@prv1-mh.provo.novell.com>
 <20181121115131.wjpmhjsnesfdw2c4@mac>
 <5BF55C5202000078001FE816@prv1-mh.provo.novell.com>
 <20181122124744.ekm2wappzsod2opb@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kqx2=ob=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gPouY-0006xM-EB
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 13:20:50 +0000
In-Reply-To: <20181122124744.ekm2wappzsod2opb@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjExLjE4IGF0IDEzOjQ3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEkgdGhpbmsgdGhlIGlzX2hhcmR3YXJlX2RvbWFpbiBwYXJ0IGNhbiBiZSBkcm9wcGVkIGZyb20g
dGhlCj4gY29uZGl0aW9uYWwgSSdtIGFkZGluZy4gdXBkYXRlX3BhZ2luZ19tb2RlIHNob3VsZG4n
dCBiZSB1c2VkIHRvIGRlY2lkZQo+IHdoZXRoZXIgYSBkb21haW4gY2FuIG9yIGNhbm5vdCBoYXZl
IGJyaWRnZXMgYXR0YWNoZWQuIFdoZXRoZXIgYSBEb21VCj4gY2FuIG9yIGNhbm5vdCBoYXZlIGEg
aG9zdCBicmlkZ2UgYXNzaWduZWQgc2hvdWxkIGJlIGRlY2lkZWQgYXQKPiBhc3NpZ25hdGlvbiB0
aW1lLCBhbmQgaGVuY2UgdXBkYXRlX3BhZ2luZ19tb2RlIHNob3VsZG4ndCBoYXZlIGhhcmR3YXJl
Cj4gZG9tYWluIHNwZWNpZmljIGNoZWNrcy4KCk9rYXksIHdlJ3JlIGluIGFncmVlbWVudCB0aGVu
LgoKPiBSZWdhcmRpbmcgdGhlIGNoZWNrIGluIGFtZF9pb21tdV9hZGRfZGV2aWNlLCBpZiBpdCdz
IHJlbW92ZWQgZnJvbQo+IHRoZXJlIGFtZF9pb21tdV9hZGRfZGV2aWNlIHdvdWxkIHJldHVybiBh
biBlcnJvciB3aGVuIGFkZGluZyBhIGhvc3QKPiBicmlkZ2UgZGV2aWNlLCBhbmQgdGhhdCB3b3Vs
ZCBjYXVzZSBzZXR1cF9vbmVfaHdkb21fZGV2aWNlIHRvIHJldHVybgo+IGVhcmx5IGFuZCBub3Qg
c2V0dXAgdlBDSSBoYW5kbGVycyBmb3IgaG9zdCBicmlkZ2VzLCBzbyBJIHRoaW5rIHdlIHdhbnQK
PiB0byBsZWF2ZSB0aGF0IG9uZSBhcy1pcy4KClJpZ2h0LCBJIGNhbiBzZWUgd2h5IGl0IG1heSBi
ZSBiZXR0ZXIgdG8gcmV0YWluIGl0IHRoZXJlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
