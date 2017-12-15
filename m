From: Govinda Tatti <Govinda.Tatti@Oracle.COM>
Subject: Re: [PATCH V3 1/2] Drivers/PCI: Export pcie_has_flr()
 interface
Date: Fri, 15 Dec 2017 14:01:57 -0600
Message-ID: <0ff910b6-9007-40b3-8943-45339603e868__16085.8708703474$1513368546$gmane$org@Oracle.COM>
References: <20171207222145.9769-1-Govinda.Tatti@Oracle.COM>
 <20171207222145.9769-2-Govinda.Tatti@Oracle.COM>
 <20171208202424.GC12367@bhelgaas-glaptop.roam.corp.google.com>
 <426eeeab-0dcd-8de3-9c5f-a166acf2c130@Oracle.COM>
 <20171212005919.GB30595@bhelgaas-glaptop.roam.corp.google.com>
 <49956aaf-5fd5-939d-5fc7-231ffdb98b70@Oracle.COM>
 <20171213212420.GH30595@bhelgaas-glaptop.roam.corp.google.com>
 <fea075cf-fe6f-0d0b-11e4-4279fbfc280a@Oracle.COM>
 <20171215181801.GU30595@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=onmx=dl=oracle.com=govinda.tatti@srs-us1.protection.inumbo.net>)
 id 1ePwHB-0002lB-LG
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2017 20:08:09 +0000
In-Reply-To: <20171215181801.GU30595@bhelgaas-glaptop.roam.corp.google.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: jgross@suse.com, Satanand Burla <satananda.burla@caviumnetworks.com>, Srikanth Jampala <Jampala.Srikanth@cavium.com>, Herbert Xu <herbert@gondor.apana.org.au>, Christoph Hellwig <hch@infradead.org>, linux-pci@vger.kernel.org, Russell Currey <ruscur@russell.cc>, linux-kernel@vger.kernel.org, Derek Chickles <derek.chickles@caviumnetworks.com>, Sinan Kaya <okaya@codeaurora.org>, JBeulich@suse.com, Felix Manlunas <felix.manlunas@caviumnetworks.com>, bhelgaas@google.com, xen-devel@lists.xenproject.org, boris.ostrovsky@Oracle.COM, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

ClRoYW5rcyBCam9ybiBmb3IgeW91ciByZXNwb25zZS4gUGxlYXNlIHNlZSBiZWxvdyBmb3IgbXkg
Y29tbWVudHMuCj4+IFNvLCB3ZSBzaG91bGQgY29uc2lkZXIgb25lIG9mIHRoZXNlIG9wdGlvbnMu
Cj4+Cj4+IC0gc2V0IFBDSV9ERVZfRkxBR1NfTk9fRkxSX1JFU0VUIGlmIGl0IGlzIG5vdCBzdXBw
b3J0ZWQuCj4+IC0gcGNpZV9mbHIoKSBzaG91bGQgcmV0dXJuIGlmIGl0IGlzIG5vdCBzdXBwb3J0
ZWQKPj4KPj4gSWYgd2UgbW9kaWZ5IHBjaWVfZmxyKCkgdG8gcmV0dXJuIGVycm9yIGNvZGVzLCB0
aGVuIHdlIG5lZWQgdG8gbW9kaWZ5Cj4+IGFsbCBleGlzdGluZyBtb2R1bGVzIHRoYXQgYXJlIGNh
bGxpbmcgdGhpcyBmdW5jdGlvbi4KPiBZZXMsIG9mIGNvdXJzZS4KPgo+PiBQbGVhc2UgbGV0IG1l
IGtub3cgeW91ciBwcmVmZXJlbmNlLCBzbyB0aGF0IEkgY2FuIG1vdmUgYWNjb3JkaW5nbHkuIFRo
YW5rcy4KPiBJIHRoaW5rIENocmlzdG9waCB2b2x1bnRlZXJlZCB0byBkbyBzb21lIHJlc3RydWN0
dXJpbmcsIGJ1dCBJIGRvbid0Cj4ga25vdyBoaXMgdGltZWZyYW1lLiAgSWYgeW91IGNhbiwgSSB3
b3VsZCBwcm9iYWJseSB3YWl0IGZvciB0aGF0Cj4gYmVjYXVzZSB0aGVyZSdzIHNvIG11Y2ggb3Zl
cmxhcCBoZXJlLgpPSy4KPgo+IFRoZSBvdGhlciBwYXRocyB0aGF0IHVzZSBQQ0lfRVhQX0RFVkNU
TF9CQ1JfRkxSIGFyZSBkZWZpbml0ZWx5IGlzc3Vlcwo+IGFuZCBzaG91bGQgYmUgZml4ZWQsIGJ1
dCBhZ2FpbiBzaG91bGQgd2FpdCBmb3IgdGhlIHJldmlzZWQgcGNpZV9mbHIoKQo+IGludGVyZmFj
ZS4gIEFuZCBpZiB0aGV5J3JlIG5vdCBhY3R1YWxseSByZXF1aXJlZCBmb3IgeW91ciBYZW4gaXNz
dWUsCj4gdGhleSBzb3VuZCBsaWtlICJuaWNlIHRvIGhhdmUiIGNsZWFudXBzIHRoYXQgd2lsbCBu
b3QgZ2F0ZSB5b3VyIFhlbgo+IGZpeGVzLiAgSSBhZGRlZCB0aGlzIHRvIG15IGV2ZXItZ3Jvd2lu
ZyBsaXN0IG9mIGNsZWFudXBzIHRvIGRvLgpGb3Igbm93LCBJIGFtIHBsYW5uaW5nIHRvIHVzZSBl
eGlzdGluZyBwY2llX2ZscigpIGFmdGVyIGNoZWNraW5nIEZMUgpjYXBhYmlsaXR5IGluc2lkZSBY
ZW5wY2liYWNrIGRyaXZlciAobGlrZSBvdGhlciBleGlzdGluZyBwY2llX2ZscigpCnVzYWdlKS4g
V2Ugd2lsbCBzd2l0Y2ggdG8gcmV2aXNlZCBwY2llX2ZscigpIG9uY2UgaXQgaXMgYXZhaWxhYmxl
LgoKQ2hlZXJzCkdPVklOREEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
