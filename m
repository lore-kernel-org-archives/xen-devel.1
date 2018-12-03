From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 09/25] errno: add POSIX error codes EMSGSIZE,
 ECONNREFUSED to the ABI
Date: Mon, 03 Dec 2018 08:42:50 -0700
Message-ID: <5C054EFA02000078002024DD@prv1-mh.provo.novell.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-10-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gTqN6-0000Xt-S1
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 15:42:56 +0000
In-Reply-To: <1543627984-21394-10-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEyLjE4IGF0IDAyOjMyLCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IGh0dHA6Ly9wdWJzLm9wZW5ncm91cC5vcmcvb25saW5lcHVicy85Njk5OTE5Nzk5
L2Jhc2VkZWZzL2Vycm5vLmguaHRtbCAKPiBkZXNjcmliZXMgdGhlc2UgY29kZXMgdGh1czoKPiAg
ICAgRU1TR1NJWkUgICAgIDogIk1lc3NhZ2UgdG9vIGxhcmdlIgo+ICAgICBFQ09OTlJFRlVTRUQg
OiAiQ29ubmVjdGlvbiByZWZ1c2VkIi4KCklmIHlvdSB3ZXJlIHRvIGdvIHNvbGVseSBieSB3aGF0
IFBPU0lYIG1hbmRhdGVzIHRvIGhhdmUsIG1vcmUKYWRkaXRpb25zIHdvdWxkIGJlIG5lY2Vzc2Fy
eSBhZmFpY3QuIFdlIGhhZCBsaW1pdGVkIG91cnNlbHZlcyB0bwpzb21lIGJhc2ljIHNldCwgc28g
c2VsZWN0aXZlIGFkZGl0aW9ucyBuZWVkIGZ1cnRoZXIgcmF0aW9uYWxlIHB1dApoZXJlLiBUaGUg
bW9yZSB0aGF0IGZvciBib3RoIGFkZGVkIGVycm9yIGNvZGVzIHRoZSB1c2UgY2FzZSBpbgp0aGUg
aHlwZXJ2aXNvciBpc24ndCBpbW1lZGlhdGVseSBvYnZpb3VzLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
