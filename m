From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] xen: fill topology info for all
 present cpus
Date: Mon, 03 Sep 2018 07:41:08 -0600
Message-ID: <5B8D39F402000078001E4A17@prv1-mh.provo.novell.com>
References: <20180831152205.21872-1-jgross@suse.com>
 <20180831152205.21872-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ymad=lr=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fwp6R-0001uH-Bk
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 13:41:15 +0000
In-Reply-To: <20180831152205.21872-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA4LjE4IGF0IDE3OjIyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBUaGUg
dG9wb2xvZ3kgaW5mb3JtYXRpb24gb2J0YWluYWJsZSB2aWEgWEVOX1NZU0NUTF9jcHV0b3BvaW5m
byBpcwo+IGZpbGxlZCByYXRoZXIgd2VpcmQ6IHRoZSBzaXplIG9mIHRoZSBhcnJheSBpcyBkZXJp
dmVkIGZyb20gdGhlIGhpZ2hlc3QKPiBvbmxpbmUgY3B1IG51bWJlciwgc28gaW4gY2FzZSB0aGVy
ZSBhcmUgdHJhaWxpbmcgb2ZmbGluZSBjcHVzIHRoZXkKPiB3aWxsIG5vdCBiZSBpbmNsdWRlZC4K
PiAKPiBPbiBhIGR1YWwgY29yZSBzeXN0ZW0gd2l0aCA0IHRocmVhZHMgYm9vdGVkIHdpdGggc210
PTAgd2l0aG91dCB0aGlzCj4gcGF0Y2ggeGwgaW5mbyAtbiB3aWxsIHByaW50Ogo+IAo+IGNwdV90
b3BvbG9neSAgICAgICAgICAgOgo+IGNwdTogICAgY29yZSAgICBzb2NrZXQgICAgIG5vZGUKPiAg
IDA6ICAgICAgIDAgICAgICAgIDAgICAgICAgIDAKPiAgIDE6ICAgICAgIDAgICAgICAgIDAgICAg
ICAgIDAKPiAgIDI6ICAgICAgIDEgICAgICAgIDAgICAgICAgIDAKPiAKPiB3aGlsZSB3aXRoIHRo
aXMgcGF0Y2ggdGhlIG91dHB1dCBpczoKPiAKPiBjcHVfdG9wb2xvZ3kgICAgICAgICAgIDoKPiBj
cHU6ICAgIGNvcmUgICAgc29ja2V0ICAgICBub2RlCj4gICAwOiAgICAgICAwICAgICAgICAwICAg
ICAgICAwCj4gICAxOiAgICAgICAwICAgICAgICAwICAgICAgICAwCj4gICAyOiAgICAgICAxICAg
ICAgICAwICAgICAgICAwCj4gICAzOiAgICAgICAxICAgICAgICAwICAgICAgICAwCj4gCj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KZm9yIHg4Ni4gSSdkIGxpa2UgdGhpcyB0
byBoYXZlIGFuIEFSTSBhY2sgYXMgd2VsbCwgdGhvdWdoLCBmb3IKdGhlcmUgcG9zc2libHkgYmVp
bmcgZGlmZmVyZW5jZXMgaW4gaG93IGNwdV9wcmVzZW50X21hcCBpcwpoYW5kbGVkIGluIHRoZWly
IGNhc2UuIEluIHBhcnRpY3VsYXIgSSBub3RpY2UgdGhhdCB0aGUgb25seSBhY2Nlc3MKdG8gdGhl
IHZhcmlhYmxlIGlzIGluIHNtcF9wcmVwYXJlX2NwdXMoKS4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
