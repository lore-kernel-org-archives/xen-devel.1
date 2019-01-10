From: Eric Chanudet <eric.chanudet@gmail.com>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Thu, 10 Jan 2019 15:11:23 -0500
Message-ID: <20190110201123.d7ig4h3yxl53yzuy@legion>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nfDD=PS=gmail.com=eric.chanudet@srs-us1.protection.inumbo.net>)
 id 1ghgfn-0000k6-7Q
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 20:11:27 +0000
Received: by mail-qt1-x82e.google.com with SMTP id k12so15123476qtf.7
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 12:11:25 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, James McKenzie <james@bromium.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDEvMTkgYXQgMTE6NDJwbSwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4rLyoKPisg
KiBUaGUgbWF4aW11bSBzaXplIG9mIGFuIEFyZ28gcmluZyBpcyBkZWZpbmVkIHRvIGJlOiAxNkdC
Cj4rICogIC0tIHdoaWNoIGlzIDB4MTAwMDAwMCBieXRlcy4KPisgKiBBIGJ5dGUgaW5kZXggaW50
byB0aGUgcmluZyBpcyBhdCBtb3N0IDI0IGJpdHMuCj4rICovCj4rI2RlZmluZSBYRU5fQVJHT19N
QVhfUklOR19TSVpFICAoMHgxMDAwMDAwVUxMKQpJdCBsb29rcyBsaWtlIDE2TUIuIERpZCBJIG1p
c3MgYSA8PDEwIHNvbWV3aGVyZSBvciBpcyBpdCBhIHR5cG8gaW4gdGhlCmNvbW1lbnQ/CgotLSAK
RXJpYyBDaGFudWRldAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
