From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2] x86/mem-sharing: statically initialize
 audit list head and lock
Date: Thu, 11 Apr 2019 09:57:08 +0100
Message-ID: <78d6ca4d-c0b2-11ed-c837-ebc065988e42@citrix.com>
References: <5CAEE3DF0200007800226799@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iw/1=SN=citrix.com=prvs=99710a114=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hEVXC-0004qi-2D
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 08:58:14 +0000
In-Reply-To: <5CAEE3DF0200007800226799@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8xMS8xOSA3OjUxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBUaGVyZSdzIG5vIG5lZWQg
dG8gZXhlY3V0ZSBhbnkgaW5zdHJ1Y3Rpb25zIGZvciBkb2luZyBzby4gRHJvcCB0aGUgdGhlbgo+
IGVmZmVjdGl2ZWx5IGVtcHR5IG1lbV9zaGFyaW5nX2luaXQoKSBhbHRvZ2V0aGVyLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
