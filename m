From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/x86: fix paging_max_paddr_bits()
Date: Wed, 28 Nov 2018 09:41:20 +0100
Message-ID: <20181128084120.sznv4wwpca6uzbtr@mac>
References: <20181128075224.30765-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ir32=OH=citrix.com=prvs=8634c6f68=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gRvPX-0004N5-KA
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 08:41:31 +0000
Content-Disposition: inline
In-Reply-To: <20181128075224.30765-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMDg6NTI6MjRBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBwYWdpbmdfbWF4X3BhZGRyX2JpdHMoKSBoYXMgYW4gaW52YWxpZCB1c2Ugb2YgSVNf
RU5BQkxFRCgpOiBpbnN0ZWFkIG9mCj4gSVNfRU5BQkxFRChDT05GSUdfQklHTUVNKSBpdCBpcyB1
c2luZyBJU19FTkFCTEVEKEJJR01FTSkuIEZpeCB0aGF0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbW8+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
