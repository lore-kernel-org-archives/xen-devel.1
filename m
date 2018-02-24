From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v4 18/28] x86/vioapic: Hook interrupt
	delivery of vIOAPIC
Date: Sat, 24 Feb 2018 03:17:19 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19101859D@SHSMSX101.ccr.corp.intel.com>
References: <1510899755-40237-1-git-send-email-chao.gao@intel.com>
 <1510899755-40237-19-git-send-email-chao.gao@intel.com>
 <20180212145402.d4e4ttwb577ezuer@MacBook-Pro-de-Roger.local>
 <20180224015101.GC162485@skl-4s-chao.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180224015101.GC162485@skl-4s-chao.sh.intel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Gao, Chao" <chao.gao@intel.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Cc: Lan Tianyu <tianyu.lan@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBHYW8sIENoYW8KPiBTZW50OiBTYXR1cmRheSwgRmVicnVhcnkgMjQsIDIwMTggOTo1
MSBBTQo+IAo+IE9uIE1vbiwgRmViIDEyLCAyMDE4IGF0IDAyOjU0OjAyUE0gKzAwMDAsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4gPk9uIEZyaSwgTm92IDE3LCAyMDE3IGF0IDAyOjIyOjI1UE0g
KzA4MDAsIENoYW8gR2FvIHdyb3RlOgo+ID4+IFdoZW4gaXJxIHJlbWFwcGluZyBpcyBlbmFibGVk
LCBJT0FQSUMgUmVkaXJlY3Rpb24gRW50cnkgbWF5IGJlIGluCj4gcmVtYXBwaW5nCj4gPj4gZm9y
bWF0LiBJZiB0aGF0LCBnZW5lcmF0ZSBhbiBpcnFfcmVtYXBwaW5nX3JlcXVlc3QgYW5kIGNhbGwg
dGhlCj4gY29tbW9uCj4gPgo+ID4iSWYgdGhhdCdzIHRoZSBjYXNlLCAuLi4iCj4gPgo+ID4+IFZJ
T01NVSBhYnN0cmFjdGlvbidzIGNhbGxiYWNrIHRvIGhhbmRsZSB0aGlzIGludGVycnVwdCByZXF1
ZXN0LiBEZXZpY2UKPiA+PiBtb2RlbCBpcyByZXNwb25zaWJsZSBmb3IgY2hlY2tpbmcgdGhlIHJl
cXVlc3QncyB2YWxpZGl0eS4KPiA+Cj4gPldoYXQgZG9lcyB0aGlzIGV4YWN0bHkgbWVhbj8gRGV2
aWNlIG1vZGVsIGlzIG5vdCBpbnZvbHZlZCBpbiB3aGF0IHRoZQo+ID5ndWVzdCB3cml0ZXMgdG8g
dGhlIHZJT0FQSUMgUlRFLCBzbyBpdCdzIGltcG9zc2libGUgZm9yIHRoZSBkZXZpY2UKPiA+bW9k
ZWwgdG8gdmFsaWRhdGUgdGhpcyBpbiBhbnkgd2F5Lgo+IAo+IEhvdyBhYm91dCB0aGlzIGRlc2Ny
aXB0aW9uOgo+IFdoZW4gaXJxIHJlbWFwcGluZyBpcyBlbmFibGVkLCBJT0FQSUMgUmVkaXJlY3Rp
b24gRW50cnkgbWF5IGJlIGluCj4gcmVtYXBwaW5nCj4gZm9ybWF0LiBJZiB0aGF0J3MgdGhlIGNh
c2UsIGFuIGlycV9yZW1hcHBpbmdfcmVxdWVzdCB3aWxsIGJlIGdlbmVyYXRlZCBhbmQKPiBJT01N
VS1zcGVjaWZpYyBoYW5kbGVyIGRlYWxzIHdpdGggdGhpcyByZXF1ZXN0LiBJT01NVS1zcGVjaWZp
YyBoYW5kbGVyCj4gd2lsbCBjaGVjayB3aGV0aGVyIHRoZSByZXF1ZXN0IGlzIHZhbGlkIG9yIG5v
dCwgcmVwb3J0IGVycm9yIHZpYQo+IElPTU1VLXNwZWNpZmljIG1hY2hhbmlzbSBpZiBpbnZhbGlk
IG9yIG90aGVyd2lzZSB0cmFuc2Zvcm0gdGhlIHJlcXVlc3QKPiB0byBhbgo+IGludGVycnVwdCBp
bmZvIChpbmNsdWRpbmcgaW50ZXJydXB0IGRlc3RpbmF0aW9uLCB2ZWN0b3IgYW5kIHRyaWdnZXIg
bW9kZQo+IGV0Yy4pIGFjY29yZGluZyB0byBJUlQuCj4gCgp0aGUgZGVzY3JpcHRpb24gc2hvdWxk
IG1hdGNoIHdoYXQgdGhpcyBwYXRjaCBhY3R1YWxseSBkb2VzLgpkZXRhaWwgYWJvdXQgaG93IGNh
bGxlciB3b3JrcyBzaG91bGQgYmUgbGVmdCB0byB0aGUgcGF0Y2ggd2hlcmUKdGhlIGNhbGxlciBp
cyBpbnRyb2R1Y2VkLiBIZXJlIGltbyB0aGUgc3ViamVjdCBsaW5lIGlzIGFscmVhZHkKY2xlYXIg
ZW5vdWdoLi4uIGlzbid0IGl0PyAKClRoYW5rcwpLZXZpbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
