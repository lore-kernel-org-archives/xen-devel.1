From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] iommu: trivial re-organisation to avoid
 unnecessary test
Date: Mon, 13 May 2019 09:22:48 -0600
Message-ID: <5CD98BC8020000780022E3ED@prv1-mh.provo.novell.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQCn5-00082A-78
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:22:59 +0000
In-Reply-To: <20190508132403.1454-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA1LjE5IGF0IDE1OjIzLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEFuICdpZiAoICFpb21tdV9lbmFibGVkICknIGZvbGxvd2VkIGJ5IGFuICdpZiAoIGlvbW11
X2VuYWJsZWQgKScgd2l0aAo+IG9ubHkgYSBwcmludGsoKSBpbiBiZXR3ZWVuIHNlZW1zIGEgbGl0
dGxlIHNpbGx5LiBNb3ZlIHRoZSBwcmludGsoKSBhbmQKPiB1c2UgJ2Vsc2UnIGluc3RlYWQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4K
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
