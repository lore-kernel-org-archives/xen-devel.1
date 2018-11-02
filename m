From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 14/16] x86: make entry point code build
 when !CONFIG_PV
Date: Fri, 2 Nov 2018 13:08:13 +0000
Message-ID: <20181102130813.362jdoaaz6ravnym@zion.uk.xensource.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <af9f79239874ca4257e136b74460646d36363650.1539959287.git-series.wei.liu2@citrix.com>
 <5BD7213602000078001F5DF4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1awx=nn=citrix.com=prvs=837bb29b5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gIZBQ-0005Rv-TP
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 13:08:16 +0000
Content-Disposition: inline
In-Reply-To: <5BD7213602000078001F5DF4@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMDk6MDM6MThBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjEwLjE4IGF0IDE2OjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBAQCAtNTQ4LDEwICs1NTAsMTQgQEAgRU5UUlkocmV0X2Zyb21faW50cikKPiA+ICAg
ICAgICAgIEdFVF9DVVJSRU5UKGJ4KQo+ID4gICAgICAgICAgdGVzdGIgJDMsIFVSRUdTX2NzKCVy
c3ApCj4gPiAgICAgICAgICBqeiAgICByZXN0b3JlX2FsbF94ZW4KPiA+ICsjaWZkZWYgQ09ORklH
X1BWCj4gPiAgICAgICAgICBtb3ZxICBWQ1BVX2RvbWFpbiglcmJ4KSwgJXJheAo+ID4gICAgICAg
ICAgY21wYiAgJDAsIERPTUFJTl9pc18zMmJpdF9wdiglcmF4KQo+ID4gICAgICAgICAgamUgICAg
dGVzdF9hbGxfZXZlbnRzCj4gPiAgICAgICAgICBqbXAgICBjb21wYXRfdGVzdF9hbGxfZXZlbnRz
Cj4gPiArI2Vsc2UKPiA+ICsgICAgICAgIEJVRwo+ID4gKyNlbmRpZgo+IAo+IEhtbSwgbm90IHN1
cmUgaGVyZSAoYW5kIGVsc2V3aGVyZSk6IEFub3RoZXIgb3B0aW9uIGlzIHRvCj4gc3RyZWFtbGlu
ZSBleGVjdXRpb24gYnkgcmVwbGFjaW5nIHRoZSBjb25kaXRpb25hbCBicmFuY2ggd2l0aCBhbgo+
IHVuY29uZGl0aW9uYWwgb25lIGluIHRoZSAhUFYgY2FzZS4gQW5kcmV3LCBkbyB5b3UgaGF2ZSBh
bnkKPiB0aG91Z2h0cyBlaXRoZXIgd2F5PwoKTXkgb3JpZ2luYWwgdGhvdWdodCB3YXMgdG8gY2F0
Y2ggcG90ZW50aWFsIGlzc3VlcyBpbiBYZW4gY29kZSB3aGljaAptZXNzZXMgdXAgd2l0aCB0aGUg
cGVybWlzc2lvbiBsZXZlbC4gIFVzaW5nIHVuY29uZGl0aW9uYWwganVtcCBpcyBmaW5lCmJ5IG1l
LCB0b28uIEJ1dCBpbiB0aGF0IGNhc2UgSSB3aWxsIHNlZWsgdG8gYXQgbGVhc3QgYWRkIGFuIGFz
c2VydGlvbgpmb3IgZGVidWcgYnVpbGQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
