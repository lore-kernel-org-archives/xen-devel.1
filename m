From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC v4 8/8] drivers/passthrough/arm: Refactor code
 for arm smmu drivers
Date: Tue, 23 Jan 2018 15:38:20 +0000
Message-ID: <e13b0801-69b1-8f69-c010-6b241ef64319@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-9-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jwx3=es=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ee0eW-0008SF-WF
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 15:38:25 +0000
Received: by mail-wr0-x22c.google.com with SMTP id z48so1027640wrz.6
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2018 07:38:23 -0800 (PST)
In-Reply-To: <20171219031703.23420-9-sameer.goel@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, julien.grall@arm.com, mjaggi@caviumnetworks.com
Cc: sstabellini@kernel.org, andre.przywara@linaro.org, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

SGkgU2FtZWVyLAoKT24gMTkvMTIvMTcgMDM6MTcsIFNhbWVlciBHb2VsIHdyb3RlOgo+IFB1bGwg
Y29tbW9uIGRlZmluZXMgZm9yIFNNTVUgZHJpdmVycyBpbiBhIGxvY2FsIGhlYWRlci4KCkkgd2Fz
IGV4cGVjdGVkIHRvIHNlZSB0aGlzIHBhdGNoIGJlZm9yZSBTTU1VdjMgaXMgYWRkZWQuIEJ1dCBJ
IGFtIG9rIAp3aXRoIHRoYXQgdG9vLgoKSG93ZXZlciwgaWYgeW91IHdhbnQgdG8gZG8gc29tZSBy
ZW5hbWluZyB0aGlzIHNob3VsZCBiZSBkb25lIHNlcGFyYXRlbHkuIApTbyBpdCB3aWxsIGJlIGVh
c2llciB0byBrbm93IHRoaXMgcGF0Y2ggaXMgb25seSBjb25zb2xpZGF0aW9uLgoKQnV0IHdoeSBk
byB5b3UgbmVlZCB0byBkbyByZW5hbWluZyBhdCBmaXJzdCBpbiB0aGUgU01NVXYzPyBUaGUgY29k
ZSBpcyBuZXcuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
