From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 01/12] xen: clang: Support correctly
 cross-compile
Date: Fri, 29 Mar 2019 04:14:18 -0600
Message-ID: <5C9DEFFA0200007800222BF1@prv1-mh.provo.novell.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-2-julien.grall@arm.com>
 <5C9C9A22020000780022265A@prv1-mh.provo.novell.com>
 <25c9291b-51dc-e45c-2fc7-b6d6c89f05b8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9oWh-0000fy-Jo
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 10:14:19 +0000
In-Reply-To: <25c9291b-51dc-e45c-2fc7-b6d6c89f05b8@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAzLjE5IGF0IDEwOjQxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDI4LzAzLzIwMTkgMDk6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNy4wMy4x
OSBhdCAxOTo0NSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IENsYW5nIHVzZXMg
Ii10YXJnZXQiIG9wdGlvbiBmb3IgY3Jvc3MtY29tcGlsYXRpb24uCj4+IAo+Pj4gLS0tIGEvY29u
ZmlnL1N0ZEdOVS5tawo+Pj4gKysrIGIvY29uZmlnL1N0ZEdOVS5tawo+Pj4gQEAgLTEsOCArMSwx
MyBAQAo+Pj4gICBBUyAgICAgICAgID0gJChDUk9TU19DT01QSUxFKWFzCj4+PiAgIExEICAgICAg
ICAgPSAkKENST1NTX0NPTVBJTEUpbGQKPj4+ICAgaWZlcSAoJChjbGFuZykseSkKPj4+IC1DQyAg
ICAgICAgID0gJChDUk9TU19DT01QSUxFKWNsYW5nCj4+PiAtQ1hYICAgICAgICA9ICQoQ1JPU1Nf
Q09NUElMRSljbGFuZysrCj4+PiAraWZuZXEgKCQoQ1JPU1NfQ09NUElMRSksKQo+Pj4gK0NDICAg
ICAgICAgPSBjbGFuZyAtdGFyZ2V0ICQoQ1JPU1NfQ09NUElMRTotPSkKPj4+ICtDWFggICAgICAg
ID0gY2xhbmcrKyAtdGFyZ2V0ICQoQ1JPU1NfQ09NUElMRTotPSkKPj4gCj4+IElzIGRyb3BwaW5n
IGRhc2hlcyBmcm9tIHRoZSB2YXJpYWJsZSB1bmlmb3JtbHkgY29ycmVjdD8gSWYgc28sCj4+IGNv
dWxkIHlvdSBwbGVhc2UgY2xhcmlmeSBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2h5IHRoYXQgaXM/
Cj4gVGhlIHRhcmdldCBvcHRpb24gcmVxdWlyZXMgdGhlIGZvbGxvd2luZyBmb3JtYXQ6Cj4gCj4g
PGFyY2g+PHN1Yj4tPHZlbmRvcj4tPHN5cz4tPGFiaT4KPiAKPiBJbiBvdGhlciBwbGFjZXMsIHdl
IG5lZWQgdGhlIHRyYWlsaW5nIGRhc2ggYXMgR05VIHRvb2xzIGFyZSB1c2luZyB0aGUgc2FtZSAK
PiBmb3JtYXQgYXMgYWJvdmUgd2l0aCBhIGRhc2ggdG8gc2VwYXJhdGUgdGhlIHRvb2wgbmFtZS4K
Ck9oLCBJJ20gc29ycnkgLSBJIGtlZXAgZm9yZ2V0dGluZyB0aGF0IHRoZSBzdWJzdGl0dXRpb24g
Zm9ybSB5b3UKdXNlIG9ubHkgZmlkZGxlcyB3aXRoIHRyYWlsaW5nIGRhc2hlcy4gT2YgY291cnNl
IEkgd29uJ3QgaW5zaXN0LCBidXQKSSdkIHByZWZlciB0aGUgbW9yZSBvYnZpb3VzICQocGF0c3Vi
c3QgJS0sJSwkKENST1NTX0NPTVBJTEUpKQp0byBiZSB1c2VkIGluc3RlYWQsIGRlc3BpdGUgcmVh
bGl6aW5nIHRoYXQgaXQncyBtZWFuaW5nZnVsbHkgbG9uZ2VyLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
