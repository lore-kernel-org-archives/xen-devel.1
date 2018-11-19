From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 00/24] ACPI reorganization
 for hardware-reduced API addition
Date: Mon, 19 Nov 2018 13:14:36 -0500
Message-ID: <20181119131314-mutt-send-email-mst@kernel.org>
References: <20181105014047.26447-1-sameo@linux.intel.com>
 <20181116172919.43f3e27d@redhat.com>
 <d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
 <20181119163110.2f357f40@redhat.com>
 <c09214f5-85fa-bb64-7c7e-2e9435ea4279@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=omFX=N6=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1gOo4G-00087q-CJ
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 18:14:40 +0000
Content-Disposition: inline
In-Reply-To: <c09214f5-85fa-bb64-7c7e-2e9435ea4279@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDY6MTQ6MjZQTSArMDEwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToKPiBPbiAxOS8xMS8xOCAxNjozMSwgSWdvciBNYW1tZWRvdiB3cm90ZToKPiA+IEkndmUg
dHJpZWQgdG8gZ2l2ZSBzdWdnZXN0aW9ucyBob3cgdG8gcmVzdHJ1Y3R1cmUgc2VyaWVzCj4gPiBv
biBwZXIgcGF0Y2ggYmFzaXMuIEluIG15IG9waW5pb24gaXQgcXVpdGUgcG9zc2libGUgdG8gc3Bs
aXQKPiA+IHNlcmllcyBpbiBzZXZlcmFsIHNtYWxsZXIgb25lcyBhbmQgaXQgc2hvdWxkIHJlYWxs
eSBoZWxwIHdpdGgKPiA+IG1ha2luZyBzZXJpZXMgY2xlYW5lciBhbmQgZWFzaWVyL2Zhc3RlciB0
byByZXZpZXcvYW1lbmQvbWVyZ2UKPiA+IHZzIHdoYXQgd2UgaGF2ZSBpbiB2NS4KPiAKPiBUaGlz
IGlzIHRydWUsIG9uIHRoZSBvdGhlciBoYW5kIHRoZSBzZXJpZXMgbWFrZXMgc2Vuc2UgdG9nZXRo
ZXIgYW5kLAo+IGV2ZW4gaWYgdGhlIHBhdGNoZXMgYXJlIG1vcmUgb3IgbGVzcyBpbmRlcGVuZGVu
dCwgdGhleSBhbHNvIGFsbCBmb2xsb3cKPiB0aGUgc2FtZSAicGxhbiIuICBGb3IgcmV2aWV3aW5n
IHY2LCBhcmUgeW91IGF3YXJlIG9mIFBhdGNoZXcncyBzZXJpZXMKPiBkaWZmIGZ1bmN0aW9uYWxp
dHk/ICBJdCBjYW4gdGVsbCB5b3Ugd2hpY2ggcGF0Y2hlcyBoYWQgY29tbWVudHMgaW4gdjUsCj4g
cmVvcmRlciBwYXRjaGVzIGlmIGFwcGxpY2FibGUsIGFuZCBkaXNwbGF5IGRlbGV0ZWQgYW5kIG5l
dyBwYXRjaGVzIGF0Cj4gdGhlIHJpZ2h0IHBvaW50IGluIHRoZSBzZXJpZXMuCj4gCj4gdjQtPnY1
IGlzIGEgYml0IG1lc3NlZCB1cCBiZWNhdXNlIFNhbXVlbCBwcm9iYWJseSBhZGRlZCBhIGRpZmYg
b3JkZXIKPiBzZXR1cAo+IChodHRwczovL3BhdGNoZXcub3JnL1FFTVUvMjAxODExMDExMDIzMDMu
MTY0MzktMS1zYW1lb0BsaW51eC5pbnRlbC5jb20vZGlmZi8yMDE4MTEwNTAxNDA0Ny4yNjQ0Ny0x
LXNhbWVvQGxpbnV4LmludGVsLmNvbS8pCj4gYnV0IGl0J3MgdmVyeSB1c2VmdWwgaW4gZ2VuZXJh
bC4KPiAKPiBQYW9sbwoKT2ggSSBkaWRuJ3QgcmVhbGl6ZSBkaWZmb3JkZXIgYnJlYWtzIHBhdGNo
ZXcuIE9yIGlzIHRoZSBwcm9ibGVtCm9ubHkgaWYgb25lIHN3aXRjaGVzIGZyb20gbm8gb3JkZXIg
dG8gZGlmZm9yZGVyPwoKLS0gCk1TVAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
