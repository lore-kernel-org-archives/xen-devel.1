From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: [PATCH V3 1/2] Drivers/PCI: Export pcie_has_flr()
 interface
Date: Mon, 10 Sep 2018 12:52:31 +0300
Message-ID: <20180910095231.GD18222__24124.2437776693$1536573076$gmane$org@reaktio.net>
References: <20171208202424.GC12367@bhelgaas-glaptop.roam.corp.google.com>
 <426eeeab-0dcd-8de3-9c5f-a166acf2c130@Oracle.COM>
 <20171212005919.GB30595@bhelgaas-glaptop.roam.corp.google.com>
 <49956aaf-5fd5-939d-5fc7-231ffdb98b70@Oracle.COM>
 <20171213212420.GH30595@bhelgaas-glaptop.roam.corp.google.com>
 <fea075cf-fe6f-0d0b-11e4-4279fbfc280a@Oracle.COM>
 <20171215181801.GU30595@bhelgaas-glaptop.roam.corp.google.com>
 <20171218122629.GA18423@infradead.org>
 <20180909185944.GC18222@reaktio.net>
 <9ffe43d2-a44b-974c-85c9-9923d71c5dba@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6csh=ly=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1fzIs0-0004cB-VZ
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 09:52:36 +0000
Content-Disposition: inline
In-Reply-To: <9ffe43d2-a44b-974c-85c9-9923d71c5dba@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sinan Kaya <okaya@kernel.org>
Cc: jgross@suse.com, Sinan Kaya <okaya@codeaurora.org>, Govinda Tatti <Govinda.Tatti@Oracle.COM>, Herbert Xu <herbert@gondor.apana.org.au>, linux-pci@vger.kernel.org, Russell Currey <ruscur@russell.cc>, linux-kernel@vger.kernel.org, Derek Chickles <derek.chickles@caviumnetworks.com>, Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org, Srikanth Jampala <Jampala.Srikanth@cavium.com>, Bjorn Helgaas <helgaas@kernel.org>, JBeulich@suse.com, Felix Manlunas <felix.manlunas@caviumnetworks.com>, bhelgaas@google.com, Satanand Burla <satananda.burla@caviumnetworks.com>, boris.ostrovsky@Oracle.COM, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiBTdW4sIFNlcCAwOSwgMjAxOCBhdCAxMDozMzowMlBNIC0wNDAwLCBTaW5hbiBLYXlh
IHdyb3RlOgo+IE9uIDkvOS8yMDE4IDI6NTkgUE0sIFBhc2kgS8Okcmtrw6RpbmVuIHdyb3RlOgo+
ID5JIG5vdGljZWQgcGNpZV9oYXNfZmxyKCkgaGFzIGJlZW4gcmVjZW50bHkgZXhwb3J0ZWQgaW4g
dXBzdHJlYW0gTGludXg6Cj4gPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTJkMjkxN2Y3NzQ3ODA1YTFm
NDE4ODY3MmYzMDhkODJhOGJhMDE3MDAKPiA+Cj4gPkFyZSB0aGVyZSBtb3JlIGNoYW5nZXMgLyBj
bGVhbnVwcyBwbGFubmVkIHRvIHRoZXNlIGludGVyZmFjZXMsIGFzIG1lbnRpb25lZCBsYXN0IHll
YXI/Cj4gPgo+ID4oY29udGV4dDogeGVuLXBjaWJhY2sgcmVzZXQvZG9fZmxyIGZlYXR1cmVzIHVw
c3RyZWFtaW5nLCB3aGljaCBraW5kIG9mIHN0YWxsZWQgbGFzdCB5ZWFyIHdoZW4gcGNpZV9oYXNf
ZmxyKCkgd2Fzbid0IGV4cG9ydGVkIGF0IHRoZSB0aW1lKQo+IAo+IEV4cG9ydGluZyBwY2llX2hh
c19mbHIoKSBpcyBhIHZlcnkgc2ltcGxlIGNoYW5nZSB3aGljaCBjb3VsZCBoYXZlIGJlZW4gZG9u
ZQo+IGJ5IHRoZSBYRU4gcG9ydGluZyBlZmZvcnQuCj4gCj4gTWF5YmUsIHRoZSByaWdodCBxdWVz
dGlvbiBpcyB3aGF0IGlzIHNvIHNwZWNpYWwgYWJvdXQgWEVOIHJlc2V0Pwo+IAo+IFdoYXQgZmVh
dHVyZSBQQ0kgY29yZSBpcyBtaXNzaW5nIHRvIHN1cHBvcnQgWEVOIEZMUiByZXNldCB0aGF0IGNh
dXNlZAo+IHRoZSBlZmZvcnQgdG8gc3RhbGw/Cj4KCldlbGwgb25lIG9mIHRoZSByZWFzb25zIHBy
b2JhYmx5IHdhcyBiZWNhdXNlIENocmlzdG9waCB3YXMgcGxhbm5pbmcgdG8gZGVwcmVjYXRlIHRo
ZSBwY2llX2hhc19mbHIoKSBmdW5jdGlvbmFsaXR5Li4KCmh0dHBzOi8vbGlzdHMueGVuLm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTEyL21zZzAxMDU3Lmh0bWwKaHR0cHM6Ly9saXN0
cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTctMTIvbXNnMDEyNTIuaHRtbAoK
QnV0IG5vdyB0aGF0IHBjaWVfaGFzX2ZscigpIGlzIGV4cG9ydGVkIGFuZCBhdmFpbGFibGUgSSBn
dWVzcyBpdCdzIGZpbmUgdG8gY29udGludWUgdXNpbmcgaXQgYWxzbyBmb3IgeGVuLXBjaWJhY2sg
OikKCgpUaGFua3MsCgotLSBQYXNpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
