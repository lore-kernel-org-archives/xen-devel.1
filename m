From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/7] Port WARN_ON_ONCE() from Linux
Date: Tue, 13 Feb 2018 02:46:14 -0700
Message-ID: <5A82C1F602000078001A73D2@prv-mh.provo.novell.com>
References: <20180209031055.21926-1-sameer.goel@linaro.org>
 <20180209031055.21926-2-sameer.goel@linaro.org>
 <20180209102947.6dwuchlgkibx4okr@MacBook-Pro-de-Roger.local>
 <6c94284e-f559-273d-021e-05ea35b9ec2e@arm.com>
 <20180209104708.qxjthhwfy6pk272h@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vshx=fh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1elXAP-00012E-EU
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 09:46:25 +0000
In-Reply-To: <20180209104708.qxjthhwfy6pk272h@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Sameer Goel <sameer.goel@linaro.org>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, mjaggi@caviumnetworks.com, george.dunlap@eu.citrix.com, Andrew.Cooper3@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org, Ian.Jackson@citrix.com, nd@arm.com, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAyLjE4IGF0IDExOjQ3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgRmViIDA5LCAyMDE4IGF0IDEwOjQ1OjI1QU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4gSGksCj4+IAo+PiBPbiAwMi8wOS8yMDE4IDEwOjI5IEFNLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+PiA+IE9uIFRodSwgRmViIDA4LCAyMDE4IGF0IDA4OjEwOjQ5UE0gLTA3MDAs
IFNhbWVlciBHb2VsIHdyb3RlOgo+PiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9s
aWIuaCBiL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+PiA+ID4gaW5kZXggMWQ5NzcxMzQwYy4uNjk3
MjEyYTA2MSAxMDA2NDQKPj4gPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+PiA+ID4g
KysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCj4+ID4gPiBAQCAtMTEsNiArMTEsMTkgQEAKPj4g
PiA+ICAgI2RlZmluZSBCVUdfT04ocCkgIGRvIHsgaWYgKHVubGlrZWx5KHApKSBCVUcoKTsgIH0g
d2hpbGUgKDApCj4+ID4gPiAgICNkZWZpbmUgV0FSTl9PTihwKSBkbyB7IGlmICh1bmxpa2VseShw
KSkgV0FSTigpOyB9IHdoaWxlICgwKQo+PiA+ID4gKyNkZWZpbmUgV0FSTl9PTl9PTkNFKHApICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ID4gPiArKHsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gPiA+ICsgICAgc3RhdGljIGJvb2wg
X19zZWN0aW9uKCIuZGF0YS51bmxpa2VseSIpIF9fd2FybmVkOyBcCj4+ID4gPiArICAgIGludCBf
X3JldF93YXJuX29uY2UgPSAhIShwKTsgICAgICAgICAgICAgICAgICAgIFwKPj4gPiAgICAgICAg
IF4gYm9vbAo+PiA+IAo+PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4+ID4gPiArICAgIGlmICggdW5saWtlbHkoX19yZXRfd2Fybl9v
bmNlICYmICFfX3dhcm5lZCkgKSAgICAgXAo+PiA+ID4gKyAgICB7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ID4gPiArICAgICAgICBfX3dhcm5lZCA9
IHRydWU7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gPiA+ICsgICAgICAgIFdBUk4o
KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiA+ID4gKyAgICB9ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ID4gPiArICAg
IHVubGlrZWx5KF9fcmV0X3dhcm5fb25jZSk7ICAgICAgICAgICAgICAgICAgICAgIFwKPj4gPiAK
Pj4gPiBEb2VzIHRoaXMgbWFjcm8gcmVhbGx5IG5lZWQgdG8gcmV0dXJuIHNvbWV0aGluZz8gSXQg
c2VlbXMgd2VpcmQgdG8gbWUKPj4gPiB0byBhbGxvdyB1c2FnZXMgbGlrZTogaWYgKCBXQVJOX09O
X09OQ0UuLi4KPj4gCj4+IFRoaXMgY29uc3RydWN0IGlzIHVzZWQgaW4gTGludXggKGluY2x1ZGVk
IGluIHRoZSBkcml2ZXIgcG9ydGVkKToKPj4gCj4+IGlmIChXQVJOX09OX09OQ0UoZndzcGVjLT5p
b21tdV9wcml2KSkgewo+PiAgICAgIG1hc3RlciA9IGZ3c3BlYy0+aW9tbXVfcHJpdjsKPj4gICAg
ICBzbW11ID0gbWFzdGVyLT5zbW11Owo+PiB9IGVsc2Ugewo+PiAuLi4uCj4+IH0KPj4gCj4+IElI
TU8gdGhlIG1ha2VzIHRoZSBjb2RlIG5pY2VyIHRvIHJlYWQgb3ZlcjoKPiAKPiBPSywgaWYgdGhh
dCdzIGludGVuZGVkIEknbSBmaW5lIHdpdGggaXQsIGp1c3Qgd2FudGVkIHRvIGNoZWNrLgoKQnV0
IFdBUk5fT04oKSBzaG91bGQgdGhlbiBiZSBnaXZlbiB0aGUgc2FtZSBwcm9wZXJ0eSwgSSB0aGlu
ay4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
