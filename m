From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 7/7] x86/IOMMU: initialize iommu_ops in
 vendor-independent code
Date: Fri, 29 Mar 2019 03:15:17 -0600
Message-ID: <5C9DE2250200007800222B61@prv1-mh.provo.novell.com>
References: <5C9CDDAF020000780022282A@prv1-mh.provo.novell.com>
 <5C9CE0270200007800222881@prv1-mh.provo.novell.com>
 <80a0095f-93ff-2f92-f8fd-f58d78b0f026@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9nbb-00032T-T4
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 09:15:19 +0000
In-Reply-To: <80a0095f-93ff-2f92-f8fd-f58d78b0f026@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAzLjE5IGF0IDE4OjUwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjgvMDMvMjAxOSAxNDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3g4Ni9pb21tdS5jCj4+IEBAIC0yNiw2ICsyNiwxOSBAQAo+PiAgY29uc3Qgc3Ry
dWN0IGlvbW11X2luaXRfb3BzICpfX2luaXRkYXRhIGlvbW11X2luaXRfb3BzOwo+PiAgc3RydWN0
IGlvbW11X29wcyBfX3JlYWRfbW9zdGx5IGlvbW11X29wczsKPj4gIAo+PiAraW50IF9faW5pdCBp
b21tdV9oYXJkd2FyZV9zZXR1cCh2b2lkKQo+PiArewo+PiArICAgIGlmICggIWlvbW11X2luaXRf
b3BzICkKPj4gKyAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4+ICsKPj4gKyAgICBpZiAoICFpb21t
dV9vcHMuaW5pdCApCj4+ICsgICAgICAgIGlvbW11X29wcyA9ICppb21tdV9pbml0X29wcy0+b3Bz
Owo+PiArICAgIGVsc2UKPj4gKyAgICAgICAgQVNTRVJUKGlvbW11X29wcy5pbml0ID09IGlvbW11
X2luaXRfb3BzLT5vcHMtPmluaXQpOwo+IAo+IFdoYXQgaXMgdGhpcyBBU1NFUlQoKSBpbnRlbmRl
ZCB0byBjYXRjaD8gIFdlIHBhc3MgdGhyb3VnaCB0aGlzIGZ1bmN0aW9uCj4gZXhhY3RseSBvbmNl
LCBtYWtpbmcgdGhlIGVsc2UgcGF0aCBkZWFkLgoKaW9tbXVfb3BzIG1heSBoYXZlIGdvdCBzZXQg
YWxyZWFkeSBkdXJpbmcgeDJBUElDIElSIGVuYWJsaW5nIChzZWUKcGF0Y2ggNikuCgo+IERvIHlv
dSBoYXZlIHNvbWUgcGxhbnMgaW4gZnV0dXJlIHNlcmllcyB3aGljaCBtYWtlIHRoaXMgYSBub24t
aW5pdCBmdW5jdGlvbj8KCk5vLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
