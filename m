From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC 15/16] xen/arm: Implement Set/Way operations
Date: Tue, 6 Nov 2018 09:38:23 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811060937560.18518@sstabellini-ThinkPad-X260>
References: <20181008183352.16291-1-julien.grall@arm.com>
 <20181008183352.16291-16-julien.grall@arm.com>
 <alpine.DEB.2.10.1811051244320.18518@sstabellini-ThinkPad-X260>
 <cafc35cb-857d-b892-1791-eb0c83d647b9@arm.com>
 <alpine.DEB.2.10.1811060927560.18518@sstabellini-ThinkPad-X260>
 <6f09ab9e-93a2-0d0f-4dbe-0dd6dd1041a5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <6f09ab9e-93a2-0d0f-4dbe-0dd6dd1041a5@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andre.przywara@linaro.org, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCA2IE5vdiAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAwNi8xMS8yMDE4IDE3OjMxLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBN
b24sIDUgTm92IDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiBUaGlzIHdpbGwgYWZm
ZWN0IGFsbCB0aGUgcmVnaXN0ZXJzIHRyYXBwZWQgd2l0aCBUVk0uIFNob3VsZG4ndCB3ZSBvbmx5
Cj4gPiA+ID4gY2FsbCBwMm1fdG9nZ2xlX2NhY2hlIHdoZW4gcmVsZXZhbnQ/IGkuZS4gd2hlbiBj
aGFuZ2luZyBTQ1RMUj8KPiA+ID4gPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBvbmx5
IG1vZGlmeSB0aGUgU0NUTFIgZW11bGF0aW9uIGhhbmRsZXIuCj4gPiA+IAo+ID4gPiBUaGlzIGlz
IG1hZGUgb24gcHVycG9zZSwgeW91IGluY3JlYXNlIHRoZSBjaGFuY2UgdG8gZGlzYWJsZSBUVk0g
YXMgc29vbiBhcwo+ID4gPiBwb3NzaWJsZS4gSWYgeW91IG9ubHkgcmVseSBvbiBTQ1RMUiwgeW91
IG1heSBlbmQgdXAgdG8gdHJhcCBhIGxvdCBvZgo+ID4gPiByZWdpc3RlcnMKPiA+ID4gZm9yIGEg
bG9uZyB0aW1lLgo+ID4gPiAKPiA+ID4gRldJVywgYXMgSSBhbHJlYWR5IHdyb3RlIGluIHRoZSBj
b21taXQgbWVzc2FnZSwgdGhpcyBpcyBiYXNlZCBvbiB3aGF0IEtWTQo+ID4gPiBkb2VzLgo+ID4g
Cj4gPiBJIG1pc3NlZCB0aGF0LiBBcyB5b3UgZXhwbGFpbiBpdCwgaXQgbWFrZXMgc2Vuc2UuIE1h
eWJlIHdvcnRoIGFkZGluZyBhbgo+ID4gZXhwbGljaXQgc3RhdGVtZW50IGFib3V0IGl0OiAiT24g
QVJNNjQsIHdlIGNhbGwgcDJtX3RvZ2dsZV9jYWNoZSBmcm9tIG9uCj4gPiB0aGUgVFZNLXRyYXBw
ZWQgcmVnaXN0ZXIgaGFuZGxlcnMgdG8gaW5jcmVhc2UgdGhlIGNoYW5jZXMgb2YgZGlzYWJsaW5n
Cj4gPiBUVk0gYXMgc29vbiBhcyBwb3NzaWJsZS4iCj4gCj4gSSBhbSBhc3N1bWluZyB5b3UgbWVh
bnQgYXJtMzIgaGVyZT8gCgpZZXMsIEkgZGlkCgoKPiBMb29raW5nIGF0IHRoZSBjb2RlLCBpdCBs
b29rcyBsaWtlIEkKPiBpbXBsZW1lbnRlZCB0aGUgYXJtNjQgZGlmZmVyZW50bHkuIEJ1dCB3ZSBw
cm9iYWJseSB3YW50IGFwcGx5IHRvIGNhbGwKPiBwMm1fdG9nZ2xlX2NhY2hlIGluIGFsbCBUVk0g
dHJhcHBlZCByZWdpc3RlcnMuCj4gCj4gVGhpcyB3b3VsZCBrZWVwIHRoZSBsb2dpYyBldmVyeXdo
ZXJlIHRoZSBzYW1lLgoKUmlnaHQsIGdvb2QgaWRlYQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
