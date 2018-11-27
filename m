From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] amd-iommu: remove page merging code
Date: Tue, 27 Nov 2018 08:42:57 -0700
Message-ID: <5BFD660102000078002006FB@prv1-mh.provo.novell.com>
References: <20181126173045.1274-1-paul.durrant@citrix.com>
 <5BFD415B02000078002005DF@prv1-mh.provo.novell.com>
 <a500cc7c-ec6b-9894-63a0-df3329790bdc@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=2mkr=og=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRfVv-00009F-QM
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 15:43:03 +0000
In-Reply-To: <a500cc7c-ec6b-9894-63a0-df3329790bdc@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjExLjE4IGF0IDE1OjE5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjcvMTEvMjAxOCAxMzowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI2
LjExLjE4IGF0IDE4OjMwLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gVGhl
IHBhZ2UgbWVyZ2luZyBsb2dpYyBtYWtlcyB1c2Ugb2YgYml0cyAxLTggYW5kIGJpdCA2MyBvZiBh
IFBURSwgd2hpY2ggdXNlZAo+Pj4gdG8gYmUgc3BlY2lmaWVkIGFzIGlnbm9yZWQuIEhvd2V2ZXIs
IGJpdHMgNSBhbmQgNiBhcmUgbm93IHNwZWNpZmllZCBhcwo+Pj4gJ2FjY2Vzc2VkJyBhbmQgJ2Rp
cnR5JyBiaXRzIGFuZCB0aGVpciB1c2Ugb25seSByZW1haW5zIHNhZmUgYXMgbG9uZyBhcwo+Pj4g
dGhlIERURSAnSG9zdCBBY2Nlc3MgRGlydHknIGJpdHMgcmVtYWluIGNsZWFyLgo+PiBVcG9uIHNl
Y29uZCB0aG91Z2h0IC0gaXMgdGhpcyBhY3R1YWxseSB0cnVlIHdpdGggdGhlIFhTQS0yNzUKPj4g
Y2hhbmdlcyBpbiBwbGFjZT8gQXMgbG9uZyBhcyB0aGUgZG9tYWluIGlzIG5vdCBydW5uaW5nIHll
dCwKPj4gaG93IHdvdWxkIEEgYW5kL29yIEQgYml0cyBnZXQgc2V0Pwo+IAo+IERURS5IQUQgaXMg
YW4gSU9NTVUgY29udHJvbCB3aGljaCBYZW4gZG9lc24ndCBjdXJyZW50bHkgZW5hYmxlLCBzbyB0
aGlzCj4gaXNuJ3QgYW4gaXNzdWUgaW4gY3VycmVudCB1c2FnZS4KCldlbGwsIG9mIGNvdXJzZSwg
YW5kIFBhdWwgZGlkIHNheSBzby4gTXkgcG9pbnQgaXMgdGhhdCBldmVuIHdoZW4gd2UKc3RhcnQg
dXNpbmcgdGhlIGZlYXR1cmUsIGFzIGxvbmcgYXMgd2UgZG9uJ3Qgc2V0IEEgYW5kL29yIEQgYml0
cwpvdXJzZWx2ZXMsIG5vdGhpbmcgaXMgZ2V0dGluZyBpbiB0aGUgd2F5IG9mIHRoZSBtZXJnaW5n
IGNvZGUsIGFzIGl0CmNlYXNlcyB0byBkbyBhbnl0aGluZyBvbmNlIHRoZSBkb21haW4gc3RhcnRz
IHJ1bm5pbmcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
