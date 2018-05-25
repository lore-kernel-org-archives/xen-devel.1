From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [v2 4/6] xen/iommu: smmu-v3: Add Xen specific code
 to enable the ported driver
Date: Fri, 25 May 2018 01:10:37 -0600
Message-ID: <5B07B6ED02000078001C5D51@prv1-mh.provo.novell.com>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-5-sameer.goel@linaro.org>
 <5B06705802000078001C56C9@prv1-mh.provo.novell.com>
 <487269f9-7af5-ad9d-e89c-0c9b8d5bd67c@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uj/n=im=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fM7V7-0004hH-0K
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 07:51:01 +0000
In-Reply-To: <487269f9-7af5-ad9d-e89c-0c9b8d5bd67c@linaro.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: sameer.goel@linaro.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Manish Jaggi <mjaggi@caviumnetworks.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, shankerd@codeaurora.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA1LjE4IGF0IDIyOjI2LCA8c2FtZWVyLmdvZWxAbGluYXJvLm9yZz4gd3JvdGU6
Cj4gT24gMDUvMjQvMjAxOCAwMTo1NyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI0
LjA1LjE4IGF0IDAyOjQ2LCA8c2FtZWVyLmdvZWxAbGluYXJvLm9yZz4gd3JvdGU6Cj4+PiAtLS0g
L2Rldi9udWxsCj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGludXhfY29tcGF0LmgKPj4gSSBj
b250aW51ZSB0byBkaXNsaWtlIHRoZSBpZGVhIG9mIGhhdmluZyBhIGhlYWRlciB3aXRoIHRoZXNl
IGNvbnRlbnRzIGluIAo+IHRoaXMgbG9jYXRpb24uCj4gQXMgZXhwbGFpbmVkIHByZXZpb3VzbHkg
dGhpcyBoZWFkZXIgY2FuIGJlIHVzZWQgZm9yIHRoZSBhbnkgZHJpdmVyIHRoYXQgCj4gd2Ugd2Fu
dCB0byBwb3J0IGZyb20gTGludXguIFRoaXMgaXMgbm90IGFybSBzcGVjaWZpYy4gVGhpcyBzZWVt
ZWQgbGlrZSAKPiB0aGUgYmVzdCBsb2NhdGlvbiBmb3IgdGhlIGZpbGUuCgpQbGVhc2UgdGFrZSBp
bnRvIGNvbnNpZGVyYXRpb24gdGhhdCB3aXRoIGxvdHMgb2YgY29kZSBvcmlnaW5hbGx5IGhhdmlu
ZyBjb21lCmZyb20gTGludXgsIGluIGFsbCB0aGUgeWVhcnMgd2UndmUgbmV2ZXIgaGFkIGEgbmVl
ZCB0byBoYXZlIHN1Y2ggYSBoZWFkZXIuCldpdGggdGhhdCBoaXN0b3J5LCBpdCBuZWVkcyBnb29k
IHJlYXNvbmluZyB0byBpbnRyb2R1Y2Ugb25lIG5vdyBpbiBzdWNoIGEKZ2xvYmFsIGZhc2hpb24u
Cgo+IFdoaWNoIG90aGVyIGNvbW1vbiBsb2NhdGlvbiBzaG91bGQgSSBwaWNrPwoKTm9uZSAtIHRo
YXQncyB0aGUgd2hvbGUgcG9pbnQgb2YgbXkgY29tbWVudDogSSBkb24ndCBzZWUgdGhpcyBhcyBz
b21ldGhpbmcKdGhhdCBzaG91bGQgZ28gaW4gYSBjb21tb24gbG9jYXRpb24uCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
