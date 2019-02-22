From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v7 8/9] x86/hvm: add nospec
 to hvmop param
Date: Fri, 22 Feb 2019 07:39:41 -0700
Message-ID: <5C7009AD020000780021941F@prv1-mh.provo.novell.com>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
 <1550737003-25779-9-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxBzM-0006hZ-UO
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 14:39:44 +0000
In-Reply-To: <1550737003-25779-9-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE5IGF0IDA5OjE2LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiAt
LS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0u
Ywo+IEBAIC00MTA5LDYgKzQxMDksMTMgQEAgc3RhdGljIGludCBodm1vcF9zZXRfcGFyYW0oCj4g
ICAgICBpZiAoIGEuaW5kZXggPj0gSFZNX05SX1BBUkFNUyApCj4gICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gIAo+ICsgICAgLyoKPiArICAgICAqIE1ha2Ugc3VyZSB0aGUgZ3Vlc3QgY29udHJv
bGxlZCB2YWx1ZSBhLmluZGV4IGlzIGJvdW5kZWQgZXZlbiBkdXJpbmcKPiArICAgICAqIHNwZWN1
bGF0aXZlIGV4ZWN1dGlvbi4KPiArICAgICAqLwo+ICsgICAgYS5pbmRleCA9IGFycmF5X2luZGV4
X25vc3BlYyhhLmluZGV4LCBIVk1fTlJfUEFSQU1TKTsKPiArICAgIGJsb2NrX3NwZWN1bGF0aW9u
KCk7Cj4gKwo+ICAgICAgZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9hbnlfaWQoYS5kb21pZCk7Cj4g
ICAgICBpZiAoIGQgPT0gTlVMTCApCj4gICAgICAgICAgcmV0dXJuIC1FU1JDSDsKPiBAQCAtNDM3
NSw2ICs0MzgyLDEzIEBAIHN0YXRpYyBpbnQgaHZtb3BfZ2V0X3BhcmFtKAo+ICAgICAgaWYgKCBh
LmluZGV4ID49IEhWTV9OUl9QQVJBTVMgKQo+ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAK
PiArICAgIC8qCj4gKyAgICAgKiBNYWtlIHN1cmUgdGhlIGd1ZXN0IGNvbnRyb2xsZWQgdmFsdWUg
YS5pbmRleCBpcyBib3VuZGVkIGV2ZW4gZHVyaW5nCj4gKyAgICAgKiBzcGVjdWxhdGl2ZSBleGVj
dXRpb24uCj4gKyAgICAgKi8KPiArICAgIGEuaW5kZXggPSBhcnJheV9pbmRleF9ub3NwZWMoYS5p
bmRleCwgSFZNX05SX1BBUkFNUyk7Cj4gKyAgICBibG9ja19zcGVjdWxhdGlvbigpOwoKUGxlYXNl
IGNhbiB0aGUgY29tbWVudHMgYnJpZWZseSBleHBsYWluIHRoZSBvdGhlcndpc2UgYXBwYXJlbnRs
eQpwb2ludGxlc3MgcmVkdW5kYW5jeSBvZiBib3RoIGNvbnN0cnVjdHM/CgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
