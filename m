From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/pv: Add PV specific legacy_pic struct
 to expose legacy IRQs.
Date: Tue, 19 Mar 2019 19:06:49 -0400
Message-ID: <2eb1fdec-6cc0-7f62-3d4f-adc5dba9971e__36334.1311620147$1553036920$gmane$org@oracle.com>
References: <1553025739-92245-1-git-send-email-jennifer.herbert@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rmwu=RW=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1h6NpO-00083l-HX
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 23:07:26 +0000
In-Reply-To: <1553025739-92245-1-git-send-email-jennifer.herbert@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jennifer Herbert <jennifer.herbert@citrix.com>, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xOS8xOSA0OjAyIFBNLCBKZW5uaWZlciBIZXJiZXJ0IHdyb3RlOgo+IFRoZSBBQ1BJIHRh
YmxlcyBkb2Vzbid0IGFsd2F5cyBjb250YWluIGFsbCBJUlFzIGZvciBsZWdhY3kgZGV2aWNlcwo+
IHN1Y2ggYXMgUlRDLiAgU2luY2Ugbm8gUElDIGNvbnRyb2xsZXIgaXMgdmlzaWJsZSBmb3IgYSBQ
ViBsaW51eCBndWVzdCwKPiB1bmRlciBYZW4sIGxlZ2FjeV9waWMgY3VycmVudGx5IGRlZmF1bHRz
IHRvIHRoZSBudWxsX2xlZ2FjeV9waWMgLSB3aXRoCj4gcmVwb3J0cyBubyBsZWdhY3kgSVJRcy4g
IFNpbmNlIHRoZSBjb21taXQgInJ0YzogY21vczogRG8gbm90IGFzc3VtZQo+IGlycSA4IGZvciBy
dGMgd2hlbiB0aGVyZSBhcmUgbm8gbGVnYWN5IGlycXMiIGJ5IEhhbnMgZGUgR29lZGUKPiAoY29t
bWl0IGlkOiBhMWUyM2E0MmYxYmRjMDBlMzJmYzQ4NjljYWVmMTJlNGU2MjcyZjI2KSwgdGhlIHJ0
YyBub3cKPiBpbmNvcnJlY3RseSBkZWNpZGVzIGl0IGhhcyBubyBpcnEgaXQgY2FuIHVzZSwgZm9y
IHNvbWUgaGFyZHdhcmUuCj4KPiBUaGlzIHBhdGNoIHJlY3RpZmllcyB0aGUgcHJvYmxlbSBieSBw
cm92aWRpbmcgYSB4ZW4gbGVnYWN5X3BpYwo+IHN0cnVjdCwgd2hpY2ggaXMgbXVjaCBsaWtlIHRo
ZSBudWxsX2xlZ2FjeV9waWMgZXhjZXB0IHRoYXQgaXQKPiByZXBvcnRzIE5SX0lSUVNfTEVHQUNZ
IGlycXMuCgpJIGFzc3VtZSB0aGlzIGlzIGZvciBkb20wPwoKQ291bGQgdGhlcmUgYmUgdGhlIHNh
bWUgcHJvYmxlbSB3aXRoIFBWSCBkb20wPyAoYW5kIGlmIHllcyB0aGVuIHRoaXMKc2hvdWxkIHBy
b2JhYmx5IGdvIGludG8gYXJjaC94ODYveGVuL2VubGlnaHRlbi5jKS4KCi1ib3JpcwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
