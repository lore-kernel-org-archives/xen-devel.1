From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 04/15] x86/cpu/vpmu: Add Hygon Dhyana and
 AMD Zen support for vPMU
Date: Tue, 02 Apr 2019 09:50:26 -0600
Message-ID: <5CA384C20200007800223F6A@prv1-mh.provo.novell.com>
References: <cover.1553935727.git.puwen@hygon.cn>
 <e82e93b090e004d2b9a679d656de96ca915e92da.1553935727.git.puwen@hygon.cn>
 <5CA1CD49020000780022376C@prv1-mh.provo.novell.com>
 <d6a0d0a4-4da2-fb62-3231-3c7da379f5a8@hygon.cn>
 <5CA3378B0200007800223D84@prv1-mh.provo.novell.com>
 <e2465fe0-b0d4-5bfe-dd79-20b878d4b3ee@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBLgE-0007FO-OE
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 15:50:30 +0000
In-Reply-To: <e2465fe0-b0d4-5bfe-dd79-20b878d4b3ee@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA0LjE5IGF0IDE0OjExLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IEJ5IHRo
ZSB3YXksIGhvdyBhYm91dCB0aGUgcGF0Y2ggMDEvMTUgb2YgdGhpcyBzZXJpZXM/Cj4gSWYgaXQn
cyBmaW5lLCBjb3VsZCB5b3UgcGxlYXNlIG9mZmVyIEFja2VkLWJ5IHRhZyBmb3IgaXQ/CgpJJ3Zl
IHlldCB0byBsb29rIGF0IHY0IG9mIGl0LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
