From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] IOMMU: avoid NULL deref in
 iommu_lookup_page()
Date: Tue, 14 May 2019 13:08:04 +0100
Message-ID: <39df6121-5f3e-f888-e46f-18c21b5e7ea1@citrix.com>
References: <5CDAAE9E020000780022E944@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ozam=TO=citrix.com=prvs=030e75626=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hQWE6-0005Tl-Jo
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:08:10 +0000
In-Reply-To: <5CDAAE9E020000780022E944@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDUvMjAxOSAxMzowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gTHVja2lseSB0aGUgZnVu
Y3Rpb24gY3VycmVudGx5IGhhcyBubyBjYWxsZXJzIC0gaXQgd291bGQgaGF2ZSBjYWxsZWQKPiB0
aHJvdWdoIE5VTEwgZm9yIGJvdGggQXJtIGFuZCB4ODYvQU1ELgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
