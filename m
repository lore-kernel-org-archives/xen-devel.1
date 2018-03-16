From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/7] iommu: introduce the concept of BFN...
Date: Fri, 16 Mar 2018 04:39:55 -0600
Message-ID: <5AABAD0B02000078001B2A3A@prv-mh.provo.novell.com>
References: <20180212104714.1922-1-paul.durrant@citrix.com>
 <20180212104714.1922-2-paul.durrant@citrix.com>
 <5AAA85BD02000078001B2327@prv-mh.provo.novell.com>
 <252aab30d4d246dfa02edfeb4fd2fb47@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewmmE-0007Qg-S0
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 10:39:58 +0000
In-Reply-To: <252aab30d4d246dfa02edfeb4fd2fb47@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDExOjMxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAxNSBNYXJjaCAyMDE4IDEzOjQwCj4+IAo+PiA+Pj4gT24gMTIuMDIuMTggYXQgMTE6NDcsIDxw
YXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVu
L2lvbW11LmgKPj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAo+PiA+IEBAIC0yMywx
MSArMjMsMTUgQEAKPj4gPiAgI2luY2x1ZGUgPHhlbi9wYWdlLWRlZnMuaD4KPj4gPiAgI2luY2x1
ZGUgPHhlbi9zcGlubG9jay5oPgo+PiA+ICAjaW5jbHVkZSA8eGVuL3BjaS5oPgo+PiA+ICsjaW5j
bHVkZSA8eGVuL3R5cGVzYWZlLmg+Cj4+ID4gICNpbmNsdWRlIDxwdWJsaWMvaHZtL2lvcmVxLmg+
Cj4+ID4gICNpbmNsdWRlIDxwdWJsaWMvZG9tY3RsLmg+Cj4+ID4gICNpbmNsdWRlIDxhc20vZGV2
aWNlLmg+Cj4+ID4gICNpbmNsdWRlIDxhc20vaW9tbXUuaD4KPj4gPgo+PiA+ICtUWVBFX1NBRkUo
dW5zaWduZWQgbG9uZywgYmZuKTsKPj4gPiArI2RlZmluZSBJTlZBTElEX0JGTiAgICAgIF9iZm4o
fjBVTCkKPj4gCj4+IFBsZWFzZSBhY2NvbXBhbnkgdGhpcyBieSBhIGdyZXAgZm9kZGVyIChsaWtl
IHRoZSBvdGhlcnMgaGF2ZSkgYW5kCj4+IHBlcmhhcHMgYWxzbyBQUklfYmZuLiBBbmQgd2hpbGUg
dGhlIHR5cGUgZGVmaW5pdGlvbiBsb2dpY2FsbHkgYmVsb25ncwo+PiBoZXJlLCB5b3Ugd2lsbCBh
bHNvIHdhbnQgdG8gYWRkIGJmbl90IHdpdGggYSBkZXNjcmlwdGlvbiBvZiBpdHMKPj4gcHVycG9z
ZSBpbnRvIHRoZSBjb21tZW50IGF0IHRoZSB0b3Agb2YgeGVuL21tLmguIEkgZ3Vlc3MgeW91J2xs
Cj4+IG5lZWQgdG8gcmVwbGFjZSAvIGFtZW5kICJob3N0IiBpbiB0aGUgTUZOIGRlc2NyaXB0aW9u
IHRoZXJlIGF0IHRoZQo+PiBzYW1lIHRpbWUuCj4gCj4gU2hvdWxkIEkgbW92ZSB0aGUgVFlQRV9T
QUZFIGV2YWx1YXRpb24gdG8geGVuL21tLmggdGhlbj8gSWYgSSBsZWF2ZSBpdCBoZXJlIAo+IHRo
ZW4gSSdsbCBwcmVzdW1hYmx5IG5lZWQgc29tZSBpZmRlZiBoYWNrZXJ5IGluIG1tLmggaWYgeW91
IHdhbnQgYmUgdG8gZGVmaW5lIAo+IGJmbl90IHRoZXJlIHRvby4KCk5vLCBJIGRvbid0IHRoaW5r
IHRoZSB0eXBlIGRlZmluaXRpb24gaXRzZWxmIG5lZWRzIHRvIGdvIHRoZXJlLiBJZgphbnl0aGlu
ZywgYWRkIGEgY29tbWVudCB0aGVyZSBzYXlpbmcgdGhhdCBiZm5fdCBsaXZlcyBpbiBpb21tdS5o
LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
