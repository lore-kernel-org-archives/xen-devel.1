From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] xenbaked.c: Avoid divide by zero issue
Date: Wed, 21 Mar 2018 16:53:12 +0000
Message-ID: <20180321165312.xivxvkog2wz5cvq3@citrix.com>
References: <1353482a-2733-e404-903a-261b4016f6cd@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=24tk=gl=citrix.com=prvs=6111f1d8b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eygzF-0000DT-Cp
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 16:53:17 +0000
Content-Disposition: inline
In-Reply-To: <1353482a-2733-e404-903a-261b4016f6cd@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Joe Jin <joe.jin@ORACLE.COM>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George Dunlap <dunlapg@umich.edu>, Wei Liu <wei.liu2@citrix.com>, Philip Lee <philip.lee@ORACLE.COM>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMTA6MTQ6MDNBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
PiB4ZW5iYWtlZC5jIC0+IGR1bXBfc3RhdHMoKSwgcnVuX3RpbWUgPSB0aW1lKCZlbmRfdGltZSkg
LSB0aW1lKCZzdGFydF90aW1lKSwKPiB0aW1lKCkgcmV0dXJucyB0aGUgdmFsdWUgaW4gc2Vjb25k
cy4gSWYgb25lIGNhbmNlbHMgeGVubW9uLnB5IGltbWVkaWF0ZWx5Cj4gYWZ0ZXIgc3RhcnRlZCwg
cnVuX3RpbWUgY2FuIGJlIHplcm8sIGFuZCB0aGVuIHhlbmJha2VkIHdpbGwgaGl0IGRpdmlkZSBi
eQo+IHplcm8gZmF1bHQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9lIEppbiA8am9lLmppbkBvcmFj
bGUuY29tPgo+IFJldmlld2VkLWJ5OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
