From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 2/2] xen/pvh: correctly setup the PV EFI
 interface for dom0
Date: Wed, 24 Apr 2019 11:36:41 -0400
Message-ID: <2359c97c-1125-cfd2-44c2-7e9ce7972558__39007.769564499$1556120320$gmane$org@oracle.com>
References: <20190423130416.68935-1-roger.pau@citrix.com>
 <20190423130416.68935-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E0+D=S2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hJJxz-0000Pu-6T
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:37:47 +0000
In-Reply-To: <20190423130416.68935-2-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, x86@kernel.org, platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yMy8xOSA5OjA0IEFNLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gVGhpcyBpbnZvbHZl
cyBpbml0aWFsaXppbmcgdGhlIGJvb3QgcGFyYW1zIEVGSSByZWxhdGVkIGZpZWxkcyBhbmQgdGhl
Cj4gZWZpIGdsb2JhbCB2YXJpYWJsZS4KPgo+IFdpdGhvdXQgdGhpcyBmaXggYSBQVkggZG9tMCBk
b2Vzbid0IGRldGVjdCB3aGVuIGJvb3RlZCBmcm9tIEVGSSwgYW5kCj4gdGh1cyBkb2Vzbid0IHN1
cHBvcnQgYWNjZXNzaW5nIGFueSBvZiB0aGUgRUZJIHJlbGF0ZWQgZGF0YS4KPgo+IFJlcG9ydGVk
LWJ5OiBQR05ldCBEZXYgPHBnbmV0LmRldkBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpIbW0uLiBUaGlzIHNlZW1zIHRv
IGJlIGJyZWFraW5nIHNhdmUvcmVzdG9yZSBmb3IgbWUgKGZvciBkb21VKSwgYW5kIEkKY2FuJ3Qg
c2VlIGFueSBvYnZpb3VzIHJlYXNvbnMuCgpDYW4geW91IHRyeSBpdD8KCi1ib3JpcwoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
