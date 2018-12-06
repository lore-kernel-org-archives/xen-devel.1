From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 v2 04/17] xen/arm: p2m: Introduce
 p2m_is_valid and use it
Date: Thu, 6 Dec 2018 14:02:12 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1812061401310.18779@sstabellini-ThinkPad-X260>
References: <20181204202651.8836-1-julien.grall@arm.com>
 <20181204202651.8836-5-julien.grall@arm.com>
 <alpine.DEB.2.10.1812041549250.527@sstabellini-ThinkPad-X260>
 <4838e4b5-51a5-5fbf-2fa3-1ce539ec3e74@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ba80=OP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gV1ip-00057F-8D
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 22:02:15 +0000
In-Reply-To: <4838e4b5-51a5-5fbf-2fa3-1ce539ec3e74@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCA1IERlYyAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwNC8xMi8yMDE4IDIzOjUwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBU
dWUsIDQgRGVjIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gVGhlIExQQUUgZm9ybWF0
IGFsbG93cyB0byBzdG9yZSBpbmZvcm1hdGlvbiBpbiBhbiBlbnRyeSBldmVuIHdpdGggdGhlCj4g
PiA+IHZhbGlkIGJpdCB1bnNldC4gSW4gYSBmb2xsb3ctdXAgcGF0Y2gsIHdlIHdpbGwgdGFrZSBh
ZHZhbnRhZ2Ugb2YgdGhpcwo+ID4gPiBmZWF0dXJlIHRvIHJlLXB1cnBvc2UgdGhlIHZhbGlkIGJp
dCBmb3IgZ2VuZXJhdGluZyBhIHRyYW5zbGF0aW9uIGZhdWx0Cj4gPiA+IGV2ZW4gaWYgYW4gZW50
cnkgY29udGFpbnMgdmFsaWQgaW5mb3JtYXRpb24uCj4gPiA+IAo+ID4gPiBTbyB3ZSBuZWVkIGEg
ZGlmZmVyZW50IHdheSB0byBrbm93IHdoZXRoZXIgYW4gZW50cnkgY29udGFpbnMgdmFsaWQKPiA+
ID4gaW5mb3JtYXRpb24uIEl0IGlzIHBvc3NpYmxlIHRvIHVzZSB0aGUgaW5mb3JtYXRpb24gaG9s
ZCBpbiB0aGUgcDJtX3R5cGUKPiA+ID4gdG8ga25vdyBmb3IgdGhhdCBwdXJwb3NlLiBJbmRlZWQg
YWxsIGVudHJpZXMgY29udGFpbmluZyB2YWxpZAo+ID4gPiBpbmZvcm1hdGlvbiB3aWxsIGhhdmUg
YSB2YWxpZCBwMm0gdHlwZSAoaS5lIHAybV90eXBlICE9IHAybV9pbnZhbGlkKS4KPiA+ID4gCj4g
PiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBoZWxwZXIgcDJtX2lzX3ZhbGlkLCB3aGlj
aCBpbXBsZW1lbnRzIHRoYXQKPiA+ID4gaWRlYSwgYW5kIHJlcGxhY2UgbW9zdCBvZiBscGFlX2lz
X3ZhbGlkIGNhbGwgd2l0aCB0aGUgbmV3IGhlbHBlci4gVGhlIG9uZXMKPiA+ID4gcmVtYWluaW5n
IGFyZSBmb3IgVExCcyBoYW5kbGluZyBhbmQgZW50cmllcyBhY2NvdW50aW5nLgo+ID4gPiAKPiA+
ID4gV2l0aCB0aGUgcmVuYW1pbmcgdGhlcmUgYXJlIDIgb3RoZXJzIGNoYW5nZXMgcmVxdWlyZWQ6
Cj4gPiA+ICAgICAgLSBHZW5lcmF0ZSB0YWJsZSBlbnRyeSB3aXRoIGEgdmFsaWQgcDJtIHR5cGUK
PiA+ID4gICAgICAtIERldGVjdCBuZXcgbWFwcGluZyBmb3IgcHJvcGVyIHN0YXRzIGFjY291bnRp
bmcKPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+Cj4gPiAKPiA+IChUaGlzIHBhdGNoIGRvZXNuJ3QgYXBwbHkgdG8g
bWFzdGVyLCBwbGVhc2UgcmViYXNlKQo+IAo+IFdoeSBhcmUgeW91IHRyeWluZyB0byBhcHBseSB0
byBtYXN0ZXI/IFRoaXMgc2VyaWVzIChhcyBtb3N0IG9mIG15IHNlcmllcykgYXJlCj4gYmFzZWQg
b24gc3RhZ2luZyBhdCB0aGUgdGltZSBpdCB3YXMgc2VudC4gSSB0cmllZCB0byBhcHBseSB0aGlz
IHBhdGNoIHRvZGF5IG9uCj4gc3RhZ2luZyBhbmQgSSBkaWRuJ3QgZmluZCBhbnkgaXNzdWUuCgpO
byBwcm9ibGVtcyB0aGVuLCBJIHRob3VnaHQgdGhlIHNlcmllcyB3YXMgYmFzZWQgb24gYW4gb2xk
ZXIgdHJlZSwgYnV0Cmluc3RlYWQgaXQgd2FzIG9uIHN0ZXAgYWhlYWQuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
