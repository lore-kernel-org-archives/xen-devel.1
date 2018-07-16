From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 12/13] x86/sysctl: Implement
 XEN_SYSCTL_get_cpu_policy
Date: Mon, 16 Jul 2018 11:58:04 +0100
Message-ID: <3dc5e891-ddca-5f8f-8e21-276422a5367d@citrix.com>
References: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
 <1531512194-6865-13-git-send-email-andrew.cooper3@citrix.com>
 <20180716101611.htzgozwkh36trikz@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180716101611.htzgozwkh36trikz@mac.bytemobile.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDcvMTggMTE6MTYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4KPj4gKwo+PiArICAg
IHN5c2N0bC5jbWQgPSBYRU5fU1lTQ1RMX2dldF9jcHVfcG9saWN5Owo+PiArICAgIHN5c2N0bC51
LmNwdV9wb2xpY3kuaW5kZXggPSBpbmRleDsKPj4gKyAgICBzeXNjdGwudS5jcHVfcG9saWN5Lm5y
X2xlYXZlcyA9ICpucl9sZWF2ZXM7Cj4+ICsgICAgc2V0X3hlbl9ndWVzdF9oYW5kbGUoc3lzY3Rs
LnUuY3B1X3BvbGljeS5jcHVpZF9wb2xpY3ksIGxlYXZlcyk7Cj4+ICsgICAgc3lzY3RsLnUuY3B1
X3BvbGljeS5ucl9tc3JzID0gKm5yX21zcnM7Cj4+ICsgICAgc2V0X3hlbl9ndWVzdF9oYW5kbGUo
c3lzY3RsLnUuY3B1X3BvbGljeS5tc3JfcG9saWN5LCBtc3JzKTsKPiBzeXNjdGwgY2FuIGJlIGlu
aXRpYWxpemVkIGF0IGRlY2xhcmF0aW9uIHRpbWUgaW5zdGVhZCBvZiB6ZXJvaW5nIGl0Cj4gYW5k
IHRoZW4gc2V0dGluZyB0aGUgZmllbGRzOgo+Cj4gc3RydWN0IHhlbl9zeXNjdGwgc3lzY3RsID0g
ewo+ICAgICAuY21kID0gWEVOX1NZU0NUTF9nZXRfY3B1X3BvbGljeTsKPiAgICAgLnUuY3B1X3Bv
bGljeS5pbmRleCA9IGluZGV4Owo+ICAgICAudS5jcHVfcG9saWN5Lm5yX2xlYXZlcyA9ICpucl9s
ZWF2ZXM7Cj4gICAgIC4uLgo+IH07CgpUaGlzIGRvZXNuJ3QgY29tcGlsZSBpbiBhIENlbnRPUyA2
IGVyYSBHQ0MuwqAgSXQgY2FuJ3QgY29wZSB3aXRoCmluaXRpYWxpc2VycyBvZiBhbm9ueW1vdXMg
dW5pb25zLCBhbmQgaXMgdGhlIHJlYXNvbiB3aHkgYSBsb3Qgb2YgdGhlCnRvb2xzdGFjayBsb2dp
YyBpcyBpbiB0aGUgZm9ybSBwcmVzZW50ZWQgaW4gdGhpcyBwYXRjaCwgcmF0aGVyIHRoYW4gdGhl
CmNsZWFuZXIgb3B0aW9uIHlvdSBwcmVzZW50LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
