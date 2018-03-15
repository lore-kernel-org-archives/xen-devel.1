From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/6] x86/XPTI: use %r12 to write zero
	into xen_cr3
Date: Thu, 15 Mar 2018 16:41:47 +0000
Message-ID: <cff3a62a-ac12-a10e-0d7f-03533aed9263@citrix.com>
References: <5AA7E24402000078001B0F41@prv-mh.provo.novell.com>
 <5AA7E4FC02000078001B0F59@prv-mh.provo.novell.com>
 <d5665059-e8f7-b782-c3bf-380e14c05803@citrix.com>
 <5AAAAFC802000078001B2561@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h5rp=gf=citrix.com=prvs=605c7d53e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewWKB-0001Mt-90
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 17:05:55 +0000
In-Reply-To: <5AAAAFC802000078001B2561@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMTggMTY6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE1LjAzLjE4IGF0
IDE3OjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDEzLzAzLzE4
IDEzOjQ5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE5vdyB0aGF0IHdlIHplcm8gYWxsIHJlZ2lz
dGVycyBlYXJseSBvbiBhbGwgZW50cnkgcGF0aHMsIHVzZSB0aGF0IHRvCj4+PiBhdm9pZCBhIGNv
dXBsZSBvZiBpbW1lZGlhdGVzIGhlcmUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4gLS0tCj4+PiBXZSBtYXkgd2FudCB0byBjb25zaWRl
ciBlbGltaW5hdGluZyBhIGZldyBtb3JlICQwIHRoaXMgd2F5LiBCdXQKPj4+IGVzcGVjaWFsbHkg
Zm9yIGJ5dGUgb25lcyBJJ20gbm90IHN1cmUgaXQncyB3b3J0aCBpdCwgZHVlIHRvIHRoZSBSRVgK
Pj4+IHByZWZpeCB0aGUgdXNlIG9mICVyMTIgd291bGQgaW5jdXIuCj4+Pgo+Pj4gLS0tIGEveGVu
L2FyY2gveDg2L3g4Nl82NC9jb21wYXQvZW50cnkuUwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3g4
Nl82NC9jb21wYXQvZW50cnkuUwo+Pj4gQEAgLTIxNiw3ICsyMTYsNyBAQCBFTlRSWShjc3Rhcl9l
bnRlcikKPj4+ICAgICAgICAgIG1vdiAgICVyY3gsIFNUQUNLX0NQVUlORk9fRklFTEQoeGVuX2Ny
MykoJXJieCkKPj4+ICAgICAgICAgIG5lZyAgICVyY3gKPj4+ICAgICAgICAgIG1vdiAgICVyY3gs
ICVjcjMKPj4+IC0gICAgICAgIG1vdnEgICQwLCBTVEFDS19DUFVJTkZPX0ZJRUxEKHhlbl9jcjMp
KCVyYngpCj4+PiArICAgICAgICBtb3YgICAlcjEyLCBTVEFDS19DUFVJTkZPX0ZJRUxEKHhlbl9j
cjMpKCVyYngpCj4+IEl0IGlzIHVucmVhc29uYWJsZSB0byBleHBlY3QgcGVvcGxlIHRvIHJlYWxp
c2UgdGhhdCB0aGlzIHVzZSBvZiAlcjEyIGlzCj4+IGZvciBhIHplcm8sIGJlY2F1c2UgdGhlcmUg
aXMgbm8gd3JpdGUgdG8gJXIxMiB2aXNpYmxlLiAgVGhlc2UgbmVlZCBzb21lCj4+IGtpbmQgb2Yg
Y29tbWVudC4KPiBXZWxsLCBva2F5LCBJJ2xsIGFkZCB0aGUgc2FtZSBjb21tZW50IGluIGFsbCA3
IHBsYWNlcy4KCldpdGggdGhhdCBjaGFuZ2UsIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
