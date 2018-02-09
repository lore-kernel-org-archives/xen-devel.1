From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/7] Port WARN_ON_ONCE() from Linux
Date: Fri, 9 Feb 2018 10:47:08 +0000
Message-ID: <20180209104708.qxjthhwfy6pk272h@MacBook-Pro-de-Roger.local>
References: <20180209031055.21926-1-sameer.goel@linaro.org>
 <20180209031055.21926-2-sameer.goel@linaro.org>
 <20180209102947.6dwuchlgkibx4okr@MacBook-Pro-de-Roger.local>
 <6c94284e-f559-273d-021e-05ea35b9ec2e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qs32=fd=citrix.com=prvs=5717decf0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ek6DA-0003jP-Pw
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 10:47:20 +0000
Content-Disposition: inline
In-Reply-To: <6c94284e-f559-273d-021e-05ea35b9ec2e@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, mjaggi@caviumnetworks.com, george.dunlap@eu.citrix.com, Andrew.Cooper3@citrix.com, Ian.Jackson@citrix.com, jbeulich@suse.com, Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, nd@arm.com, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMDksIDIwMTggYXQgMTA6NDU6MjVBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDAyLzA5LzIwMTggMTA6MjkgQU0sIFJvZ2VyIFBhdSBNb25uw6kg
d3JvdGU6Cj4gPiBPbiBUaHUsIEZlYiAwOCwgMjAxOCBhdCAwODoxMDo0OVBNIC0wNzAwLCBTYW1l
ZXIgR29lbCB3cm90ZToKPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaCBi
L3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+ID4gPiBpbmRleCAxZDk3NzEzNDBjLi42OTcyMTJhMDYx
IDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPiA+ID4gKysrIGIveGVu
L2luY2x1ZGUveGVuL2xpYi5oCj4gPiA+IEBAIC0xMSw2ICsxMSwxOSBAQAo+ID4gPiAgICNkZWZp
bmUgQlVHX09OKHApICBkbyB7IGlmICh1bmxpa2VseShwKSkgQlVHKCk7ICB9IHdoaWxlICgwKQo+
ID4gPiAgICNkZWZpbmUgV0FSTl9PTihwKSBkbyB7IGlmICh1bmxpa2VseShwKSkgV0FSTigpOyB9
IHdoaWxlICgwKQo+ID4gPiArI2RlZmluZSBXQVJOX09OX09OQ0UocCkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKPiA+ID4gKyh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgc3RhdGljIGJvb2wgX19zZWN0aW9uKCIuZGF0
YS51bmxpa2VseSIpIF9fd2FybmVkOyBcCj4gPiA+ICsgICAgaW50IF9fcmV0X3dhcm5fb25jZSA9
ICEhKHApOyAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICBeIGJvb2wKPiA+IAo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ID4gKyAgICBpZiAoIHVubGlrZWx5KF9fcmV0X3dhcm5fb25jZSAmJiAhX193YXJuZWQpICkg
ICAgIFwKPiA+ID4gKyAgICB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiA+ICsgICAgICAgIF9fd2FybmVkID0gdHJ1ZTsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4gPiArICAgICAgICBXQVJOKCk7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ID4gKyAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICsgICAgdW5saWtlbHkoX19yZXRfd2Fybl9vbmNl
KTsgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gCj4gPiBEb2VzIHRoaXMgbWFjcm8gcmVhbGx5
IG5lZWQgdG8gcmV0dXJuIHNvbWV0aGluZz8gSXQgc2VlbXMgd2VpcmQgdG8gbWUKPiA+IHRvIGFs
bG93IHVzYWdlcyBsaWtlOiBpZiAoIFdBUk5fT05fT05DRS4uLgo+IAo+IFRoaXMgY29uc3RydWN0
IGlzIHVzZWQgaW4gTGludXggKGluY2x1ZGVkIGluIHRoZSBkcml2ZXIgcG9ydGVkKToKPiAKPiBp
ZiAoV0FSTl9PTl9PTkNFKGZ3c3BlYy0+aW9tbXVfcHJpdikpIHsKPiAgICAgIG1hc3RlciA9IGZ3
c3BlYy0+aW9tbXVfcHJpdjsKPiAgICAgIHNtbXUgPSBtYXN0ZXItPnNtbXU7Cj4gfSBlbHNlIHsK
PiAuLi4uCj4gfQo+IAo+IElITU8gdGhlIG1ha2VzIHRoZSBjb2RlIG5pY2VyIHRvIHJlYWQgb3Zl
cjoKCk9LLCBpZiB0aGF0J3MgaW50ZW5kZWQgSSdtIGZpbmUgd2l0aCBpdCwganVzdCB3YW50ZWQg
dG8gY2hlY2suCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
