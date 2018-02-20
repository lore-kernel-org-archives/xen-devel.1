From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/4] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Tue, 20 Feb 2018 05:32:17 -0700
Message-ID: <5A8C236102000078001A994B@prv-mh.provo.novell.com>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-4-roger.pau@citrix.com>
 <5A8BF53C02000078001A97CE@prv-mh.provo.novell.com>
 <20180220101916.ve5gcjq6c53tkiey@MacBook-Pro-de-Roger.local>
 <20180220110108.tsekpststokuw5mo@MacBook-Pro-de-Roger.local>
 <5A8C10F602000078001A9895@prv-mh.provo.novell.com>
 <20180220112231.o56tu5issvljuxxn@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wunw=fo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eo75x-0007ez-Uu
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 12:32:29 +0000
In-Reply-To: <20180220112231.o56tu5issvljuxxn@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjAyLjE4IGF0IDEyOjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgRmViIDIwLCAyMDE4IGF0IDA0OjEzOjQyQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjAuMDIuMTggYXQgMTI6MDEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaAo+PiA+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYXNtX2RlZm5zLmgKPj4gPiBAQCAtMTUsNiArMTUsOSBA
QAo+PiA+ICAjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4+ID4gCj4+ID4gICNpZmRlZiBf
X0FTU0VNQkxZX18KPj4gPiArI2lmbmRlZiBDT05GSUdfSU5ESVJFQ1RfVEhVTksKPj4gPiArLmVx
dSBDT05GSUdfSU5ESVJFQ1RfVEhVTkssIDAKPj4gPiArI2VuZGlmCj4+ID4gICMgaW5jbHVkZSA8
YXNtL2luZGlyZWN0X3RodW5rX2FzbS5oPgo+PiA+ICAjZWxzZQo+PiA+ICBhc20gKCAiXHQuZXF1
IENPTkZJR19JTkRJUkVDVF9USFVOSywgIgo+PiA+IAo+PiA+IEl0J3MgZmFpcmx5IHNpbWlsYXIg
dG8gbXkgZmlyc3QgYXBwcm9hY2gsIGJ1dCBhdCBsZWFzdCAiI2lmZGVmCj4+ID4gQ09ORklHX0lO
RElSRUNUX1RIVU5LIiB3aWxsIHN0aWxsIHdvcmsgYXMgZXhwZWN0ZWQgYWZ0ZXIgdGhpcyBmaXgu
Cj4+IAo+PiBJJ3ZlIHVzZWQgc29tZXRoaW5nIHNpbWlsYXIgaW4gYmFja3BvcnRzIHRvIG9sZCB2
ZXJzaW9ucywgc28gSQo+PiB3b25kZXIgd2hldGhlciB3aGF0IHlvdSBxdW90ZSBhYm92ZSBpcyBy
aWdodDogQXNzZW1ibHkgZmlsZXMKPj4gZG9uJ3QgZ2V0IGhhbmRlZCB0byBjbGFuZyBhbnl3YXkg
aWlyYywgc28gdGhlIGNoYW5nZSB3b3VsZAo+PiBzZWVtIHRvIGJlIG5lZWRlZCBpbiB0aGUgI2Vs
c2UgcGFydCBvZiB0aGUgY29uZGl0aW9uYWwuCj4gCj4gQXNzZW1ibHkgZmlsZXMgZG8gZ2V0IGhh
bmRlZCB0byBjbGFuZywgZnJvbSB4ZW4vUnVsZXMubWs6Cj4gCj4gJS5vOiAlLlMgTWFrZWZpbGUK
PiAJJChDQykgJChBRkxBR1MpIC1jICQ8IC1vICRACj4gCj4gWGVuIGRvZXNuJ3QgY2FsbCBhcyBk
aXJlY3RseSB0byBjb21waWxlIHRob3NlLCBvciBhbSBJIG1pc3NpbmcKPiBzb21ldGhpbmc/CgpP
aCwgSSB3YXMgcmVmZXJyaW5nIHRvIHRoZSAtbW5vLWludGVncmF0ZWQtYXMgKG9yIHdoYXRldmVy
IGl0J3MKY2FsbGVkKSBvcHRpb24uICJIYW5kZWQgdG8gY2xhbmciIHdhc24ndCB0aGUgYmVzdCB3
YXkgdG8gcHV0IGl0LApJIGFncmVlLiBCdXQgaXQncyBjbGFuZydzIGludGVncmF0ZWQgYXNzZW1i
bGVyIHdoaWNoIHRoZSBwcm9ibGVtCmlzIHdpdGguCgpKYW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
