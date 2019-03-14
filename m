From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-next 7/9] xen: Convert is_xen_heap_mfn
 to use typesafe MFN
Date: Thu, 14 Mar 2019 12:18:33 +0000
Message-ID: <671d43cf-5a1d-e7c5-69c5-72534c6ad6f4@citrix.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-8-julien.grall@arm.com>
 <5C891BFF020000780021E35F@prv1-mh.provo.novell.com>
 <e36aeed3-0d7f-f0e6-4e13-adf4d44db0be@arm.com>
 <5C8A0856020000780021E649@prv1-mh.provo.novell.com>
 <f78bf48b-9371-20bf-98cb-9daf3143c39b@arm.com>
 <008b64d6-8ef2-be9c-ed4c-999d61fbfd61@citrix.com>
 <5C8A3F5D020000780021E8A3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rzje=RR=citrix.com=prvs=969ff7116=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4PJl-0005PG-Hf
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 12:18:37 +0000
In-Reply-To: <5C8A3F5D020000780021E8A3@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxMTo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDMuMTkg
YXQgMTE6MTQsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gWW91IGRvIGtu
b3cgdGhhdCBtZm5fYWRkKG1mbiwgLTEpIHdpbGwgRFRSVD8KPiBJdCB3aWxsLCBidXQgaW1vIGl0
IGxvb2tzIHNsaWdodGx5IG9kZCBpbiBwYXJ0aWN1bGFyIGluIGUuZy4KPiBmb3IgKCAuLi47IC4u
LjsgbWZuX2FkZChtZm4sIC0xKSApLCBoZW5jZSBJIGRpZG4ndCBzdWdnZXN0IGl0LiBCdXQKPiBJ
IGRvbid0IG9iamVjdCBlaXRoZXIuCgpXZWxsIC0gaW4gbWF0aGVtYXRpY3MsIHggLSAxIGlzIGlk
ZW50aWNhbCB0byB4ICsgKC0xKSwgc28gdGhlIGNvbnN0cnVjdApkb2Vzbid0IGxvb2sgb3Zlcmx5
IG9kZCB0byBtZS4KCkFsdGVybmF0aXZlbHksIHdlIGNvdWxkIHJlbmFtZSBtZm5fYWRkIHRvIHNv
bWV0aGluZyBlbHNlLCBidXQgbm90aGluZwpjb21lcyB0byBtaW5kIHdoaWNoIHdvdWxkIGJlIGFz
IGNsZWFyLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
