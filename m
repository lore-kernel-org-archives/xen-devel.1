From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] drop "domain_" prefix from struct
 domain's dirty CPU mask
Date: Fri, 19 Jan 2018 17:56:28 +0000
Message-ID: <2721e560-8e55-4626-94e0-22103730c480@citrix.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A6225C902000078001A07D8@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rwd1=eo=citrix.com=prvs=5503b2e3b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ecb5K-0001Ni-Ri
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 18:08:14 +0000
In-Reply-To: <5A6225C902000078001A07D8@prv-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDEvMTggMTY6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEl0IGJlaW5nIGEgZmllbGQg
b2Ygc3RydWN0IGRvbWFpbiBpcyBzdWZmaWNpZW50IHRvIHJlY29nbml6ZSBpdHMKPiBwdXJwb3Nl
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2
aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+LCBhbHRo
b3VnaC4uLgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21t
LmMKPiBAQCAtMzMyNyw3ICszMzI3LDcgQEAgbG9uZyBkb19tbXVleHRfb3AoCj4gICAgICAgICAg
ICAgIGlmICggdW5saWtlbHkoY3VycmQgIT0gcGdfb3duZXIpICkKPiAgICAgICAgICAgICAgICAg
IHJjID0gLUVQRVJNOwo+ICAgICAgICAgICAgICBlbHNlIGlmICggX19hZGRyX29rKG9wLmFyZzEu
bGluZWFyX2FkZHIpICkKPiAtICAgICAgICAgICAgICAgIGZsdXNoX3RsYl9vbmVfbWFzayhjdXJy
ZC0+ZG9tYWluX2RpcnR5X2NwdW1hc2ssCj4gKyAgICAgICAgICAgICAgICBmbHVzaF90bGJfb25l
X21hc2soY3VycmQtPmRpcnR5X2NwdW1hc2ssCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgb3AuYXJnMS5saW5lYXJfYWRkcik7Cj4gICAgICAgICAgICAgIGJyZWFrOwo+ICAK
PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L21tL3NoYWRvdy9jb21tb24uYwo+IEBAIC0zNjM5LDcgKzM2MzksNyBAQCBzdGF0aWMgdm9p
ZCBzaF91bnNoYWRvd19mb3JfcDJtX2NoYW5nZShzCj4gICAgICAgICAgICAgICAgICAgICAgaWYg
KCBzaF9yZW1vdmVfYWxsX21hcHBpbmdzKGQsIG9tZm4sCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9nZm4oZ2ZuICsgKGkgPDwgUEFHRV9TSElGVCkp
KSApCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNwdW1hc2tfb3IoJmZsdXNobWFzaywgJmZs
dXNobWFzaywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkLT5kb21haW5f
ZGlydHlfY3B1bWFzayk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZC0+
ZGlydHlfY3B1bWFzayk7Cj4gICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgICBv
bWZuID0gX21mbihtZm5feChvbWZuKSArIDEpOwo+ICAgICAgICAgICAgICB9Cj4KCkNhbiBlaXRo
ZXIgb2YgdGhlc2UgaHVua3MgYmUgcmUtZmxvd2VkIG9udG8gYSBzaW5nbGUgbGluZT8KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
