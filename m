From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/TSC: don't allow deadline timer
 to be used with unfixed errata
Date: Fri, 2 Nov 2018 18:34:48 +0000
Message-ID: <738fc0aa-6d8c-7d12-9b91-094f414aa66e@citrix.com>
References: <5BDC7D4002000078001F759D@prv1-mh.provo.novell.com>
 <5BDC7DEB02000078001F75A7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a587=nn=citrix.com=prvs=837a34217=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gIeHc-0005WN-IM
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 18:35:00 +0000
In-Reply-To: <5BDC7DEB02000078001F75A7@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTEvMTggMTY6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluIHByZXBhcmF0aW9uIG9m
IHdyaXRlcyB0byB0aGUgVFNDX0FESlVTVCBNU1IsIGF2b2lkIHRoZSBiYWQKPiBpbnRlcmFjdGlv
biBvZiB3cml0ZXMgdG8gaXQgYW5kIHRoZSBUU0NfREVBRExJTkUgb25lLiBQcmVzdW1hYmx5IHRo
ZQo+IG9yaWdpbmFsIExpbnV4IGNvbW1pdCBiZDkyNDBhMThlICgieDg2L2FwaWM6IEFkZCBUU0Nf
REVBRExJTkUgcXVpcmsgZHVlCj4gdG8gZXJyYXRhIikgcmVmZXJzIHRvIGUuZy4gS0JXMDkyLiAo
T2YgY291cnNlIHRoaXMgaXMgYW4gaXNzdWUgYWxzbwo+IHdpdGhvdXQgdXMgd3JpdGluZyB0aGUg
VFNDX0FESlVTVCBNU1IsIGlmIGluc3RlYWQgZmlybXdhcmUgZGlkIGFscmVhZHkuCj4KPiBUaGUg
ZXJyYXRhIGNoZWNraW5nIGNhbid0IGJlIHB1dCBpbiBpbml0X2FwaWNfbWFwcGluZ3MoKSBhcyBM
aW51eCBkb2VzLAo+IGFzIHRoYXQgcnVucyBiZWZvcmUgd2UgdXBkYXRlIG1pY3JvY29kZSBvbiB0
aGUgYm9vdCBDUFUuIEl0IG5lZWRzIHRvCj4gaGFwcGVuIGJlZm9yZSBjb25zdW1lcnMgb2YgdGR0
X2VuYWJsZWQsIGkuZS4KPiAtIF9fc2V0dXBfQVBJQ19MVlRUKCkgPC0gc2V0dXBfQVBJQ190aW1l
cigpIDwtIHNldHVwX2Jvb3RfQVBJQ19jbG9jaygpCj4gLSAgICAgICAgICAgICAgICAgICAgIDwt
IGNhbGlicmF0ZV9BUElDX2Nsb2NrKCkgPC0gc2V0dXBfYm9vdF9BUElDX2Nsb2NrKCkKPiAtIHNl
dHVwX2Jvb3RfQVBJQ19jbG9jaygpCj4gc2V0dXBfYm9vdF9BUElDX2Nsb2NrKCkgZ2V0cyBjYWxs
ZWQgZnJvbSBzbXBfcHJlcGFyZV9jcHVzKCksIHdoaWNoIHNpdHMKPiBhZnRlciBtaWNyb2NvZGUg
bG9hZGluZyAobm90ZSB0aGF0IGNhbGlicmF0ZV9BUElDX2Nsb2NrKCkgZ2V0cyBjYWxsZWQKPiBi
ZWZvcmUgc2V0dGluZyB0ZHRfZW5hYmxlZCkuCj4KPiBBbHNvIGFkZCBhbiBNRkVOQ0UgYXMgcGVy
IExpbnV4IGNvbW1pdCA1ZDdjNjMxZDkyICgieDg2L2FwaWM6IFNlcmlhbGl6ZQo+IExWVFQgYW5k
IFRTQ19ERUFETElORSB3cml0ZXMiKSwgYnV0IEkgc2VlIG5vIHJlYXNvbiB0byBwdXQgYSBjb25k
aXRpb25hbAo+IGFyb3VuZCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
