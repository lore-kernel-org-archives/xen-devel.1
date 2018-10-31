From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] tools/misc/xenpm: fix getting info when
 some CPUs are offline
Date: Wed, 31 Oct 2018 03:33:58 -0600
Message-ID: <5BD9770602000078001F6A4F@prv1-mh.provo.novell.com>
References: <20181030221615.24171-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nwhd=nl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHmt0-0004IA-06
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 09:34:02 +0000
In-Reply-To: <20181030221615.24171-1-marmarek@invisiblethingslab.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjEwLjE4IGF0IDIzOjE2LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gLS0tIGEvdG9vbHMvbWlzYy94ZW5wbS5jCj4gKysrIGIvdG9vbHMvbWlzYy94
ZW5wbS5jCj4gQEAgLTEyMzEsNyArMTIzMSw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICph
cmd2W10pCj4gICAgICAgICAgeGNfaW50ZXJmYWNlX2Nsb3NlKHhjX2hhbmRsZSk7Cj4gICAgICAg
ICAgcmV0dXJuIHJldDsKPiAgICAgIH0KPiAtICAgIG1heF9jcHVfbnIgPSBwaHlzaW5mby5ucl9j
cHVzOwo+ICsgICAgbWF4X2NwdV9uciA9IHBoeXNpbmZvLm1heF9jcHVfaWQ7CgpJc24ndCB0aGlz
IG9mZiBieSAxIHRoZW4/IG1heF9jcHVfbnIgaXMgbWlzbmFtZWQsIGFsbCBsb29wcyB1c2luZyBp
dAphcmUgb2YgdGhlIGZvcm0KCiAgICBmb3IgKCBpID0gMDsgaSA8IG1heF9jcHVfbnI7IGkrKyAp
CgpJJ20gYWxzbyBhZnJhaWQgdGhlcmUgYXJlIGZ1cnRoZXIgcXVpcmtzIGhlcmUsIHdpdGggdmFy
aW91cyBjb25zdHJ1Y3RzCmFsb25nIHRoZSBsaW5lcyBvZiAoYXMgYm9kaWVzIG9mIGFmb3JlbWVu
dGlvbmVkIGZvcigpKQoKICAgICAgICBpZiAoIHNob3dfY3hzdGF0X2J5X2NwdWlkKHhjX2hhbmRs
ZSwgaSkgPT0gLUVOT0RFViApCiAgICAgICAgICAgIGJyZWFrOwoKd2hpY2ggSSBzdXNwZWN0IHdv
dWxkIHRlcm1pbmF0ZSBwcm9jZXNzaW5nIGVhcmx5IHdoZW4gaGl0dGluZyBhIHRydWUKZ2FwIChp
LmUuIG5vdCBvbmUgcmVzdWx0aW5nIGZyb20gYSBwYXJrZWQgQ1BVKS4gQnV0IEkgZ3Vlc3MgaXQg
d291bGRuJ3QKYmUgYXBwcm9wcmlhdGUgdG8gYXNrIHlvdSB0byBkZWFsIHdpdGggdGhpcyBhdCB0
aGUgc2FtZSB0aW1lLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
