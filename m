From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/7] Port WARN_ON_ONCE() from Linux
Date: Mon, 12 Feb 2018 14:49:31 +0000
Message-ID: <20180212144931.gpxbb7nvpvmcdhnb@citrix.com>
References: <20180209031055.21926-1-sameer.goel@linaro.org>
 <20180209031055.21926-2-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=co21=fg=citrix.com=prvs=5740883f0=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1elFQJ-00032Z-QI
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 14:49:39 +0000
Content-Disposition: inline
In-Reply-To: <20180209031055.21926-2-sameer.goel@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sameer Goel <sameer.goel@linaro.org>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, mjaggi@caviumnetworks.com, george.dunlap@eu.citrix.com, Andrew.Cooper3@citrix.com, julien.grall@arm.com, jbeulich@suse.com, Ian.Jackson@citrix.com, xen-devel@lists.xenproject.org, nd@arm.com, shankerd@codeaurora.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDgsIDIwMTggYXQgMDg6MTA6NDlQTSAtMDcwMCwgU2FtZWVyIEdvZWwgd3Jv
dGU6Cj4gIAo+ICsjZGVmaW5lIFdBUk5fT05fT05DRShwKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ICsoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ICsgICAgc3RhdGljIGJvb2wgX19zZWN0aW9uKCIuZGF0YS51bmxpa2VseSIpIF9f
d2FybmVkOyBcCj4gKyAgICBpbnQgX19yZXRfd2Fybl9vbmNlID0gISEocCk7ICAgICAgICAgICAg
ICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gKyAgICBpZiAoIHVubGlrZWx5KF9fcmV0X3dhcm5fb25jZSAmJiAhX193YXJu
ZWQpICkgICAgIFwKPiArICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiArICAgICAgICBfX3dhcm5lZCA9IHRydWU7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKClBsZWFzZSBkb24ndCBtaXggYm9vbCBhbmQgaW50IHR5cGUuCgpXZWkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
