From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] automation: add SLES 11 SP4 dockerfile
Date: Wed, 18 Jul 2018 09:04:08 +0100
Message-ID: <20180718080408.6huubhhke3nex42f@citrix.com>
References: <20180717200305.4067-1-wei.liu2@citrix.com>
 <5B4EEB6202000078001D5366@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ab30=kc=citrix.com=prvs=730fbb136=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ffhRV-00034z-K2
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 08:04:13 +0000
Content-Disposition: inline
In-Reply-To: <5B4EEB6202000078001D5366@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMDE6MjU6MjJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE3LjA3LjE4IGF0IDIyOjAzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4g
LS0tCj4gPiBObyBPVk1GIGJlY2F1c2UgaXQgcmVxdWlyZXMgZ2NjIDQuNCBvciBsYXRlci4KPiA+
IE5vIHNlYWJpb3MgYmVjYXVzZSBpdCByZXF1aXJlcyBhbm9ueW1vdXMgdW5pb24gaW5pdGlhbGlz
YXRpb24KPiAKPiBUaGlzIGlzIHVuZm9ydHVuYXRlLCBhbmQgY291bGQgcGVyaGFwcyBiZSB3b3Jr
ZWQgYXJvdW5kIGJ5IHVzaW5nIHRoZQo+IGFsdGVybmF0aXZlIG5ld2VyIGdjYy01IChpaXJjKSB0
aGF0IGlzIGJlaW5nIHByb3ZpZGVkLiBPdG9oIHdlJ3JlIG5vdAo+IHNvIG11Y2ggYWZ0ZXIgdGhl
IGJ1aWxkIGNoZWNraW5nIG9mIDNyZCBwYXJ0eSBjb21wb25lbnRzIGhlcmUgYW55d2F5Lgo+IAoK
SSdtIG5vdCBnb2luZyB0byBkbyBzcGVjaWFsIGFycmFuZ2VtZW50IGZvciB0aGF0IGluIENJLCBi
dXQgSSB3aWxsIHRyeQp0byBwdXQgdGhlIGFsdGVybmF0aXZlIGNvbXBpbGVyIGluIHNvIHRoYXQg
ZGV2ZWxvcGVycyBjYW4gdHJ5IGl0IG91dC4KVGhlIG1haW4gcHVycG9zZSBvZiB0aGlzIGNvbnRh
aW5lciBpcyB0byB1c2Ugb2xkIGNvbXBpbGVyIGluIG91ciBDSQpzeXN0ZW0uCgo+ID4gTm8gUUVN
VSB1cHN0cmVhIGJlY2F1c2Ugc2VkIGRvZXNuJ3Qgc3VwcG9ydCAtRS4KPiAKPiBUaGlzIGhhcyBi
ZWVuIGZpeGVkIGluIHFlbXUgcXVpdGUgc29tZSB0aW1lIGFnbyAoNjgwOWRmMWRmMCkuCgpSaWdo
dC4gSSBzdXBwb3NlIG9uY2Ugd2UgdXBkYXRlIHFlbXUteGVuLCBpdCBzaG91bGQgYnVpbGQgZmlu
ZS4KCj4gCj4gPiB2bWNzLmMgdm14X2ZpbmRfbXNyIGFuZCB2bXhfZGVsX21zciBidWlsZCBmYWls
dXJlIGluIHB2IHNoaW0gYmVjYXVzZQo+ID4gdGhlIGNvbXBpbGVyIHRoaW5rcyB0b3RhbCwgc3Vi
c3RhcnQgYW5kIHN1YmVuZCBtYXkgYmUgdXNlZAo+ID4gdW5pbml0aWFsaXNlZC4gIFRoZSBjb21w
aWxlciBkb2Vzbid0IGNvbXBsYWluIHdoaWxlIGJ1aWxkaW5nIG5vcm1hbAo+ID4geGVuIHRob3Vn
aC4KPiAKPiBBIHBhdGNoIGZvciB0aGlzIHdhcyBhbHJlYWR5IHNlbnQsIGJ1dCBJIG1lYW4gdG8g
d29yayBvdXQgd2hldGhlcgo+IGluc3RlYWQgc29tZSBDRkxBR1MgaXNzdWUgZXhpc3RzLgo+IAoK
SnVzdCBzYXcgaXQuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
