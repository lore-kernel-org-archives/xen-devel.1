From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86/vvmx: Simplify per-CPU memory
 allocations
Date: Fri, 26 Apr 2019 09:35:09 +0100
Message-ID: <20190426083509.GM30543@zion.uk.xensource.com>
References: <1556210685-2549-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yv7G=S4=citrix.com=prvs=01296b64e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hJwKV-0008OJ-Ts
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 08:35:35 +0000
Content-Disposition: inline
In-Reply-To: <1556210685-2549-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMDU6NDQ6NDVQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiAgKiBVc2UgWEZSRUUoKSBpbnN0ZWFkIG9mIG9wZW5jb2RpbmcgaXQgaW4gbnZteF9j
cHVfZGVhZCgpCj4gICogQXZvaWQgcmVkdW5kYW50IGV2YWx1YXRpb25zIG9mIHBlcl9jcHUoKQo+
ICAqIERvbid0IGFsbG9jYXRlIHZ2bWNzX2J1ZiBhdCBhbGwgaWYgaXQgaXNuJ3QgZ29pbmcgdG8g
YmUgdXNlZC4gIEl0IGlzIG5ldmVyCj4gICAgdG91Y2hlZCBvbiBoYXJkd2FyZSBsYWNraW5nIHRo
ZSBWTUNTIFNoYWRvd2luZyBmZWF0dXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
