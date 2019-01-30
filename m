From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pv-shim: Avoid a command line parameter
 warning for CONFIG_PV_SHIM_EXCLUSIVE builds
Date: Wed, 30 Jan 2019 10:01:20 +0000
Message-ID: <804418e7-a5c8-b108-dceb-a9ca7c04d312@citrix.com>
References: <1548788870-1851-1-git-send-email-andrew.cooper3@citrix.com>
 <5C51751B0200007800212354@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C51751B0200007800212354@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDEvMjAxOSAwOTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjkuMDEuMTkg
YXQgMjA6MDcsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEveGVu
L2FyY2gveDg2L3B2L3NoaW0uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCj4+IEBA
IC00MCw3ICs0MCwxMSBAQAo+PiAgI3VuZGVmIHZpcnRfdG9fbWZuCj4+ICAjZGVmaW5lIHZpcnRf
dG9fbWZuKHZhKSBfbWZuKF9fdmlydF90b19tZm4odmEpKQo+PiAgCj4+IC0jaWZuZGVmIENPTkZJ
R19QVl9TSElNX0VYQ0xVU0lWRQo+PiArI2lmZGVmIENPTkZJR19QVl9TSElNX0VYQ0xVU0lWRQo+
PiArLyogVG9sZXJhdGUgInB2LXNoaW0iIGJlaW5nIHBhc3NlZCB0byBhIENPTkZJR19QVl9TSElN
X0VYQ0xVU0lWRSBoeXBlcnZpc29yLiAqLwo+PiArc3RhdGljIGJvb2wgX2Rpc2NhcmQ7Cj4+ICti
b29sZWFuX3BhcmFtKCJwdi1zaGltIiwgX2Rpc2NhcmQpOwo+PiArI2Vsc2UKPj4gIGJvb2wgcHZf
c2hpbTsKPj4gIGJvb2xlYW5fcGFyYW0oInB2LXNoaW0iLCBwdl9zaGltKTsKPj4gICNlbmRpZgo+
IEl0IHdvdWxkIGVuZCB1cCBiZWluZyBsZXNzIGV4dHJhIGNvZGUgaWYgeW91IGRpZAo+Cj4gI2lm
ZGVmIENPTkZJR19QVl9TSElNX0VYQ0xVU0lWRQo+IC8qIFRvbGVyYXRlICJwdi1zaGltIiBiZWlu
ZyBwYXNzZWQgdG8gYSBDT05GSUdfUFZfU0hJTV9FWENMVVNJVkUgaHlwZXJ2aXNvci4gKi8KPiBz
dGF0aWMgYm9vbCBfX2luaXRkYXRhIHB2X3NoaW07Cj4gI2Vsc2UKPiBib29sIHB2X3NoaW07Cj4g
I2VuZGlmCj4gYm9vbGVhbl9wYXJhbSgicHYtc2hpbSIsIHB2X3NoaW0pOwoKU2FkbHkgbm90LsKg
IEluIHRoZSBFWENMVVNJVkUgY2FzZSwgcHZfc2hpbSBpcyBkZWZpbmVkIHRvIGJlIDEsIGFuZCB0
aGVuCnlvdSd2ZSBnb3QgYW4gb2JqZWN0IG5hbWVkIHdpdGgganVzdCBhIG51bWJlci7CoCAoSSB0
cmllZCB0aGlzIGFwcHJvYWNoCmZpcnN0LikKCkkgY2FuJ3QgdGhpbmsgb2YgYW55IGNsZWFuZXIg
c29sdXRpb24uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
