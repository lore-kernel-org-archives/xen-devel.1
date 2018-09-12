From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 08/14] vtd: add lookup_page method to
 iommu_ops
Date: Wed, 12 Sep 2018 03:12:58 -0600
Message-ID: <5B98D89A02000078001E7B14@prv1-mh.provo.novell.com>
References: <20180823094711.21376-1-paul.durrant@citrix.com>
 <20180823094711.21376-9-paul.durrant@citrix.com>
 <5B925CC402000078001E6538@prv1-mh.provo.novell.com>
 <f341403b1c684f6a82ec85905599178e@AMSPEX02CL03.citrite.net>
 <5B98D1B702000078001E7A8F@prv1-mh.provo.novell.com>
 <77f7af1c0daf48c9ab66bbd77cc022ec@AMSPEX02CL03.citrite.net>
 <2c79d7d0775c4cbe8dc7577ab6b08e74@AMSPEX02CL03.citrite.net>
 <22882dd60fc847728f96b2d4b9c0a9d3@AMSPEX02CL03.citrite.net>
 <5B98D65E02000078001E7ACF@prv1-mh.provo.novell.com>
 <7ad76f0c35584cf08adcffaf1fe5bba4@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mhj0=l2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g01Cp-0000VT-6K
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 09:13:03 +0000
In-Reply-To: <7ad76f0c35584cf08adcffaf1fe5bba4@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjA5LjE4IGF0IDExOjA1LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAxMiBTZXB0ZW1iZXIgMjAxOCAxMDowMwo+PiAKPj4gQSBIVk0gZ3Vlc3QgdXNpbmcgdGhlIFBW
IElPTU1VIGlzIHF1aXRlIGZpbmUsIGJ1dCBpdCBzaG91bGRuJ3QgdGFsayB0bwo+PiBpdCBpbiB0
ZXJtcyBvZiBNRk5zLgo+PiAKPiAKPiBXZWxsLCBpdCBoYXMgdG8gdGFsayBNRk5zIGF0IHNvbWUg
bGV2ZWwsIHN1cmVseT8gVGhlIG91dHB1dCBvZiB0aGUgSU9NTVUgaXMgCj4gbm90IHN1YmplY3Qg
dG8gRVBUL05QVCwgcmlnaHQ/CgpZZXMgdG8gdGhlIHNlY29uZCBxdWVzdGlvbiwgYnV0IG5vIHRv
IHRoZSBmaXJzdDogVGhlIEdGTiAtPiBNRk4gdHJhbnNsYXRpb24Kc2hvdWxkIHN0aWxsIGJlIGRv
bmUgaW5zaWRlIFhlbiBpbiB0aGUgSFZNIGNhc2UsIGltbyAoaW4gdGhlIGNvdXJzZSBvZgptYW51
ZmFjdHVyaW5nIHRoZSBQVEUpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
