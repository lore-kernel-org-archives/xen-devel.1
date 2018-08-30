From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: use alternatives for FS/GS base
 accesses
Date: Thu, 30 Aug 2018 09:13:03 +0100
Message-ID: <20180830081303.fh62xdkkqbkflidp@citrix.com>
References: <5B86C3B502000078001E32EC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=9rit=ln=citrix.com=prvs=773fe5341=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fvI5M-0007Ng-Vj
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 08:13:48 +0000
Content-Disposition: inline
In-Reply-To: <5B86C3B502000078001E32EC@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjksIDIwMTggYXQgMTA6MDM6MDFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRWxpbWluYXRlcyBhIGNvdXBsZSBvZiBicmFuY2hlcyBpbiBwYXJ0aWN1bGFyIGZyb20g
dGhlIGNvbnRleHQgc3dpdGNoCj4gcGF0aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0
cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
