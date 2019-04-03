From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] xen/console: Don't treat NUL character
 as the end of the buffer
Date: Wed, 03 Apr 2019 01:59:31 -0600
Message-ID: <5CA467E30200007800224225@prv1-mh.provo.novell.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-3-julien.grall@arm.com>
 <68f3392e-9bc5-422b-787b-38f5a82c0fa0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBao4-0004EC-QK
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 07:59:36 +0000
In-Reply-To: <68f3392e-9bc5-422b-787b-38f5a82c0fa0@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjA0LjE5IGF0IDE5OjQ5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDIvMDQvMjAxOSAxNzo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2Vhcmx5X3ByaW50ay5jIGIveGVuL2FyY2gvYXJtL2Vhcmx5X3By
aW50ay5jCj4+IGluZGV4IDk3NDY2YTEyYjEuLjM1YTQ3YzcyMjkgMTAwNjQ0Cj4+IC0tLSBhL3hl
bi9hcmNoL2FybS9lYXJseV9wcmludGsuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vZWFybHlfcHJp
bnRrLmMKPj4gQEAgLTE3LDkgKzE3LDEwIEBACj4+ICB2b2lkIGVhcmx5X3B1dGNoKGNoYXIgYyk7
Cj4+ICB2b2lkIGVhcmx5X2ZsdXNoKHZvaWQpOwo+PiAgCj4+IC12b2lkIGVhcmx5X3B1dHMoY29u
c3QgY2hhciAqcykKPj4gK3ZvaWQgZWFybHlfcHV0cyhjb25zdCBjaGFyICpzLCB1bnNpZ25lZCBp
bnQgbnIpCj4gCj4gc2l6ZV90IGhlcmUgYW5kIGVsc2V3aGVyZSBwbGVhc2UsIGJlY2F1c2UuLi4K
PiAKPj4gQEAgLTY2NiwxNiArNjY0LDE2IEBAIHN0YXRpYyBib29sX3QgY29uc29sZV9sb2Nrc19i
dXN0ZWQ7Cj4+ICAKPj4gIHN0YXRpYyB2b2lkIF9fcHV0c3RyKGNvbnN0IGNoYXIgKnN0cikKPj4g
IHsKPj4gKyAgICBzaXplX3QgbGVuID0gc3RybGVuKHN0cik7Cj4+ICsKPj4gICAgICBBU1NFUlQo
c3Bpbl9pc19sb2NrZWQoJmNvbnNvbGVfbG9jaykpOwo+PiAgCj4+IC0gICAgc2VyY29uX3B1dHMo
c3RyKTsKPj4gLSAgICB2aWRlb19wdXRzKHN0cik7Cj4+ICsgICAgc2VyY29uX3B1dHMoc3RyLCBs
ZW4pOwo+PiArICAgIHZpZGVvX3B1dHMoc3RyLCBsZW4pOwo+IAo+IC4uLiB0aGlzIGludHJvZHVj
ZXMgYSB0cnVuY2F0aW9uIGJ1ZyBmb3IgNjRiaXQgYnVpbGRzLgo+IAo+IEkgZG9uJ3QgZXhwZWN0
IGEgNEcgYnVmZmVyIHRvIGJlIHBhc3NlZCwgYnV0IGl0IGlzIG5vdCB3b3J0aCBpbnRyb2R1Y2lu
Zwo+IHRoZSBwb3NzaWJpbGl0eSBmb3Igc3VjaCBhIHN1YnRsZSBidWcgaW4gdGhlIGZpcnN0IHBs
YWNlLgoKSSBkb24ndCBlbnRpcmVseSBvYmplY3QgdG8gd2hhdCB5b3Ugc2F5LCBidXQgSSBhbHNv
IGRvbid0IHRoaW5rCnJ1bm5pbmcgaW50byBhIHRydW5jYXRpb24gc2l0dWF0aW9uIGhlcmUgd291
bGQgYmUgYW4gYWN0dWFsCnByb2JsZW06IENvbnNpZGVyIGhvdyBsb25nIGl0IHdvdWxkIHRha2Ug
dG8gZ2V0IG91dCBzdWNoIGEKZ2lhbnQgc3RyaW5nLCBub3QgdG8gc3BlYWsgb2YgaXQgZ29pbmcg
dG8gd3JhcCBvdXIgaW50ZXJuYWwgcmluZwpidWZmZXJzIG1hbnkgdGltZXMuIExvb2tpbmcgYXQg
aXQgZnJvbSB0aGF0IGFuZ2xlLCB0cnVuY2F0aW9uCm1heSBhY3R1YWxseSBiZW5lZmljaWFsIGhl
cmU7ICJsZW4iIG1heSB3YW50IHRvIGJlIHVuc2lnbmVkIGludAphcyB3ZWxsIHRoZW4uIGRvX2Nv
bnNvbGVfaW8oKSdzICJjb3VudCIgaXMgImludCIgYXMgd2VsbCAoc2hvdWxkCnJlYWxseSBiZSAi
dW5zaWduZWQgaW50IiBpbW8sIGp1c3QgbGlrZSAiY21kIikuCgpJJ3ZlIGdvbmUgdGhyb3VnaCBh
bGwgdGhlIGV4aXN0aW5nIF9fcHV0c3RyKCkgY2FsbGVyczogVGhleQphbGwgcGFzcyBlaXRoZXIg
c3RyaW5nIGxpdGVyYWxzIG9yIGFkZHJlc3NlcyBvZiBzdGF0aWMgYXJyYXlzLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
