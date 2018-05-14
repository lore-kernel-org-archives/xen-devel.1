From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] pci: treat class 0 devices as endpoints
Date: Mon, 14 May 2018 06:46:08 -0600
Message-ID: <5AF9851002000078001C27B0@prv1-mh.provo.novell.com>
References: <20180508093301.7311-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=r2k+=ib=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fICrn-0003wG-9Z
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 12:46:15 +0000
In-Reply-To: <20180508093301.7311-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA1LjE4IGF0IDExOjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IENsYXNzIDAgZGV2aWNlcyBhcmUgbGVnYWN5IHByZSBQQ0kgMi4wIGRldmljZXMgdGhhdCBkaWRu
J3QgaGF2ZSBhCj4gY2xhc3MgY29kZS4gVHJlYXQgdGhlbSBhcyBlbmRwb2ludHMsIHNvIHRoYXQg
dGhleSBjYW4gYmUgaGFuZGxlZCBieQo+IHRoZSBJT01NVSBhbmQgcHJvcGVybHkgcGFzc2VkLXRo
cm91Z2ggdG8gdGhlIGhhcmR3YXJlIGRvbWFpbi4KPiAKPiBTdWNoIGRldmljZSBoYXMgYmVlbiBz
ZWVuIG9uIGEgU3VwZXIgTWljcm8gc2VydmVyLCBsc3BjaSAtdnYgcmVwb3J0czoKPiAKPiAwMDox
My4wIE5vbi1WR0EgdW5jbGFzc2lmaWVkIGRldmljZTogSW50ZWwgQ29ycG9yYXRpb24gRGV2aWNl
IGExMzUgKHJldiAzMSkKPiAJU3Vic3lzdGVtOiBTdXBlciBNaWNybyBDb21wdXRlciBJbmMgRGV2
aWNlIDA5MzEKPiAJRmxhZ3M6IGJ1cyBtYXN0ZXIsIGZhc3QgZGV2c2VsLCBsYXRlbmN5IDAsIElS
USAxMQo+IAlNZW1vcnkgYXQgZGYyMjIwMDAgKDY0LWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3Np
emU9NEtdCj4gCUNhcGFiaWxpdGllczogWzgwXSBQb3dlciBNYW5hZ2VtZW50IHZlcnNpb24gMwo+
IAo+IEFyZ3VhYmx5IHRoaXMgaXMgbm90IGEgbGVnYWN5IGRldmljZSAoc2luY2UgdGhpcyBpcyBh
IG5ldyBzZXJ2ZXIpLCBidXQKPiBpbiBhbnkgY2FzZSBYZW4gbmVlZHMgdG8gZGVhbCB3aXRoIGl0
LgoKV2VsbCwgaXQncyBhIHR3byBmb2xkIGFyZ3VtZW50OiBPbiBvbmUgaGFuZCBJIGFncmVlIHdl
IG91Z2h0IHRvIGJlIGRlYWxpbmcKd2l0aCBjbGFzcyAwLiBPdG9oIHRoaXMgcGFydGljdWxhciBk
ZXZpY2UgaXMgYW4gZXhhbXBsZSB0byB0aGUgY29udHJhcnkgLSB3ZQpzaG91bGQgdHJ5IHRvIGF2
b2lkIHBhc3NpbmcgdGhyb3VnaCBicm9rZW4gZGV2aWNlczogSWYgdGhlaXIgZGVzaWduZXJzIGRv
bid0CmV2ZW4gZ2V0IHRoZSBjbGFzcyBjb2RlIHJpZ2h0LCB3aGF0IG90aGVyIGZsYXdzIGRvIHdl
IGhhdmUgdG8gZXhwZWN0PwpBbnl3YXksIHRoaXMgaXMgbm8gb2JqZWN0aW9uIHRvIHRoZSBhY3R1
YWwgY29kZSBjaGFuZ2UsIEknbSBtZXJlbHkKdW5jb252aW5jZWQgdGhhdCB0aGUgYXJndW1lbnRh
dGlvbiBpcyBwbGF1c2libGUuCgo+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
