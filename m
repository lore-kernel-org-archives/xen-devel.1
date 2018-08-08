From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 2/5] xen/blkfront: cleanup stale
 persistent grants
Date: Wed, 8 Aug 2018 17:23:13 +0200
Message-ID: <20180808152313.j4k6jbnw73xm2iht__28059.7432553352$1533741826$gmane$org@mac>
References: <20180808142528.31029-1-jgross@suse.com>
 <20180808142528.31029-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xhyf=kx=citrix.com=prvs=751fb83b8=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fnQKg-0005Mn-3Z
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 15:25:06 +0000
Content-Disposition: inline
In-Reply-To: <20180808142528.31029-3-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMDgsIDIwMTggYXQgMDQ6MjU6MjVQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBBZGQgYSBwZXJpb2RpYyBjbGVhbnVwIGZ1bmN0aW9uIHRvIHJlbW92ZSBvbGQgcGVy
c2lzdGVudCBncmFudHMgd2hpY2gKPiBhcmUgbm8gbG9uZ2VyIGluIHVzZSBvbiB0aGUgYmFja2Vu
ZCBzaWRlLiBUaGlzIGF2b2lkcyBzdGFydmF0aW9uIGluCj4gY2FzZSB0aGVyZSBhcmUgbG90cyBv
ZiBwZXJzaXN0ZW50IGdyYW50cyBmb3IgYSBkZXZpY2Ugd2hpY2ggbm8gbG9uZ2VyCj4gaXMgaW52
b2x2ZWQgaW4gSS9PIGJ1c2luZXNzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
