From: Juergen Gross <jgross@suse.com>
Subject: Re: [stable] xen/pciback: Don't disable PCI_COMMAND on
 PCI device reset.
Date: Fri, 31 May 2019 13:46:03 +0200
Message-ID: <9335b280-3cd2-3071-4139-5cb804849205__29704.5605185971$1559303232$gmane$org@suse.com>
References: <1559229415.24330.2.camel@codethink.co.uk>
 <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdqe=T7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hWfz8-0000CI-12
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 11:46:10 +0000
In-Reply-To: <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ben Hutchings <ben.hutchings@codethink.co.uk>
Cc: Prarit Bhargava <prarit@redhat.com>, xen-devel@lists.xenproject.org, stable <stable@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMjAxOSAwNDowMiwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+IE9uIDUv
MzAvMTkgODoxNiBBTSwgQmVuIEh1dGNoaW5ncyB3cm90ZToKPj4gSSdtIGxvb2tpbmcgYXQgQ1ZF
LTIwMTUtODU1MyB3aGljaCBpcyBmaXhlZCBieToKPj4KPj4gY29tbWl0IDc2ODFmMzFlYzljZGFj
YWI0ZmQxMDU3MGJlOTI0ZjJjZWY2NjY5YmEKPj4gQXV0aG9yOiBLb25yYWQgUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4+IERhdGU6wqDCoMKgV2VkIEZlYiAxMyAxODoy
MTozMSAyMDE5IC0wNTAwCj4+Cj4+IMKgwqDCoMKgwqB4ZW4vcGNpYmFjazogRG9uJ3QgZGlzYWJs
ZSBQQ0lfQ09NTUFORCBvbiBQQ0kgZGV2aWNlIHJlc2V0Lgo+Pgo+PiBJJ20gYXdhcmUgdGhhdCB0
aGlzIGNoYW5nZSBpcyBpbmNvbXBhdGlibGUgd2l0aCBxZW11IDwgMi41LCBidXQgdGhhdCdzCj4+
IG5vdyBxdWl0ZSBvbGQuwqAgRG8geW91IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGFwcGx5IHRo
aXMgY2hhbmdlIHRvCj4+IHNvbWUgc3RhYmxlIGJyYW5jaGVzPwo+Pgo+PiBCZW4uCj4+Cj4gCj4g
SGV5IEJlbiwKPiAKPiA8c2hydWdzPiBNeSBvcGluaW9uIGlzIHRvIGRyb3AgaXQsIGJ1dCBpZiBK
dWVyZ2VuIHRoaW5rcyBpdCBtYWtlcyBzZW5zZQo+IHRvIGJhY2twb3J0IEkgYW0gbm90IGdvaW5n
IHRvIGFyZ3VlLgo+IAoKSSdtIHdpdGggS29ucmFkIGhlcmUuCgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
