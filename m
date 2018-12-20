From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] drm/xen-front: Make shmem backed display
 buffer coherent
Date: Thu, 20 Dec 2018 09:39:50 -0800
Message-ID: <20181220173950.GA19641__11492.9326031872$1545327514$gmane$org@infradead.org>
References: <20181127103252.20994-1-andr2000@gmail.com>
 <17640791-5306-f7e4-8588-dd39c14e975b@tronnes.org>
 <20181220153646.GA22997@infradead.org>
 <f2cfadc7-2e0b-b63d-d094-d5339b0c85fe@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=onL2=O5=bombadil.srs.infradead.org=batv+4320e4c38c4ab4f6f328+5597+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1ga2Ib-00008R-HI
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 17:39:53 +0000
Content-Disposition: inline
In-Reply-To: <f2cfadc7-2e0b-b63d-d094-d5339b0c85fe@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: jgross@suse.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, daniel.vetter@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMDU6NDk6MzlQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1
c2hjaGVua28gd3JvdGU6Cj4gVGhpcyBpcyB0aGUgb25seSBwYXRjaCBbMV0sIG5vIHNlcmllcy4g
QW5kIGF0IHRoZSBtb21lbnQgSSB0aGluawo+IHRoZXJlIGlzIG5vdGhpbmcgdG8gcmV2aWV3IGFz
IEkgYW0gbm90IHN1cmUgaG93IHRvIGRlYWwgd2l0aCB0aG9zZQo+IHNobWVtIHBhZ2VzOiB0aGlz
IHBhdGNoIGlzIHJhdGhlciB0byBzdGFydCBhIGRpc2N1c3Npb24gb24gaG93IHNobWVtCj4gcGFn
ZXMgY2FuIGJlIGZsdXNoZWQgb24gQVJNICh0aGUgb25seSB3b3JrYXJvdW5kIEkgaGF2ZSBzbyBm
YXIgaXMKPiBpbiB0aGlzIHBhdGNoIHdoaWNoIHVzZXMgRE1BIEFQSSkuIFRoaXMgaXMgd2hlcmUg
SSBhbSBsb29raW5nIGZvcgo+IHNvbWUgYWR2aWNlLCBzbyBJIGNhbiBpbXBsZW1lbnQgdGhlIHBh
dGNoIHRoZSByaWdodCB3YXkuCgpzaG1lbSBpcyBiYXNpY2FsbHkgcGFnZSBjYWNoZS4gIFNvIHlv
dSBuZWVkIHRvIHVzZSB0aGUgRE1BIHN0cmVhbWluZwpBUEkgKGRtYV9tYXBfKikgdG8gbWFwIGl0
IGZvciBETUEuICBZb3UgbmVlZCB0byBtYWtlIHN1cmUgbm8gb25lCmFjY2VzcyB0aGUga2VybmVs
IG1hcHBpbmcgYXQgdGhlIHNhbWUgdGltZSBhcyB5b3UgZG8gRE1BIHRvIGl0LApzbyB0aGUgcGFn
ZXMgc2hvdWxkIGJlIGxvY2tlZC4gIFRoaXMgaXMgaG93IHRoZSBub3JtYWwgZmlsZSBzeXN0ZW0K
SS9PIHBhdGggd29ya3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
