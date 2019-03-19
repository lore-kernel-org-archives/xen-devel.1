From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v1 1/4] xen: add hypercall for getting
 parameters at runtime
Date: Tue, 19 Mar 2019 09:12:16 +0100
Message-ID: <de1241e3-e060-7391-92b0-c809c637dc3c@suse.com>
References: <20190306125832.93901vliaskovitis@suse.com>
 <20190306125832.93902vliaskovitis@suse.com>
 <5C89313F020000780021E497@suse.com>
 <cea582cc2d10bfff1f3932df582d7369a59609a4.camel@suse.com>
 <5C8FA508020000780021FE6B@suse.com>
 <bc2190c092ead3c29167b0ca3417e01afcfdec2f.camel@suse.com>
 <5C8FCEF1020000780021FFF5@suse.com>
 <3583ae25-8843-d4b5-3ab3-27e1f4f76455@suse.com>
 <5C90A28F0200007800220205@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h69r9-0008Ux-UY
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2019 08:12:19 +0000
In-Reply-To: <5C90A28F0200007800220205@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Vasilis Liaskovitis <vliaskovitis@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDMvMjAxOSAwOTowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTkuMDMuMTkg
YXQgMDc6MDcsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBXaHkgZG9uJ3Qgd2UgcmVwbGFj
ZSB0aGUgIipnZXRfZnVuYygpIiB3aXRoIGEgImNoYXIgKmN1cnJlbnRfdmFsIiBiZWluZwo+PiBm
aWxsZWQgYXQgcGFyYW1ldGVyIHNldHRpbmcgdGltZT8gSG93IGN1cnJlbnRfdmFsIGlzIGFsbG9j
YXRlZCAoc3RhdGljCj4+IHN0cmluZyBvciBkeW5hbWljIGJ1ZmZlcikganVzdCBoYXMgdG8gYmUg
a25vd24gYnkgdGhlIGN1c3RvbSBwYXJhbWV0ZXIKPj4gcGFyc2luZyBmdW5jdGlvbi4KPiAKPiBD
b3VsZCBhY2N1bXVsYXRlIChvdmVyIHRpbWUpIHRvIHF1aXRlIGEgYml0IG9mIHdhc3RlZCBhbGxv
Y2F0aW9ucyBpZgo+IG5vLW9uZSBldmVyIGNhcmVzIGFib3V0IGNhbGxpbmcgdGhlIG5ldyBzeXNj
dGwuCgpJbiB0aGUgbm9ybWFsIGNhc2UgdGhlIG5lZWRlZCBtZW1vcnkgc2hvdWxkbid0IGJlIG1v
cmUgdGhhbiB0aGF0IG9mIHRoZQpib290IHBhcmFtZXRlcnMsIG1heWJlIHBsdXMgc29tZSBieXRl
cyBpbiBjYXNlIHJ1bnRpbWUgcGFyYW1ldGVycyBhcmUKc2V0LiBTbyBJIGJlbGlldmUgd2UgYXJl
IHRhbGtpbmcgYWJvdXQgbGVzcyB0aGFuIG9uZSBtZW1vcnkgcGFnZS4KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
