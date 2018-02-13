From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] pvcalls-front: wait for other
 operations to return when release passive sockets
Date: Mon, 12 Feb 2018 18:07:09 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802121807030.3704__27624.2776927122$1518487567$gmane$org@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1802051448460.10160@sstabellini-ThinkPad-X260>
 <1517871107-15349-1-git-send-email-sstabellini@kernel.org>
 <1517871107-15349-2-git-send-email-sstabellini@kernel.org>
 <e2d6f037-cb0c-7669-0efc-c1e9bcf69a07@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0inx=fh=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1elQ07-0007JY-Sy
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 02:07:19 +0000
In-Reply-To: <e2d6f037-cb0c-7669-0efc-c1e9bcf69a07@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <stefano@aporeto.com>, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxMiBGZWIgMjAxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNS8wMi8xOCAy
Mzo1MSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gUGFzc2l2ZSBzb2NrZXRzIGNhbiBo
YXZlIG9uZ29pbmcgb3BlcmF0aW9ucyBvbiB0aGVtLCBzcGVjaWZpY2FsbHksIHdlCj4gPiBoYXZl
IHR3byB3YWl0X2V2ZW50X2ludGVycnVwdGFibGUgY2FsbHMgaW4gcHZjYWxsc19mcm9udF9hY2Nl
cHQuCj4gPiAKPiA+IEFkZCB0d28gd2FrZV91cCBjYWxscyBpbiBwdmNhbGxzX2Zyb250X3JlbGVh
c2UsIHRoZW4gd2FpdCBmb3IgdGhlCj4gPiBwb3RlbnRpYWwgd2FpdGVycyB0byByZXR1cm4gYW5k
IHJlbGVhc2UgdGhlIHNvY2tfbWFwcGluZyByZWZjb3VudC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vQGFwb3JldG8uY29tPgo+IAo+IEFja2VkLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpUaGFua3MhCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
