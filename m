From: Andrii Anisov <andrii_anisov@epam.com>
Subject: Re: [PATCH] perfc: Print a system time in a convenient
 format
Date: Tue, 11 Sep 2018 12:50:01 +0300
Message-ID: <68847407-3f44-12b8-50f4-3cfe150a77ee@epam.com>
References: <1536648829-13743-1-git-send-email-andrii.anisov@gmail.com>
 <5B977C7902000078001E70BE@prv1-mh.provo.novell.com>
 <d643cde4-a64a-fee0-af57-6d169fd04206@epam.com>
 <91a59884-bb7b-1042-4632-335a8c3480d2@citrix.com>
 <5B978BF202000078001E71A3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7wzx=lz=epam.com=andrii_anisov@srs-us1.protection.inumbo.net>)
 id 1fzfJH-0001Cj-2b
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 09:50:15 +0000
In-Reply-To: <5B978BF202000078001E71A3@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, george.dunlap@citrix.com
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDExLjA5LjE4IDEyOjMzLCBKYW4gQmV1bGljaCB3cm90ZToKPiBXZWxsLCB3aGF0IHNob3Vs
ZCBJIHNheSAtIEkgZGlzYWdyZWUuIEkgd291bGQgYWdyZWUgaWYgaXQgd291bGQgYmUgYQo+IHdo
b2xlIGxvdCBvZiB3b3JrLCBidXQgdGhlcmUncyBub3QgdGhhdCBtYW55IGtleSBoYW5kbGVycyB0
byBiZWdpbgo+IHdpdGgsIGFuZCBmYXIgbm90IGFsbCBvZiB0aGVtIHByaW50IGEgdGltZSBzdGFt
cCBpbiB0aGVpciBoZWFkbGluZXMuCkknbSBxdWl0ZSBvayB3aXRoIHRoYXQuCgotLSAKCipBbmRy
aWkgQW5pc292KgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
