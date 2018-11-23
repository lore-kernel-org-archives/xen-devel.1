From: Joerg Roedel <joro@8bytes.org>
Subject: Re: remove the ->mapping_error method from dma_map_ops
 V2
Date: Fri, 23 Nov 2018 11:49:18 +0100
Message-ID: <20181123104918.GE1586__19023.8070711077$1542970080$gmane$org@8bytes.org>
References: <20181122140320.24080-1-hch@lst.de>
 <CAHk-=wh=_T=A53+o4zLNbKio43LGqVDb0KCbWPDvAg54bRDmWw@mail.gmail.com>
 <20181122170715.GI30658@n2100.armlinux.org.uk>
 <CAHk-=wgfGzXuDAKFQPdzMib3QCRHfSTsy5=gLU-WCoya+Ym+1A@mail.gmail.com>
 <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dRFs=OC=8bytes.org=joro@srs-us1.protection.inumbo.net>)
 id 1gQ91V-00007B-3f
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 10:49:21 +0000
Content-Disposition: inline
In-Reply-To: <11829e3c-7302-f821-cf5c-863e5267a17b@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, linux@armlinux.org.uk, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, jdmason@kudzu.us, Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMDU6NTI6MTVQTSArMDAwMCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+IFVuZm9ydHVuYXRlbHksIHdpdGggdGhpbmdzIGxpa2UgdGhlIHRvcC1kb3duIElPVkEg
YWxsb2NhdG9yLCBhbmQgMzItYml0Cj4gc3lzdGVtcyBpbiBnZW5lcmFsLCAidGhlIHRvcCA0MDk1
IiB2YWx1ZXMgbWF5IHdlbGwgc3RpbGwgYmUgdmFsaWQgYWRkcmVzc2VzCj4gLSB3ZSdyZSByZWx5
aW5nIG9uIGEgMS1ieXRlIG1hcHBpbmcgb2YgdGhlIHZlcnkgdG9wIGJ5dGUgb2YgbWVtb3J5L0lP
VkEKPiBzcGFjZSBiZWluZyBzdWZmaWNpZW50bHkgcmlkaWN1bG91cyB0aGF0IG5vIHJlYWwgY29k
ZSB3b3VsZCBldmVyIGRvIHRoYXQsCj4gYnV0IGV2ZW4gYSA0LWJ5dGUgbWFwcGluZyBvZiB0aGUg
dG9wIDQgYnl0ZXMgaXMgd2l0aGluIHRoZSByZWFsbXMgb2YgdGhlCj4gcGxhdXNpYmxlIChJJ3Zl
IGRlZmluaXRlbHkgc2VlbiB0aGUgVVNCIGxheWVyIG1ha2UgOC1ieXRlIG1hcHBpbmdzIGZyb20g
YW55Cj4gb2xkIG9mZnNldCB3aXRoaW4gYSBwYWdlLCBmb3IgZXhhbXBsZSkuCgpCdXQgd2UgY2Fu
IGVhc2lseSB3b3JrIGFyb3VuZCB0aGF0IGJ5IHJlc2VydmluZyB0aGUgdG9wIDRrIG9mIHRoZSBm
aXJzdAo0R0Igb2YgSU9WQSBhZGRyZXNzIHNwYWNlIGluIHRoZSBhbGxvY2F0b3IsIG5vPyBUaGVu
IHRoZXNlIHZhbHVlcyBhcmUKbmV2ZXIgcmV0dXJuZWQgYXMgdmFsaWQgRE1BIGhhbmRsZXMuCgoK
UmVnYXJkcywKCglKb2VyZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
