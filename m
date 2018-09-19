From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 05/12] xen: add hypercall interfaces for
 domain and cpupool parameter setting
Date: Wed, 19 Sep 2018 07:14:07 +0200
Message-ID: <71c7313c-9efb-0ad0-9be4-eed7e3ee692d@suse.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <20180918060309.7186-6-jgross@suse.com>
 <c4b91aab-f48d-6426-86f2-a10fdd471f04@tycho.nsa.gov>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0kue=mb=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g2UoW-0007k4-Ps
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 05:14:12 +0000
In-Reply-To: <c4b91aab-f48d-6426-86f2-a10fdd471f04@tycho.nsa.gov>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMDkvMTggMjM6MjMsIERhbmllbCBEZSBHcmFhZiB3cm90ZToKPiBPbiAwOS8xOC8yMDE4
IDAyOjAzIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBBZGQgYSBuZXcgZG9tY3RsIGZvciBz
ZXR0aW5nIGRvbWFpbiBzcGVjaWZpYyBwYXJhbWV0ZXJzIHNpbWlsYXIgdG8KPj4gWEVOX1NZU0NU
TF9zZXRfcGFyYW1ldGVyIGZvciBnbG9iYWwgaHlwZXJ2aXNvciBwYXJhbWV0ZXJzLgo+Pgo+PiBF
bmhhbmNlIFhFTl9TWVNDVExfc2V0X3BhcmFtZXRlciB0byBiZSB1c2FibGUgZm9yIHNldHRpbmcg
Y3B1cG9vbAo+PiBzcGVjaWZpYyBwYXJhbWV0ZXJzLCB0b28uIEZvciBub3cgZG8gb25seSBleHRl
bmRlZCBwYXJhbWV0ZXIgY2hlY2tpbmcuCj4+IFRoZSBjcHVwb29sIHBhcmFtZXRlciBzZXR0aW5n
IHdpbGwgYmUgYWRkZWQgbGF0ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPiAKPiBZb3UgYWxzbyBuZWVkIHRvIGFkZCB0aGUgcGVybWlzc2lv
biB0byB0aGUgY3JlYXRlX2RvbWFpbl9jb21tb24gbWFjcm8KPiBpbiB4ZW4uaWYgKGN1cnJlbnRs
eSB5b3Ugb25seSBsZXQgZG9tMCBtb2RpZnkgaXRzIG93biBzZXR0aW5ncykuwqAgSWYKPiB5b3Ug
aW50ZW5kIHRoaXMgaW50ZXJmYWNlIHRvIGJlIHVzZWQgdG8gbW9kaWZ5IHJ1bm5pbmcgZG9tYWlu
cywgYWRkaW5nCj4gaXQgdG8gdGhlIG1hbmFnZV9kb21haW4gbWFjcm8gd291bGQgYWxzbyBiZSB1
c2VmdWwsIGJ1dCB0aGF0J3Mgbm90IGFzCj4gY3JpdGljYWwuCgpUaGFua3MsIHdpbGwgZG8uCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
