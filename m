From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 8/8] cpumask: tidy {,z}alloc_cpumask_var()
Date: Wed, 11 Jul 2018 06:12:14 -0600
Message-ID: <5B45F41E02000078001D3174@prv1-mh.provo.novell.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t1xz=j3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdDyj-0006r1-Fn
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 12:12:17 +0000
In-Reply-To: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

RHJvcCB1bm5lY2Vzc2FyeSBjYXN0cyBhbmQgdXNlIGJvb2wgaW4gZmF2b3Igb2YgYm9vbF90LgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2luY2x1ZGUveGVuL2NwdW1hc2suaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vY3B1bWFzay5oCkBA
IC0zNDUsOSArMzQ1LDkgQEAgc3RhdGljIGlubGluZSBpbnQgY3B1bGlzdF9zY25wcmludGYoY2hh
cgogCiB0eXBlZGVmIGNwdW1hc2tfdCAqY3B1bWFza192YXJfdDsKIAotc3RhdGljIGlubGluZSBi
b29sX3QgYWxsb2NfY3B1bWFza192YXIoY3B1bWFza192YXJfdCAqbWFzaykKK3N0YXRpYyBpbmxp
bmUgYm9vbCBhbGxvY19jcHVtYXNrX3ZhcihjcHVtYXNrX3Zhcl90ICptYXNrKQogewotCSoodm9p
ZCAqKiltYXNrID0gX3htYWxsb2MobnJfY3B1bWFza19iaXRzIC8gOCwgc2l6ZW9mKGxvbmcpKTsK
KwkqbWFzayA9IF94bWFsbG9jKG5yX2NwdW1hc2tfYml0cyAvIDgsIHNpemVvZihsb25nKSk7CiAJ
cmV0dXJuICptYXNrICE9IE5VTEw7CiB9CiAKQEAgLTM1OCw5ICszNTgsOSBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgY29uZF9hbGxvY19jcHVtYXNrX3ZhCiAJcmV0dXJuICptYXNrICE9IE5VTEw7CiB9
CiAKLXN0YXRpYyBpbmxpbmUgYm9vbF90IHphbGxvY19jcHVtYXNrX3ZhcihjcHVtYXNrX3Zhcl90
ICptYXNrKQorc3RhdGljIGlubGluZSBib29sIHphbGxvY19jcHVtYXNrX3ZhcihjcHVtYXNrX3Zh
cl90ICptYXNrKQogewotCSoodm9pZCAqKiltYXNrID0gX3h6YWxsb2MobnJfY3B1bWFza19iaXRz
IC8gOCwgc2l6ZW9mKGxvbmcpKTsKKwkqbWFzayA9IF94emFsbG9jKG5yX2NwdW1hc2tfYml0cyAv
IDgsIHNpemVvZihsb25nKSk7CiAJcmV0dXJuICptYXNrICE9IE5VTEw7CiB9CiAKQEAgLTM4NSwx
NiArMzg1LDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjbGVhcl9jcHVtYXNrX3ZhcihjcHUKICNl
bHNlCiB0eXBlZGVmIGNwdW1hc2tfdCBjcHVtYXNrX3Zhcl90WzFdOwogCi1zdGF0aWMgaW5saW5l
IGJvb2xfdCBhbGxvY19jcHVtYXNrX3ZhcihjcHVtYXNrX3Zhcl90ICptYXNrKQorc3RhdGljIGlu
bGluZSBib29sIGFsbG9jX2NwdW1hc2tfdmFyKGNwdW1hc2tfdmFyX3QgKm1hc2spCiB7Ci0JcmV0
dXJuIDE7CisJcmV0dXJuIHRydWU7CiB9CiAjZGVmaW5lIGNvbmRfYWxsb2NfY3B1bWFza192YXIg
YWxsb2NfY3B1bWFza192YXIKIAotc3RhdGljIGlubGluZSBib29sX3QgemFsbG9jX2NwdW1hc2tf
dmFyKGNwdW1hc2tfdmFyX3QgKm1hc2spCitzdGF0aWMgaW5saW5lIGJvb2wgemFsbG9jX2NwdW1h
c2tfdmFyKGNwdW1hc2tfdmFyX3QgKm1hc2spCiB7CiAJY3B1bWFza19jbGVhcigqbWFzayk7Ci0J
cmV0dXJuIDE7CisJcmV0dXJuIHRydWU7CiB9CiAjZGVmaW5lIGNvbmRfemFsbG9jX2NwdW1hc2tf
dmFyIHphbGxvY19jcHVtYXNrX3ZhcgogCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
