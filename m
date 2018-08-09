From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] xen/netfront: don't cache skb_shinfo()
Date: Thu, 9 Aug 2018 15:47:01 +0100
Message-ID: <20180809144701.b6hn2or22dnkey2h__23727.1363650963$1533825950$gmane$org@citrix.com>
References: <20180809144216.18856-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cugt=ky=citrix.com=prvs=752bb2a90=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fnmDS-0000cy-Dl
 for xen-devel@lists.xenproject.org; Thu, 09 Aug 2018 14:47:06 +0000
Content-Disposition: inline
In-Reply-To: <20180809144216.18856-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, davem@davemloft.net
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBdWcgMDksIDIwMTggYXQgMDQ6NDI6MTZQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBza2Jfc2hpbmZvKCkgY2FuIGNoYW5nZSB3aGVuIGNhbGxpbmcgX19wc2tiX3B1bGxf
dGFpbCgpOiBEb24ndCBjYWNoZQo+IGl0cyByZXR1cm4gdmFsdWUuCj4gCj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
