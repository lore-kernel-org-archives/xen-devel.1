From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 03/13] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Mon, 12 Nov 2018 03:36:05 -0700
Message-ID: <5BE9579502000078001FAC2A@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BE45CB602000078001F9C6A@prv1-mh.provo.novell.com>
 <5BE45F7C02000078001F9CA9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=18fz=nx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gM9Zj-00009C-6h
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 10:36:11 +0000
In-Reply-To: <5BE45F7C02000078001F9CA9@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjExLjE4IGF0IDE3OjA4LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+
IEBAIC02Niw2ICs2NiwxMCBAQAo+ICAKPiAgI2RlZmluZSBST1VORFVQKHgsIGEpICgoKHgpICsg
KGEpIC0gMSkgJiB+KChhKSAtIDEpKQo+ICAKPiArI2RlZmluZSBjb3VudF92YV9hcmdfKGRvdCwg
YTEsIGEyLCBhMywgYTQsIGE1LCBhNiwgYTcsIGE4LCB4LCAuLi4pIHgKPiArI2RlZmluZSBjb3Vu
dF92YV9hcmcoYXJncy4uLikgXAo+ICsgICAgY291bnRfdmFfYXJnXyguLCAjIyBhcmdzLCA4LCA3
LCA2LCA1LCA0LCAzLCAyLCAxLCAwKQoKSSd2ZSBqdXN0IG5vdGljZWQgdGhhdCBJIGZvcmdvdCB0
byByZW5hbWUgdGhpcyB0byBjb3VudF9hcmdzKCksCndoaWNoIHRoZW4gSSBob3BlIGlzIG5vIGxv
bmdlciBjb250cm92ZXJzaWFsIGFzIGEgbmFtZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
