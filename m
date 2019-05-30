From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
Date: Thu, 30 May 2019 08:46:39 -0400
Message-ID: <eebb0275-9418-717f-97d7-5e55917f46fd__26202.1939082601$1559220670$gmane$org@oracle.com>
References: <20190529090407.1225-1-jgross@suse.com>
 <20190529090407.1225-4-jgross@suse.com>
 <20190530090409.GB30428@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4onE=T6=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hWKVT-0004zG-I5
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 12:50:07 +0000
In-Reply-To: <20190530090409.GB30428@infradead.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christoph Hellwig <hch@infradead.org>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8zMC8xOSA1OjA0IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBQbGVhc2UgZG9u
J3QgYWRkIHlvdXIgcHJpdmF0ZSBmbGFnIHRvIHBhZ2UtZmxhZ3MuaC4gIFRoZSB3aG9sZSBwb2lu
dCBvZgo+IHRoZSBwcml2YXRlIGZsYWcgaXMgdGhhdCB5b3UgY2FuIHVzZSBpdCBpbiBhbnkgd2F5
IHlvdSB3YW50IHdpdGhvdQo+IHRvdWNoaW5nIHRoZSBjb21tb24gY29kZS4KCgpUaGVyZSBpcyBh
bHJlYWR5IGEgYnVuY2ggb2YgYWxpYXNlcyBmb3IgdmFyaW91cyBzdWItY29tcG9uZW50cwooaW5j
bHVkaW5nIFhlbikgaW4gcGFnZS1mbGFncy5oIGZvciBwcml2YXRlIGZsYWdzLCB3aGljaCBpcyB3
aHkgSQpzdWdnZXN0ZWQgd2UgZG8gdGhlIHNhbWUgZm9yIHRoZSBuZXcgdXNlIGNhc2UuIEFkZGlu
ZyB0aGlzIG5ldyBhbGlhcwp3aWxsIGtlZXAgZmxhZyB1c2FnZSBjb25zaXN0ZW50LgoKLWJvcmlz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
