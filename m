From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Qemu-devel] [PATCH 16/16] configure: do_compiler:
 Dump some extra info under bash
Date: Mon, 23 Apr 2018 18:12:07 +0100
Message-ID: <23262.5095.477702.668746__10445.3439395458$1524503479$gmane$org@mariner.uk.xensource.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-17-git-send-email-ian.jackson@eu.citrix.com>
 <20180423162142.GG1980@perard>	<20180423163809.GR3267@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n26l=hm=citrix.com=prvs=644ea31d5=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fAf0e-0003Q9-Oj
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 17:12:12 +0000
In-Reply-To: <20180423163809.GR3267@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Daniel P.=?iso-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Janosch Frank <frankja@linux.vnet.ibm.com>, "Kent R. Spillner" <kspillner@acm.org>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: xen-devel@lists.xenproject.org

RGFuaWVsIFAuIEJlcnJhbmfDqSB3cml0ZXMgKCJSZTogW1FlbXUtZGV2ZWxdIFtQQVRDSCAxNi8x
Nl0gY29uZmlndXJlOiBkb19jb21waWxlcjogRHVtcCBzb21lIGV4dHJhIGluZm8gdW5kZXIgYmFz
aCIpOgo+IFBlcnNvbmFsbHkgSSdkIHN1Z2dlc3Qgd2UgYWRkIGluZm9ybWF0aXZlIG1lc3NhZ2Vz
IHRocm91Z2hvdXQgdGhlCj4gY29uZmlndXJlIHNjcmlwdCBmb3IgZWFjaCBjaGVjayBiZWluZyBy
dW4uIElmIHBlb3BsZSByZWFsbHkgaGF0ZSB0aGUKPiBpZGVhIG9mIGEgdmVyYm9zZSBvdXRwdXQg
ZnJvbSBjb25maWd1cmUsIHdlIGNvdWxkIGxlYXZlIGl0IHNpbGVudCBieQo+IGRlZmF1bHQgYW5k
IGFkZCBhICctLXZlcmJvc2UnIG9wdGlvbiB0byB0dXJuIGl0IG9uLgoKRG9pbmcgdGhhdCB3b3Vs
ZCBiZSBhIGxvdCBvZiB3b3JrLiAgSSBhbSBub3Qgb3Bwb3NlZCB0byBpdCwgYnV0IEkgYW0Kbm90
IGdvaW5nIHRvIGRvIGl0LgoKTXkgc3VnZ2VzdGlvbiBpcyBhIHZlcnkgc21hbGwgY2hhbmdlIHdo
aWNoIGluc3RhbnRseSBtYWtlcyBjb25maWd1cmUKbXVjaCBlYXNpZXIgdG8gZGVidWcsIGF0IGxl
YXN0IGlmIHlvdSBoYXZlIGJhc2ggYXZhaWxhYmxlIChhbmQgdGhlIGJ1Zwp5b3UgYXJlIGZpeGlu
ZyBkb2Vzbid0IGdvIGF3YXkgd2l0aCBiYXNoKS4KClBsZWFzZSBkb24ndCBsZXQgdGhlIGJlc3Qg
YmUgdGhlIGVuZW15IG9mIGFuIGltcHJvdmVtZW50LiAgSWYKY29uZmlndXJlIGlzIGV2ZXIgaW1w
cm92ZWQgKHdpdGhvdXQgYmVpbmcgc2ltcGx5IHJlcGxhY2VkKSwgdGhlCmxvZ2dpbmcgY29kZSBj
YW4gZWFzaWx5IGJlIHJlbW92ZWQuCgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
