From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] fix potential null dereference
Date: Tue, 16 Jan 2018 00:11:20 -0700
Message-ID: <5A5DB3A8020000780019EF05@prv-mh.provo.novell.com>
References: <alpine.DEB.2.10.1801121538050.5767@sstabellini-ThinkPad-X260>
 <5ba8b0e5-21a9-1999-5aff-f9b9062827f6@linaro.org>
 <5A5C72F2020000780019EAB8@prv-mh.provo.novell.com>
 <alpine.DEB.2.10.1801151049130.5767@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=n0uv=el=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ebLP8-0007j9-Bi
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 07:11:30 +0000
In-Reply-To: <alpine.DEB.2.10.1801151049130.5767@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@linaro.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAxLjE4IGF0IDE5OjUxLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gTW9uLCAxNSBKYW4gMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4+PiBPbiAxMy4w
MS4xOCBhdCAwNzoyMSwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPiB3cm90ZToKPj4gPiBPbiAw
MS8xMi8yMDE4IDExOjQwIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+ID4+IGhhbmRs
ZXMgY2FuIHRoZW9yZXRpY2FsbHkgYmUgTlVMTCwgY2hlY2sgZm9yIGl0IGV4cGxpY2l0bHkgYmVm
b3JlCj4+ID4+IGRlcmVmZXJlbmNpbmcgaXQuCj4+ID4gCj4+ID4gSSBkb3VidCBoYW5kbGVzIGNv
dWxkIGJlIE5VTEwgaWYgTG9jYXRlSGFuZGxlIHN1Y2NlZWQuIFRoaXMgc2VlbXMgdG8gYmUgCj4+
ID4gY29uZmlybWVkIGJ5IHRoZSBzcGVjIChQYWdlIDIwOCBpbiBVRUZJIHNwZWMgMi43KS4KPj4g
PiAKPj4gPiBTbyBJIGFtIG5vdCBlbnRpcmVseSBjb252aW5jZSB3ZSBzaG91bGQgYWRkIHlldCBh
bm90aGVyIGNoZWNrIGluIHRoZSAKPj4gPiBjb2RlLiBBbiBBU1NFUlQgbWlnaHQgYmUgYmV0dGVy
Lgo+PiAKPj4gSW5kZWVkIGlmIHRoZXJlIGlzIGEgcGxhdGZvcm0gd2hlcmUgTlVMTCBpcyBjb21p
bmcgYmFjayBpbiB0aGUKPj4gc3VjY2VzcyBjYXNlLCB0aGF0IHBsYXRmb3JtIHNob3VsZCBiZSBu
YW1lZCBhcyBhIGp1c3RpZmljYXRpb24KPj4gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBPdGhlcndp
c2UgSSBkb24ndCBzZWUgdGhlIHZhbHVlIG9mIHRoaXMKPj4gY2hhbmdlLgo+IAo+IFRydXRoZnVs
bHksIGl0IGlzIG1vc3RseSB0byBzaWxlbmNlIENvdmVyaXR5LiBXZSBjYW4gYWxsIGFwcHJlY2lh
dGUgd2hlbgo+IHN0YXRpYyBhbmFseXN0cyBjYW5ub3QgZmluZCBkZWZlY3RzIGluIHRoZSBjb2Rl
LgoKU28gd2hhdCBkb2VzIENvdmVyaXR5IGRpc2xpa2UgaGVyZSAodGhlIG1vcmUgdGhhdCB0aGlz
IGlzIG9uIGEKYm9vdCBwYXRoLCBpLmUuIG5vdCBleHBsb2l0YWJsZSBieSBndWVzdHMgYXQgYWxs
IGluIHRoZSBmaXJzdCBwbGFjZSk/Ck1lcmVseSB0aGUgTlVMTCBwb2ludGVyPyBXaGF0IGlmIHRo
ZSBpbnRlcmZhY2UgZ2F2ZSBiYWNrIGEKcG9pbnRlciB3aXRoIGEgdmFsdWUgb2YgMHgxMjM0NTY3
ODlhYmNkZWY/CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
