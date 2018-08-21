From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 32/34] x86: expose CONFIG_HVM
Date: Tue, 21 Aug 2018 06:57:55 -0600
Message-ID: <5B7C0C5302000078001E0812@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <b1ac4290c63a0ea02915bdbb958f2c28409e406c.1534518694.git-series.wei.liu2@citrix.com>
 <5B7BFC2402000078001E0744@prv1-mh.provo.novell.com>
 <078223f6-2923-7b1e-6f62-eb3abc80f00b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs6ER-0007XX-Tu
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 12:57:59 +0000
In-Reply-To: <078223f6-2923-7b1e-6f62-eb3abc80f00b@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA4LjE4IGF0IDE0OjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjEvMDgvMjAxOCAxMjo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE3
LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAtLS0gYS94
ZW4vYXJjaC94ODYvS2NvbmZpZwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcKPj4+IEBA
IC02MCw2ICs2MCwxMiBAQCBjb25maWcgUFZfTElORUFSX1BUCj4+PiAgCj4+PiAgY29uZmlnIEhW
TQo+Pj4gIAlkZWZfYm9vbCB5Cj4+PiArCXByb21wdCAiSFZNIC8gUFZIIHN1cHBvcnQiCj4+PiAr
ICAgICAgIC0tLWhlbHAtLS0KPj4+ICsgICAgICAgICBJbnRlcmZhY2VzIHRvIHN1cHBvcnQgSFZN
IGFuZCBQVkggZ3Vlc3RzLgo+Pj4gKwo+Pj4gKyAgICAgICAgIElmIHVuc3VyZSwgc2F5IFkuCj4+
IEFzIHNhaWQgYmVmb3JlLCB0aGlzIHdhbnRzIHRvIGdhaW4gYSBkZXBlbmRlbmN5IG9uICFQVl9T
SElNX0VYQ0xVU0lWRS4KPiAKPiBObyAtIGl0IHNob3VsZCBub3QuCj4gCj4gRGVwZW5kZW5jaWVz
IGZvcmNlIG9wdGlvbnMgdG8gYmUgaGlkZGVuIGluIEtjb25maWcsIHdoaWNoIGxlYWQgdG8gdmVy
eQo+IHBvb3IgdXNlIGV4cGVyaWVuY2UgZm9yIHBlb3BsZSB0cnlpbmcgdG8gZmluZCBhbiBvcHRp
b24gdGhleSBleHBlY3QgdG8KPiBiZSBhdmFpbGFibGUuCj4gCj4gVGhlcmUgbm8gZnVuY3Rpb25h
bCBkZXBlbmRlbmN5IGJldHdlZW4gSFZNIGFuZCBQVl9TSElNX0VYQ0xVU0lWRSwgc28KPiB0aGVy
ZSBzaG91bGQgYmUgbm8gZGVwZW5kZW5jeSBpbiBLY29uZmlnLiAgUFZfU0hJTV9FWENMVVNJVkUg
c2hvdWxkCj4gcHJvYmFibHkgcmVjb21tZW5kIGluIGl0cyBoZWxwIHRleHQgdG8gZGlzYWJsZSBI
Vk0sIGJ1dCB0aGF0IGlzIHRoZSBtb3N0Cj4gd2hpY2ggS2NvbmZpZyBzaG91bGQgaW5mbHVlbmNl
LgoKSSBkaXNhZ3JlZTsgYXQgdGhlIHZlcnkgbGVhc3QgdGhlIGRlZmF1bHQgb2YgdGhlIG9wdGlv
biBoZXJlIHNob3VsZApub3QgYmUgWWVzIHdoZW4gUFZfU0hJTV9FWENMVVNJVkUgaXMgZW5hYmxl
ZC4gQnV0IEkgdGhpbmsgYQpkZXBlbmRzIGlzIFRoZSBSaWdodCBUaGluZyBUbyBEbyAodG0pIGhl
cmU7IHVzZXIgZXhwZXJpZW5jZSB3aGVuCnVzaW5nIHRoZSB2YXJpb3VzIGZyb250ZW5kcyBpcyBv
bmx5IG9uZSBhc3BlY3QsIHVzZXJzIGdldHRpbmcgdGhlaXIKc2VsZWN0aW9ucyB3cm9uZyBiZWNh
dXNlIHRoZXkndmUgYmVlbiBnaXZlbiB0b28gbXVjaCBjb250cm9sIGlzCmFub3RoZXIuIFdoYXQg
YnVzaW5lc3Mgd291bGQgYSB1c2VyIHdhbnRpbmcgdG8gY29uZmlndXJlIHRoZSBzaGltCmhhdmUg
ZmluZGluZyB0aGUgSFZNIG9wdGlvbj8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
