From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v19 06/11] x86/hvm/ioreq: add a new mappable
 resource type...
Date: Fri, 30 Mar 2018 02:56:46 -0600
Message-ID: <5ABDFBCE020000780012BFD8@prv1-mh.provo.novell.com>
References: <20180329153616.2929-1-paul.durrant@citrix.com>
 <20180329153616.2929-7-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=keyz=gu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f1pq6-0004TI-9w
 for xen-devel@lists.xenproject.org; Fri, 30 Mar 2018 08:56:50 +0000
In-Reply-To: <20180329153616.2929-7-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: paul.durrant@citrix.com
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IDAzLzI5LzE4IDU6NDkg
UE0gPj4+Cj4uLi4gWEVOTUVNX3Jlc291cmNlX2lvcmVxX3NlcnZlcgo+Cj5UaGlzIHBhdGNoIGFk
ZHMgc3VwcG9ydCBmb3IgYSBuZXcgcmVzb3VyY2UgdHlwZSB0aGF0IGNhbiBiZSBtYXBwZWQgdXNp
bmcKPnRoZSBYRU5NRU1fYWNxdWlyZV9yZXNvdXJjZSBtZW1vcnkgb3AuCj4KPklmIGFuIGVtdWxh
dG9yIG1ha2VzIHVzZSBvZiB0aGlzIHJlc291cmNlIHR5cGUgdGhlbiwgaW5zdGVhZCBvZiBtYXBw
aW5nCj5nZm5zLCB0aGUgSU9SRVEgc2VydmVyIHdpbGwgYWxsb2NhdGUgcGFnZXMgd2hpY2ggYXJl
IGFzc2lnbmVkIHRvIHRoZQo+ZW11bGF0aW5nIGRvbWFpbi4gVGhlc2UgcGFnZXMgd2lsbCBuZXZl
ciBiZSBwcmVzZW50IGluIHRoZSBQMk0gb2YgdGhlCj5ndWVzdCBhdCBhbnkgcG9pbnQgKGFuZCBh
cmUgbm90IGV2ZW4gc2hhcmVkIHdpdGggdGhlIGd1ZXN0KSBhbmQgc28gYXJlIG5vdAo+dnVsbmVy
YWJsZSB0byBhbnkgZGlyZWN0IGF0dGFjayBieSB0aGUgZ3Vlc3QuCj4KPk5PVEU6IFVzZSBvZiB0
aGUgbmV3IHJlc291cmNlIHR5cGUgaXMgbm90IGNvbXBhdGlibGUgd2l0aCB1c2Ugb2YKPlhFTl9E
TU9QX2dldF9pb3JlcV9zZXJ2ZXJfaW5mbyB1bmxlc3MgdGhlIFhFTl9ETU9QX25vX2dmbnMgZmxh
ZyBpcwo+c2V0Lgo+Cj5TaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
