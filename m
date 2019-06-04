From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
Date: Tue, 04 Jun 2019 03:21:08 -0600
Message-ID: <5CF638040200007800234F11@prv1-mh.provo.novell.com>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
 <abc6106c-0c38-d891-0cbb-5b4d79c8093a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hY5d6-000879-Qb
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 09:21:16 +0000
In-Reply-To: <abc6106c-0c38-d891-0cbb-5b4d79c8093a@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA2LjE5IGF0IDExOjA0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDMvMDYvMjAxOSAxNDowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRoaXMgcmV2
ZXJ0cyBjb21taXQgYjZiZDAyYjdhODc3ZjlmYWMyZGU2OWU2NGQ4MjQ1ZDU2ZjkyYWIyNS4gVGhl
IGNoYW5nZQo+PiB3YXMgcmVkdW5kYW50IHdpdGggYW1kX2lvbW11X2RldGVjdF9vbmVfYWNwaSgp
IGFscmVhZHkgY2FsbGluZwo+PiBwY2lfcm9fZGV2aWNlKCkuCj4gCj4gU2VlaW5nIGFzIGFtZF9p
b21tdV9kZXRlY3Rfb25lX2FjcGkoKSBoYXNuJ3QgY2hhbmdlZCBmb3IgbWFueSB5ZWFycywgYW5k
Cj4gYjZiZDAyYjcgd2FzIGEgZnVuY3Rpb25hbCBmaXggZm9yIGJvb3RpbmcgUFZIIG9uIEFNRCwg
SSBjYW4ndCBzZWUgd2hhdAo+IHdvdWxkIG1ha2UgdGhpcyB0cnVlIG5vdy4KCkknZCBsaWtlIHRv
IGNvdW50ZXIgdGhpczogSSBjYW4ndCBzZWUgd2h5IHRoYXQgY2hhbmdlIHdhcyBuZWVkZWQuCkNs
ZWFybHksIGlmIHRoaXMgd2FzIGluZGVlZCBuZWVkZWQgZm9yIFBWSCBEb20wIGJvb3QsIHRoZXJl
IHdhcwppbnN1ZmZpY2llbnQgcmVhc29uaW5nIGFzIHRvIHdoeSB0aGUgZXhpc3RpbmcgcGNpX3Jv
X2RldmljZSgpCmludm9jYXRpb24gd2FzIG5vdCBlbm91Z2guIEksIGZvciBvbmUsIHN1cmVseSBk
aWRuJ3QgZXZlbiByZWNhbGwKaXQgd2FzIHRoZXJlIHdoZW4gcmV2aWV3aW5nIHRoZSBwYXRjaCwg
b3IgZWxzZSBJIHdvdWxkIGhhdmUgYXNrZWQKZm9yIGEgbW9yZSBjb21wbGV0ZSBkZXNjcmlwdGlv
bi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
