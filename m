From: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH 05/12] xen: add hypercall interfaces for
 domain and cpupool parameter setting
Date: Tue, 18 Sep 2018 17:23:45 -0400
Message-ID: <c4b91aab-f48d-6426-86f2-a10fdd471f04@tycho.nsa.gov>
References: <20180918060309.7186-1-jgross@suse.com>
 <20180918060309.7186-6-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=44s/=ma=tycho.nsa.gov=dgdegra@srs-us1.protection.inumbo.net>)
 id 1g2NTO-0008RR-0R
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 21:23:54 +0000
In-Reply-To: <20180918060309.7186-6-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTgvMjAxOCAwMjowMyBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgYSBuZXcg
ZG9tY3RsIGZvciBzZXR0aW5nIGRvbWFpbiBzcGVjaWZpYyBwYXJhbWV0ZXJzIHNpbWlsYXIgdG8K
PiBYRU5fU1lTQ1RMX3NldF9wYXJhbWV0ZXIgZm9yIGdsb2JhbCBoeXBlcnZpc29yIHBhcmFtZXRl
cnMuCj4gCj4gRW5oYW5jZSBYRU5fU1lTQ1RMX3NldF9wYXJhbWV0ZXIgdG8gYmUgdXNhYmxlIGZv
ciBzZXR0aW5nIGNwdXBvb2wKPiBzcGVjaWZpYyBwYXJhbWV0ZXJzLCB0b28uIEZvciBub3cgZG8g
b25seSBleHRlbmRlZCBwYXJhbWV0ZXIgY2hlY2tpbmcuCj4gVGhlIGNwdXBvb2wgcGFyYW1ldGVy
IHNldHRpbmcgd2lsbCBiZSBhZGRlZCBsYXRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpZb3UgYWxzbyBuZWVkIHRvIGFkZCB0aGUgcGVybWlz
c2lvbiB0byB0aGUgY3JlYXRlX2RvbWFpbl9jb21tb24gbWFjcm8KaW4geGVuLmlmIChjdXJyZW50
bHkgeW91IG9ubHkgbGV0IGRvbTAgbW9kaWZ5IGl0cyBvd24gc2V0dGluZ3MpLiAgSWYKeW91IGlu
dGVuZCB0aGlzIGludGVyZmFjZSB0byBiZSB1c2VkIHRvIG1vZGlmeSBydW5uaW5nIGRvbWFpbnMs
IGFkZGluZwppdCB0byB0aGUgbWFuYWdlX2RvbWFpbiBtYWNybyB3b3VsZCBhbHNvIGJlIHVzZWZ1
bCwgYnV0IHRoYXQncyBub3QgYXMKY3JpdGljYWwuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
