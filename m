From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] PCI: Mark expected switch fall-throughs
Date: Wed, 20 Mar 2019 14:41:35 -0500
Message-ID: <500ce9e7-9a0f-b632-1731-f15a5ba872fd__479.874345340647$1553110960$gmane$org@embeddedor.com>
References: <20190320182715.GA9406@embeddedor>
 <b67ab7b5-bb75-4443-1cfc-bb905ac09a15@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m5Fq=RX=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1h6h5o-0007Cj-So
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 19:41:40 +0000
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 46337400D4332
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2019 14:41:37 -0500 (CDT)
In-Reply-To: <b67ab7b5-bb75-4443-1cfc-bb905ac09a15@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAzLzIwLzE5IDI6MjcgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjAvMDMvMjAx
OSAxODoyNywgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGNpL3Byb2MuYyBiL2RyaXZlcnMvcGNpL3Byb2MuYwo+PiBpbmRleCA2ZmExNjI3Y2UwOGQu
LjQ0NWI1MWRiNzViMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9wY2kvcHJvYy5jCj4+ICsrKyBi
L2RyaXZlcnMvcGNpL3Byb2MuYwo+PiBAQCAtMjIyLDYgKzIyMiw3IEBAIHN0YXRpYyBsb25nIHBy
b2NfYnVzX3BjaV9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgaW50IGNtZCwKPj4g
IAkJfQo+PiAgCQkvKiBJZiBhcmNoIGRlY2lkZWQgaXQgY2FuJ3QsIGZhbGwgdGhyb3VnaC4uLiAq
Lwo+PiAgI2VuZGlmIC8qIEhBVkVfUENJX01NQVAgKi8KPj4gKwkJLyogZmFsbCB0aHJvdWdoICov
Cj4gCj4gU3VyZWx5IGl0IHdvdWxkIGJlIGJldHRlciB0byB0cmFuc3Bvc2UgdGhlICNlbmRpZiBh
bmQgaXRzIHByZXZpb3VzIGxpbmUsCj4gdGhhbiB0byBhZGQgYSBzZWNvbmQgZmFsbHRocm91Z2gg
Pwo+IAoKSSBhZ3JlZS4gIFRoZSB0aGluZyBpcyB0aGF0LCBjdXJyZW50bHksIEdDQyBpcyBleHBl
Y3RpbmcgdG8gZmluZCB0aGUKZmFsbC10aHJvdWdoICJhbm5vdGF0aW9ucyIgYXQgdGhlIHZlcnkg
Ym90dG9tIG9mIHRoZSBjYXNlIHN0YXRlbWVudCwKYXMgSSBtZW50aW9uZWQgaXQgaW4gdGhlIGNo
YW5nZWxvZyB0ZXh0LgoKVGhhdCdzIHRoZSByZWFzb24gd2h5IEkgZGVjaWRlZCB0byBsZWZ0IGlu
IHBsYWNlIHRoZSBvcmlnaW5hbCBjb21tZW50LgoKVGhhbmtzCi0tCkd1c3Rhdm8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
