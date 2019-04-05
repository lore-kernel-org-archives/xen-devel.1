From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] vm_event: Fix XEN_VM_EVENT_RESUME domctl
Date: Fri, 05 Apr 2019 04:05:37 -0600
Message-ID: <5CA728710200007800224D3B@prv1-mh.provo.novell.com>
References: <06086a6f2400b372993d03ece48e65bfbe88134e.1554456553.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCLjC-0001vO-Sm
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 10:05:42 +0000
In-Reply-To: <06086a6f2400b372993d03ece48e65bfbe88134e.1554456553.git.ppircalabu@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA0LjE5IGF0IDExOjMzLCA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+IHdy
b3RlOgo+IEBAIC01MjksMzAgKzUzNCwyMSBAQCBpbnQgX192bV9ldmVudF9jbGFpbV9zbG90KHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZlZCwKPiAgLyogUmVnaXN0
ZXJlZCB3aXRoIFhlbi1ib3VuZCBldmVudCBjaGFubmVsIGZvciBpbmNvbWluZyBub3RpZmljYXRp
b25zLiAqLwo+ICBzdGF0aWMgdm9pZCBtZW1fcGFnaW5nX25vdGlmaWNhdGlvbihzdHJ1Y3QgdmNw
dSAqdiwgdW5zaWduZWQgaW50IHBvcnQpCj4gIHsKPiAtICAgIHN0cnVjdCBkb21haW4gKmRvbWFp
biA9IHYtPmRvbWFpbjsKPiAtCj4gLSAgICBpZiAoIGxpa2VseSh2bV9ldmVudF9jaGVja19yaW5n
KGRvbWFpbi0+dm1fZXZlbnRfcGFnaW5nKSkgKQo+IC0gICAgICAgIHZtX2V2ZW50X3Jlc3VtZShk
b21haW4sIGRvbWFpbi0+dm1fZXZlbnRfcGFnaW5nKTsKPiArICAgICh2b2lkKXZtX2V2ZW50X3Jl
c3VtZSh2LT5kb21haW4sIHYtPmRvbWFpbi0+dm1fZXZlbnRfcGFnaW5nKTsKClVubGVzcyB0aGVy
ZSdzIGEgZ29vZCByZWFzb24gZm9yIHRoZW0sIGNvdWxkIHlvdSBwbGVhc2UgYXZvaWQKYWRkaW5n
IHN1Y2ggY2FzdHM/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
