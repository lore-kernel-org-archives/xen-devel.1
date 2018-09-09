From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: [PATCH V3 1/2] Drivers/PCI: Export pcie_has_flr()
 interface
Date: Sun, 9 Sep 2018 21:59:44 +0300
Message-ID: <20180909185944.GC18222__33665.8779801384$1536519536$gmane$org@reaktio.net>
References: <20171207222145.9769-1-Govinda.Tatti@Oracle.COM>
 <20171207222145.9769-2-Govinda.Tatti@Oracle.COM>
 <20171208202424.GC12367@bhelgaas-glaptop.roam.corp.google.com>
 <426eeeab-0dcd-8de3-9c5f-a166acf2c130@Oracle.COM>
 <20171212005919.GB30595@bhelgaas-glaptop.roam.corp.google.com>
 <49956aaf-5fd5-939d-5fc7-231ffdb98b70@Oracle.COM>
 <20171213212420.GH30595@bhelgaas-glaptop.roam.corp.google.com>
 <fea075cf-fe6f-0d0b-11e4-4279fbfc280a@Oracle.COM>
 <20171215181801.GU30595@bhelgaas-glaptop.roam.corp.google.com>
 <20171218122629.GA18423@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=yo3k=lx=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1fz4w4-0003IK-F9
 for xen-devel@lists.xenproject.org; Sun, 09 Sep 2018 18:59:52 +0000
Content-Disposition: inline
In-Reply-To: <20171218122629.GA18423@infradead.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: jgross@suse.com, Satanand Burla <satananda.burla@caviumnetworks.com>, Govinda Tatti <Govinda.Tatti@Oracle.COM>, Herbert Xu <herbert@gondor.apana.org.au>, linux-pci@vger.kernel.org, Russell Currey <ruscur@russell.cc>, linux-kernel@vger.kernel.org, Derek Chickles <derek.chickles@caviumnetworks.com>, Sinan Kaya <okaya@codeaurora.org>, Srikanth Jampala <Jampala.Srikanth@cavium.com>, Bjorn Helgaas <helgaas@kernel.org>, JBeulich@suse.com, Felix Manlunas <felix.manlunas@caviumnetworks.com>, bhelgaas@google.com, xen-devel@lists.xenproject.org, boris.ostrovsky@Oracle.COM, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMTgsIDIwMTcgYXQgMDQ6MjY6MzBBTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBEZWMgMTUsIDIwMTcgYXQgMTI6MTg6MDJQTSAtMDYwMCwgQmpv
cm4gSGVsZ2FhcyB3cm90ZToKPiA+IEkgdGhpbmsgQ2hyaXN0b3BoIHZvbHVudGVlcmVkIHRvIGRv
IHNvbWUgcmVzdHJ1Y3R1cmluZywgYnV0IEkgZG9uJ3QKPiA+IGtub3cgaGlzIHRpbWVmcmFtZS4g
IElmIHlvdSBjYW4sIEkgd291bGQgcHJvYmFibHkgd2FpdCBmb3IgdGhhdAo+ID4gYmVjYXVzZSB0
aGVyZSdzIHNvIG11Y2ggb3ZlcmxhcCBoZXJlLgo+IAo+IEknbGwgaGF2ZSBzb21lIHRpbWUgb3Zl
ciB0aGUgaG9saWRheXMuICBJZiB5b3UgbmVlZCBpdCBtb3JlIHVyZ2VudAo+IHRoYW4gdGhhdCBm
ZWVsIGZyZWUgdG8gdGFrZSBvdmVyLgo+IAoKUmVwbHlpbmcgdG8gYW4gb2xkIHRocmVhZC4uCgpJ
IG5vdGljZWQgcGNpZV9oYXNfZmxyKCkgaGFzIGJlZW4gcmVjZW50bHkgZXhwb3J0ZWQgaW4gdXBz
dHJlYW0gTGludXg6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTJkMjkxN2Y3NzQ3ODA1YTFmNDE4ODY3
MmYzMDhkODJhOGJhMDE3MDAKCkFyZSB0aGVyZSBtb3JlIGNoYW5nZXMgLyBjbGVhbnVwcyBwbGFu
bmVkIHRvIHRoZXNlIGludGVyZmFjZXMsIGFzIG1lbnRpb25lZCBsYXN0IHllYXI/CgooY29udGV4
dDogeGVuLXBjaWJhY2sgcmVzZXQvZG9fZmxyIGZlYXR1cmVzIHVwc3RyZWFtaW5nLCB3aGljaCBr
aW5kIG9mIHN0YWxsZWQgbGFzdCB5ZWFyIHdoZW4gcGNpZV9oYXNfZmxyKCkgd2Fzbid0IGV4cG9y
dGVkIGF0IHRoZSB0aW1lKQoKClRoYW5rcywKCi0tIFBhc2kKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
