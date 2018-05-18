From: Sameer Goel <sameer.goel@linaro.org>
Subject: Re: [PATCH 1/7] Port WARN_ON_ONCE() from Linux
Date: Fri, 18 May 2018 16:46:10 -0600
Message-ID: <2afc35bc-3998-b10d-9b7c-e0306412b7f0@linaro.org>
References: <20180209031055.21926-1-sameer.goel@linaro.org>
 <20180209031055.21926-2-sameer.goel@linaro.org>
 <20180209102947.6dwuchlgkibx4okr@MacBook-Pro-de-Roger.local>
 <6c94284e-f559-273d-021e-05ea35b9ec2e@arm.com>
 <20180209104708.qxjthhwfy6pk272h@MacBook-Pro-de-Roger.local>
 <5A82C1F602000078001A73D2@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=d17f=if=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1fJo8e-0002Sa-Bl
 for xen-devel@lists.xenproject.org; Fri, 18 May 2018 22:46:16 +0000
Received: by mail-pg0-x243.google.com with SMTP id a13-v6so3890108pgu.4
 for <xen-devel@lists.xenproject.org>; Fri, 18 May 2018 15:46:14 -0700 (PDT)
In-Reply-To: <5A82C1F602000078001A73D2@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, mjaggi@caviumnetworks.com, george.dunlap@eu.citrix.com, Andrew.Cooper3@citrix.com, Julien Grall <julien.grall@arm.com>, Ian.Jackson@citrix.com, xen-devel@lists.xenproject.org, nd@arm.com, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyLzEzLzIwMTggMjo0NiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDkuMDIu
MTggYXQgMTE6NDcsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIEZyaSwgRmVi
IDA5LCAyMDE4IGF0IDEwOjQ1OjI1QU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhp
LAo+Pj4KPj4+IE9uIDAyLzA5LzIwMTggMTA6MjkgQU0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4+Pj4gT24gVGh1LCBGZWIgMDgsIDIwMTggYXQgMDg6MTA6NDlQTSAtMDcwMCwgU2FtZWVyIEdv
ZWwgd3JvdGU6Cj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbGliLmggYi94ZW4v
aW5jbHVkZS94ZW4vbGliLmgKPj4+Pj4gaW5kZXggMWQ5NzcxMzQwYy4uNjk3MjEyYTA2MSAxMDA2
NDQKPj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpYi5oCj4+Pj4+ICsrKyBiL3hlbi9pbmNs
dWRlL3hlbi9saWIuaAo+Pj4+PiBAQCAtMTEsNiArMTEsMTkgQEAKPj4+Pj4gICAjZGVmaW5lIEJV
R19PTihwKSAgZG8geyBpZiAodW5saWtlbHkocCkpIEJVRygpOyAgfSB3aGlsZSAoMCkKPj4+Pj4g
ICAjZGVmaW5lIFdBUk5fT04ocCkgZG8geyBpZiAodW5saWtlbHkocCkpIFdBUk4oKTsgfSB3aGls
ZSAoMCkKPj4+Pj4gKyNkZWZpbmUgV0FSTl9PTl9PTkNFKHApICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4+Pj4+ICsoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+Pj4+PiArICAgIHN0YXRpYyBib29sIF9fc2VjdGlvbigiLmRhdGEudW5s
aWtlbHkiKSBfX3dhcm5lZDsgXAo+Pj4+PiArICAgIGludCBfX3JldF93YXJuX29uY2UgPSAhIShw
KTsgICAgICAgICAgICAgICAgICAgIFwKPj4+PiAgICAgICAgIF4gYm9vbAo+Pj4+Cj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4+
PiArICAgIGlmICggdW5saWtlbHkoX19yZXRfd2Fybl9vbmNlICYmICFfX3dhcm5lZCkgKSAgICAg
XAo+Pj4+PiArICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPj4+Pj4gKyAgICAgICAgX193YXJuZWQgPSB0cnVlOyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4+Pj4+ICsgICAgICAgIFdBUk4oKTsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+Pj4+PiArICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPj4+Pj4gKyAgICB1bmxpa2VseShfX3JldF93YXJuX29uY2UpOyAg
ICAgICAgICAgICAgICAgICAgICBcCj4+Pj4gRG9lcyB0aGlzIG1hY3JvIHJlYWxseSBuZWVkIHRv
IHJldHVybiBzb21ldGhpbmc/IEl0IHNlZW1zIHdlaXJkIHRvIG1lCj4+Pj4gdG8gYWxsb3cgdXNh
Z2VzIGxpa2U6IGlmICggV0FSTl9PTl9PTkNFLi4uCj4+PiBUaGlzIGNvbnN0cnVjdCBpcyB1c2Vk
IGluIExpbnV4IChpbmNsdWRlZCBpbiB0aGUgZHJpdmVyIHBvcnRlZCk6Cj4+Pgo+Pj4gaWYgKFdB
Uk5fT05fT05DRShmd3NwZWMtPmlvbW11X3ByaXYpKSB7Cj4+PiAgICAgIG1hc3RlciA9IGZ3c3Bl
Yy0+aW9tbXVfcHJpdjsKPj4+ICAgICAgc21tdSA9IG1hc3Rlci0+c21tdTsKPj4+IH0gZWxzZSB7
Cj4+PiAuLi4uCj4+PiB9Cj4+Pgo+Pj4gSUhNTyB0aGUgbWFrZXMgdGhlIGNvZGUgbmljZXIgdG8g
cmVhZCBvdmVyOgo+PiBPSywgaWYgdGhhdCdzIGludGVuZGVkIEknbSBmaW5lIHdpdGggaXQsIGp1
c3Qgd2FudGVkIHRvIGNoZWNrLgo+IEJ1dCBXQVJOX09OKCkgc2hvdWxkIHRoZW4gYmUgZ2l2ZW4g
dGhlIHNhbWUgcHJvcGVydHksIEkgdGhpbmsuCgpOb3QgY2hhbmdpbmcgYW55IGFscmVhZHkgZGVm
aW5lZCBtYWNyb3MgaW4gWGVuLgo+Cj4gSmFuCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
