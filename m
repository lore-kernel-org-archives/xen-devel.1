From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [OSSTEST PATCH v2 07/19] ts-host-install: don't use
 the new nic naming scheme
Date: Fri, 19 Jan 2018 17:08:09 +0000
Message-ID: <23138.9721.667173.922904@mariner.uk.xensource.com>
References: <20171031135203.11537-1-wei.liu2@citrix.com>
 <20171031135203.11537-8-wei.liu2@citrix.com>
 <bca1c4ed-c061-3510-e80d-69802a8ac806@linaro.org>
 <3c780892-4aac-1532-d09a-f5e2ce803fdf@linaro.org>
 <20180119142124.h2ldgdssch7duy4s@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qk1k=eo=citrix.com=prvs=550ee7a3f=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1eca9d-0004Ks-O2
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 17:08:37 +0000
In-Reply-To: <20180119142124.h2ldgdssch7duy4s@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW09TU1RFU1QgUEFUQ0ggdjIgMDcvMTld
IHRzLWhvc3QtaW5zdGFsbDogZG9uJ3QgdXNlIHRoZSBuZXcgbmljIG5hbWluZyBzY2hlbWUiKToK
PiBPbiBGcmksIERlYyAxNSwgMjAxNyBhdCAwMzo0NTowNlBNICswMDAwLCBKdWxpZW4gR3JhbGwg
d3JvdGU6Cj4gPiBJIGR1ZyBhIGJpdCBtb3JlLCBzbyAnZm9yY2UgaW50ZXJmYWNlJyB3aWxsIGNy
ZWF0ZSB0aGUKPiA+IC9ldGMvdWRldi9ydWxlcy5kLzcwLXBlcnNpc3RlbnQtbmV0LnJ1bGVzIGZv
ciB0aGUgaW5zdGFsbGVyIGluaXRyZC4KPiA+IAo+ID4gSG93ZXZlciwgaXQgZG9lcyBub3QgZ2V0
IGNvcGllZCB0byB0aGUgaW5zdGFsbGVkIERlYmlhbi4gRm9yIHRoZSBtb21lbnQsIEkKPiA+IHdv
cmthcm91bmQgdGhpcyBieSBjb3B5aW5nIHRoZSBmaWxlIGluIG92ZXJsYXkvIHNvIGl0IGdldCBp
bnN0YWxsZWQuCj4gCj4gSSB0cmllZCB0aGF0IGFzIHdlbGwsIGJ1dCB0aGF0J3Mgd3JvbmcuCj4g
Cj4gVGhhdCB3b3VsZCBtYWtlIHRoZSBnZW5lcmF0ZWQgcnVsZSBnZXQgY29waWVkIGluIHRvIHRo
ZSBob3N0IGluaXRyZCwKPiB3aGljaCBlbmRzIHVwIGJlaW5nIHVzZWQgYXMgdGhlIGd1ZXN0cyBp
bml0cmQgKGF0IGxlYXN0IG9uIHg4NiksIHRoZW4KPiB0aGUgZ3Vlc3Qgd2lsbCBoaWphY2sgdGhl
IGhvc3QncyBJUCBhZGRyZXNzICghKS4KCj8/PwoKMS4gcGVyc2lzdGVudC1uZXQucnVsZXMgY29u
dGFpbnMgaW5mb3JtYXRpb24gc2F5aW5nICJpZiBuaWMgd2l0aAphZGRyZXNzIGFhOmJiOmNjOmRk
OmVlOmZmIHNob3dzIHVwLCBjYWxsIGl0IGV0aDI7IGFsc28sIGRvIG5vdCBjYWxsCmFueXRoaW5n
IGVsc2UgZXRoMiIuICBTbyBpdCBoYXMgbm90aGluZyB0byBkbyB3aXRoIGlwIGFkZHJlc3Nlcy4K
CjIuIGluaXRyZHMgZG9uJ3QgbmVlZCB0byBicmluZyB1cCB0aGUgbmV0d29yayBzbyBJJ20gbm90
IHN1cmUgd2h5IHRoaXMKd291bGQgZW5kIHVwIHRoZXJlLiAgSWYgaXQgZG9lcywgd2UgY291bGQg
YWRkIHNvbWV0aGluZyB0byB0aGUKaW5pdHJhbWZzLXRvb2xzIGNvbmZpZyB0byBzdG9wIGl0LgoK
SWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
