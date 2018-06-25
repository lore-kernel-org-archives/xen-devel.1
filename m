From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/8] xen: calculate XEN_BUILD_TIME using
 XEN_BUILD_DATE value
Date: Mon, 25 Jun 2018 07:48:34 -0600
Message-ID: <5B30F2B202000078001CD8E4@prv1-mh.provo.novell.com>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-2-git-send-email-daniel.kiper@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrz=jl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXRrD-0001hs-ME
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 13:48:39 +0000
In-Reply-To: <1529418946-30114-2-git-send-email-daniel.kiper@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA2LjE4IGF0IDE2OjM1LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9NYWtlZmlsZQo+ICsrKyBiL3hlbi9NYWtlZmlsZQo+IEBAIC05LDcgKzks
NyBAQCBleHBvcnQgWEVOX0ZVTExWRVJTSU9OICAgPSAkKFhFTl9WRVJTSU9OKS4kKFhFTl9TVUJW
RVJTSU9OKSQoWEVOX0VYVFJBVkVSU0lPTikKPiAgZXhwb3J0IFhFTl9XSE9BTUkJPz0gJChVU0VS
KQo+ICBleHBvcnQgWEVOX0RPTUFJTgk/PSAkKHNoZWxsIChbIC14IC9iaW4vZG5zZG9tYWlubmFt
ZSBdICYmIC9iaW4vZG5zZG9tYWlubmFtZSkgfHwgKFsgLXggL2Jpbi9kb21haW5uYW1lIF0gJiYg
L2Jpbi9kb21haW5uYW1lIHx8IGVjaG8gW3Vua25vd25dKSkKPiAgZXhwb3J0IFhFTl9CVUlMRF9E
QVRFCT89ICQoc2hlbGwgTENfQUxMPUMgZGF0ZSkKPiAtZXhwb3J0IFhFTl9CVUlMRF9USU1FCT89
ICQoc2hlbGwgTENfQUxMPUMgZGF0ZSArJVQpCj4gK2V4cG9ydCBYRU5fQlVJTERfVElNRQk/PSAk
KHNoZWxsIExDX0FMTD1DIGRhdGUgLWQgJyQoWEVOX0JVSUxEX0RBVEUpJyArJVQpCgpOaWNlIGlk
ZWEsIGJ1dCBJJ20gbm90IHN1cmUgd2UgY2FuIHJlbHkgb24gdGhlIG5vbi1zdGFuZGFyZCAtZApv
cHRpb24gdG8gYmUgc3VwcG9ydGVkIGJ5IGFsbCBlbnZpcm9ubWVudHMgWGVuIG1heSBiZSBidWls
dCBpbi4KQXMgcGVyCmh0dHA6Ly9wdWJzLm9wZW5ncm91cC5vcmcvb25saW5lcHVicy8wMDc5MDQ5
NzUvdXRpbGl0aWVzL2RhdGUuaHRtbAp0aGUgb25seSBzdGFuZGFyZCBvcHRpb24gc3VwcG9ydGVk
IGJ5IGRhdGUgaXMgLXUuIEFzc3VtaW5nIEMgYW5kClBPU0lYIGxvY2FsZXMgcHJvZHVjZSB0aGUg
c2FtZSBzdGFuZGFyZCBmb3JtYXQsIEknbSBhZnJhaWQgeW91IG1heQpuZWVkIHRvIHJlc29ydCB0
byBzZWQtZXJ5IHRvIGFjaGlldmUgd2hhdCB5b3Ugd2FudC4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
