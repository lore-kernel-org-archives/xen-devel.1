From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] p2m: move p2m-common.h inclusion point
Date: Tue, 06 Nov 2018 09:41:37 -0700
Message-ID: <5BE1C44102000078001F8C3C@prv1-mh.provo.novell.com>
References: <5BB7397802000078001EEBA2@prv1-mh.provo.novell.com>
 <47069a3fc8354750a9141aee96ca6bcd@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hxzx=nr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gK4QA-0005zg-5c
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 16:41:42 +0000
In-Reply-To: <47069a3fc8354750a9141aee96ca6bcd@AMSPEX02CL03.citrite.net>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDEyOjIxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMDUgT2N0b2JlciAyMDE4IDExOjE0Cj4+
IFRvOiB4ZW4tZGV2ZWwgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4KPj4gQ2M6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBBbmRyZXcgQ29vcGVyCj4+IDxBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4
LmNvbT47IFdlaQo+PiBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxH
ZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4KPj4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0
cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaQo+PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47Cj4+IFRpbSAo
WGVuLm9yZykgPHRpbUB4ZW4ub3JnPgo+PiBTdWJqZWN0OiBbUEFUQ0hdIHAybTogbW92ZSBwMm0t
Y29tbW9uLmggaW5jbHVzaW9uIHBvaW50Cj4+IAo+PiBUaGUgaGVhZGVyIGlzIChoZW5jZSBpdHMg
bmFtZSkgc3VwcG9zZWQgdG8gYmUgYSBoZWxwZXIgZm9yIHRoZSBwZXItYXJjaAo+PiBwMm0uaCBm
aWxlcy4gSXQgd2FzIG5ldmVyIHN1cHBvc2VkIHRvIGJlIGluY2x1ZGVkIGRpcmVjdGx5LCBhbmQg
Zm9yIHRoZQo+PiBwdXJwb3NlIG9mIHB1dHRpbmcgY29tbW9uIGZ1bmN0aW9uIGRlY2xhcmF0aW9u
cyBpbnRvIHRoZSBjb21tb24gaGVhZGVyCj4+IGl0IGlzIG1vcmUgaGVscGZ1bCBpZiB0aGluZ3Mg
bGlrZSBwMm1fdCBhcmUgYWxyZWFkeSBhdmFpbGFibGUgYXQgdGhlCj4+IGluY2x1c2lvbiBwb2lu
dC4KPj4gCj4+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhbHNvIGRpdGNoIGEgZHVwbGljYXRl
IHB1YmxpYy9tZW1vcnkuaCBmcm9tIHRoZQo+PiBBUk0gaGVhZGVyLgo+PiAKPj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEkgc3VwcG9zZSB5b3Ug
Y291bGQgbm93IGRyb3AgdGhlICdmb3J3YXJkIGVudW0gZGVjbGFyYXRpb24nIHBhcnQgb2YgbXkg
cGF0Y2ggCj4gbm93IHRoYXQgaXQgaXMgbm8gbG9uZ2VyIGZvcndhcmRzIChkZXBlbmRpbmcgb24g
d2hpY2ggaXMgY29tbWl0dGVkIGZpcnN0IG9mIAo+IGNvdXJzZSkuCgpDb3VsZCB5b3UgcmVtaW5k
IG1lIHdoaWNoIHBhdGNoIGFuZC9vciBoZWFkZXIgdGhpcyB3YXMgaW4/CkkgY2FuJ3Qgc2VlbSB0
byBiZSBhYmxlIHRvIGxvY2F0ZSBpdCAuLi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
