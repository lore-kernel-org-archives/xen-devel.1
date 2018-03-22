From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Thu, 22 Mar 2018 06:09:44 -0600
Message-ID: <5AB3AB1802000078001B5065@prv-mh.provo.novell.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
 <20180319155802.immvsgqttrs3yezg@MacBook-Pro-de-Roger.local>
 <20180320054922.00005669@gmail.com>
 <20180320085048.orjv67qtwhe35ntl@MacBook-Pro-de-Roger.local>
 <20180321105840.00004698@gmail.com>
 <20180321090911.qd6epofdaywc4blb@MacBook-Pro-de-Roger.local>
 <20180322002540.000032f1@gmail.com>
 <20180321152017.bv32mt4bpxaa7zfr@MacBook-Pro-de-Roger.local>
 <20180322025656.00005281@gmail.com>
 <3a237f106c9348799473fca673f7ef7c@AMSPEX02CL03.citrite.net>
 <20180322103142.0000423c@gmail.com>
 <5AB37FA002000078001B4DD5@prv-mh.provo.novell.com>
 <20180322195506.00000d4a@gmail.com>
 <6dd0dcee536c44409bda0729bdac5164@AMSPEX02CL03.citrite.net>
 <20180322215636.000042ea@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhfi=gm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyz2T-0007xe-LQ
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 12:09:49 +0000
In-Reply-To: <20180322215636.000042ea@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey G <x1917x@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAzLjE4IGF0IDEyOjU2LCA8eDE5MTd4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gSSBy
ZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgc29tZSBwZW9wbGUgaGF2ZSB0aGF0IGZlYXIgb2Yg
ZW11bGF0ZWQKPiBNTUNPTkZJRyAtLSBpdCdzIHJlYWxseSB0aGUgc2FtZSB0aGluZyBhcyBhbnkg
b3RoZXIgTU1JTyByYW5nZSBRRU1VCj4gYWxyZWFkeSBlbXVsYXRlcyB2aWEgbWFwX2lvX3Jhbmdl
X3RvX2lvcmVxX3NlcnZlcigpLiBObyBzZW5zaXRpdmUKPiBpbmZvcm1hdGlvbiBleHBvc2VkLiBJ
dCBpcyByZWxhdGVkIG9ubHkgdG8gZW11bGF0ZWQgUENJIGNvbmYgc3BhY2Ugd2hpY2gKPiBRRU1V
IGFscmVhZHkga25vd3MgYWJvdXQgYW5kIHVzZSwgcHJvdmlkaW5nIGVtdWxhdGVkIFBDSSBkZXZp
Y2VzIGZvciBpdC4KCllvdSBjb250aW51ZSB0byBpZ25vcmUgdGhlIHJvdXRpbmcgcmVxdWlyZW1l
bnQgbXVsdGlwbGUgaW9yZXEKc2VydmVycyBpbXBvc2UuCgpKYW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
