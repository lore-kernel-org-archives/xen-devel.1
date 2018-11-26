From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH for-3.1] hw/xen/xen_pt_graphics: Don't trust
 the BIOS ROM contents so much
Date: Mon, 26 Nov 2018 15:03:07 +0000
Message-ID: <20181126150307.GM2448@perard.uk.xensource.com>
References: <20181119162658.30358-1-peter.maydell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7cum=of=citrix.com=prvs=86102624d=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gRIQ4-00018S-Pk
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 15:03:28 +0000
Content-Disposition: inline
In-Reply-To: <20181119162658.30358-1-peter.maydell@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, patches@linaro.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMTksIDIwMTggYXQgMDQ6MjY6NThQTSArMDAwMCwgUGV0ZXIgTWF5ZGVsbCB3
cm90ZToKPiBDb3Zlcml0eSAoQ0lEIDc5NjU5OSkgcG9pbnRzIG91dCB0aGF0IHhlbl9wdF9zZXR1
cF92Z2EoKSB0cnVzdHMKPiB0aGUgcm9tLT5zaXplIGZpZWxkIGluIHRoZSBCSU9TIFJPTSBmcm9t
IGEgUENJIHBhc3N0aHJvdWdoIFZHQQo+IGRldmljZSwgYW5kIHVzZXMgaXQgYXMgYW4gaW5kZXgg
aW50byB0aGUgbWVtb3J5IHdoaWNoIGNvbnRhaW5zCj4gdGhlIEJJT1MgaW1hZ2UuIEEgY29ycnVw
dCBCSU9TIFJPTSBjb3VsZCB0aGVyZWZvcmUgY2F1c2UgdXMgdG8KPiBpbmRleCBvZmYgdGhlIGVu
ZCBvZiB0aGUgYnVmZmVyLgo+IAo+IENoZWNrIHRoYXQgdGhlIHNpemUgaXMgd2l0aGluIGJvdW5k
cyBiZWZvcmUgd2UgdXNlIGl0Lgo+IAo+IFdlIGFyZSBhbHNvIHRydXN0aW5nIHRoZSBwY2lvZmZz
ZXQgZmllbGQsIGFuZCBhc3N1bWluZyB0aGF0Cj4gdGhlIHdob2xlIHJvbV9oZWFkZXIgaXMgcHJl
c2VudDsgQ292ZXJpdHkgZG9lc24ndCBub3RpY2UgdGhlc2UsCj4gYnV0IGNoZWNrIHRoZW0gdG9v
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJv
Lm9yZz4KPiAtLS0KPiBEaXNjbGFpbWVyOiBjb21waWxlIHRlc3RlZCBvbmx5LCBhcyBJIGRvbid0
IGhhdmUgYSBYZW4gc2V0dXAsCj4gbGV0IGFsb25lIG9uZSB3aXRoIHBhc3MtdGhyb3VnaCBQQ0kg
Z3JhcGhpY3MuCj4gCj4gTm90ZSB0aGF0IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL3hzYS9hZHZp
c29yeS0xMjQuaHRtbAo+IGRlZmluZXMgdGhhdCBidWdzIHdoaWNoIGFyZSBvbmx5IGV4cGxvaXRh
YmxlIGJ5IGEgbWFsaWNpb3VzCj4gcGllY2Ugb2YgaGFyZHdhcmUgdGhhdCBpcyBwYXNzZWQgdGhy
b3VnaCB0byB0aGUgZ3Vlc3QgYXJlCj4gbm90IHNlY3VyaXR5IHZ1bG5lcmFiaWxpdGllcyBhcyBm
YXIgYXMgdGhlIFhlbiBQcm9qZWN0IGlzCj4gY29uY2VybmVkLCBhbmQgYXJlIHRyZWF0ZWQgbGlr
ZSBub3JtYWwgbm9uLXNlY3VyaXR5LXJlbGF0ZWQgYnVncy4KPiBTbyB0aGlzIGlzIGp1c3QgYSBi
dWdmaXgsIG5vdCBhIHNlY3VyaXR5IGlzc3VlLgo+IAo+IE1hcmtlZCAiZm9yLTMuMSIgYmVjYXVz
ZSBpdCB3b3VsZCBsZXQgdXMgc3F1YXNoIGFub3RoZXIgQ292ZXJpdHkKPiBpc3N1ZSwgYW5kIGl0
IGlzIGEgYnVnIGZpeDsgb24gdGhlIG90aGVyIGhhbmQgaXQncyBhbiBvYnNjdXJlCj4gY29ybmVy
IGNhc2UgYW5kIGhhcyBiZWVuIHRoaXMgd2F5IHNpbmNlIGZvcmV2ZXIuCgpJIGhhdmVuJ3QgdGVz
dGVkIHRoYXQgcGF0Y2ggZWl0aGVyLCBidXQgdGhlIGNoYW5nZXMgbG9va3MgZmluZSwgc286CgpB
Y2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFu
a3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
