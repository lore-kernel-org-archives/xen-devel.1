From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Mon, 26 Nov 2018 09:50:42 -0700
Message-ID: <5BFC2462020000780020022A@prv1-mh.provo.novell.com>
References: <20181123132516.28681****1****jgross@suse.com>
 <5BFBD1C602000078001FFE09@suse.com>
 <d38b1c33*5cca*572a*a942*b1db8ca309a2@suse.com>
 <5BFBFCD3020000780020004F@suse.com>
 <955bec0d-f574-53c5-91a5-1d6ea0bc4f2a@suse.com>
 <5BFC0A1302000078002000E1@suse.com>
 <06592737-411f-d518-d972-6b4cdc704d9b@suse.com>
 <4c7158b4-d4da-994e-545b-8f5dec97dbb6@arm.com>
 <2b040ede-2103-b93c-c005-5ff39ae21c4c@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRK5z-00062g-3u
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 16:50:51 +0000
In-Reply-To: <2b040ede-2103-b93c-c005-5ff39ae21c4c@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjExLjE4IGF0IDE3OjE3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJIHJl
YWxseSBmYWlsIHRvIHNlZSB3aHkgaXQgaXMgc28gYmFkIHRvIG5vdCBjbG9iYmVyIGRhdGEgaW4g
YSBjYXNlCj4gd2hpY2ggbm9ybWFsbHkgc2hvdWxkIG5ldmVyIG9jY3VyLgoKU2VlIEFuZHJldydz
IG9yaWdpbmFsIHJlcGx5LiBZb3UncmUgYWxzbyBjbG9iYmVyaW5nIG9uIHBvdGVudGlhbApzdWNj
ZXNzIHBhdGhzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
