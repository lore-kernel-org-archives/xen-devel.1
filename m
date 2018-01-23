From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC v4 1/8] Port WARN_ON_ONCE() from Linux
Date: Tue, 23 Jan 2018 11:33:51 +0000
Message-ID: <3eaf2c0e-94e4-8161-985b-3704fbfd4c96@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-2-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jwx3=es=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1edwpw-0003jf-Ig
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 11:33:56 +0000
Received: by mail-wm0-x242.google.com with SMTP id x4so21605943wmc.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2018 03:33:54 -0800 (PST)
In-Reply-To: <20171219031703.23420-2-sameer.goel@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, julien.grall@arm.com, mjaggi@caviumnetworks.com
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, george.dunlap@eu.citrix.com, Andrew.Cooper3@citrix.com, andre.przywara@linaro.org, jbeulich@suse.com, Ian.Jackson@citrix.com, nd@arm.com, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

SGkgU2FtZWVyLAoKT24gMTkvMTIvMTcgMDM6MTYsIFNhbWVlciBHb2VsIHdyb3RlOgo+IFBvcnQg
V0FSTl9PTl9PTkNFIG1hY3JvIGZyb20gTGludXguCj4gCj4gU2lnbmVkLW9mZi1ieTogU2FtZWVy
IEdvZWwgPHNhbWVlci5nb2VsQGxpbmFyby5vcmc+Cj4gLS0tCj4gICB4ZW4vaW5jbHVkZS94ZW4v
bGliLmggfCAxMSArKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2xpYi5oIGIveGVuL2luY2x1ZGUv
eGVuL2xpYi5oCj4gaW5kZXggZWQwMGFlMTM3OS4uODMyMDZjMDg0OCAxMDA2NDQKPiAtLS0gYS94
ZW4vaW5jbHVkZS94ZW4vbGliLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPiBAQCAt
MTEsNiArMTEsMTcgQEAKPiAgICNkZWZpbmUgQlVHX09OKHApICBkbyB7IGlmICh1bmxpa2VseShw
KSkgQlVHKCk7ICB9IHdoaWxlICgwKQo+ICAgI2RlZmluZSBXQVJOX09OKHApIGRvIHsgaWYgKHVu
bGlrZWx5KHApKSBXQVJOKCk7IH0gd2hpbGUgKDApCj4gICAKPiArI2RlZmluZSBXQVJOX09OX09O
Q0UocCkJKHsgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgIHN0YXRpYyBib29sIF9f
c2VjdGlvbigiLmRhdGEudW5saWtlbHkiKSBfX3dhcm5lZDsgXAo+ICsgICAgaW50IF9fcmV0X3dh
cm5fb25jZSA9ICEhKHApOyAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgaWYgKHVubGlrZWx5
KF9fcmV0X3dhcm5fb25jZSAmJiAhX193YXJuZWQpKSB7ICAgXAoKSSByZWFsaXNlIEJVR19PTi9X
QVJOX09OIGFib3ZlIGlzIG5vdCB1c2luZyBYZW4gY29kaW5nIHN0eWxlLiBIb3dldmVyLCAKY2Fu
IHlvdSBtYWtlIHRoaXMgY29kZSBmb2xsb3cgWGVuIGNvZGluZyBzdHlsZT8KCkZXSVcgd2l0aCB0
aGUgY29kaW5nIHN0eWxlIGNoYW5nZToKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBsaW5hcm8ub3JnPgoKVGhpcyB3aWxsIGFsc28gcmVxdWlyZSBhbiBhY2sgZnJvbSAiVEhF
IFJFU1QiIG1haW50YWluZXJzIGFzIHRoaXMgaXMgCmNvbW1vbiBjb2RlLgoKQ2hlZXJzLAoKPiAr
ICAgICAgICBfX3dhcm5lZCA9IHRydWU7ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAr
ICAgICAgICBXQVJOX09OKDEpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAr
ICAgIH0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAr
ICAgIHVubGlrZWx5KF9fcmV0X3dhcm5fb25jZSk7ICAgICAgICAgICAgICAgICAgICAgIFwKPiAr
fSkKPiArCj4gICAjaWYgX19HTlVDX18gPiA0IHx8IChfX0dOVUNfXyA9PSA0ICYmIF9fR05VQ19N
SU5PUl9fID49IDYpCj4gICAvKiBGb3JjZSBhIGNvbXBpbGF0aW9uIGVycm9yIGlmIGNvbmRpdGlv
biBpcyB0cnVlICovCj4gICAjZGVmaW5lIEJVSUxEX0JVR19PTihjb25kKSAoeyBfU3RhdGljX2Fz
c2VydCghKGNvbmQpLCAiISgiICNjb25kICIpIik7IH0pCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
