From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v5 2/2] xen/blkback: rework connect_ring()
 to avoid inconsistent xenstore 'ring-page-order' set by malicious blkfront
Date: Wed, 16 Jan 2019 11:32:27 -0500
Message-ID: <20190116163227.GC7892__47731.1314353303$1547656330$gmane$org@char.us.oracle.com>
References: <1546935350-20957-1-git-send-email-dongli.zhang@oracle.com>
 <1546935350-20957-2-git-send-email-dongli.zhang@oracle.com>
 <5c3760a1-4f45-a67b-3b70-80fa68ee4358@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5X0w=PY=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1gjo8D-0000D7-Fa
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 16:33:33 +0000
Content-Disposition: inline
In-Reply-To: <5c3760a1-4f45-a67b-3b70-80fa68ee4358@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, paul.durrant@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMDgsIDIwMTkgYXQgMDQ6MjQ6MzJQTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdy
b3RlOgo+IG9vcHMuIFBsZWFzZSBpZ25vcmUgdGhpcyB2NSBwYXRjaC4KPiAKPiBJIGp1c3QgcmVh
bGl6ZWQgTGludXMgc3VnZ2VzdGVkIGluIGFuIG9sZCBlbWFpbCBub3QgdXNlIEJVRygpL0JVR19P
TigpIGluIHRoZSBjb2RlLgo+IAo+IEkgd2lsbCBzd2l0Y2ggdG8gdGhlIFdBUk4oKSBzb2x1dGlv
biBhbmQgcmVzZW5kIGFnYWluLgoKT0suIERpZCBJIG1pc3MgaXQ/CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
