From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: only clobber multicall elements
 without error
Date: Mon, 26 Nov 2018 07:01:55 -0700
Message-ID: <5BFBFCD3020000780020004F@prv1-mh.provo.novell.com>
References: <20181123132516.28681-1-jgross@suse.com>
 <5BFBD1C602000078001FFE09@suse.com>
 <d38b1c33-5cca-572a-a942-b1db8ca309a2@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=azgn=of=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRHSe-0002YL-0V
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 14:02:04 +0000
In-Reply-To: <d38b1c33-5cca-572a-a942-b1db8ca309a2@suse.com>
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

Pj4+IE9uIDI2LjExLjE4IGF0IDE0OjUyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJIGRv
bid0IHRoaW5rIHRoZSBoeXBlcnZpc29yIHNob3VsZCBleHBsaWNpdGx5IHRyeSB0byBtYWtlIGl0
IGFzIGhhcmQgYXMKPiBwb3NzaWJsZSBmb3IgdGhlIGd1ZXN0IHRvIGZpbmQgcHJvYmxlbXMgaW4g
dGhlIGNvZGUuCgpUaGF0J3MgaW5kZWVkIG5vdCB0aGUgaHlwZXJ2aXNvcidzIGdvYWwuIEluc3Rl
YWQgaXQgdHJpZXMgdG8gbWFrZQppdCBhcyBoYXJkIGFzIHBvc3NpYmxlIGZvciB0aGUgZ3Vlc3Qg
KGRldmVsb3BlcikgdG8gbWFrZSB3cm9uZwphc3N1bXB0aW9ucy4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
