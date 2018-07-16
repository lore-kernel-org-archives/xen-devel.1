From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/HVM: improve a few state load checks
Date: Mon, 16 Jul 2018 15:01:30 +0100
Message-ID: <710b891f-752e-3830-1610-cdd081767502@citrix.com>
References: <5B4CA48002000078001D470D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pxdv=ka=citrix.com=prvs=728a4bfaa=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ff44g-0001r9-6z
 for xen-devel@lists.xenproject.org; Mon, 16 Jul 2018 14:02:02 +0000
In-Reply-To: <5B4CA48002000078001D470D@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDcvMTggMTQ6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFVzaW5nIHBsYWluIGludCBm
b3IgaW5zdGFuY2UgbnVtYmVycyBsb29rcyBxdWl0ZSBkYW5nZXJvdXMgd2l0aG91dAo+IGJlaW5n
IGF3YXJlIHRoYXQgaHZtX2xvYWRfaW5zdGFuY2UoKSByZXR1cm5zIGFuIHVuc2lnbmVkIHF1YW50
aXR5LiBNYWtlCj4gdGhpcyBtb3JlIGV4cGxpY2l0LiBBbHNvIHJlcGxhY2UgdWludDE2X3QgdXNl
cyBieSB1bnNpZ25lZCBpbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
