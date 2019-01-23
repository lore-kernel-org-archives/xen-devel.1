From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Wed, 23 Jan 2019 13:04:33 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901230935280.17936__31364.2706767254$1548277538$gmane$org@sstabellini-ThinkPad-X260>
References: <20190121050056.14325-1-peng.fan@nxp.com>
 <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260>
 <20190123071232.GA20526@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3kqX=P7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gmPhN-00040k-0m
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 21:04:37 +0000
In-Reply-To: <20190123071232.GA20526@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "hch@infradead.org" <hch@infradead.org>
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, luto@kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMiBKYW4gMjAxOSwgaGNoQGluZnJhZGVhZC5vcmcgd3JvdGU6Cj4gT24gVHVlLCBK
YW4gMjIsIDIwMTkgYXQgMTE6NTk6MzFBTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+ID4gPiAgCWlmICghdmlydGlvX2hhc19pb21tdV9xdWlyayh2ZGV2KSkKPiA+ID4gIAkJcmV0
dXJuIHRydWU7Cj4gPiA+ICAKPiA+ID4gQEAgLTI2MCw3ICsyNjIsNyBAQCBzdGF0aWMgYm9vbCB2
cmluZ191c2VfZG1hX2FwaShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKPiA+ID4gIAkgKiB0
aGUgRE1BIEFQSSBpZiB3ZSdyZSBhIFhlbiBndWVzdCwgd2hpY2ggYXQgbGVhc3QgYWxsb3dzCj4g
PiA+ICAJICogYWxsIG9mIHRoZSBzZW5zaWJsZSBYZW4gY29uZmlndXJhdGlvbnMgdG8gd29yayBj
b3JyZWN0bHkuCj4gPiA+ICAJICovCj4gPiA+IC0JaWYgKHhlbl9kb21haW4oKSkKPiA+ID4gKwlp
ZiAoeGVuX2RvbWFpbigpICYmICFkbWFfZGV2LT5kbWFfbWVtKQo+ID4gPiAgCQlyZXR1cm4gdHJ1
ZTsKPiA+ID4gIAo+ID4gPiAgCXJldHVybiBmYWxzZTsKPiA+IAo+ID4gSSBjYW4gc2VlIHlvdSBz
cG90dGVkIGEgcmVhbCBpc3N1ZSwgYnV0IHRoaXMgaXMgbm90IHRoZSByaWdodCBmaXguIFdlCj4g
PiBqdXN0IG5lZWQgc29tZXRoaW5nIGEgYml0IG1vcmUgZmxleGlibGUgdGhhbiB4ZW5fZG9tYWlu
KCk6IHRoZXJlIGFyZQo+ID4gbWFueSBraW5kcyBvZiBYZW4gZG9tYWlucyBvbiBkaWZmZXJlbnQg
YXJjaGl0ZWN0dXJlcywgd2UgYmFzaWNhbGx5IHdhbnQKPiA+IHRvIGVuYWJsZSB0aGlzIChyZXR1
cm4gdHJ1ZSBmcm9tIHZyaW5nX3VzZV9kbWFfYXBpKSBvbmx5IHdoZW4gdGhlIHhlbgo+ID4gc3dp
b3RsYiBpcyBtZWFudCB0byBiZSB1c2VkLiBEb2VzIHRoZSBhcHBlbmRlZCBwYXRjaCBmaXggdGhl
IGlzc3VlIHlvdQo+ID4gaGF2ZT8KPiAKPiBUaGUgcHJvYmxlbSBnZW5lcmFsbHkgaXMgdGhlIG90
aGVyIHdheSBhcm91bmQgLSBpZiBkbWFfZGV2LT5kbWFfbWVtCj4gaXMgc2V0IHRoZSBkZXZpY2Ug
ZGVjcmlwdGlvbiBpbiB0aGUgZGV2aWNlIHRyZWUgZXhwbGljaXRseSByZXF1aXJlcwo+IHVzaW5n
IHRoaXMgbWVtb3J5LCBzbyB3ZSBtdXN0IF9hbHdheXNfIHVzZSB0aGUgRE1BIEFQSS4KPiAKPiBU
aGUgcHJvYmxlbSBpcyBqdXN0IHRoYXQgdGhhdCBycHJvYyBkcml2ZXIgYWJzdXNlcyB0aGUgRE1B
IEFQSQo+IGluIGhvcnJpYmxlIHdheXMuCgpJZiB2cmluZ191c2VfZG1hX2FwaSBpcyBhY3R1YWxs
eSBzdXBwb3NlZCB0byByZXR1cm4gdHJ1ZSB3aGVuCmRtYV9kZXYtPmRtYV9tZW0gaXMgc2V0LCB0
aGVuIGJvdGggUGVuZydzIHBhdGNoIGFuZCB0aGUgcGF0Y2ggSSB3cm90ZQphcmUgbm90IGZpeGlu
ZyB0aGUgcmVhbCBpc3N1ZSBoZXJlLgoKSSBkb24ndCBrbm93IGVub3VnaCBhYm91dCByZW1vdGVw
cm9jIHRvIGtub3cgd2hlcmUgdGhlIHByb2JsZW0gYWN0dWFsbHkKbGllcyB0aG91Z2guCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
