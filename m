From: Sameer Goel <sameer.goel@linaro.org>
Subject: Re: [v2 4/6] xen/iommu: smmu-v3: Add Xen specific code
 to enable the ported driver
Date: Thu, 24 May 2018 14:26:05 -0600
Message-ID: <487269f9-7af5-ad9d-e89c-0c9b8d5bd67c@linaro.org>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-5-sameer.goel@linaro.org>
 <5B06705802000078001C56C9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=merd=il=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1fLwoL-0005Ut-74
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 20:26:09 +0000
Received: by mail-pl0-x243.google.com with SMTP id c11-v6so1724993plr.5
 for <xen-devel@lists.xenproject.org>; Thu, 24 May 2018 13:26:08 -0700 (PDT)
In-Reply-To: <5B06705802000078001C56C9@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Manish Jaggi <mjaggi@caviumnetworks.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, shankerd@codeaurora.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNS8yNC8yMDE4IDAxOjU3IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNC4w
NS4xOCBhdCAwMjo0NiwgPHNhbWVlci5nb2VsQGxpbmFyby5vcmc+IHdyb3RlOgo+PiAtLS0gL2Rl
di9udWxsCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9saW51eF9jb21wYXQuaAo+IEkgY29udGlu
dWUgdG8gZGlzbGlrZSB0aGUgaWRlYSBvZiBoYXZpbmcgYSBoZWFkZXIgd2l0aCB0aGVzZSBjb250
ZW50cyBpbiB0aGlzIGxvY2F0aW9uLgpBcyBleHBsYWluZWQgcHJldmlvdXNseSB0aGlzIGhlYWRl
ciBjYW4gYmUgdXNlZCBmb3IgdGhlIGFueSBkcml2ZXIgdGhhdCAKd2Ugd2FudCB0byBwb3J0IGZy
b20gTGludXguIFRoaXMgaXMgbm90IGFybSBzcGVjaWZpYy4gVGhpcyBzZWVtZWQgbGlrZSAKdGhl
IGJlc3QgbG9jYXRpb24gZm9yIHRoZSBmaWxlLiBXaGljaCBvdGhlciBjb21tb24gbG9jYXRpb24g
c2hvdWxkIEkgcGljaz8KPiBJbmRlcGVuZGVudCBvZiB0aGF0IEknZCBwcmVmZXIgaWYgbmV3IGZp
bGVzIHVzZWQgaHlwaGVucyBpbnN0ZWFkIG9mIHVuZGVyc2NvcmVzCkknbGwgY2hhbmdlIHRoZSBu
YW1lIG9mIHRoZSBmaWxlLgo+IGluIHRoZWlyIG5hbWVzIC0ganVzdCBsaWtlIGZvciBjb21tYW5k
IGxpbmUgb3B0aW9ucywgb3RoZXIgdGhhbiBDIGlkZW50aWZpZXJzIHRoZXkncmUKPiBub3QgcmVz
dHJpY3RlZCB0byBhIHZlcnkgbmFycm93IHNldCBvZiBwb3NzaWJsZSBkZWxpbWl0ZXJzIG9yIG5h
bWUgY29tcG9uZW50cy4KPgo+IEphbgo+Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
