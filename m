From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] SVM: re-work VMCB sync-ing
Date: Mon, 30 Apr 2018 09:50:46 -0600
Message-ID: <5AE73B5602000078001BFAEF@prv1-mh.provo.novell.com>
References: <5AE6ED2302000078001BF867@prv1-mh.provo.novell.com>
 <5AE6FFEA02000078001BF8A2@prv1-mh.provo.novell.com>
 <2eb0fe3c-7ff5-e731-d64c-8d04d082acce@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfxw=ht=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fDB4l-0008IK-Sw
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 15:50:51 +0000
In-Reply-To: <2eb0fe3c-7ff5-e731-d64c-8d04d082acce@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA0LjE4IGF0IDE3OjMwLCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDA0LzMwLzIwMTggMDc6MzcgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBAQCAt
MTE2OCw2ICsxMTY5LDkgQEAgc3RhdGljIHZvaWQgbm9yZXR1cm4gc3ZtX2RvX3Jlc3VtZShzdHJ1
Ywo+PiAgCj4+ICAgICAgaHZtX2RvX3Jlc3VtZSh2KTsKPj4gIAo+PiArICAgIGlmICggdi0+YXJj
aC5odm1fc3ZtLnZtY2Jfc3luY19zdGF0ZSA9PSB2bWNiX25lZWRzX3ZtbG9hZCApCj4+ICsgICAg
ICAgIHN2bV9zeW5jX3ZtY2Iodiwgdm1jYl9uZWVkc192bXNhdmUpOwo+IAo+IAo+IElzIGl0IG5v
dCBwb3NzaWJsZSAob3IgYWR2aXNhYmxlKSB0byBtb3ZlIHRoZSB0ZXN0IGludG8gc3ZtX3N5bmNf
dm1jYigpCj4gKGFuZCBkcm9wIHRoZSBBU1NFUlQgdGhlcmUpPwoKSXQgaXMgcG9zc2libGU7IEkn
bSBub3Qgc3VyZSBteXNlbGYgaWYgaXQncyBhZHZpc2FibGUsIGJ1dCBJIHRha2UgeW91IGFza2lu
ZyB0aGUKcXVlc3Rpb24gYXMgeW91IHRoaW5raW5nIGl0IGlzLCBzbyBJJ2xsIGNoYW5nZSBpdC4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
