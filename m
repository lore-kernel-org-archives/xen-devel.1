From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] guest/pvh: fix handling of multiboot
 info and module list
Date: Mon, 12 Nov 2018 08:12:56 -0700
Message-ID: <5BE9987802000078001FB0D1@prv1-mh.provo.novell.com>
References: <20181109172250.12894-1-roger.pau@citrix.com>
 <20181109172250.12894-2-roger.pau@citrix.com>
 <5BE955D502000078001FAC06@prv1-mh.provo.novell.com>
 <20181112114909.rovrjxp2ynrlgx2n@mac.citrite.net>
 <5BE974B502000078001FAF6F@prv1-mh.provo.novell.com>
 <20181112150006.qzk6gmxzevg5hgnv@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=18fz=nx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMDtd-0006HK-PI
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 15:13:01 +0000
In-Reply-To: <20181112150006.qzk6gmxzevg5hgnv@mac.citrite.net>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjExLjE4IGF0IDE2OjAwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFllcywgaXQncyBvbmx5IHRoZSBtb2R1bGUgbGlzdCB0aGF0J3MgcGFzc2VkIGJ5IHBoeXNpY2Fs
IGFkZHJlc3MgYW5kCj4gdGhlbiBtYXBwZWQgdXNpbmcgX192YS4gSG93IGFib3V0IHRoZSBmb2xs
b3dpbmcgZGVzY3JpcHRpb246Cj4gCj4gIldoZW4gYm9vdGluZyBYZW4gYXMgYSBQVkggZ3Vlc3Qg
dGhlIGRhdGEgaW4gdGhlIFBWSCBzdGFydCBpbmZvCj4gc3RydWN0dXJlIGlzIGNvcGllZCBvdmVy
IHRvIGEgbXVsdGlib290IHN0cnVjdHVyZSBhbmQgYSBtb2R1bGUgbGlzdAo+IGFycmF5IHRoYXQg
cmVzaWRlcyBpbiB0aGUgLmluaXQgc2VjdGlvbiBvZiB0aGUgWGVuIGltYWdlLiBUaGUKPiByZXN1
bHRpbmcgbXVsdGlib290IG1vZHVsZSBsaXN0IGlzIHRoZW4gaGFuZGVkIHRvIHRoZSBnZW5lcmlj
IGJvb3QKPiBwcm9jZXNzIHVzaW5nIHRoZSBwaHlzaWNhbCBhZGRyZXNzIGluIG1iaS0+bW9kc19h
ZGRyLgo+IAo+IFRoaXMgd29ya3MgZmluZSBhcyBsb25nIGFzIHRoZSBYZW4gaW1hZ2UgZG9lc24n
dCByZWxvY2F0ZSBpdHNlbGYsIGlmCj4gdGhlcmUncyBzdWNoIGEgcmVsb2NhdGlvbiB0aGUgcGh5
c2ljYWwgYWRkcmVzc2VzIG9mIG11bHRpYm9vdCBtb2R1bGUKPiBsaXN0IGlzIG5vIGxvbmdlciB2
YWxpZC4KPiAKPiBGaXggdGhpcyBieSBoYW5kaW5nIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgb2YgdGhl
IG1vZHVsZSBsaXN0IHRvIHRoZQo+IGdlbmVyaWMgYm9vdCBwcm9jZXNzIGluc3RlYWQgb2YgaXQn
cyBwaHlzaWNhbCBhZGRyZXNzLiIKClNvdW5kcyBmaW5lLiBCdXQgZGlkbid0IFNlcmdleSBzcG90
IHR3byByZWdpb25zIHRoYXQgd2VyZSBub3QKdGFrZW4gY2FyZSBvZj8gT3IgaXMgdGhlIG90aGVy
IHBhcnQgZGVhbHQgd2l0aCBpbiBwYXRjaCAyPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
