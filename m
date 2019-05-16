From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC V2 24/45] xen: let vcpu_create() select
 processor
Date: Thu, 16 May 2019 14:46:25 +0200
Message-ID: <5fe18121-19de-b6d3-bc77-dc68b6221165@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-25-jgross@suse.com> <5CDD557D020000780022FA32@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xQgL=TQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRFmL-00023O-0T
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:46:33 +0000
In-Reply-To: <5CDD557D020000780022FA32@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDUvMjAxOSAxNDoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKPj4gKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4+IEBAIC0zMTQsMTQgKzMx
NCw0MiBAQCBzdGF0aWMgc3RydWN0IHNjaGVkX2l0ZW0gKnNjaGVkX2FsbG9jX2l0ZW0oc3RydWN0
IHZjcHUgKnYpCj4+ICAgICAgcmV0dXJuIE5VTEw7Cj4+ICB9Cj4+ICAKPj4gLWludCBzY2hlZF9p
bml0X3ZjcHUoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCBwcm9jZXNzb3IpCj4+ICtzdGF0
aWMgdW5zaWduZWQgaW50IHNjaGVkX3NlbGVjdF9pbml0aWFsX2NwdShzdHJ1Y3QgdmNwdSAqdikK
Pj4gK3sKPj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwo+IAo+IGNvbnN0IChw
ZXJoYXBzIGFsc28gdGhlIGZ1bmN0aW9uIHBhcmFtZXRlcik/CgpZZXMuCgo+IAo+PiArICAgIG5v
ZGVpZF90IG5vZGU7Cj4+ICsgICAgY3B1bWFza190IGNwdXM7Cj4gCj4gVG8gYmUgaG9uZXN0LCBJ
J20gbm90IGhhcHB5IHRvIHNlZSBuZXcgb24tc3RhY2sgaW5zdGFuY2VzIG9mCj4gY3B1bWFza190
IGFwcGVhci4gU2VlaW5nIC4uLgo+IAo+PiArICAgIGNwdW1hc2tfY2xlYXIoJmNwdXMpOwo+PiAr
ICAgIGZvcl9lYWNoX25vZGVfbWFzayAoIG5vZGUsIGQtPm5vZGVfYWZmaW5pdHkgKQo+PiArICAg
ICAgICBjcHVtYXNrX29yKCZjcHVzLCAmY3B1cywgJm5vZGVfdG9fY3B1bWFzayhub2RlKSk7Cj4+
ICsgICAgY3B1bWFza19hbmQoJmNwdXMsICZjcHVzLCBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKGQp
KTsKPj4gKyAgICBpZiAoIGNwdW1hc2tfZW1wdHkoJmNwdXMpICkKPj4gKyAgICAgICAgY3B1bWFz
a19jb3B5KCZjcHVzLCBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKGQpKTsKPiAKPiAuLi4gdGhpcyBm
YWxsYmFjayB5b3UgdXNlIGFueXdheSwgaXMgdGhlcmUgYW55IGlzc3VlIHdpdGggaXQgYWxzbwo+
IHNlcnZpbmcgdGhlIGNhc2Ugd2hlcmUgemFsbG9jX2NwdW1hc2tfdmFyKCkgZmFpbHM/CgpFaXRo
ZXIgdGhhdCwgb3I6CgotIGp1c3QgZmFpbCB0byBjcmVhdGUgdGhlIHZjcHUgaW4gdGhhdCBjYXNl
LCBhcyBjaGFuY2VzIGFyZSByYXRoZXIKICBoaWdoIGUuZy4gdGhlIGZvbGxvd2luZyBhcmNoX3Zj
cHVfY3JlYXRlKCkgd2lsbCBmYWlsIGFueXdheQotIHRha2UgdGhlIHNjaGVkdWxpbmcgbG9jayBh
bmQgdXNlIGNwdW1hc2tfc2NyYXRjaAotIChhYil1c2Ugb25lIG9mIHRoZSBhdmFpbGFibGUgY3B1
bWFza3MgaW4gc3RydWN0IHNjaGVkX3VuaXQgd2hpY2gKICBhcmUgbm90IGluIHVzZSB5ZXQKCk15
IHByZWZlcmVuY2Ugd291bGQgYmUgdXNpbmcgY3B1bWFza19zY3JhdGNoLgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
