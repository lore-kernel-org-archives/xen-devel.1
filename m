From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/kdd: silence gcc 8 warning a
 different way
Date: Tue, 22 May 2018 11:54:36 +0100
Message-ID: <20180522105436.hogfzpzo633vlnrl@citrix.com>
References: <5ACF678102000078001BAA8E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fj/e=ij=citrix.com=prvs=6735f0edb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fL4wC-00067T-B6
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 10:54:40 +0000
Content-Disposition: inline
In-Reply-To: <5ACF678102000078001BAA8E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

SSBoYXZlIHRyaWVkIHRvIHJldmVydCA0MzdlMDBmZWEwNGJlY2M5MWMxYjZiYzFjMGJhYTYzNmIw
NjdhNWNjIGFuZApyZXByb2R1Y2UgdGhlIGdjYyA4LjEgd2FybmluZyB3aXRoIEFyY2ggTGludXgn
cyBnY2MgOC4xIGNvbXBpbGVyLgpTdHJhbmdlbHkgaXQgZG9lc24ndCBjb21wbGFpbi4KCkkgaGF2
ZW4ndCBnb3QgYSBGZWRvcmEgMjggYXJvdW5kICh3aGljaCBNYXJlayB1c2VkKS4gSXQgd2lsbCB0
YWtlIHNvbWUKdGltZSB0byBzZXQgdGhhdCB1cC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
