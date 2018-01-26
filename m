From: Sameer Goel <sameer.goel@linaro.org>
Subject: Re: [RFC v4 1/8] Port WARN_ON_ONCE() from Linux
Date: Thu, 25 Jan 2018 18:45:12 -0700
Message-ID: <5690d0d2-a7c6-b681-8763-d939158d9747@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-2-sameer.goel@linaro.org>
 <20180123161342.ev32hdjtjrcxpgsj@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=3cms=ev=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1eet4w-0006cs-5a
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 01:45:18 +0000
Received: by mail-pg0-x241.google.com with SMTP id w17so6260982pgv.6
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2018 17:45:16 -0800 (PST)
In-Reply-To: <20180123161342.ev32hdjtjrcxpgsj@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: sstabellini@kernel.org, mjaggi@caviumnetworks.com, george.dunlap@eu.citrix.com, Andrew.Cooper3@citrix.com, andre.przywara@linaro.org, julien.grall@arm.com, jbeulich@suse.com, xen-devel@lists.xenproject.org, Ian.Jackson@citrix.com, nd@arm.com, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxLzIzLzIwMTggOToxMyBBTSwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIERlYyAxOCwg
MjAxNyBhdCAwODoxNjo1NlBNIC0wNzAwLCBTYW1lZXIgR29lbCB3cm90ZToKPj4gUG9ydCBXQVJO
X09OX09OQ0UgbWFjcm8gZnJvbSBMaW51eC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2FtZWVyIEdv
ZWwgPHNhbWVlci5nb2VsQGxpbmFyby5vcmc+Cj4+IC0tLQo+PiAgeGVuL2luY2x1ZGUveGVuL2xp
Yi5oIHwgMTEgKysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbGliLmggYi94ZW4vaW5jbHVkZS94
ZW4vbGliLmgKPj4gaW5kZXggZWQwMGFlMTM3OS4uODMyMDZjMDg0OCAxMDA2NDQKPj4gLS0tIGEv
eGVuL2luY2x1ZGUveGVuL2xpYi5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+PiBA
QCAtMTEsNiArMTEsMTcgQEAKPj4gICNkZWZpbmUgQlVHX09OKHApICBkbyB7IGlmICh1bmxpa2Vs
eShwKSkgQlVHKCk7ICB9IHdoaWxlICgwKQo+PiAgI2RlZmluZSBXQVJOX09OKHApIGRvIHsgaWYg
KHVubGlrZWx5KHApKSBXQVJOKCk7IH0gd2hpbGUgKDApCj4+ICAKPj4gKyNkZWZpbmUgV0FSTl9P
Tl9PTkNFKHApCSh7ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAgc3RhdGljIGJv
b2wgX19zZWN0aW9uKCIuZGF0YS51bmxpa2VseSIpIF9fd2FybmVkOyBcCj4gWW91IGludHJvZHVj
ZWQgYSBuZXcgc2VjdGlvbiB3aXRob3V0IGNvcnJlc3BvbmRpbmcgY2hhbmdlcyB0bwo+IHthcm0s
eDg2fS94ZW4ubGRzLlMKSSB3aWxsIGZpeCB0aGlzLgo+Cj4+ICsgICAgaW50IF9fcmV0X3dhcm5f
b25jZSA9ICEhKHApOyAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICBpZiAodW5saWtlbHko
X19yZXRfd2Fybl9vbmNlICYmICFfX3dhcm5lZCkpIHsgICBcCj4+ICsgICAgICAgIF9fd2FybmVk
ID0gdHJ1ZTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICBXQVJOX09O
KDEpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiBUaGlzIGlzbid0IHJlYWxs
eSBhIGRpcmVjdCBwb3J0IGZyb20gTGludXguIEF0IHRoaXMgcG9pbnQgSSB3b25kZXIgd2h5Cj4g
eW91IGRpZG4ndCB1c2UgV0FSTigpIGRpcmVjdGx5Pwo+Cj4gV2VpLgo+Cj4+ICsgICAgfSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgIHVubGlr
ZWx5KF9fcmV0X3dhcm5fb25jZSk7ICAgICAgICAgICAgICAgICAgICAgIFwKPj4gK30pCj4+ICsK
Pj4gICNpZiBfX0dOVUNfXyA+IDQgfHwgKF9fR05VQ19fID09IDQgJiYgX19HTlVDX01JTk9SX18g
Pj0gNikKPj4gIC8qIEZvcmNlIGEgY29tcGlsYXRpb24gZXJyb3IgaWYgY29uZGl0aW9uIGlzIHRy
dWUgKi8KPj4gICNkZWZpbmUgQlVJTERfQlVHX09OKGNvbmQpICh7IF9TdGF0aWNfYXNzZXJ0KCEo
Y29uZCksICIhKCIgI2NvbmQgIikiKTsgfSkKPj4gLS0gCj4+IDIuMTQuMQo+Pgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxp
bmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
