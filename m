From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Thu, 22 Mar 2018 07:20:00 -0600
Message-ID: <5AB3BB9002000078001B5134@prv-mh.provo.novell.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
 <20180319155802.immvsgqttrs3yezg@MacBook-Pro-de-Roger.local>
 <20180320054922.00005669@gmail.com>
 <20180320085048.orjv67qtwhe35ntl@MacBook-Pro-de-Roger.local>
 <20180321105840.00004698@gmail.com>
 <20180321090911.qd6epofdaywc4blb@MacBook-Pro-de-Roger.local>
 <20180322002540.000032f1@gmail.com>
 <20180321152017.bv32mt4bpxaa7zfr@MacBook-Pro-de-Roger.local>
 <20180322025656.00005281@gmail.com>
 <3a237f106c9348799473fca673f7ef7c@AMSPEX02CL03.citrite.net>
 <20180322103142.0000423c@gmail.com>
 <5AB37FA002000078001B4DD5@prv-mh.provo.novell.com>
 <20180322195506.00000d4a@gmail.com>
 <6dd0dcee536c44409bda0729bdac5164@AMSPEX02CL03.citrite.net>
 <20180322215636.000042ea@gmail.com>
 <5AB3AB1802000078001B5065@prv-mh.provo.novell.com>
 <20180322230511.00000b6a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ez08S-0005fP-RC
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 13:20:04 +0000
In-Reply-To: <20180322230511.00000b6a@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey G <x1917x@gmail.com>
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, PaulDurrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAzLjE4IGF0IDE0OjA1LCA8eDE5MTd4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24g
VGh1LCAyMiBNYXIgMjAxOCAwNjowOTo0NCAtMDYwMAo+ICJKYW4gQmV1bGljaCIgPEpCZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToKPiAKPj4+Pj4gT24gMjIuMDMuMTggYXQgMTI6NTYsIDx4MTkxN3hA
Z21haWwuY29tPiB3cm90ZTogIAo+Pj4gSSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgc29t
ZSBwZW9wbGUgaGF2ZSB0aGF0IGZlYXIgb2YgZW11bGF0ZWQKPj4+IE1NQ09ORklHIC0tIGl0J3Mg
cmVhbGx5IHRoZSBzYW1lIHRoaW5nIGFzIGFueSBvdGhlciBNTUlPIHJhbmdlIFFFTVUKPj4+IGFs
cmVhZHkgZW11bGF0ZXMgdmlhIG1hcF9pb19yYW5nZV90b19pb3JlcV9zZXJ2ZXIoKS4gTm8gc2Vu
c2l0aXZlCj4+PiBpbmZvcm1hdGlvbiBleHBvc2VkLiBJdCBpcyByZWxhdGVkIG9ubHkgdG8gZW11
bGF0ZWQgUENJIGNvbmYgc3BhY2UKPj4+IHdoaWNoIFFFTVUgYWxyZWFkeSBrbm93cyBhYm91dCBh
bmQgdXNlLCBwcm92aWRpbmcgZW11bGF0ZWQgUENJCj4+PiBkZXZpY2VzIGZvciBpdC4gIAo+Pgo+
PllvdSBjb250aW51ZSB0byBpZ25vcmUgdGhlIHJvdXRpbmcgcmVxdWlyZW1lbnQgbXVsdGlwbGUg
aW9yZXEKPj5zZXJ2ZXJzIGltcG9zZS4KPiAKPiBJZiB0aGUgZW11bGF0ZWQgTU1DT05GSUcgYXBw
cm9hY2ggd2lsbCBiZSBtb2RpZmllZCB0byBiZWNvbWUKPiBmdWxseSBjb21wYXRpYmxlIHdpdGgg
bXVsdGlwbGUgaW9yZXEgc2VydmVycyAod2hhdGV2ZXIgdGhleSB1c2VkIGZvciksIEkKPiBhc3N1
bWUgdGhlcmUgd2lsbCBiZSBubyBvYmplY3Rpb25zIHRoYXQgZW11bGF0ZWQgTU1DT05GSUcgY2Fu
J3QgYmUKPiB1c2VkPwo+IEkganVzdCB3YW50IHRvIGNsYXJpZnkgdGhpcyBtb21lbnQgLS0gd2h5
IHBlb3BsZSB0aGluayB0aGF0Cj4gYSBjb21wbGV0ZWx5IGVtdWxhdGVkIE1NSU8gcmFuZ2UsIG5v
dCByZWxhdGVkIGluIGFueQo+IHdheSB0byBob3N0J3MgTU1DT05GSUcgbWF5IGNvbXByb21pc2Ug
c29tZXRoaW5nLgoKQ29tcHJvbWlzZT8gQWxsIHRoYXQgd2FzIHNhaWQgc28gZmFyIC0gYWZhaXIg
LSB3YXMgdGhhdCB0aGlzIGlzIHRoZQp3cm9uZyB3YXkgcm91bmQgZGVzaWduIHdpc2UuCgpKYW4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
