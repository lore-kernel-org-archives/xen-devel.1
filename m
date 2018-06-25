From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 4/5] tools: load IPXE from
 standalone file
Date: Mon, 25 Jun 2018 03:04:22 -0600
Message-ID: <5B30B01602000078001CD62D@prv1-mh.provo.novell.com>
References: <20180515182243.3339-1-wei.liu2@citrix.com>
 <20180515182243.3339-5-wei.liu2@citrix.com>
 <20180604134757.GA9256@perard.uk.xensource.com>
 <20180625081645.cyyeaplwitg4ggxx@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrz=jl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXNQB-0003PX-M2
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 09:04:27 +0000
In-Reply-To: <20180625081645.cyyeaplwitg4ggxx@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: anthony.perard@citrix.com, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA2LjE4IGF0IDEwOjE2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBKdW4gMDQsIDIwMTggYXQgMDI6NDc6NTdQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4+IE9uIFR1ZSwgTWF5IDE1LCAyMDE4IGF0IDA3OjIyOjQyUE0gKzAxMDAsIFdlaSBM
aXUgd3JvdGU6Cj4+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9odm1s
b2FkZXIuYyBiL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9odm1sb2FkZXIuYwo+PiA+IGluZGV4
IGY2MDNmNjhkZWQuLmY1NDZjZmIzYWIgMTAwNjQ0Cj4+ID4gLS0tIGEvdG9vbHMvZmlybXdhcmUv
aHZtbG9hZGVyL2h2bWxvYWRlci5jCj4+ID4gKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVy
L2h2bWxvYWRlci5jCj4+ID4gQEAgLTM2OCw3ICszNjgsMTMgQEAgaW50IG1haW4odm9pZCkKPj4g
PiAgI2lmZGVmIEVOQUJMRV9ST01CSU9TCj4+ID4gICAgICBlbHNlIGlmICggYmlvcyA9PSAmcm9t
Ymlvc19jb25maWcgKQo+PiA+ICAgICAgewo+PiA+IC0gICAgICAgIGJpb3MtPmJpb3NfbG9hZChi
aW9zLCBOVUxMLCAwKTsKPj4gPiArICAgICAgICBjb25zdCBzdHJ1Y3QgaHZtX21vZGxpc3RfZW50
cnkgKmlweGU7Cj4+ID4gKyAgICAgICAgdWludDMyX3QgcGFkZHIgPSAwOwo+PiA+ICsKPj4gPiAr
ICAgICAgICBpcHhlID0gZ2V0X21vZHVsZV9lbnRyeShodm1fc3RhcnRfaW5mbywgImlweGUiKTsK
Pj4gPiArICAgICAgICBpZiAoIGlweGUgKQo+PiA+ICsgICAgICAgICAgICBwYWRkciA9IGlweGUt
PnBhZGRyOwo+PiA+ICsgICAgICAgIGJpb3MtPmJpb3NfbG9hZChiaW9zLCAodm9pZCopcGFkZHIs
IDAgLyogdW51c2VkICovKTsKPj4gCj4+IEkgZG9uJ3QgdGhpbmsgaXQncyBhIGdvb2QgaWRlYSB0
byBjaGFuZ2UgdGhlIG1lYW5pbmcgb2YgdGhlIGFyZ3VtZW50cyBvZgo+PiBiaW9zX2xvYWQoKS4g
Rm9yIGV2ZXJ5IG90aGVyIHVzZSBvZiBiaW9zX2xvYWQsIHRoZSBzZWNvbmQgYXJndW1lbnQgaXMK
Pj4gdXNlZCBhdCB0aGUgYWRkcmVzcyBvZiB0aGUgZmlybXdhcmUgdG8gbG9hZC4gSGVyZSAiaXB4
ZSIgaXMgYW4gZXh0cmEKPj4gYmxvYiB0byBsb2FkLgo+IAo+IFdlIGVpdGhlciBhZGQgbW9yZSBh
cmd1bWVudHMgdG8gYmlvc19sb2FkIG9yIHJlcHVycG9zZSB0aGUgZXhpc3RpbmcKPiBvbmUocyku
IEknbSBub3QgdG9vIGZ1c3NlZCB3aXRoIGVpdGhlciBvcHRpb24gcmVhbGx5Lgo+IAo+IEphbiBh
bmQgQW5kcmV3LCB5b3VyIG9waW5pb24/CgpIbW0sIGl0IGRpZCBsb29rIGZpbmUgdG8gbWUsIGJ1
dCBpZiBBbnRob255IGhhcyBzdHJvbmcgcmVzZXJ2YXRpb25zLAptYXliZSBhZGRpbmcgYSBuZXcg
cGFyYW1ldGVyIG1pZ2h0IGJlIGJldHRlciBpbmRlZWQ/CgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
