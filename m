From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CONFIG_XEN_PV breaks
 xen_create_contiguous_region on ARM
Date: Fri, 26 Oct 2018 10:55:44 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1810261040540.32521@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1810161627250.5150@sstabellini-ThinkPad-X260>
 <f9c0b190-e56b-0204-3ae3-349f8cd7d5df@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7wsz=ng=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gG6Kp-0006sB-1i
 for xen-devel@lists.xenproject.org; Fri, 26 Oct 2018 17:55:47 +0000
In-Reply-To: <f9c0b190-e56b-0204-3ae3-349f8cd7d5df@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jeff.Kubascik@dornerworks.com, Nathan.Studer@dornerworks.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, vkuznets@redhat.com, Jarvis.Roach@dornerworks.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyNiBPY3QgMjAxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxNi8xMC8yMDE4
IDEwOjM4LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiB4ZW5fY3JlYXRlX2NvbnRpZ3Vv
dXNfcmVnaW9uIGhhcyBub3cgb25seSBhbiBpbXBsZW1lbnRhdGlvbiBpZgo+ID4gQ09ORklHX1hF
Tl9QViBpcyBkZWZpbmVkLiBIb3dldmVyLCBvbiBBUk0gd2UgbmV2ZXIgc2V0IENPTkZJR19YRU5f
UFYgYnV0Cj4gPiB3ZSBkbyBoYXZlIGFuIGltcGxlbWVudGF0aW9uIG9mIHhlbl9jcmVhdGVfY29u
dGlndW91c19yZWdpb24gd2hpY2ggaXMKPiA+IHJlcXVpcmVkIGZvciBzd2lvdGxiLXhlbiB0byB3
b3JrIGNvcnJlY3RseSAoYWx0aG91Z2ggaXQganVzdCBzZXRzCj4gPiAqZG1hX2hhbmRsZSkuCj4g
PiAKPiA+IFRoaXMgZml4ZXMgYSBidWcgaW50cm9kdWNlZCBieSAxNjYyNDM5MDgxNmM0YzQwZGYz
ZDc3N2IzNDY2NWQzZmQwMWU2OTNkLgo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4v
eGVuLW9wcy5oIGIvaW5jbHVkZS94ZW4veGVuLW9wcy5oCj4gPiBpbmRleCBmZDE4Yzk3Li45Mzlh
OTYyIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS94ZW4veGVuLW9wcy5oCj4gPiArKysgYi9pbmNs
dWRlL3hlbi94ZW4tb3BzLmgKPiA+IEBAIC00MSw3ICs0MSw3IEBAIHN0YXRpYyBpbmxpbmUgdWlu
dDMyX3QgeGVuX3ZjcHVfbnIoaW50IGNwdSkKPiA+ICAKPiA+ICBleHRlcm4gdW5zaWduZWQgbG9u
ZyAqeGVuX2NvbnRpZ3VvdXNfYml0bWFwOwo+ID4gIAo+ID4gLSNpZmRlZiBDT05GSUdfWEVOX1BW
Cj4gPiArI2lmZGVmIENPTkZJR19YRU5fUFYgfHwgQ09ORklHX0FSTSB8fCBDT05GSUdfQVJNNjQK
PiA+ICBpbnQgeGVuX2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbihwaHlzX2FkZHJfdCBwc3RhcnQs
IHVuc2lnbmVkIGludCBvcmRlciwKPiA+ICAJCQkJdW5zaWduZWQgaW50IGFkZHJlc3NfYml0cywK
PiA+ICAJCQkJZG1hX2FkZHJfdCAqZG1hX2hhbmRsZSk7Cj4gPiAKPiA+IAo+IAo+IENvdWxkIHlv
dSBwbGVhc2UgdGVzdCB5b3VyIHBhdGNoIGJlZm9yZSBzZW5kaW5nPyBJdCBkb2Vzbid0IGV2ZW4g
Y29tcGlsZQo+IHdpdGhvdXQgd2FybmluZyBhbmQgaXQgaXMgbWlzc2luZyBTb0IsIGNvcnJlY3Qg
IkZpeGVzOiIgdGFnIGFuZCBsb29rcyBhcwo+IGlmIGl0IGhhcyBiZWVuIGFzc2VtYmxlZCBieSBo
YW5kIGluc3RlYWQgb2YgdXNpbmcgYSBwcm9wZXIgdG9vbCBsaWtlCj4gImdpdCBmb3JtYXQtcGF0
Y2giIChubyAiLS0tIiBkZWxpbWl0ZXIsIGV4dHJhIGVtcHR5IGxpbmVzIGF0IHRoZSBlbmQpLgoK
U29ycnkgSnVlcmdlbiwgSSBtdXN0IGhhdmUgYmVlbiBkaXN0cmFjdGVkIG9yIG1heWJlIEkgd2Fz
IHdvcmtpbmcgb24gYW4Kb2xkZXIgdmVyc2lvbi4gQW55d2F5LCBJJ2xsIHNlbmQgYSBuZXcgcGF0
Y2gsIHJlYmFzZWQgb24gbWFzdGVyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
