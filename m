From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/x86/vpmu: Zero struct pt_regs before
 calling into sample handling code
Date: Thu, 20 Sep 2018 12:57:46 -0400
Message-ID: <45999524-b360-6a42-f395-3110fb62481f__21493.8254248866$1537462517$gmane$org@oracle.com>
References: <1531416420-3580-1-git-send-email-boris.ostrovsky@oracle.com>
 <8f1cfd9a-cabb-85fe-1b63-5b5162f149be@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=evnq=mc=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g32Fb-0003Ii-Fh
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 16:56:23 +0000
In-Reply-To: <8f1cfd9a-cabb-85fe-1b63-5b5162f149be@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gNy8xMy8xOCA0OjQxIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IE9uIDEyLzA3LzE4IDE5
OjI3LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE90aGVyd2lzZSB3ZSBtYXkgbGVhayBrZXJu
ZWwgc3RhY2sgZm9yIGV2ZW50cyB0aGF0IHNhbXBsZSB1c2VyCj4+IHJlZ2lzdGVycy4KPj4KPj4g
UmVwb3J0ZWQtYnk6IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPgoKQmVsYXRlZGx5LCBhcHBsaWVkIHRvIGZvci1saW51cy00LjE5
ZAoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
