From: Sinan Kaya <okaya@kernel.org>
Subject: Re: [PATCH V3 1/2] Drivers/PCI: Export pcie_has_flr()
 interface
Date: Mon, 10 Sep 2018 13:04:39 -0400
Message-ID: <8b56c803-f8b7-2bb3-79b5-c7aebda6c87c__19649.2434399717$1536599017$gmane$org@kernel.org>
References: <20171208202424.GC12367@bhelgaas-glaptop.roam.corp.google.com>
 <426eeeab-0dcd-8de3-9c5f-a166acf2c130@Oracle.COM>
 <20171212005919.GB30595@bhelgaas-glaptop.roam.corp.google.com>
 <49956aaf-5fd5-939d-5fc7-231ffdb98b70@Oracle.COM>
 <20171213212420.GH30595@bhelgaas-glaptop.roam.corp.google.com>
 <fea075cf-fe6f-0d0b-11e4-4279fbfc280a@Oracle.COM>
 <20171215181801.GU30595@bhelgaas-glaptop.roam.corp.google.com>
 <20171218122629.GA18423@infradead.org> <20180909185944.GC18222@reaktio.net>
 <9ffe43d2-a44b-974c-85c9-9923d71c5dba@kernel.org>
 <20180910095231.GD18222@reaktio.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mz+s=ly=kernel.org=okaya@srs-us1.protection.inumbo.net>)
 id 1fzPcF-0006Ae-1I
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 17:04:47 +0000
In-Reply-To: <20180910095231.GD18222@reaktio.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?B?UGFzaSBLw6Rya2vDpGluZW4=?= <pasik@iki.fi>
Cc: jgross@suse.com, Sinan Kaya <okaya@codeaurora.org>, Govinda Tatti <Govinda.Tatti@Oracle.COM>, Herbert Xu <herbert@gondor.apana.org.au>, linux-pci@vger.kernel.org, Russell Currey <ruscur@russell.cc>, linux-kernel@vger.kernel.org, Derek Chickles <derek.chickles@caviumnetworks.com>, Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org, Srikanth Jampala <Jampala.Srikanth@cavium.com>, Bjorn Helgaas <helgaas@kernel.org>, JBeulich@suse.com, Felix Manlunas <felix.manlunas@caviumnetworks.com>, bhelgaas@google.com, Satanand Burla <satananda.burla@caviumnetworks.com>, boris.ostrovsky@Oracle.COM, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gOS8xMC8yMDE4IDU6NTIgQU0sIFBhc2kgS8Okcmtrw6RpbmVuIHdyb3RlOgo+IEhpLAo+IAo+
IE9uIFN1biwgU2VwIDA5LCAyMDE4IGF0IDEwOjMzOjAyUE0gLTA0MDAsIFNpbmFuIEtheWEgd3Jv
dGU6Cj4+IE9uIDkvOS8yMDE4IDI6NTkgUE0sIFBhc2kgS8Okcmtrw6RpbmVuIHdyb3RlOgo+Pj4g
SSBub3RpY2VkIHBjaWVfaGFzX2ZscigpIGhhcyBiZWVuIHJlY2VudGx5IGV4cG9ydGVkIGluIHVw
c3RyZWFtIExpbnV4Ogo+Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9MmQyOTE3Zjc3NDc4MDVhMWY0
MTg4NjcyZjMwOGQ4MmE4YmEwMTcwMAo+Pj4KPj4+IEFyZSB0aGVyZSBtb3JlIGNoYW5nZXMgLyBj
bGVhbnVwcyBwbGFubmVkIHRvIHRoZXNlIGludGVyZmFjZXMsIGFzIG1lbnRpb25lZCBsYXN0IHll
YXI/Cj4+Pgo+Pj4gKGNvbnRleHQ6IHhlbi1wY2liYWNrIHJlc2V0L2RvX2ZsciBmZWF0dXJlcyB1
cHN0cmVhbWluZywgd2hpY2gga2luZCBvZiBzdGFsbGVkIGxhc3QgeWVhciB3aGVuIHBjaWVfaGFz
X2ZscigpIHdhc24ndCBleHBvcnRlZCBhdCB0aGUgdGltZSkKPj4KPj4gRXhwb3J0aW5nIHBjaWVf
aGFzX2ZscigpIGlzIGEgdmVyeSBzaW1wbGUgY2hhbmdlIHdoaWNoIGNvdWxkIGhhdmUgYmVlbiBk
b25lCj4+IGJ5IHRoZSBYRU4gcG9ydGluZyBlZmZvcnQuCj4+Cj4+IE1heWJlLCB0aGUgcmlnaHQg
cXVlc3Rpb24gaXMgd2hhdCBpcyBzbyBzcGVjaWFsIGFib3V0IFhFTiByZXNldD8KPj4KPj4gV2hh
dCBmZWF0dXJlIFBDSSBjb3JlIGlzIG1pc3NpbmcgdG8gc3VwcG9ydCBYRU4gRkxSIHJlc2V0IHRo
YXQgY2F1c2VkCj4+IHRoZSBlZmZvcnQgdG8gc3RhbGw/Cj4+Cj4gCj4gV2VsbCBvbmUgb2YgdGhl
IHJlYXNvbnMgcHJvYmFibHkgd2FzIGJlY2F1c2UgQ2hyaXN0b3BoIHdhcyBwbGFubmluZyB0byBk
ZXByZWNhdGUgdGhlIHBjaWVfaGFzX2ZscigpIGZ1bmN0aW9uYWxpdHkuLgo+IAo+IGh0dHBzOi8v
bGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTEyL21zZzAxMDU3Lmh0
bWwKPiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0x
Mi9tc2cwMTI1Mi5odG1sCj4gCj4gQnV0IG5vdyB0aGF0IHBjaWVfaGFzX2ZscigpIGlzIGV4cG9y
dGVkIGFuZCBhdmFpbGFibGUgSSBndWVzcyBpdCdzIGZpbmUgdG8gY29udGludWUgdXNpbmcgaXQg
YWxzbyBmb3IgeGVuLXBjaWJhY2sgOikKPiAKClllYWgsIEkgd291bGQgZ28gYWhlYWQgd2l0aCB0
aGUgaW1wbGVtZW50YXRpb24uIFJlZmFjdG9yaW5nIGNhbiBiZSBkb25lCmluZGVwZW5kZW50bHku
Cgo+IAo+IFRoYW5rcywKPiAKPiAtLSBQYXNpCj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
