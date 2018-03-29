From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/1] xen-netback: process malformed sk_buff
 correctly to avoid BUG_ON()
Date: Thu, 29 Mar 2018 12:09:03 -0400 (EDT)
Message-ID: <20180329.120903.1175452061863560219.davem__39888.1385954612$1522339680$gmane$org@davemloft.net>
References: <1522194136-11985-1-git-send-email-dongli.zhang@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aiwl=gt=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1f1a6t-00016v-F0
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 16:09:07 +0000
In-Reply-To: <1522194136-11985-1-git-send-email-dongli.zhang@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: dongli.zhang@oracle.com
Cc: xen-devel@lists.xenproject.org, paul.durrant@citrix.com, wei.liu2@citrix.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogRG9uZ2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KRGF0ZTogV2VkLCAy
OCBNYXIgMjAxOCAwNzo0MjoxNiArMDgwMAoKPiBUaGUgIkJVR19PTighZnJhZ19pdGVyKSIgaW4g
ZnVuY3Rpb24geGVudmlmX3J4X25leHRfY2h1bmsoKSBpcyB0cmlnZ2VyZWQgaWYKPiB0aGUgcmVj
ZWl2ZWQgc2tfYnVmZiBpcyBtYWxmb3JtZWQsIHRoYXQgaXMsIHdoZW4gdGhlIHNrX2J1ZmYgaGFz
IHBhdHRlcm4KPiAoc2tiLT5kYXRhX2xlbiAmJiAhc2tiX3NoaW5mbyhza2IpLT5ucl9mcmFncyku
IEJlbG93IGlzIGEgc2FtcGxlIGNhbGwKPiBzdGFjazoKCldlIHNob3VsZCBmaXggdGhlIHBhcnRz
IG9mIHRoZSBrZXJuZWwgd2hpY2ggYnVpbGQgaWxsZWdhbCBtYWxmb3JtZWQKU0tCcyByYXRoZXIg
dGhhbiBhZGRpbmcgY2hlY2tzIHRvIGV2ZXJ5IGRyaXZlciBpbiB0aGUgdHJlZS4KCkknbSBub3Qg
YXBwbHlpbmcgdGhpcywgc29ycnkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
