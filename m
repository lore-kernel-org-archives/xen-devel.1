From: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH RFC 2/6] mm: convert PG_balloon to PG_offline
Date: Wed, 14 Nov 2018 18:07:26 -0800
Message-ID: <20181115020725.GC2353__8446.83293621547$1542262039$gmane$org@rapoport-lnx>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-3-david@redhat.com>
 <20181114222321.GB1784@bombadil.infradead.org>
 <b4668081-5aa3-d7f5-6880-d01c75cfc6ae@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ljlt=n2=linux.ibm.com=rppt@srs-us1.protection.inumbo.net>)
 id 1gN74R-0003Lp-74
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 02:07:51 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAF1wfOJ024294
 for <xen-devel@lists.xenproject.org>; Wed, 14 Nov 2018 21:07:48 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2nrwwq3r9b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 14 Nov 2018 21:07:47 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <xen-devel@lists.xenproject.org> from <rppt@linux.ibm.com>;
 Thu, 15 Nov 2018 02:07:44 -0000
Content-Disposition: inline
In-Reply-To: <b4668081-5aa3-d7f5-6880-d01c75cfc6ae@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org, linux-mm@kvack.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>, Pavel Tatashin <pasha.tatashin@oracle.com>, Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org, Alexey Dobriyan <adobriyan@gmail.com>, linux-pm@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Christian Hansen <chansen3@cisco.com>, linux-kernel@vger.kernel.org, Miles Chen <miles.chen@mediatek.com>, linux-fsdevel@vger.kernel.org, devel@linuxdriverproject.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMTQsIDIwMTggYXQgMTE6NDk6MTVQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gT24gMTQuMTEuMTggMjM6MjMsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+ID4g
T24gV2VkLCBOb3YgMTQsIDIwMTggYXQgMTA6MTc6MDBQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgd3JvdGU6Cj4gPj4gUmVuYW1lIFBHX2JhbGxvb24gdG8gUEdfb2ZmbGluZS4gVGhpcyBpcyBh
biBpbmRpY2F0b3IgdGhhdCB0aGUgcGFnZSBpcwo+ID4+IGxvZ2ljYWxseSBvZmZsaW5lLCB0aGUg
Y29udGVudCBzdGFsZSBhbmQgdGhhdCBpdCBzaG91bGQgbm90IGJlIHRvdWNoZWQKPiA+PiAoZS5n
LiBhIGh5cGVydmlzb3Igd291bGQgaGF2ZSB0byBhbGxvY2F0ZSBiYWNraW5nIHN0b3JhZ2UgaW4g
b3JkZXIgZm9yIHRoZQo+ID4+IGd1ZXN0IHRvIGR1bXAgYW4gdW51c2VkIHBhZ2UpLiAgV2UgY2Fu
IHRoZW4gZS5nLiBleGNsdWRlIHN1Y2ggcGFnZXMgZnJvbQo+ID4+IGR1bXBzLgo+ID4+Cj4gPj4g
SW4gZm9sbG93aW5nIHBhdGNoZXMsIHdlIHdpbGwgbWFrZSB1c2Ugb2YgdGhpcyBiaXQgYWxzbyBp
biBvdGhlciBiYWxsb29uCj4gPj4gZHJpdmVycy4gIFdoaWxlIGF0IGl0LCBkb2N1bWVudCBQR1RB
QkxFLgo+ID4gCj4gPiBUaGFuayB5b3UgZm9yIGRvY3VtZW50aW5nIFBHVEFCTEUuICBJIGRpZG4n
dCByZWFsaXNlIEkgYWxzbyBoYWQgdGhpcwo+ID4gZG9jdW1lbnQgdG8gdXBkYXRlIHdoZW4gSSBh
ZGRlZCBQR1RBQkxFLgo+IAo+IFRoYW5rIHlvdSBmb3IgbG9va2luZyBpbnRvIHRoaXMgOikKPiAK
PiA+IAo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbW0vcGFnZW1hcC5yc3QK
PiA+PiBAQCAtNzgsNiArNzgsOCBAQCBudW1iZXIgb2YgdGltZXMgYSBwYWdlIGlzIG1hcHBlZC4K
PiA+PiAgICAgIDIzLiBCQUxMT09OCj4gPj4gICAgICAyNC4gWkVST19QQUdFCj4gPj4gICAgICAy
NS4gSURMRQo+ID4+ICsgICAgMjYuIFBHVEFCTEUKPiA+PiArICAgIDI3LiBPRkZMSU5FCj4gPiAK
PiA+IFNvIHRoZSBvZmZsaW5lICp1c2VyKiBiaXQgaXMgbmV3IC4uLiBldmVuIHRob3VnaCB0aGUg
Kmtlcm5lbCogYml0Cj4gPiBqdXN0IHJlbmFtZXMgdGhlIGJhbGxvb24gYml0LiAgSSdtIG5vdCBz
dXJlIGhvdyBJIGZlZWwgYWJvdXQgdGhpcy4KPiA+IEknbSBnb2luZyB0byB0aGluayBhYm91dCBp
dCBzb21lIG1vcmUuICBDb3VsZCB5b3Ugc2hhcmUgeW91ciBkZWNpc2lvbgo+ID4gcHJvY2VzcyB3
aXRoIHVzPwo+IAo+IEJBTExPT04gd2FzL2lzIGRvY3VtZW50ZWQgYXMKPiAKPiAiMjMgLSBCQUxM
T09OCj4gICAgIGJhbGxvb24gY29tcGFjdGlvbiBwYWdlCj4gIgo+IAo+IGFuZCBvbmx5IGluY2x1
ZGVzIGFsbCB2aXJ0aW8tYmFsbG9uIHBhZ2VzIGFmdGVyIHRoZSBub24tbHJ1IG1pZ3JhdGlvbgo+
IGZlYXR1cmUgaGFzIGJlZW4gaW1wbGVtZW50ZWQgZm9yIGJhbGxvb25lZCBwYWdlcy4gU2luY2Ug
dGhlbiwgdGhpcyBmbGFnCj4gZG9lcyBiYXNpY2FsbHkgbm8gbG9uZ2VyIHN0YW5kcyBmb3Igd2hh
dCBpdCBhY3R1YWxseSB3YXMgc3VwcG9zZWQgdG8gZG8uCgpQZXJoYXBzIEkgbWlzc2luZyBzb21l
dGhpbmcsIGJ1dCBob3cgdGhlIHVzZXIgc2hvdWxkIGludGVycHJldCAiMjMiIHdoZW4gaGUKcmVh
ZHMgL3Byb2Mva3BhZ2VmbGFncz8KCj4gVG8gbm90IGJyZWFrIHVhcGkgSSBkZWNpZGVkIHRvIG5v
dCByZW5hbWUgaXQgYnV0IGluc3RlYWQgdG8gYWRkIGEgbmV3IGZsYWcuCgpJJ3ZlIGdvdCBhIGZl
ZWxpbmcgdGhhdCB1YXBpIHdhcyBhbnl3YXkgY2hhbmdlZCBmb3IgdGhlIEJBTExPTiBmbGFnCm1l
YW5pbmcuCiAKPiA+IAo+ID4gSSBoYXZlIG5vIG9iamVjdGlvbiB0byByZW5hbWluZyB0aGUgYmFs
bG9vbiBiaXQgaW5zaWRlIHRoZSBrZXJuZWw7IEkKPiA+IHRoaW5rIHRoYXQncyBhIHdpc2UgaWRl
YS4gIEknbSBqdXN0IG5vdCBzdXJlIHdoZXRoZXIgd2Ugc2hvdWxkIHJlbmFtZQo+ID4gdGhlIHVz
ZXIgYmFsbG9vbiBiaXQgcmF0aGVyIHRoYW4gYWRkaW5nIGEgbmV3IGJpdC4KPiA+IAo+IAo+IENh
biB3ZSByZW5hbWUgd2l0aG91dCBicmVha2luZyB1YXBpPwo+IAo+IC0tIAo+IAo+IFRoYW5rcywK
PiAKPiBEYXZpZCAvIGRoaWxkZW5iCj4gCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
