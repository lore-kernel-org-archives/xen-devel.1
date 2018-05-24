From: Sameer Goel <sameer.goel@linaro.org>
Subject: Re: [v2 5/6] drivers/passthrough/arm: Refactor code for
 arm smmu drivers
Date: Thu, 24 May 2018 14:30:08 -0600
Message-ID: <1fc46640-fc7f-942c-fa88-b52b7cf536b4@linaro.org>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-6-sameer.goel@linaro.org>
 <5B06708E02000078001C56CC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=merd=il=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1fLwsG-0006Dh-9g
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 20:30:12 +0000
Received: by mail-pf0-x244.google.com with SMTP id o76-v6so1438884pfi.5
 for <xen-devel@lists.xenproject.org>; Thu, 24 May 2018 13:30:10 -0700 (PDT)
In-Reply-To: <5B06708E02000078001C56CC@prv1-mh.provo.novell.com>
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

CgpPbiAwNS8yNC8yMDE4IDAxOjU4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNC4w
NS4xOCBhdCAwMjo0NiwgPHNhbWVlci5nb2VsQGxpbmFyby5vcmc+IHdyb3RlOgo+PiBQdWxsIGNv
bW1vbiBkZWZpbmVzIGZvciBTTU1VIGRyaXZlcyBpbiBhIGxvY2FsIGhlYWRlci4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogU2FtZWVyIEdvZWwgPHNhbWVlci5nb2VsQGxpbmFyby5vcmc+Cj4+IC0tLQo+
PiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9hcm1fc21tdS5oIHwgMTI1ICsrKysrKysr
KysrKysrKysrKysrKysrKysKPiBUaGlzIGJlaW5nIGEgbG9jYWwgaGVhZGVyIC0gd2h5IHRoZSBh
cm1fIHByZWZpeD8KSSdsbCBmaXggdGhpcy4KPgo+IEphbgo+Cj4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
